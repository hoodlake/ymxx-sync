--�޸��ˣ���˫
--�޸����ڣ�2012-12-25
--�޸����ݣ�VP7396������ҵ�����ͣ��жһ�Ʊ

DECLARE
  @VN_COUNT INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*)  FROM ERP_VOUCHER_TYPE WHERE ID = 4;
  IF (@VN_COUNT < 1)
  BEGIN
    INSERT INTO ERP_VOUCHER_TYPE
      (ID, VOUCHER_TYPE_CODE, VOUCHER_TYPE_NAME)
    VALUES
      (4, '04', '�жһ�Ʊ');
  END;
END;