--�޸����ڣ�20121109
--�޸��ˣ�LISHC
--�޸����ݣ�
-- Add/modify columns 
alter table CMS_LOAN_INFO add PAY_TYPE varchar(2)
go
alter table CMS_LOAN_INFO add CLB_FIXED_RATE numeric(1)
go
alter table LOAN_SEND_OUT_INFO add CLB_FIXED_RATE numeric(1);
go
update CMS_LOAN_INFO set PAY_TYPE = '1'
go
