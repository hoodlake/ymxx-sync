--创建人：刘勇
--修改日期：2012-10-19
--修改内容: 借款划款，贷款划款，贷款发放
--修改原因:需求：XD-JD03-013、XD-JD03-008、XD-JD03-009、XD-JD03-010 系统功能-银行借款信息补录界面-还款计划

--cms_loan_info添加send_time字段
alter table cms_loan_info add send_time number default 1;
--repayment_schedule添加send_time字段
alter table repayment_schedule add send_time number;
commit;
