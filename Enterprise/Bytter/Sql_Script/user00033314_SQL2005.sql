--修改日期：2012.9.6
--修改人：李鹏飞
--修改内容：XD-JD03-007  增加创建贷款管理的子菜单的脚本
--LOAN_SEND_OUT_INFO
--贷款发放页面 
--输入框维护贷款合同规定的点数或浮动比例
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_TEXT VARCHAR(50);

--下拉框选择点数或者比例
alter table LOAN_SEND_OUT_INFO add POINTS_PROPORTION_SELECT VARCHAR(50);


--浮动方式
alter table LOAN_SEND_OUT_INFO add FLOAT_WAY VARCHAR(15);

--利率调整生效日期
alter table LOAN_SEND_OUT_INFO add RATE_ENTRIES_EFFECT_DATE DATETIME;

--计息方式
alter table LOAN_SEND_OUT_INFO add INTEREST_WAY VARCHAR(15);


--基准利率类型
alter table LOAN_SEND_OUT_INFO add REFERENCE_RATE_TYPE VARCHAR(50);

--贷款周期
alter table LOAN_SEND_OUT_INFO add REPAY_CYCLE VARCHAR(50);

-- 录入日期
alter table LOAN_SEND_OUT_INFO add (LOAN_ENTERING_DATE DATE);
go
