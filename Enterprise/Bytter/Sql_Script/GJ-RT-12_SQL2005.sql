--�޸���:��ϲ��
--�޸�ʱ��:2012-11-17
--�޸�����:-BT_BANK_ACC�����ֶ�bemploy_sign �Ƿ���Զ���
if exists(select 1 from syscolumns where object_id('bt_bank_acc')=id and name='BEMPLOY_SIGN')
  alter table bt_bank_acc drop column BEMPLOY_SIGN;
alter table bt_bank_acc add BEMPLOY_SIGN char;
