--修改人：孙江华
--修改日期：2012-09-14
--修改内容: 新增付款帐号，付款行，行号
--修改原因:需求：_AKS-JD03-07
-- BANK_ACC:付款帐号，BANK_NAME:付款行，BANK_CODE:行号
alter table ab_emit add BANK_ACC VARCHAR(30)
go
alter table ab_emit add BANK_NAME VARCHAR(140)
go
alter table ab_emit add BANK_CODE CHAR(4)
go