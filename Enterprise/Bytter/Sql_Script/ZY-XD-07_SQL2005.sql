--�޸����ڣ�2012.12.05
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����(����Ѻ��Ǽǽű��޸�)
--��������
alter table GUA_MORTGAGE_INFO add AREA_CORP_NAME varchar(50);
--������������
alter table GUA_MORTGAGE_INFO add coorperation_bank_name varchar(100);
--���н�ɫ
alter table GUA_MORTGAGE_INFO add bank_role varchar(100);
--�Ƿ�ռ����������
alter table GUA_MORTGAGE_INFO add occupy_bank_credit char(1);
--ҵ���������--ʡ
alter table GUA_MORTGAGE_INFO add province varchar(50);
--ҵ���������--��
alter table GUA_MORTGAGE_INFO add city varchar(50);
--�ȼ�
alter table GUA_MORTGAGE_INFO add level_code varchar(50);
--���
alter table GUA_MORTGAGE_INFO add specification varchar(100);
--��Ѻ����ֵ��ͻ�ʵ��ռ�õ����Ŷ�ȱ�����ϵ
alter table GUA_MORTGAGE_INFO add occupy_credit_relation varchar(50);
--��Ѻ��ܺ�ͬ�пͻ�������Լ�������Ŷ���ܶ�
alter table GUA_MORTGAGE_INFO add occupy_credit_money NUMERIC(9,2);
--�ͻ���ռ�õ��������Ŷ�Ȱٷֱ�
alter table GUA_MORTGAGE_INFO add occupy_credit_proportion NUMERIC(8,6);
--���Ѽ���
alter table GUA_MORTGAGE_INFO add alert_level char(1);

GO