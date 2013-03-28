--修改人：李程
--修改日期：2012-08-08
--修改内容: 数据库ab_emit表新增两个字段
--修改原因:PJ-JD03-018(增加自开承兑汇票票据的保证金利率和保证金到期日期)
--bail_interest_rate:保证金利率；bail_maturity_date date:保证金到期日期;
ALTER TABLE ab_emit add bail_maturity_date date;
ALTER TABLE ab_emit add bail_interest_rate number(6,2);
