--�޸����ڣ�20130228
--�޸��ˣ���̺�
--�޸����ݣ��˺���Ȩ����
--�������ã�
--�˺���Ȩ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '�˺���Ȩ����' and Sys_Code = 'adm';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (23, 'adm', '23', '�˺���Ȩ����', 10, '�˺���Ȩ����', '����${count}���˺���Ȩ���ѣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/
