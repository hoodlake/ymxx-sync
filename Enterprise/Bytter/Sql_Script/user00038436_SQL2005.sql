--修改日期：20130121
--修改人：黄学安
--修改内容：增加借款发放视图
DROP VIEW v_cms_provide_loan;
create  view v_cms_provide_info_send as 
select s.bill_code as BILL_CODE,s.money as MONEY,s.cur_code as CUR_CODE,i.bank_code as BANK_CODE,i.bank_name as BANK_NAME,s.status as STATUS,s.corp_id as CORP_ID,s.send_date as SEND_DATE from cms_provide_loan_send s,cms_provide_loan_info i 
where i.bill_code=s.father_code;

create  view v_ploadfincostview as
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
           fc.guid,
           send.bill_code as lasendCode
 from finanic_cost fc
inner join (select * from cms_provide_loan_info where (STATUS !=110 and STATUS >= 97)) cl on fc.req_corp = cl.bill_code
left join cms_provide_loan_send send on send.FATHER_CODE=cl.bill_code and send.status>=95
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_bank bb on cl.bank_code = bb.bank_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
where fc.status != -2;
