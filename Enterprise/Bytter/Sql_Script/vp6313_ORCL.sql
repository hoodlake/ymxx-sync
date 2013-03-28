--修改时间2012-08-23
--修改人 田进
--修改内容 增加视图v_erp_external_cash_yph
--修改原因 客户需求
create or replace view v_erp_external_cash_yph as
select
b.serial_id,--主键
b.bank_acc,--收款账号
 case when ( select  corp_code from v_acc_list v where v.bank_acc=b.bank_acc) is null
      then (select corp_code from bt_bankacc_app bt where bt.bankacc=b.bank_acc)
      else (select  corp_code from v_acc_list v where v.bank_acc=b.bank_acc)
      end  as corp_code,--收款账号所在单位
(select prov from v_acc_list v where v.bank_acc=b.bank_acc) as prov,--收款账号所在省
b.acc_name,--收款户名
b.bank_name,--收款银行
b.cur,--币别
b.AMT,--收款金额
b.uses,
b.TRANS_TIME,
e.TRAFFIC_TYPE,--业务类型，客户：C；非客户：F
e.status,
b.opp_acc_name,
b.opp_acc_no,
b.opp_acc_bank,
e.IS_IMPORT,
e.receipt_date,
e.customer_name,
e.customer_bank_account,
e.customer_bank_name,
e.outer_num,
(select max(vendor_num) from bt_external_corp where external_corp = b.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = b.bank_acc))--通过帐号查询出corp_code 再通过copr_code在bt_corp查询出id
as vendor_num1,
(select case when count(vendor_num)=1 then max(vendor_num) when count(vendor_num)>1 then 'D' else '' end from bt_external_corp where external_corp = b.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = b.bank_acc))--通过帐号查询出corp_code 再通过copr_code在bt_corp查询出id
as vendor_num,
e.rmk
from bis_acc_his_dtl b
left join erp_external_cash e on trim(b.serial_id) = e.receipt_number where b.cd_sign = '0'
union
select
n.serial_id,--主键
n.bank_acc,--收款账号
 case when ( select  corp_code from v_acc_list v where v.bank_acc=n.bank_acc) is null
      then (select corp_code from bt_bankacc_app bt where bt.bankacc=n.bank_acc)
      else (select  corp_code from v_acc_list v where v.bank_acc=n.bank_acc)
      end  as corp_code,--收款账号所在单位
(select prov from v_acc_list v where v.bank_acc=n.bank_acc) as prov,--收款账号所在省
n.acc_name,--收款户名
n.bank_name,--收款银行
n.cur,--币别
n.AMT,--收款金额
n.uses,
n.TRANS_TIME,
e.TRAFFIC_TYPE,--业务类型，客户：C；非客户：F
e.status,
n.opp_acc_name,
n.opp_acc_no,
n.opp_acc_bank,
e.IS_IMPORT,
e.receipt_date,
e.customer_name,
e.customer_bank_account,
e.customer_bank_name,
e.outer_num,
(select max(vendor_num) from bt_external_corp where external_corp = n.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = n.bank_acc))--通过帐号查询出corp_code 再通过copr_code在bt_corp查询出id
as vendor_num1,
(select case when count(vendor_num)=1 then max(vendor_num) when count(vendor_num)>1 then 'D' else '' end from bt_external_corp where external_corp = n.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = n.bank_acc))--通过帐号查询出corp_code 再通过copr_code在bt_corp查询出id
as vendor_num,
e.rmk
from bis_acc_dtl n
left join erp_external_cash e on trim(n.serial_id) = e.receipt_number where n.cd_sign = '0';