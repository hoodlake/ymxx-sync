--�޸��ˣ����
--�޸����ڣ�2012-08-08
--�޸�����: ���ݿ�ab_emit�����������ֶ�
--�޸�ԭ��:PJ-JD03-018(�����Կ��жһ�ƱƱ�ݵı�֤�����ʺͱ�֤��������)
--bail_interest_rate:��֤�����ʣ�bail_maturity_date date:��֤��������;
ALTER TABLE ab_emit add bail_maturity_date date;
ALTER TABLE ab_emit add bail_interest_rate number(6,2);
