--�޸��ˣ��´���
--�޸����ڣ�2012-07-30
--�޸�����: ���ݿ�ab_operation������һ���ֶ�
--�޸�ԭ��:PJ-JD03-010,PJ-JD03-011���ж��Կ��Ϳ��Ʊ������Ʊ��ҵ������գ��Ǽǵ���Ʊ����ҵ���¼��
--BILL_OP_VESTING_DATE:Ʊ��ҵ��������ڣ�NEED_BANKTRANSACT����ҵ���Ƿ���Ҫ���а���
alter table ab_operation add BILL_OP_VESTING_DATE DATETIME
go
alter table ab_operation add NEED_BANKTRANSACT CHAR(1) default 1
go
