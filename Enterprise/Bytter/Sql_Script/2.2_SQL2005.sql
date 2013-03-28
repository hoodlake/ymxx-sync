
--修改时间2012-9-11
--修改人 李德成
--修改内容  贷款发放表

-- Create table
create table LOAN_SEND_OUT_INFO
(
  BILL_CODE           VARCHAR(20) not null primary key,
  REPAY_TYPE          VARCHAR(1),
  LOAN_SEND_OUT_DATE  DATETIME,
  REPAY_DATE          DATETIME,
  LOAN_SEND_OUT_MONEY NUMERIC(15,2),
  FATHER_CODE         VARCHAR(13),
  CORP_ID             NUMERIC(10),
  RMK                 VARCHAR(100),
  NEXT_CHECKER        VARCHAR(150),
  APPROVES            VARCHAR(200),
  OP                  VARCHAR(8),
  STATUS              int,
  CONTRACT_CODE       VARCHAR(50),
  LOAN_RATE           NUMERIC(8,6),
  DEFERRED_RATE       NUMERIC(8,6),
  OVERDUE_RATE        NUMERIC(8,6),
  LOAN_DATE           DATETIME,
  PAY_TYPE            VARCHAR(4),
  LOAN_ACC            VARCHAR(16),
  REPAY_ACC           VARCHAR(16)
);

--修改时间2012-9-11
--修改人 李德成
--修改内容 贷款数据表增加字段LOAN_SEND_OUT_TYPE货款发放方式，1：一次性发放  2：分次发放
ALTER TABLE CMS_LOAN_INFO ADD LOAN_SEND_OUT_TYPE  VARCHAR(1);

--修改时间2012-9-11
--修改人 李德成
--修改内容  向库存票据表中增加字段LOAN_SEND_BILL_CODE贷款发放表中的主键
ALTER TABLE AB_RECEIVE ADD LOAN_SEND_BILL_CODE  VARCHAR(20);

  
--表cms_loan_info新增字段
--补录页面 
--输入框维护贷款合同规定的点数或浮动比例
alter table cms_loan_info add points_proportion_text VARCHAR(50);

--下拉框选择点数或者比例
alter table cms_loan_info add points_proportion_select VARCHAR(50);


--浮动方式
alter table cms_loan_info add float_way VARCHAR(15);

--利率调整生效日期
alter table cms_loan_info add rate_entries_effect_date DATETIME;

--计息方式
alter table cms_loan_info add interest_way VARCHAR(15);


--基准利率类型
alter table cms_loan_info add reference_rate_type VARCHAR(50);

--贷款周期
alter table cms_loan_info add repay_cycle VARCHAR(50);

 
-- 增加贷款发放
-- 修改日期：20120821
-- 修改原因：vp5975
-- 修改人：李德成
--先调整顺序，菜单顺序号为5。changed by zhangjf
update bt_sys_res set res_order = res_order + 1 where father_code in (select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms') and res_order >= 5;

insert into BT_SYS_RES   
  (RES_CODE, 
   RES_NAME,
   SYS_CODE,
   FATHER_CODE, 
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '贷款发放',
         'cms',
         res_code,
         '/cms/LoanSendOutPreview.jsp',
         '0',
         '1',
         '0',
         '0',
         5,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '贷款管理'
   and sys_code='cms';
  
  --修改内容：增加贷款发放申请
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('cms_A4', 'cms', '贷款发放', 'A,B,C', 'loan_send_out_info', '', 'loan_send_out_money', '', 'next_checker', 'bill_code', '../cms/LoanSendOutBillShowInclude.jsp', 'com.byttersoft.cms.form.LoanSendOutForm');
go