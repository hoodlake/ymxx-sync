
--�޸����ڣ�20121210
--�޸��ˣ�������
--�޸����ݣ���ͨCFCA3.0֤����������CFCA�汾�����ֶ�
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FC_PARAM
   WHERE PARAM_CODE='cfca_version';
  IF VN_COUNT < 1 THEN
  insert into fc_param (PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
values ( 'cfca_version', 'CFCA�汾��', '0', '1ΪCFCA3.0�汾,0Ϊ�ϰ汾', '', '', '');

  COMMIT;
 END IF; 
END;
/


