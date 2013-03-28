--�޸�����:����ϵͳģ�飭���˼���
--�޸���:����
--�޸�ʱ��:2012-12-03
create or replace view v_cms_check_dtl_temp as
select c1.corp_name as out_corp_name,
       c2.corp_name as in_corp_name,
       b.precative_id,  --������λID 3
       b.loan_opp, --���뵥λ����  5
       a.money, --������
       a.rate, --��������
       a.term,--����
       c.check_rate, --��������,
		a.bill_code,--ί���������
       (select out_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type') from CMS_CHECK_RULE where out_rule_sql is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp)) out_rule, --��������
       (select in_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type')  from CMS_CHECK_RULE where in_rule_sql is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp))  in_rule,  --�������
       a.send_date,
       a.deadline_date
  from cms_precative_loan_send a, cms_precative_loan_info b,cms_check_rate c,bt_corp c1,bt_corp c2
 where a.father_code = b.bill_code
   and c.corp_id=b.precative_id
   and b.precative_id=c1.id
   and b.loan_opp = c2.id
/
