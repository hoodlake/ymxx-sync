--修改日期：20121109
--修改人lishc
--修改内容：添加固定利率 和支付方式 
-- Add/modify columns 
alter table CMS_LOAN_INFO add PAY_TYPE varchar2(2);
alter table CMS_LOAN_INFO add CLB_FIXED_RATE NUMBER(9,6);

update CMS_LOAN_INFO set PAY_TYPE = '1';

-- Add/modify columns 
alter table LOAN_SEND_OUT_INFO add CLB_FIXED_RATE number(15,6);
comment on column LOAN_SEND_OUT_INFO.CLB_FIXED_RATE
  is '固定费率';
delete   from loan_send_out_info lo where lo.contract_code is null;