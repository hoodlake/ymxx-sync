--修改日期：20121109
--修改人：LISHC
--修改内容：
-- Add/modify columns 
alter table CMS_LOAN_INFO add PAY_TYPE varchar(2)
go
alter table CMS_LOAN_INFO add CLB_FIXED_RATE numeric(1)
go
alter table LOAN_SEND_OUT_INFO add CLB_FIXED_RATE numeric(1);
go
update CMS_LOAN_INFO set PAY_TYPE = '1'
go
