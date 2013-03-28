 --添加内部贷款的添加查询视图
CREATE OR REPLACE VIEW V_LOADFINCOSTADDVIEW AS
select
           fc.finanic_type, --融资类型
           cl.bill_code,     --单据编号/单据编码
           bl.id,           --贷款单位id
           bl.corp_name,     --贷款单位/申请单位
           --fc.load_corp,    --放款单位id
           cl.net_code as load_corp,    --放款单位id
           bb.corp_name as brrowCorp_name,    --放款单位/借款单位
           cl.loan_date,       --借款日期
           cl.repay_date,       --还款日期
           lasend.BILL_CODE as lasendCode,
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
 from (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
left join loan_send_out_info lasend on cl.bill_code = lasend.father_code;

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
           fc.guid
 from (select * from finanic_cost where status != -2) fc
inner join (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code;

--银行借款视图表
CREATE OR REPLACE VIEW V_PLOADFINCOSTADDVIEW AS
select
           fc.finanic_type, --融资类型
           cl.bill_code,     --单据编号/单据编码
           bl.id,           --贷款单位id
           bl.corp_name,     --贷款单位/申请单位
           cl.BANK_CODE as load_corp,    --放款单位id
           bb.bank_name as brrowCorp_name,    --放款单位/借款单位
           cl.BANK_TYPE,                       --放款银行类型
           cl.pl_date as loan_date,       --借款日期
           cl.repay_date,       --还款日期
           --lasend.BILL_CODE as lasendCode,
           cl.enter_date,     --录入日期,
          (SELECT bc.cur_name FROM  bt_currency bc where bc.cur_code =  cl.cur_code) as  curName, --币别
          cl.pl_money as loan_money,
          fc.buss_time,
          fct.type_name,  --费用类型名称
          --费用金额 备注 状态
          fc.cost_amount,
          fc.commen as fcComment,
          fc.status,
          fc.guid     --费用计提id
 from (select * from CMS_PROVIDE_LOAN_INFO where (STATUS !=110 and STATUS >= 97)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_bank bb on cl.BANK_CODE = bb.BANK_CODE
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code;

create or replace view v_ploadfincostview as
select
           fc.cost_no, --费用编码
           fc.finanic_type, --融资类型
           bl.id,           --贷款单位id
           bl.corp_name,     --贷款单位/申请单位
           fc.load_corp,    --放款单位id
           bb.bank_name as brrowCorp_name,    --放款单位/借款单位
           cl.BANK_TYPE,                       --放款银行类型
           cl.bill_code,     --单据编号/单据编码
           fct.type_code,   --费用类型code
           fct.type_name,    --费用名称
           fc.buss_time,    --发生时间
           fc.cost_amount,   --费用金额
           fc.commen as fcCommen, --费用描述
           fc.status,
           fc.guid
 from finanic_cost fc
inner join (select * from cms_provide_loan_info where (STATUS !=110 and STATUS >= 97)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_bank bb on cl.bank_code = bb.bank_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
where fc.status != -2;