--�޸����ڣ�2013-02-20 16:19:02
--�޸��ˣ����¾�
--�޸����ݣ����ز���,���д�������ܱ������˻����ȡֵѡ��
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='aqs_bank_balance_way' AND SYS_CODE='adm';
  IF VN_COUNT < 1 THEN
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('aqs_bank_balance_way', 'adm', '���д�������ܱ��������ȡ��', '0', null, null, '0', 'ȡ����Դ 0,ȡ����ʷ����;1,ȡ����ʷ��ϸ��; ', '0,ȡ����ʷ����;1,ȡ����ʷ��ϸ��', '', '', '', '', null, null, null, null, null);
  COMMIT;
 END IF; 
END;
/
