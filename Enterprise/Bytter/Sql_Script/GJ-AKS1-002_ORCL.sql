-- �޸������ʱ� 
--���ڣ�2012-10-16
--���� �¿�˹_���ʽ���_GJ-AKS1-002 

--֪ͨ��
Alter table lc_enrol add NOTIFYING_BANK VARCHAR2(40);
--֪ͨ����
Alter table lc_enrol add NOTIFYING_BILL VARCHAR2(40);
--��������
Alter table lc_enrol add HAND_DOC_TL DATE;
--�ͻ�����
Alter table lc_enrol add CUSTOMER_NAME VARCHAR2(100); 
--��֤�� 
Alter table lc_enrol add BAIL_MONEY  number(18,2);  

--��ѯͳ���У��������� Ԥ��ִ���� 
Alter table lc_enrol add bugget_month VARCHAR2(10); 
 

commit; 