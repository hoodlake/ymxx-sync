--创建人：刘勇
--修改日期：2012-09-12
--修改内容: 新增信贷借款录入、借款补录中还款计划表
--修改原因:需求：XD-JD03-013 系统功能-银行借款信息补录界面-还款计划

--字段说明 
--REPAYMENT_SCHEDULE_ID  还款计划ID
--BILL_CODE              票据号码
--REPAYMENT_BEGIN_DATE   还款开始日
--REPAYMENT_CYCEL        还款周期
--PREDICE_REPAYMENT_DATE 预计还款日
--REPAYMENT_MONEY        还款金额
--REPAYMENT_RATE         还款利息
--CURRENT_REPAYMENT_MONEY 本期还款金额
--REALITY_REPAYMENT_DATE 实际还款日
--REALITY_REPAYMENT_MONEY 实际还款本金
--SURPLUS_MONEY           剩余本金
--IS_REPAY                是否已还
--REMARK                     备注
create table REPAYMENT_SCHEDULE
(
 REPAYMENT_SCHEDULE_ID    NUMBER(10) NOT NULL , 
 BILL_CODE                CHAR(13) NOT NULL,
 REPAYMENT_BEGIN_DATE     DATE   ,
 REPAYMENT_CYCEL          CHAR(2) ,
 PREDICE_REPAYMENT_DATE   DATE  ,   
 REPAYMENT_MONEY          NUMBER(15,2) NOT NULL,
 REPAYMENT_RATE           NUMBER(15,2) NOT NULL,
 CURRENT_REPAYMENT_MONEY  NUMBER(15,2) ,  
 REALITY_REPAYMENT_DATE   DATE,
 REALITY_REPAYMENT_MONEY  NUMBER(15,2),  
 SURPLUS_MONEY            NUMBER(15,2), 
 IS_REPAY                 CHAR(1),
 REMARK                   VARCHAR2(100)
);

--表cms_provide_loan_info新增字段


--保证金比例
alter table cms_provide_loan_info add bailMoney_rate number;

--保证金合同
alter table cms_provide_loan_info add bailMoney_contract VARCHAR2(50);


--浮动方式
alter table cms_provide_loan_info add float_way VARCHAR2(15);

--利率调整生效日期
alter table cms_provide_loan_info add rate_entries_effect_date DATE;

--计息方式
alter table cms_provide_loan_info add interest_way VARCHAR2(15);


--基准利率类型
alter table cms_provide_loan_info add reference_rate_type VARCHAR2(50);

--贷款周期
alter table cms_provide_loan_info add repay_cycle VARCHAR2(50);

--下拉框选择点数或者比例
alter table cms_provide_loan_info add points_proportion_select VARCHAR2(50);

--输入框维护贷款合同规定的点数或浮动比例
alter table cms_provide_loan_info add points_proportion_text VARCHAR2(50);




--表cms_provide_loan_info新增字段

--浮动方式
alter table cms_provide_loan_repay add float_way VARCHAR2(15);

--利率调整生效日期
alter table cms_provide_loan_repay add rate_entries_effect_date DATE;

--计息方式
alter table cms_provide_loan_repay add interest_way VARCHAR2(15);


--基准利率类型
alter table cms_provide_loan_repay add reference_rate_type VARCHAR2(50);

--贷款周期
alter table cms_provide_loan_repay add repay_cycle VARCHAR2(50);

--下拉框选择点数或者比例
alter table cms_provide_loan_repay add points_proportion_select VARCHAR2(50);

--输入框维护贷款合同规定的点数或浮动比例
alter table cms_provide_loan_repay add points_proportion_text VARCHAR2(50);


--展期利率
alter table cms_provide_loan_repay add deferred_rate number(8,6);


--逾期利率
alter table cms_provide_loan_repay add overdue_rate number(8,6);

--上次计息日
alter table cms_provide_loan_repay add last_time_interest_date date;

--贷款利率
alter table cms_provide_loan_repay add pl_rate number(8,6);

--还款计划id
alter table cms_provide_loan_repay add repayment_schedule_id number;

commit

