--修改日期：20121129
--修改人lishc
--修改内容：担保合同编码  西北矿业 没有挂担保
-- Add/modify columns 
alter table CMS_LOAN_INFO add guarantee_Contract varchar2(20);
-- Add comments to the columns 
comment on column CMS_LOAN_INFO.guarantee_Contract
  is '
担保合同编码    西北矿业';