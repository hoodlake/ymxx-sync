--�޸���:��ϲ��
--�޸�ʱ��:2012-11-17
--�޸�����:-BT_BANK_ACC�����ֶ�bemploy_sign �Ƿ���Զ���
declare
sqlnum1 number;
begin
 SELECT count(*) into sqlnum1 FROM USER_TAB_COLUMNS
WHERE TABLE_NAME =upper('bt_bank_acc') and COLUMN_NAME='BEMPLOY_SIGN';
if(sqlnum1 = 0) then
execute immediate 'alter table bt_bank_acc add bemploy_sign char';
end if ;
end ;
/