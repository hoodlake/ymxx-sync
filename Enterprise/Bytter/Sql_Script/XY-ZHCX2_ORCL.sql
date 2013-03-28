--修改日期：20121219
--修改人：费滔
--需求编号：兴业账户信息查询
--修改内容：兴业账户信息查询，新增字段，用来接受接口扫回的数据
-- Add/modify columns 
alter table BT_BANKACC_APP add ACCOUNT_TYPE varchar2(6);
-- Add comments to the columns 
comment on column BT_BANKACC_APP.ACCOUNT_TYPE
  is '帐户类型--兴业银行接口返回 0-一般账户 1-授权帐户';
commit;