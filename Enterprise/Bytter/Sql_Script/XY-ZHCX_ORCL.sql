--�޸����ڣ�20121219
--�޸��ˣ�����
--�����ţ���ҵ�˻���Ϣ��ѯ
--�޸����ݣ���ҵ�˻���Ϣ��ѯ�������ֶΣ��������ܽӿ�ɨ�ص�����
alter table BIS_ACC_HIS_BAL add CONTROL_MONEY NUMBER(15,2);
alter table BIS_ACC_HIS_BAL add FREEZE_MONEY NUMBER(15,2);
comment on column BIS_ACC_HIS_BAL.CONTROL_MONEY  is '���ƶ��';
comment on column BIS_ACC_HIS_BAL.FREEZE_MONEY  is '������'; 
commit;