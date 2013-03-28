create or replace view v_query_fc_acc_all as
select c.corp_code,c.corp_name,
b.blnctr_acc,b.acc_name,
b.acc_type_code,d.acc_type_name,
b.shortcut,b.interest_rate,
b.interest_start_date,b.acc_start_date,
to_date(to_char(b.acc_open_time,'yyyy-MM-dd'),'yyyy-MM-dd') as acc_open_time,b.acc_property,
e.cur_code,e.cur_name,
g.subject_code,g.subject_name,
b.acc_attribute,
    case b.acc_attribute
         when '01' then '综合户(可收可支)'
         when '02' then '收入户'
         when '03' then '支出户'
    end  acc_attribute_name,
f.net_code,f.net_name,b.agreed_deposit_sign as regular_sign ,
b.acc_state as fc_status,b.acc_state
from fc_acc b ,bt_corp c ,
fc_acc_type d ,bt_currency e,bt_net f ,fc_subject g
where b.corp_code=c.corp_code
and f.net_code=b.net_code
and b.cur_code=e.cur_code
and g.subject_code=b.subject_code
and d.acc_type_code=b.acc_type_code;