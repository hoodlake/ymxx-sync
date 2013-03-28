
--修改人:蒲勇军
--修改时间:2012-09-28
--资金调拨反向流程老数据清理

begin 
 declare  @VOUNCHER_NO CHAR(10);      --付款凭证号
 declare  @CBS_BILL_NO VARCHAR(100)
 declare  @ORIGIN_NO   VARCHAR(100); --原始凭证号
 declare  @ORIGIN_NO_TEMP VARCHAR(100); --原始凭证号
 declare  @VOUNCHER_FROM numeric(2);
 declare  @IS_FROM_CS numeric(1);
 declare  @count_no numeric(5) ;
 set @count_no = 0 
 declare cur cursor for (select e.voucher_no from bis_exc e where e.voucher_from is null )
	open cur 
	fetch  from cur into @VOUNCHER_NO
	WHILE @@FETCH_STATUS=0 
	BEGIN 
	
	--清空参数 
	set @CBS_BILL_NO = null
	set @IS_FROM_CS = null
	set @VOUNCHER_FROM = null
	set @ORIGIN_NO_TEMP = null
	
	--查询cbs_bill_no
	select  @CBS_BILL_NO  =e.cbs_bill_no from bis_exc e where e.voucher_no = @VOUNCHER_NO
	--如果没有来源则认为由CS端产生的付款指令
	IF @CBS_BILL_NO IS NULL 
	BEGIN
		SET @IS_FROM_CS = 1
        SET @VOUNCHER_FROM = 6
	END 
	--如果存在来源
	IF @CBS_BILL_NO IS NOT NULL 
	BEGIN
		 
		 SELECT @ORIGIN_NO = max(orig_voucher_no)  FROM ( select voucher_no,orig_voucher_no from fc_accbook  union select voucher_no,orig_voucher_no from fc_accbook_blned ) f where f.voucher_no = @CBS_BILL_NO
          
          --如果不能找到相应的记账,则说明付款单由BS生成
          IF @ORIGIN_NO IS NULL
          BEGIN
			SET @ORIGIN_NO = @CBS_BILL_NO
          END 
          ELSE 
          BEGIN 
			SET @IS_FROM_CS = 1
			SET @VOUNCHER_FROM = 6 
          END 
          
          
          --查询业务单号具体来源
          IF @ORIGIN_NO IS NOT NULL
          BEGIN 
            select @ORIGIN_NO_TEMP = max(n.bill_no) FROM nis_billhead n where n.bill_no = @ORIGIN_NO
			IF @ORIGIN_NO_TEMP IS NOT NULL
			BEGIN 
				SET @VOUNCHER_FROM = 5
			END 
			ELSE
			BEGIN 
				select @ORIGIN_NO_TEMP = r.bill_no from nis_allocation_req r where r.bill_no = @ORIGIN_NO
				IF @ORIGIN_NO_TEMP IS NOT NULL
				BEGIN
					SET @VOUNCHER_FROM = 2 
				END
				ELSE 
				BEGIN 
					SET @VOUNCHER_FROM = -1 
				END 
			END 
          END 
    END 
 
    --更新付款指令来源
   IF @ORIGIN_NO_TEMP is not null
   BEGIN
		update bis_exc  set voucher_from =@VOUNCHER_FROM where voucher_no =''+@VOUNCHER_NO		
   END
   if @ORIGIN_NO_TEMP is null and @IS_FROM_CS = 1
   BEGIN 
		update bis_exc  set voucher_from = 6 where voucher_no =''+@VOUNCHER_NO		
   END 
   
   FETCH next From cur INTO @VOUNCHER_NO
   END
   CLOSE cur --4.关闭游标 
   DEALLOCATE cur --5.释放游标
 end
