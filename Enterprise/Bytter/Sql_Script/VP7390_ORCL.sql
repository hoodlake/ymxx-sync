--修改日期：2013-01-09
--修改人：黄学安
--修改内容：增加预计利息
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add antic_interest NUMBER(15,2);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_INFO.antic_interest
  is '预计利息';
