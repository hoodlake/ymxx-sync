-- �޸������ʱ� 
--���ڣ�2012-10-16
--���� �¿�˹_���ʽ���_GJ-AKS1-002

--֪ͨ��
Alter table lc_enrol add NOTIFYING_BANK VARCHAR(40);
--֪ͨ����
Alter table lc_enrol add NOTIFYING_BILL VARCHAR(40);
--��������
Alter table lc_enrol add HAND_DOC_TL DATE;
--�ͻ�����
Alter table lc_enrol add CUSTOMER_NAME VARCHAR(100) ;
--��֤�� 
Alter table lc_enrol add BAIL_MONEY NUMERIC(18,2)  Default 0;

--��ѯͳ���У��������� Ԥ��ִ���� 
Alter table lc_enrol add bugget_month VARCHAR(10); 

go 