--�޸�ʱ�䣺2013-01-29
--�޸��ˣ�����
--�޸�ԭ��V10.4BUG,������������û��ͨ�������Ƿ����ÿ��ƿ���
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '�жҽ������' and Sys_Code = 'ads';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (24, 'ads', '24', '�жҽ������', '10', '�жҽ������', '����${count}�ʳжҽ�㵽�ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

--�ж���������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '�ж���������' and Sys_Code = 'ads';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (25, 'ads', '25', '�ж���������', '10', '�ж���������', '����${count}�ʳж����յ��ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 
--���������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '���������' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (26, 'cms', '26', '���������', '10', '���������', '����${count}�ʴ���ڵ��ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

--ί�д�������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = 'ί�д�������' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (27, 'cms', '27', 'ί�д�������', '10', 'ί�д�������', '����${count}��ί�д���ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

--ί�д�����ѱ�������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = 'ί�д������' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (28, 'cms', '28', 'ί�д������', '10', 'ί�д������', '����${count}��ί�д��ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 
