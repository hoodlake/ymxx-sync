--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  ��������ݱ��������ֶδ�������LOAN_GENRE�������ͣ�1�������ʽ����     2��Ʊ�ݽ��
ALTER TABLE CMS_LOAN_INFO ADD LOAN_GENRE VARCHAR(1)
go
--��ʷ�����¼���������ֶ�ֵĬ�ϸ�ֵΪ�����ʽ����
update CMS_LOAN_INFO set LOAN_GENRE = 1
go

--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  ����Ʊ�ݱ��������ֶ�LOAN_REPAY_BILL_CODE�������е�����
ALTER TABLE AB_RECEIVE ADD LOAN_REPAY_BILL_CODE  VARCHAR(13)
go
--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸����� ����� PAY_TYPE֧����ʽ   1:�ֻ�֧��   2:Ʊ��֧��
ALTER TABLE CMS_LOAN_REPAY ADD PAY_TYPE  VARCHAR(1)
go