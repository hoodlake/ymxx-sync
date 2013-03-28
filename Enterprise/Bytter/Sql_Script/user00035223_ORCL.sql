--修改人：刘之三
--修改日期：  2012-11-26
--修改内容: fbs_corp_item添加预算上期比率
--修改原因: 易才天预算新增需求

alter table fbs_corp_item add priorPeriod_Budget_Rate number(5,2);  
comment on column fbs_corp_item.priorPeriod_Budget_Rate is '添加预算上期比率'; 
   
commit;