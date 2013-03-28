--修改时间2012-11-05
--修改人 andyhuang
--修改内容  账号管理-审批上传符件
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
  is '文件存储路径';
comment on column BT_APPROVE_FILE.FILE_NAME
  is '文件名称';
comment on column BT_APPROVE_FILE.FILE_DESC
  is '文件描述';
comment on column BT_APPROVE_FILE.TARGET_TABLE_NAME
  is '对应日志表名';
comment on column BT_APPROVE_FILE.TARGET_ID
  is '对应日志ID';  
comment on column BT_APPROVE_FILE.TARGET_ID
  is '创建日期'; 
comment on column BT_APPROVE_FILE.TARGET_ID
  is '创建人';

--修改开户账号信息，增加会计科目
  -- Add/modify columns 
alter table BT_BANKACC_APP add SAP_SUBJECT VARCHAR2(50);
-- Add comments to the columns 
comment on column BT_BANKACC_APP.SAP_SUBJECT
  is '会计科目';
  
alter table bt_bankacc_app add his_acc_category varchar2(6);

alter table BT_APPROVE_FLOW_DTL add APPRO_STATUS VARCHAR2(50);

