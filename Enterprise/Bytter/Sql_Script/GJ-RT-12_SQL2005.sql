--修改人:盖喜洋
--修改时间:2012-11-17
--修改内容:-BT_BANK_ACC增加字段bemploy_sign 是否可以动用
if exists(select 1 from syscolumns where object_id('bt_bank_acc')=id and name='BEMPLOY_SIGN')
  alter table bt_bank_acc drop column BEMPLOY_SIGN;
alter table bt_bank_acc add BEMPLOY_SIGN char;
