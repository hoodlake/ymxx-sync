--添加内部贷款的查询视图
create or replace view v_loadfincostview as
select
           fc.cost_no, --费用编码
           fc.finanic_type, --融资类型
           bl.id,           --贷款单位id
           bl.corp_name,     --贷款单位/申请单位
           fc.load_corp,    --放款单位id
           bb.corp_name as brrowCorp_name,    --放款单位/借款单位
           cl.bill_code,     --单据编号/单据编码
           fct.type_code,   --费用类型code
           fct.type_name,    --费用名称
           fc.buss_time,    --发生时间
           fc.cost_amount,   --费用金额
           fc.commen as fcCommen, --费用描述
           fc.status,
           fc.guid,
           lasend.BILL_CODE as lasendCode --发放编码
 from (select * from finanic_cost where status != -2) fc
inner join (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
left join loan_send_out_info lasend on cl.bill_code = lasend.father_code;