--�޸�ʱ��2012-11-05
--�޸��� andyhuang
--�޸�����  �˺Ź���-�����ϴ�����
-- Create table
create table BT_APPROVE_FILE
(
  ID                numeric(10) not null,
  FILE_PATH         VARCHAR(511),
  FILE_NAME         VARCHAR(200),
  FILE_DESC         VARCHAR(511),
  TARGET_TABLE_NAME VARCHAR(100),
  TARGET_ID         VARCHAR(100),
  CREATE_DATE       datetime default getdate(),
  CREATE_USER       VARCHAR(50)
);
--�޸Ŀ����˺���Ϣ�����ӻ�ƿ�Ŀ
  -- Add/modify columns 
alter table BT_BANKACC_APP add SAP_SUBJECT VARCHAR(50);

alter table bt_bankacc_app add his_acc_category varchar(6);

alter table BT_APPROVE_FLOW_DTL add APPRO_STATUS VARCHAR(50);


