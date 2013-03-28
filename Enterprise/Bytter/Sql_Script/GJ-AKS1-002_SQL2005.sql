-- 修改人邹仁斌 
--日期：2012-10-16
--需求 奥克斯_国际结算_GJ-AKS1-002

--通知行
Alter table lc_enrol add NOTIFYING_BANK VARCHAR(40);
--通知书编号
Alter table lc_enrol add NOTIFYING_BILL VARCHAR(40);
--交单期限
Alter table lc_enrol add HAND_DOC_TL DATE;
--客户名称
Alter table lc_enrol add CUSTOMER_NAME VARCHAR(100) ;
--保证金 
Alter table lc_enrol add BAIL_MONEY NUMERIC(18,2)  Default 0;

--查询统计中，用来保存 预算执行月 
Alter table lc_enrol add bugget_month VARCHAR(10); 

go 