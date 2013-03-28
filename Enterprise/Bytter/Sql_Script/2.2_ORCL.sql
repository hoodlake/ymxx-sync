--修改时间2012-9-11
--修改人 李德成
--修改内容  贷款发放表

-- Create table
create table LOAN_SEND_OUT_INFO
(
  BILL_CODE           VARCHAR2(20) not null primary key,
  REPAY_TYPE          VARCHAR2(1),
  LOAN_SEND_OUT_DATE  DATE,
  REPAY_DATE          DATE,
  LOAN_SEND_OUT_MONEY NUMBER(15,2),
  FATHER_CODE         VARCHAR2(13),
  CORP_ID             NUMBER(10),
  RMK                 VARCHAR2(100),
  NEXT_CHECKER        VARCHAR2(150),
  APPROVES            VARCHAR2(200),
  OP                  VARCHAR2(8),
  STATUS              NUMBER,
  CONTRACT_CODE       VARCHAR2(50),
  LOAN_RATE           NUMBER(8,6),
  DEFERRED_RATE       NUMBER(8,6),
  OVERDUE_RATE        NUMBER(8,6),
  LOAN_DATE           DATE,
  PAY_TYPE            VARCHAR2(4),
  LOAN_ACC            VARCHAR2(16),
  REPAY_ACC           VARCHAR2(16)
);

-- Add comments to the columns 
comment on column LOAN_SEND_OUT_INFO.BILL_CODE
  is '主键';
comment on column LOAN_SEND_OUT_INFO.REPAY_TYPE
  is '还款方式';
comment on column LOAN_SEND_OUT_INFO.LOAN_SEND_OUT_DATE
  is '发放日期';
comment on column LOAN_SEND_OUT_INFO.REPAY_DATE
  is '还款日期';
comment on column LOAN_SEND_OUT_INFO.LOAN_SEND_OUT_MONEY
  is '发放金额';
comment on column LOAN_SEND_OUT_INFO.FATHER_CODE
  is 'cms_loan_info的bill_code';
comment on column LOAN_SEND_OUT_INFO.RMK
  is '备注';
comment on column LOAN_SEND_OUT_INFO.STATUS
  is '状态';
comment on column LOAN_SEND_OUT_INFO.CONTRACT_CODE
  is '合同';
comment on column LOAN_SEND_OUT_INFO.LOAN_RATE
  is '录入日期';
comment on column LOAN_SEND_OUT_INFO.DEFERRED_RATE
  is '展期率';
comment on column LOAN_SEND_OUT_INFO.OVERDUE_RATE
  is '过期率';
comment on column LOAN_SEND_OUT_INFO.LOAN_DATE
  is '贷款率';
comment on column LOAN_SEND_OUT_INFO.PAY_TYPE
  is '支付方式';
comment on column LOAN_SEND_OUT_INFO.LOAN_ACC
  is '贷款账号';
comment on column LOAN_SEND_OUT_INFO.REPAY_ACC
  is '还款账号';
    
--修改时间2012-9-11
--修改人 李德成
--修改内容 贷款数据表
ALTER TABLE CMS_LOAN_INFO ADD(LOAN_SEND_OUT_TYPE  VARCHAR2(1)); 
comment on column CMS_LOAN_INFO.LOAN_SEND_OUT_TYPE
  is '货款发放方式，1：一次性发放  2：分次发放';
  
--修改时间2012-9-11
--修改人 李德成
--修改内容  向库存票据表中增加字段
ALTER TABLE AB_RECEIVE ADD(LOAN_SEND_BILL_CODE  varchar2(20)); 
comment on column AB_RECEIVE.LOAN_SEND_BILL_CODE
  is '贷款发放表中的主键';
  
  
--表cms_loan_info新增字段
--输入框维护贷款合同规定的点数或浮动比例
alter table cms_loan_info add points_proportion_text VARCHAR2(50);

--下拉框选择点数或者比例
alter table cms_loan_info add points_proportion_select VARCHAR2(50);

--补录页面


--浮动方式
alter table cms_loan_info add float_way VARCHAR2(15);

--利率调整生效日期
alter table cms_loan_info add rate_entries_effect_date DATE;

--计息方式
alter table cms_loan_info add interest_way VARCHAR2(15);


--基准利率类型
alter table cms_loan_info add reference_rate_type VARCHAR2(50);

--贷款周期
alter table cms_loan_info add repay_cycle VARCHAR2(50);

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

commit;