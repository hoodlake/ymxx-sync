
--�޸����ڣ�20121218
--�޸��ˣ�������
--�޸����ݣ���ǿ��������Ľ�����,���ӡ��������Ƿ����ѡ�����
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FC_PARAM
   WHERE PARAM_CODE='encrypt_remind';
  IF VN_COUNT < 1 THEN
  insert into fc_param (PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
values ( 'encrypt_remind', '�������Ƿ�����', '1', '1Ϊ����������,0Ϊ�����ܲ�����', '', '', '');

  COMMIT;
 END IF; 
END;
/


