
--�޸���:���¾�
--�޸�ʱ��:2012-09-28
--�ʽ����������������������

begin 
 declare  @VOUNCHER_NO CHAR(10);      --����ƾ֤��
 declare  @CBS_BILL_NO VARCHAR(100)
 declare  @ORIGIN_NO   VARCHAR(100); --ԭʼƾ֤��
 declare  @ORIGIN_NO_TEMP VARCHAR(100); --ԭʼƾ֤��
 declare  @VOUNCHER_FROM numeric(2);
 declare  @IS_FROM_CS numeric(1);
 declare  @count_no numeric(5) ;
 set @count_no = 0 
 declare cur cursor for (select e.voucher_no from bis_exc e where e.voucher_from is null )
	open cur 
	fetch  from cur into @VOUNCHER_NO
	WHILE @@FETCH_STATUS=0 
	BEGIN 
	
	--��ղ��� 
	set @CBS_BILL_NO = null
	set @IS_FROM_CS = null
	set @VOUNCHER_FROM = null
	set @ORIGIN_NO_TEMP = null
	
	--��ѯcbs_bill_no
	select  @CBS_BILL_NO  =e.cbs_bill_no from bis_exc e where e.voucher_no = @VOUNCHER_NO
	--���û����Դ����Ϊ��CS�˲����ĸ���ָ��
	IF @CBS_BILL_NO IS NULL 
	BEGIN
		SET @IS_FROM_CS = 1
        SET @VOUNCHER_FROM = 6
	END 
	--���������Դ
	IF @CBS_BILL_NO IS NOT NULL 
	BEGIN
		 
		 SELECT @ORIGIN_NO = max(orig_voucher_no)  FROM ( select voucher_no,orig_voucher_no from fc_accbook  union select voucher_no,orig_voucher_no from fc_accbook_blned ) f where f.voucher_no = @CBS_BILL_NO
          
          --��������ҵ���Ӧ�ļ���,��˵�������BS����
          IF @ORIGIN_NO IS NULL
          BEGIN
			SET @ORIGIN_NO = @CBS_BILL_NO
          END 
          ELSE 
          BEGIN 
			SET @IS_FROM_CS = 1
			SET @VOUNCHER_FROM = 6 
          END 
          
          
          --��ѯҵ�񵥺ž�����Դ
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
 
    --���¸���ָ����Դ
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
   CLOSE cur --4.�ر��α� 
   DEALLOCATE cur --5.�ͷ��α�
 end
