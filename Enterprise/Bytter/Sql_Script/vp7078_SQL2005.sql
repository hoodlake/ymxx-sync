
--�޸��ˣ���³�
--�޸����ڣ�2012-12-03
--�޸����ݣ����Ӷ��۹����ѯȨ��
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from BT_SYS_OPERATION  where OP_TYPE = 1 and sys_code = 'amm';
  IF @VN_COUNT < 1
  BEGIN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('amm', 1, '��ѯ');
  END;
END;
GO

--�޸��ˣ���³�
--�޸����ڣ�2012-12-03
--�޸����ݣ����ӻ���ƽ̨����ά��Ȩ��
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from BT_SYS_OPERATION  where OP_TYPE = 1 and sys_code = 'adm';
  IF @VN_COUNT < 1
  BEGIN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('adm', 1, '����ά��');
  END;
END;
GO

--�޸��ˣ���³�
--�޸����ڣ�2012-12-03
--�޸����ݣ����ӻ���ƽ̨�˺���ȨȨ��
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from BT_SYS_OPERATION  where OP_TYPE = 2 and sys_code = 'adm';
  IF @VN_COUNT < 1
  BEGIN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('adm', 2, '�˺���Ȩ');
  END;
END;
GO
