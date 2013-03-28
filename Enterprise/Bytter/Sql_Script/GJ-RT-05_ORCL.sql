DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE  RES_NAME='��λ����ά��' and sys_code='adm';
   IF VN_COUNT = 0 THEN
       insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '��λ����ά��', 'adm', (select res_code from bt_sys_res where RES_NAME='��������ά��' and sys_code='adm'), '/admin/CorpGroups.do?method=toList', '0', '1', '0', '0', 16, '', '', '', '', '', '', null, null, null, null, null, 3, '');
   END IF;
end;
/

-- CREATE TABLE ��λ���� for ����Ļ����
DECLARE
  tb NUMBER;
BEGIN
  SELECT COUNT(*) INTO tb FROM tabs WHERE table_name='GJ_CORP_GROUPS';
   IF tb <> 0 THEN
     EXECUTE IMMEDIATE 'DROP TABLE GJ_CORP_GROUPS';
   END IF;
END; 
/
CREATE TABLE GJ_CORP_GROUPS
(
  ID       NUMBER,
  PG_NAME  VARCHAR2(50),
  PG_CODE  char(4),
  SUPER_ID NUMBER,
  display   char(1),
  CORP    VARCHAR2(30),
  PG_LEVEL    NUMBER
);
alter table GJ_CORP_GROUPS add constraint GJ_CORP_GROUPS_PK primary key (ID);
COMMENT ON COLUMN GJ_CORP_GROUPS.CORP IS '��λ����';
COMMENT ON COLUMN GJ_CORP_GROUPS.PG_LEVEL IS '0��ʾ�����ԣ�1��ʾ��';
COMMENT ON COLUMN GJ_CORP_GROUPS.display IS '0��ʾ����ʾ��1��ʾ��ʾ';

declare
sqlnum1 number;
begin
 SELECT count(*) into sqlnum1 FROM USER_TAB_COLUMNS
WHERE TABLE_NAME =upper('GJ_CORP_GROUPS') and COLUMN_NAME='PG_ORDER';
if(sqlnum1 = 0) then
execute immediate 'alter table GJ_CORP_GROUPS add  PG_ORDER NUMBER';
end if ;
end ;
/

