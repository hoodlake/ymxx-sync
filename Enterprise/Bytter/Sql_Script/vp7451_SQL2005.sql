--�޸����ڣ�20130107
--�޸��ˣ���̺�
--�޸����ݣ�vp7451 ����ERPת�ƹ�������ʷ���
--�޸����ݣ�ERP_HIS_MONEY �����ֶ� ERP��ʷ���
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'ERP_HIS_MONEY' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
  ALTER TABLE NIS_BILLHEAD ADD ERP_HIS_MONEY numeric(15,2);
GO

--�޸��ֶγ���
alter table nis_billhead alter column billnumber varchar(500);
--�޸ĸ����˺š�����Ա�ֶο���Ϊ��
ALTER TABLE nis_billhead alter column payer_acc varchar(30);
ALTER TABLE nis_billhead alter column op varchar(20);

go

--�޸����ڣ�20130107
--�޸��ˣ���̺�
--�޸����ݣ�vp7451 �����Կ�Ʊ�� �� ����������bill_no
--�޸����ݣ�AB_EMIT �����ֶ� ������ BILL_NO
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'BILL_NO' AND LTRIM(B.NAME) = 'AB_EMIT')
  ALTER TABLE AB_EMIT ADD BILL_NO varchar(20);
GO

--�޸����ڣ�20130107
--�޸��ˣ���̺�
--�޸����ݣ�vp7451 ���ӿ��Ʊ�� �� ����������bill_no
--�޸����ݣ�AB_RECEIVE �����ֶ� ������ BILL_NO
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'BILL_NO' AND LTRIM(B.NAME) = 'AB_RECEIVE')
  ALTER TABLE AB_RECEIVE ADD BILL_NO varchar(20);
GO
