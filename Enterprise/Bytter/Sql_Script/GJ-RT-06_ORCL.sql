
declare
sqlnum1 number;
begin
 SELECT count(*) into sqlnum1 FROM USER_TAB_COLUMNS
WHERE TABLE_NAME =upper('BT_CORP') and COLUMN_NAME='ISHEAD';
if(sqlnum1 = 0) then
execute immediate 'alter table BT_CORP add ISHEAD NUMBER DEFAULT 0';
end if ;
end ;
/
comment on column BT_CORP.ISHEAD is '是否是本部 0,否 1是';


