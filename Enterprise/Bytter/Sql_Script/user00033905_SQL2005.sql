--�޸����ڣ�20120918
--�޸��ˣ��ന��
--�����ţ�XD-JD03-029 ϵͳ����-���Ӵ����
--�������ã�
alter table CMS_BILLING add CLB_LOAN_MONEY numeric(15, 2)
GO
update CMS_BILLING set CLB_LOAN_MONEY = 0 where CLB_LOAN_MONEY is null
GO