 --添加内部贷款的添加查询视图
ALTER VIEW V_LOADFINCOSTADDVIEW AS
select
           fc.finanic_type, --融资类型
           cl.bill_code,     --单据编号/单据编码
           bl.id,           --贷款单位id
           bl.corp_name,     --贷款单位/申请单位
           cl.net_code as load_corp,    --放款单位id
           bb.corp_name as brrowCorp_name,    --放款单位/借款单位
           cl.loan_date,       --借款日期
           cl.repay_date,       --还款日期
           --lasend.BILL_CODE as lasendCode,
           cl.lasendbillcode as lasendCode,
           cl.enter_date,     --录入日期,
          (SELECT bc.cur_name FROM  bt_currency bc where bc.cur_code =  cl.cur_code) as  curName, --币别
          cl.loan_money,
          fc.buss_time,
          fct.type_name,  --费用类型名称
          --费用金额 备注 状态
          fc.cost_amount,
          fc.commen as fcComment,
          fc.status,
          fc.guid     --费用计提id
 from (select case when lasend.bill_code is null then cl.bill_code  
            when lasend.bill_code is not null then lasend.bill_code
            end as bill_codetemp,lasend.bill_code as lasendbillcode,cl.*
from (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl left join loan_send_out_info lasend on cl.bill_code = lasend.father_code) cl
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join (select * from finanic_cost where status != -2) fc on fc.bill_no = cl.bill_codetemp
left join finanic_cost_type fct on fc.cost_type = fct.type_code
GO

ALTER  view v_loadfincostview as
select
           fc.cost_no, --费用编码
           fc.finanic_type, --融资类型
           bl.id,           --贷款单位id
           bl.corp_name,     --贷款单位/申请单位
           fc.load_corp,    --放款单位id
           bb.corp_name as brrowCorp_name,    --放款单位/借款单位
           fc.bill_no as bill_code,     --单据编号/单据编码
           fct.type_code,   --费用类型code
           fct.type_name,    --费用名称
           fc.buss_time,    --发生时间
           fc.cost_amount,   --费用金额
           fc.commen as fcCommen, --费用描述
           fc.status,
           fc.guid,
           --lasend.BILL_CODE as lasendCode --发放编码
           cl.lasendbillcode as lasendCode
 from (select * from finanic_cost where status != -2) fc
inner join (select case when lasend.bill_code is null then cl.bill_code  
            when lasend.bill_code is not null then lasend.bill_code
            end as bill_codetemp,lasend.bill_code as lasendbillcode,cl.*
from (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl left join loan_send_out_info lasend on cl.bill_code = lasend.father_code) cl
on fc.bill_no = cl.bill_codetemp
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
GO

