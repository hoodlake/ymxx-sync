--�޸�ʱ�䣺2013-01-30
--�޸��ˣ�����
--�޸�ԭ��V10.4BUG,������������û��ͨ�������Ƿ����ÿ��ƿ���
--���н������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '���н������' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (29, 'cms', '29', '���н������', '10', '���н������', '����${count}�����н��ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

