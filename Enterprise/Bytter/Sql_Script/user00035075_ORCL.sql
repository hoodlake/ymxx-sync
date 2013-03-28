--修改人:盖喜洋
--修改时间:2012-11-17
--修改内容:-BT_BANK_ACC增加字段START_BALANCE 期初余额
declare
sqlnum1 number;
begin
 SELECT count(*) into sqlnum1 FROM USER_TAB_COLUMNS
WHERE TABLE_NAME =upper('bt_bank_acc') and COLUMN_NAME='START_BALANCE';
if(sqlnum1 = 0) then
execute immediate 'alter table bt_bank_acc add START_BALANCE number(15,2)';
end if ;
end ;
/