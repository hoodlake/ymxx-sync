--�޸�ʱ��2012-11-05
--�޸��� andyhuang
--�޸�����  �˺Ź���-�����ϴ�����
-- Create table
create table BT_APPROVE_FILE
(
  ID                NUMBER(10) not null,
  FILE_PATH         VARCHAR2(511),
  FILE_NAME         VARCHAR2(200),
  FILE_DESC         VARCHAR2(511),
  TARGET_TABLE_NAME VARCHAR2(100),
  TARGET_ID         VARCHAR2(100),
  CREATE_DATE       DATE default sysdate,
  CREATE_USER       VARCHAR2(50)
);
comment on column BT_APPROVE_FILE.FILE_PATH
  is '�ļ��洢·��';
comment on column BT_APPROVE_FILE.FILE_NAME
  is '�ļ�����';
comment on column BT_APPROVE_FILE.FILE_DESC
  is '�ļ�����';
comment on column BT_APPROVE_FILE.TARGET_TABLE_NAME
  is '��Ӧ��־����';
comment on column BT_APPROVE_FILE.TARGET_ID
  is '��Ӧ��־ID';  
comment on column BT_APPROVE_FILE.TARGET_ID
  is '��������'; 
comment on column BT_APPROVE_FILE.TARGET_ID
  is '������';

--�޸Ŀ����˺���Ϣ�����ӻ�ƿ�Ŀ
  -- Add/modify columns 
alter table BT_BANKACC_APP add SAP_SUBJECT VARCHAR2(50);
-- Add comments to the columns 
comment on column BT_BANKACC_APP.SAP_SUBJECT
  is '��ƿ�Ŀ';
  
alter table bt_bankacc_app add his_acc_category varchar2(6);

alter table BT_APPROVE_FLOW_DTL add APPRO_STATUS VARCHAR2(50);

