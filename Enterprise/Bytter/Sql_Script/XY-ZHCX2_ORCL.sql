--�޸����ڣ�20121219
--�޸��ˣ�����
--�����ţ���ҵ�˻���Ϣ��ѯ
--�޸����ݣ���ҵ�˻���Ϣ��ѯ�������ֶΣ��������ܽӿ�ɨ�ص�����
-- Add/modify columns 
alter table BT_BANKACC_APP add ACCOUNT_TYPE varchar2(6);
-- Add comments to the columns 
comment on column BT_BANKACC_APP.ACCOUNT_TYPE
  is '�ʻ�����--��ҵ���нӿڷ��� 0-һ���˻� 1-��Ȩ�ʻ�';
commit;