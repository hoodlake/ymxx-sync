
--修改人:盖喜洋
--修改时间:2012-11-17
--修改内容:-BT_BANK_ACC增加字段START_BALANCE 期初余额
if exists(select 1 from syscolumns where object_id('bt_bank_acc')=id and name='START_BALANCE')
  alter table bt_bank_acc drop column START_BALANCE;
alter table bt_bank_acc add START_BALANCE numeric(1);
/