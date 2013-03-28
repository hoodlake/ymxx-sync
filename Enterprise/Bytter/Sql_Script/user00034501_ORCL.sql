--修改时间2012-11-06
--修改人 andyhuang
--修改内容  账号管理-审批上传符件

-- Drop columns 
alter table BT_BANKACC_APP drop column SAP_SUBJECT1;
--修改开户账号信息，增加会计科目
  -- Add/modify columns 
alter table BT_BANKACC_APP add SAP_SUBJECT VARCHAR2(50);
-- Add comments to the columns 
comment on column BT_BANKACC_APP.SAP_SUBJECT
  is '会计科目';
  


