--修改时间：2011-04-13
--修改人：刘鹏
--修改内容：外付网银打回后，修改，提示指令重复
-- 修改日期：20120817
-- 修改人：祁继鸿
--修改内容：触发器，代发工资可以生成两笔付款指令
ALTER TRIGGER TR_BIS_EXC_INS
ON BIS_EXC
FOR INSERT
AS
BEGIN
    DECLARE @CNT INT
    DECLARE @CBS_BILL_NO VARCHAR(20)
    DECLARE @VOUCHER_NO VARCHAR(20)
    DECLARE @LS_ERR VARCHAR(100)

    SELECT @CBS_BILL_NO=CBS_BILL_NO,@VOUCHER_NO=VOUCHER_NO
    FROM INSERTED

    IF  @CBS_BILL_NO IS NOT NULL AND @CBS_BILL_NO<>''
  BEGIN 
  SELECT @CNT=COUNT(*) FROM BIS_EXC 
             WHERE CBS_BILL_NO=@CBS_BILL_NO AND VOUCHER_NO <> @VOUCHER_NO and (voucher_stat<>'B' and voucher_stat<>'7') and voucher_type <> '48';
    
  IF @CNT >0 
         BEGIN
                            ROLLBACK
                            SELECT @LS_ERR='系统已存在凭证'+@CBS_BILL_NO +'的付款指令,不能再产生付款指令!'
     RAISERROR 51888 @LS_ERR
     RETURN
         END
             END 
END
go

