
--�޸��ˣ���³�
--�޸����ڣ�2012-12-03
--�޸����ݣ����Ӷ��۹����ѯȨ��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 1 and sys_code = 'amm';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('amm', 1, '��ѯ');
  END IF;
  COMMIT; 
END;
/

--�޸��ˣ���³�
--�޸����ڣ�2012-12-03
--�޸����ݣ����ӻ���ƽ̨����ά��Ȩ��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 1 and sys_code = 'adm';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('adm', 1, '����ά��');
  END IF;
  COMMIT; 
END;
/

--�޸��ˣ���³�
--�޸����ڣ�2012-12-03
--�޸����ݣ����ӻ���ƽ̨�˺���ȨȨ��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 2 and sys_code = 'adm';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('adm', 2, '�˺���Ȩ');
  END IF;
  COMMIT; 
END;
/