
--�޸����ڣ�20130108
--�޸��ˣ�������
--�޸����ݣ�����״̬��0�ɹ���1ʧ��
--�޸�����  FC_ACCBOOK �����ֶ�TRANS_STATUS
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TRANS_STATUS' AND LTRIM(B.NAME) = 'FC_ACCBOOK')
  ALTER TABLE FC_ACCBOOK ADD TRANS_STATUS CHAR(1);
GO
--�޸����ڣ�20130108
--�޸��ˣ�������
--�޸����ݣ�erpƾ֤��
--�޸�����  FC_ACCBOOK �����ֶ�ERP_VOUCHER_NO
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'ERP_VOUCHER_NO' AND LTRIM(B.NAME) = 'FC_ACCBOOK')
  alter table FC_ACCBOOK add ERP_VOUCHER_NO VARCHAR2(30);
GO
--�޸����ڣ�20130108
--�޸��ˣ�������
--�޸����ݣ��������
--�޸�����  FC_ACCBOOK �����ֶ�SEND_FREQUENCY
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'SEND_FREQUENCY' AND LTRIM(B.NAME) = 'FC_ACCBOOK')
  alter table FC_ACCBOOK add SEND_FREQUENCY number default 0;
GO
--�޸����ڣ�20130108
--�޸��ˣ�������
--�޸����ݣ�������Ϣ
--�޸�����  FC_ACCBOOK �����ֶ�TRANS_MSG
--�������ã�
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TRANS_MSG' AND LTRIM(B.NAME) = 'FC_ACCBOOK')
  ALTER TABLE FC_ACCBOOK ADD TRANS_MSG VARCHAR2(500);
GO