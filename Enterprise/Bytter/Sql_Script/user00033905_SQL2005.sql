--修改日期：20120918
--修改人：余川锋
--需求编号：XD-JD03-029 系统功能-增加贷款本金
--参数设置：
alter table CMS_BILLING add CLB_LOAN_MONEY numeric(15, 2)
GO
update CMS_BILLING set CLB_LOAN_MONEY = 0 where CLB_LOAN_MONEY is null
GO