--�޸�ʱ�䣺2012-12-17
--�޸��ˣ�����
--�޸�ԭ���ʽ�Ԥ��ִ���ܱ������ѹ����޸ĵ����� ����̨��Ϣ����
alter table FBS_ITEM add FBS_PROCESS_RATE NUMBER(5,2);
comment on column FBS_ITEM.FBS_PROCESS_RATE
  is '�������Ԥ��ִ�б���';
 
--�ʽ�Ԥ��ִ���ܱ�������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '�ʽ�Ԥ��ִ���ܱ�������' and Sys_Code = 'fbs';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (20, 'fbs', '20', '�ʽ�Ԥ��ִ���ܱ�������', '10', '�ʽ�Ԥ��ִ���ܱ�������', 'Ԥ���Ŀ���ɹ����ã�ִ�б����Ѵﵽxx%��', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/
--��Ϣ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '��Ϣ����' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (21, 'cms', '21', '��Ϣ����', '10', '��Ϣ����', '����${count}�ʽ���ڱ��£���Ϣ�գ����ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;

/
--���Ϣ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '���Ϣ����' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (22, 'cms', '22', '���Ϣ����', '10', '���Ϣ����', '����${count}�ʴ����ڱ��£���Ϣ�գ����ڣ�', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/