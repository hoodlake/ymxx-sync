--�޸����ڣ�20121109
--�޸��ˣ�LISHC
--�޸����ݣ�
-- Add/modify columns 
alter table CMS_LOAN_INFO add PAY_TYPE varchar(2);
alter table CMS_LOAN_INFO add CLB_FIXED_RATE NUMRIC(9,6);

update CMS_LOAN_INFO set PAY_TYPE = '1';