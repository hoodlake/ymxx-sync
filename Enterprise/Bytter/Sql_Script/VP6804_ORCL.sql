--�޸����ڣ�20121126
--�޸��ˣ� ���
--�޸�ԭ��vp6804�¿�˹AD�򵥵��¼�������û�ӳ���OUTER_USER_CODE����д�û���WINDOWS��¼������������USER_CODE��bt_user�����user_code
---------��������ϵͳ����
declare
  i integer;
begin
  select count(*) into i from user_tables where table_name = 'OUTER_USER_RELATIONSHIP';
  if i = 0 then
    execute immediate 'CREATE TABLE OUTER_USER_RELATIONSHIP(
    OUTER_USER_CODE VARCHAR2(200) NOT NULL,
    USER_CODE VARCHAR2(8) NOT NULL,
    CONSTRAINT PK_OUTER_USER_RELATIONSHIP PRIMARY KEY (USER_CODE)
);';
  end if;
end;
/

DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
    WHERE code = 'SENDTODO';
    IF VN_COUNT = 0 THEN
    insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
	values ('sendToDo', 'adm', '�Ƿ�ʵʱ�������', '0', null, null, '0', '�Ƿ�����,1-����,0-������', '1,����;0,������', '', '', '', '', 1.00, 14.00, null, null, null);
end if;
end;
/

DECLARE
  SA_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO SA_COUNT
    FROM bt_param
    WHERE code = 'SENDADDRESS';
    IF SA_COUNT = 0 THEN
    insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
  values ('sendAddress', 'adm', '��������ַ', '', null, null, '0', '', '', '', '', '', '', 0.00, 15.00, null, null, null);
end if;
end;
/
