--�޸�ʱ�䣺2012-12-03
--�޸����ݣ����ݲ�¼�����,���ӿͻ���Ų�������
DECLARE
  @VN_COUNT int;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM ERP_ADDITIONAL_DEFINE
   WHERE FIELD_CODE='VENDOR_NUM';
  IF @VN_COUNT < 1
    BEGIN
	--��ʼ������
	insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_NOT_NULL)values(2,'VENDOR_NUM','�ͻ����','1','0');
  END;
END;
GO