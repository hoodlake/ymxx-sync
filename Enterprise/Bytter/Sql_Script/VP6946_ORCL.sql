--�޸����ڣ�20121109
--�޸���lishc
--�޸����ݣ���ӹ̶����� ��֧����ʽ 
-- Add/modify columns 
alter table CMS_LOAN_INFO add PAY_TYPE varchar2(2);
alter table CMS_LOAN_INFO add CLB_FIXED_RATE NUMBER(9,6);

update CMS_LOAN_INFO set PAY_TYPE = '1';