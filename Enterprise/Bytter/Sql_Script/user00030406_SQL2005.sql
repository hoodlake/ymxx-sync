--修改人：费滔
--修改日期：2012-09-05
--修改内容: 增加sqlserver相关表的字段，和修改视图
--修改原因:BUGuser00030406,sqlserver表，视图没有同步
----点击国资监管平台下所有菜单报错。

alter table ERP_ACCBAL add  create_date datetime 
go
alter table ERP_BANK_INFO add  create_date datetime 
go
alter table erp_accdetail add  create_date datetime 
go
drop  view verp_acc_bal_list 
go
create  view verp_acc_bal_list  as
select  b.bank_type,
e.erp_id as erp_bank_type,
c.corp_name,c.net_sign,c.id as corp_id,
g.type_name as bank_type_name,
d.erp_id as exp_cur_code,
f.uuid,f.status,h.erp_id as erp_corp_code,a.bank_acc ,b.bank_name,a.avail_bal,
a.bal_date,a.bank_bal,j.CORP_CODE,j.ACC_NAME,j.CUR,'his'+a.bank_acc+a.bal_date id,'his' datasource,f.create_date
from  bis_acc_his_bal a
left join v_acc_list j on (j.bank_acc= a.bank_acc)
left join bt_bank b on b.bank_code = j.bank_code
left join bt_corp c on   c.corp_code= j.corp_code
left join bt_bank_type g on g.bank_type=b.bank_type
left join erp_basic_data d on j.cur=d.bytter_id and d.data_type='CUR' and d.erp_sys_name='gzw'
left join erp_basic_data e on b.bank_type = e.bytter_id and e.data_type='BANK_TYPE' and e.erp_sys_name='gzw'
left join ERP_ACCBAL f on f.acc_no = a.bank_acc and f.bal_date= a.bal_date
left join erp_basic_data h on j.corp_code = h.bytter_id and h.data_type='CORP' and h.erp_sys_name='gzw'
union
select  b.bank_type,
e.erp_id as erp_bank_type,
c.corp_name,c.net_sign,c.id as corp_id,
g.type_name as bank_type_name,
d.erp_id as exp_cur_code,
f.uuid,f.status,h.erp_id as erp_corp_code,a.bank_acc ,b.bank_name,a.avail_bal,
a.query_time,a.bal,j.CORP_CODE,j.ACC_NAME,j.CUR,a.bank_acc+a.query_time id,'now' datasource,f.create_date
from  bis_acc_bal a
left join v_acc_list j on (j.bank_acc= a.bank_acc)
left join bt_bank b on b.bank_code = j.bank_code
left join bt_corp c on   c.corp_code= j.corp_code
left join bt_bank_type g on g.bank_type=b.bank_type
left join erp_basic_data d on j.cur=d.bytter_id and d.data_type='CUR' and d.erp_sys_name='gzw'
left join erp_basic_data e on b.bank_type = e.bytter_id and e.data_type='BANK_TYPE' and e.erp_sys_name='gzw'
left join ERP_ACCBAL f on f.acc_no = a.bank_acc and CONVERT(varchar(10), f.BAL_DATE, 120) = CONVERT(varchar(10), a.QUERY_TIME, 120) 
left join erp_basic_data h on j.corp_code = h.bytter_id and h.data_type='CORP' and h.erp_sys_name='gzw'
go

drop  view verp_acc_list
go
create  view verp_acc_list as
select b.bank_type,e.erp_id as erp_bank_type,c.corp_name,c.net_sign,f.create_date,
c.id as corp_id,
g.type_name as bank_type_name,
d.erp_id as erp_cur,f.uuid,f.status,h.erp_id as erp_corp_code, a."BANK_ACC",a."BIF_CODE",a."ACC_NAME",a."BANK_NAME",a."CUR",a."BANK_CODE",a."AREA_CODE",a."PRENT_ACC",a."CORP_CODE",a."ACC_TYPE",a."BANK_GRANT_ID",a."ENT_LICENSE_ID",a."ENT_ID",a."PARENT_SIGN",a."REGISTER_DATE",a."VALID_SIGN",a."SCAN_FLAG",a."ORG_CODE",a."RMK",a."PURPOSE",a."BIS_TYPE",a."COUNTER_ACC",a."PRIVATE_NO",a."CHARGE_MODE",a."DIR_SIGN",a."PROV",a."CITY",a."ACC_MODE",a."ACC_TYPE1",a."PSBKNO",a."PSBKSQNO"
from  v_acc_list a
left join bt_bank b on a.BANK_CODE = b.bank_code
left join bt_corp c on a.CORP_CODE = c.corp_code
left join erp_basic_data d on a.CUR=d.bytter_id and d.data_type='CUR' and d.erp_sys_name='gzw'
left join erp_basic_data e on b.bank_type = e.bytter_id and e.data_type='BANK_TYPE' and e.erp_sys_name='gzw'
left join erp_bank_info f on f.acc_no = a.bank_acc
left join bt_bank_type g on g.bank_type=b.bank_type
left join erp_basic_data h on a.CORP_CODE = h.bytter_id and h.data_type='CORP' and h.erp_sys_name='gzw'
where a.VALID_SIGN=1
go


drop  view verp_acc_dtl
go
create  view verp_acc_dtl as
select b.uuid,c.CORP_CODE,d.erp_id as erp_corp_code,a.trans_time,a.bank_acc,
a.acc_name,c.bank_name,a.opp_acc_no,a.opp_acc_name,a.opp_acc_bank,a.cd_sign,
a.amt,a.uses,a.abs,a.cur,e.erp_id as erp_cur ,a.serial_id,f.id as corp_id,f.corp_name,'his' as data_source,
'his'+a.serial_id as id,b.status,b.create_date
from bis_acc_his_dtl a
left join erp_accdetail b on a.serial_id=b.serial_id
left join v_acc_list c on  c.BANK_ACC=a.bank_acc
left join erp_basic_data d on d.bytter_id=c.CORP_CODE and d.erp_sys_name='gzw' and d.data_type='CORP'
left join erp_basic_data e on e.bytter_id=a.cur and e.erp_sys_name='gzw' and e.data_type='CUR'
left join bt_corp f on f.corp_code=c.CORP_CODE
union
select b.uuid,c.CORP_CODE,d.erp_id as erp_corp_code,a.trans_time,a.bank_acc,
a.acc_name,c.bank_name,a.opp_acc_no,a.opp_acc_name,a.opp_acc_bank,a.cd_sign,
a.amt,a.uses,a.abs,a.cur,e.erp_id as erp_cur ,a.serial_id,f.id as corp_id,f.corp_name,'current' as data_source,
'current'+a.serial_id as id,b.status,b.create_date
from bis_acc_dtl a
left join erp_accdetail b on a.serial_id=b.serial_id
left join v_acc_list c on  c.BANK_ACC=a.bank_acc
left join erp_basic_data d on d.bytter_id=c.CORP_CODE and d.erp_sys_name='gzw' and d.data_type='CORP'
left join erp_basic_data e on e.bytter_id=a.cur and e.erp_sys_name='gzw' and e.data_type='CUR'
left join bt_corp f on f.corp_code=c.CORP_CODE
go
