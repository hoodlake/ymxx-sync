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

--�޸����ڣ�20130108
--�޸��ˣ���³�
--�޸����ݣ��������Ӻ��ֵ�λ����
--�޸�����  AB_RECEIVE �����ֶ� ������NEXT_VENDOR_NUM
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'NEXT_VENDOR_NUM' AND LTRIM(B.NAME) = 'AB_RECEIVE')
  ALTER TABLE AB_RECEIVE ADD NEXT_VENDOR_NUM VARCHAR2(31);
GO
