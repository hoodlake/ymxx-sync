
--�޸���:��ϲ��
--�޸�ʱ��:2012-11-17
--�޸�����:-BT_BANK_ACC�����ֶ�START_BALANCE �ڳ����
if exists(select 1 from syscolumns where object_id('bt_bank_acc')=id and name='START_BALANCE')
  alter table bt_bank_acc drop column START_BALANCE;
alter table bt_bank_acc add START_BALANCE numeric(1);
