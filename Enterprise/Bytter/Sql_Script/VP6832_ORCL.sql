--�޸��ˣ���˫
--�޸����ڣ�2012-11-22
--�޸�ԭ��VP6832Ҫ����ӡ�����ǰ�û���ѯ�� �Ĳ���Ȩ�޿���

DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_OPERATION
   WHERE SYS_CODE = 'ads'
     AND OP_TYPE = 3;
  IF VN_COUNT < 1 THEN
    INSERT INTO BT_SYS_OPERATION
      (SYS_CODE, OP_TYPE, TYPE_NAME)
    VALUES
      ('ads', 3, '����ǰ�û���ѯ');
  END IF;
  COMMIT;
END;
/
