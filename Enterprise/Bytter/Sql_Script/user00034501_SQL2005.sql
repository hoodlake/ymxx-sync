--�޸�ʱ��2012-11-06
--�޸��� andyhuang
--�޸�����  �˺Ź���-�����ϴ�����

-- Drop columns 
alter table BT_BANKACC_APP drop column SAP_SUBJECT1;
--�޸Ŀ����˺���Ϣ�����ӻ�ƿ�Ŀ
  -- Add/modify columns 
alter table BT_BANKACC_APP add SAP_SUBJECT VARCHAR(50);

  