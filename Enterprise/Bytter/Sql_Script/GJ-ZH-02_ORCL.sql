--�޸���:��ϲ��
--�޸�ʱ��:2012-11-17
--�޸�����:-BT_BANK_ACC�����ֶ�START_BALANCE �ڳ����
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