--修改日期：20121022
--修改人：高枫
--修改内容：FY-AKS1-02 系统功能-费用计提
--修改内容：系统菜单 增加 费用计提
--参数设置：
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '费用计提', 'cms', RES_CODE, '/cms/financiCount.do?method=initQuery', '0', '1', '0', '0', (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '费用管理' AND T3.SYS_CODE = 'cms'
go

/*==============================================================*/
/* Table: FINANIC_COST                                          */
/*==============================================================*/
--费用管理费用计提表
create table FINANIC_COST  (
   GUID                 VARCHAR(40)                     not null,
   COST_NO              VARCHAR(40),
   FINANIC_TYPE         INT,
   REQ_CORP             NATIONAL CHAR VARYING(40),
   LOAD_CORP            VARCHAR(40),
   BILL_NO              VARCHAR(40),
   BUSS_TIME            DATETIME,
   COST_TYPE            VARCHAR(40),
   COST_AMOUNT          NUMERIC(18,2),
   COMMEN               VARCHAR(255),
   STATUS               INT,
   OP_CODE              VARCHAR(40),
   CREATE_TIME          DATETIME,
   UPDATE_TIME          DATETIME,
   UPDATER              VARCHAR(40),
   NEXT_CHECKER VARCHAR(150),     --下一个审批人
   APPROVES VARCHAR(200),         --当前审批人     
   PASS_DATE DATETIME,                 --审批通过实践
   CORP_ID NUMERIC(10),             --贷款id
   constraint PK_FINANIC_COST primary key (GUID)
)

alter table FINANIC_COST
   add constraint FK_FINANIC__COST_TYPE_FINANIC_ foreign key (COST_TYPE)
      references FINANIC_COST_TYPE (TYPE_CODE)
go
      
 --添加内部贷款的添加查询视图
CREATE VIEW V_LOADFINCOSTADDVIEW AS
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
 from (select * from cms_loan_info where (STATUS !=-2 and STATUS != 0)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
left join loan_send_out_info lasend on cl.bill_code = lasend.father_code
go

--添加内部贷款的查询视图
create  view v_loadfincostview as
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
inner join (select * from cms_loan_info where (STATUS !=-2 and STATUS != 0)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
go

insert into bt_approve_business
  (BUSINESS_CODE,
   SYS_CODE,
   BUSINESS_NAME,
   BUSINESS_LEVEL,
   TABLE_NAME,
   BILL_CODE_FIELD2,
   MONEY_FIELD,
   TABLE_FIELD,
   NEXT_CHECKER_FIELD,
   BILL_CODE_FIELD,
   URL1,
   URL2,
   URL3,
   URL4,
   URL5,
   CLASS_PATH,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   TOTAL_SET)
values
  ('cms_finat',
   'cms',
   '费用计提',
   'A,B,C',
   'FINANIC_COST',
   '',
   'COST_AMOUNT',
   '',
   'next_checker',
   'COST_NO',
   '../cms/FinanciView.jsp',
   '',
   '',
   '',
   '',
   'com.byttersoft.cms.form.FinanciCountForm',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   '')
go

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '费用统计', 'cms', RES_CODE, '/cms/financiCount.do?method=initQuery'+char(38)+'total=true', '0', '1', '0', '0', (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '费用管理' AND T3.SYS_CODE = 'cms';
go

CREATE  VIEW V_PLOADFINCOSTADDVIEW AS
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
 from (select * from CMS_PROVIDE_LOAN_INFO where (STATUS !=-2 and STATUS != 0)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_bank bb on cl.BANK_CODE = bb.BANK_CODE
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
go

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
           fc.guid
 from finanic_cost fc
inner join cms_provide_loan_info cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --贷款单位id
inner join bt_bank bb on cl.bank_code = bb.bank_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
where fc.status != -2