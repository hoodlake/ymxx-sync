--修改日期：20130125
--修改人：张均锋
--修改原因：增加查询发放表信息
--系统功能-费用计提银行借款视图表
IF EXISTS (SELECT * FROM sysobjects WHERE NAME = 'V_PLOADFINCOSTADDVIEW')  
DROP VIEW V_PLOADFINCOSTADDVIEW  
GO
CREATE VIEW V_PLOADFINCOSTADDVIEW AS
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
           send.bill_code as lasendCode,
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
 left join cms_provide_loan_send send on send.FATHER_CODE=cl.bill_code and send.status>=95
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_bank bb on cl.BANK_CODE = bb.BANK_CODE
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code;
GO
