--修改内容:新增系统模块－资金管理中心
--修改人:吴结兵
--修改时间:2012-12-01
--考核计算视图
create or replace view v_cms_check_dtl_temp as
select c1.corp_name as out_corp_name,
       c2.corp_name as in_corp_name,
       b.precative_id,  --贷出单位ID 3
       b.loan_opp, --贷入单位代码  5
       a.money, --贷款金额
       a.rate, --贷款利率
       a.term,--期限
       c.check_rate, --考核利率,
		a.bill_code,--委贷发方编号
       (select out_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type') from CMS_CHECK_RULE where out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp)) out_rule, --贷出规则
       (select in_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type')  from CMS_CHECK_RULE where out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp))  in_rule,  --贷入规则
       a.send_date,
       a.deadline_date
  from cms_precative_loan_send a, cms_precative_loan_info b,cms_check_rate c,bt_corp c1,bt_corp c2
 where a.father_code = b.bill_code
   and c.corp_id=b.precative_id
   and b.precative_id=c1.id
   and b.loan_opp = c2.id
/   