--�޸�ʱ�䣺2011-04-13
--�޸��ˣ�����
--�޸����ݣ��⸶������غ��޸ģ���ʾָ���ظ�
-- �޸����ڣ�20120817
-- �޸��ˣ���̺�
--�޸����ݣ����������������ʿ����������ʸ���ָ��
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
                            SELECT @LS_ERR='ϵͳ�Ѵ���ƾ֤'+@CBS_BILL_NO +'�ĸ���ָ��,�����ٲ�������ָ��!'
     RAISERROR 51888 @LS_ERR
     RETURN
         END
             END 
END
go

