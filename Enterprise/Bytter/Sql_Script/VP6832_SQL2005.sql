--�޸��ˣ���˫
--�޸����ڣ�2012-11-22
--�޸�ԭ��VP6832Ҫ����ӡ�����ǰ�û���ѯ�� �Ĳ���Ȩ�޿���

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_OPERATION
   WHERE SYS_CODE = 'ads'
     AND OP_TYPE = 3;
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO BT_SYS_OPERATION
        (SYS_CODE, OP_TYPE, TYPE_NAME)
      VALUES
        ('ads', 3, '����ǰ�û���ѯ');
    END;
END;
GO
