--修改日期：2012.11.15
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(ZY-WD-03-01)
--是否银行办理
alter table cms_precative_loan_info add is_bank char(1) default '0';
--委托申请单号
alter table cms_precative_loan_info add app_code varchar2(20);
--银行代码
alter table cms_precative_loan_info add bank_code char(4);
--担保合同编码
alter table cms_precative_loan_info add gua_hypothec_code varchar2(50);
--还款方式
alter table cms_precative_loan_info add repay_type varchar2(30);
--计息方式
alter table cms_precative_loan_info add interest_way varchar2(15);
--贷款发放方式
alter table cms_precative_loan_info add loan_send_out_type varchar2(1);
--跳过贷款发放功能
alter table cms_precative_loan_info add skip_loan_send_out varchar2(1);
--浮动方式
alter table cms_precative_loan_info add float_way varchar2(15);
--利率调整生效日期
alter table cms_precative_loan_info add rate_entries_effect_date date;
--浮动利率
alter table cms_precative_loan_info add reference_rate_type varchar2(50);
--贷款周期
alter table cms_precative_loan_info add repay_cycle varchar2(50);
--下拉选择点数或比例
alter table cms_precative_loan_info add points_proportion_select varchar2(50);
--输入框维护贷款合同规定的点数或比例
alter table cms_precative_loan_info add points_proportion_text varchar2(50);

commit;

--修改表

--文件上传记录表增加 唯一文件名字段，用 java.uuid 生成
alter table cms_precative_upload_file 
add UNIONFILENAME varchar2(36);


--委托贷款还款表增加字段 还款计划ID
alter table CMS_PRECATIVE_LOAN_REPAY
add REPAYMENT_SCHEDULE_ID number(10);

--委托贷款还款增加字段 还款利息
alter table CMS_PRECATIVE_LOAN_REPAY 
add REPAY_MONEY_RATE number(10,2);


--新建表 CMS_PRECATIVE_LOAN_CCAL 委托贷款试算信息
--刘建武
create table CMS_PRECATIVE_LOAN_SEND
(
  BILL_CODE                CHAR(13) not null,
  PRECATIVE_ID             NUMBER(10) not null,
  FATHER_CODE              VARCHAR2(13),
  CONTRACT_CODE            VARCHAR2(20),
  MONEY                    NUMBER(15,2) not null,
  RATE                     NUMBER(8,6),
  SEND_DATE                DATE not null,
  DEADLINE_DATE            DATE not null,
  REPAY_TYPE               CHAR(2) not null,
  OP                       VARCHAR2(8) not null,
  NEXT_CHECKER             VARCHAR2(150),
  APPROVES                 VARCHAR2(200),
  STATUS                   NUMBER not null,
  ENTER_DATE               DATE not null,
  RMK                      VARCHAR2(400),
  VOUCHER_NO               CHAR(15),
  ORDER_NO                 CHAR(36),
  TALLIER_CODE             CHAR(8),
  DEPOSIT_ACC              VARCHAR2(50),
  VOUCHER_NO2              CHAR(15),
  VOUCHER_NO1              CHAR(15),
  LOAN_ACC                 VARCHAR2(50),
  FLOAT_WAY                VARCHAR2(15),
  RATE_ENTRIES_EFFECT_DATE DATE,
  INTEREST_WAY             VARCHAR2(15),
  REFERENCE_RATE_TYPE      VARCHAR2(50),
  REPAY_CYCLE              VARCHAR2(50),
  POINTS_PROPORTION_SELECT VARCHAR2(50),
  POINTS_PROPORTION_TEXT   NUMBER(15,2),
  TERM                     NUMBER,
  CORP_ID                  NUMBER(10),
  SEND_TIME                NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column CMS_PRECATIVE_LOAN_SEND.BILL_CODE
  is '发放编号(主键)';
comment on column CMS_PRECATIVE_LOAN_SEND.PRECATIVE_ID
  is '委贷单位';
comment on column CMS_PRECATIVE_LOAN_SEND.FATHER_CODE
  is '委贷申请编号';
comment on column CMS_PRECATIVE_LOAN_SEND.CONTRACT_CODE
  is '委贷发放编码';
comment on column CMS_PRECATIVE_LOAN_SEND.MONEY
  is '发放金额';
comment on column CMS_PRECATIVE_LOAN_SEND.RATE
  is '利率';
comment on column CMS_PRECATIVE_LOAN_SEND.SEND_DATE
  is '发放日期';
comment on column CMS_PRECATIVE_LOAN_SEND.DEADLINE_DATE
  is '到期日期';
comment on column CMS_PRECATIVE_LOAN_SEND.REPAY_TYPE
  is '还款方式,01 一次性偿还 ;02 分期偿还 ;03不定';
comment on column CMS_PRECATIVE_LOAN_SEND.OP
  is '操作员';
comment on column CMS_PRECATIVE_LOAN_SEND.NEXT_CHECKER
  is '下个审批人';
comment on column CMS_PRECATIVE_LOAN_SEND.APPROVES
  is '已审批人';
comment on column CMS_PRECATIVE_LOAN_SEND.STATUS
  is '状态';
comment on column CMS_PRECATIVE_LOAN_SEND.ENTER_DATE
  is '录入日期';
comment on column CMS_PRECATIVE_LOAN_SEND.RMK
  is '备注';
comment on column CMS_PRECATIVE_LOAN_SEND.VOUCHER_NO
  is '记账凭证号';
comment on column CMS_PRECATIVE_LOAN_SEND.ORDER_NO
  is '记账流水号';
comment on column CMS_PRECATIVE_LOAN_SEND.TALLIER_CODE
  is '记账员';
comment on column CMS_PRECATIVE_LOAN_SEND.DEPOSIT_ACC
  is '贷款账号';
comment on column CMS_PRECATIVE_LOAN_SEND.FLOAT_WAY
  is '浮动方式';
comment on column CMS_PRECATIVE_LOAN_SEND.RATE_ENTRIES_EFFECT_DATE
  is '利率调整生效日期';
comment on column CMS_PRECATIVE_LOAN_SEND.INTEREST_WAY
  is '计息方式';
comment on column CMS_PRECATIVE_LOAN_SEND.REFERENCE_RATE_TYPE
  is '基准利率类型';
comment on column CMS_PRECATIVE_LOAN_SEND.REPAY_CYCLE
  is '贷款周期';
comment on column CMS_PRECATIVE_LOAN_SEND.POINTS_PROPORTION_SELECT
  is '下拉框选择点数或者比例';
comment on column CMS_PRECATIVE_LOAN_SEND.POINTS_PROPORTION_TEXT
  is '输入框维护贷款合同规定的点数或浮动比例';
comment on column CMS_PRECATIVE_LOAN_SEND.CORP_ID
  is '值同PRECATIVE_ID,审批必须字段';
comment on column CMS_PRECATIVE_LOAN_SEND.SEND_TIME
  is '第几次发放';
  
  
alter table CMS_PRECATIVE_LOAN_SEND
  add constraint PK_CMS_PRECATIVE_LOAN_SEND primary key (BILL_CODE);
  
create index INDEX_CMS_PRECATIVE_LOAN_SEND on CMS_PRECATIVE_LOAN_SEND (BILL_CODE, STATUS, NEXT_CHECKER, APPROVES);

--新建视图
CREATE OR REPLACE VIEW V_CMS_PRECATIVE_LOAN_INFO AS
select info.BILL_CODE,
       info.PD_CODE,
       info.PRECATIVE_ID,
       info.CORP_ID,
       info.CONTRACT_CODE,
       info.POUNDAGE,
       info.LOAN_OPP,
       info.PURPOSE,
       info.CURRENCY,
       info.TERM,
       info.RATE,
       info.MONEY,
       info.HYPOTHEC_CODE,
       info.SURETY_EXPLAIN,
       info.REPAIR_OP,
       info.END_DATE,
       info.START_DATE,
       info.OP,
       info.NEXT_CHECKER,
       info.APPROVES,
       info.STATUS,
       info.ENTER_DATE,
       info.RMK,
       info.VOUCHER_NO,
       info.REVERSE1,
       info.REVERSE2,
       info.REVERSE3,
       info.REVERSE4,
       info.REVERSE5,
       info.REVERSE6,
       info.REVERSE7,
       info.REVERSE8,
       info.REVERSE9,
       info.REVERSE10,
       info.ORDER_NO,
       info.TALLIER_CODE,
       info.POUNDAGE_RATE,
       info.DEPOSIT_ACC,
       info.VOUCHER_NO2,
       info.VOUCHER_NO1,
       info.LOAN_ACC,
       info.IS_BANK,
       info.APP_CODE,
       info.BANK_CODE,
       info.GUA_HYPOTHEC_CODE,
       info.REPAY_TYPE,
       info.INTEREST_WAY,
       info.LOAN_SEND_OUT_TYPE,
       info.SKIP_LOAN_SEND_OUT,
       info.FLOAT_WAY,
       info.RATE_ENTRIES_EFFECT_DATE,
       info.REFERENCE_RATE_TYPE,
       info.REPAY_CYCLE,
       info.POINTS_PROPORTION_SELECT,
       info.POINTS_PROPORTION_TEXT,
       corp1.corp_code precative_id_corp_code,
       corp1.corp_name precative_id_corp_name,
       corp3.corp_code corp_id_corp_code,
       corp3.corp_name corp_id_corp_name,
       corp2.corp_code loan_opp_corp_code,
       corp2.corp_name loan_opp_corp_name,
       bank.bank_name,
       cur.cur_name,
       typ.type_name
  from cms_precative_loan_info info
 inner join bt_corp corp1 on corp1.id = info.precative_id --委托方
 inner join bt_corp corp2 on corp2.id = info.loan_opp --借款方（贷款对象）
  left join bt_corp corp3 on corp3.id = info.corp_id --受托方，如果是is_bank=1, 受托方是银行
  left join bt_bank bank on bank.bank_code = info.bank_code --银行受托方
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join cms_provide_loan_type typ on typ.type_code = info.hypothec_code
                                     and typ.operation_type = 'C';
/



CREATE OR REPLACE VIEW V_CMS_PRECATIVE_LOAN_SEND AS
select send.BILL_CODE,
       send.PRECATIVE_ID,--委托方
       send.FATHER_CODE,
       send.CONTRACT_CODE,
       send.MONEY,
       send.RATE,
       send.SEND_DATE,
       send.DEADLINE_DATE,
       send.REPAY_TYPE,
       send.OP,
       send.NEXT_CHECKER,
       send.APPROVES,
       send.STATUS,
       send.ENTER_DATE,
       send.RMK,
       send.VOUCHER_NO,
       send.ORDER_NO,
       send.TALLIER_CODE,
       send.DEPOSIT_ACC,
       send.VOUCHER_NO2,
       send.VOUCHER_NO1,
       send.LOAN_ACC,
       send.FLOAT_WAY,
       send.RATE_ENTRIES_EFFECT_DATE,
       send.INTEREST_WAY,
       send.REFERENCE_RATE_TYPE,
       send.REPAY_CYCLE,
       send.POINTS_PROPORTION_SELECT,
       send.POINTS_PROPORTION_TEXT,
       send.TERM,
       cur.cur_code,
       cur.cur_name,
       corp1.corp_code,
       corp1.corp_name,
       corp2.corp_code  corp_id_corp_code,
       corp2.corp_name  corp_id_corp_name,
       corp3.corp_code  loan_opp_corp_code,
       corp3.corp_name  loan_opp_corp_name,
       usr.user_code,
       usr.user_name,
       typ.type_code,
       typ.type_name,
       info.hypothec_code,
       info.purpose,
       info.pd_code,
       info.loan_send_out_type,
       info.skip_loan_send_out,
       info.gua_hypothec_code,
       info.bank_code,
       info.app_code,
       info.is_bank,
       info.repair_op,
       info.surety_explain,
       info.poundage_rate,
       info.poundage,
       info.corp_id,--受托方
       info.loan_opp,--借款人
       bank.bank_name --受托行
  from cms_precative_loan_send send
   inner join   cms_precative_loan_info info   on send.father_code = info.bill_code
   inner join    bt_corp                 corp1 on info.precative_id = corp1.id
   left join    bt_corp                 corp2 on info.corp_id=corp2.id
   inner join    bt_corp                 corp3 on info.loan_opp=corp3.id
   inner join    bt_currency             cur   on info.currency = cur.cur_code
   inner join    cms_provide_loan_type   typ   on info.hypothec_code = typ.type_code and typ.operation_type = 'C'
   inner join    bt_user                 usr   on send.op = usr.user_code
   left  join    bt_bank                  bank on bank.bank_code=info.bank_code;
/



create or replace view v_cms_precative_loan_send_info as
select info.BILL_CODE            info_bill_code,        --委托贷款录入单号
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --委托人单位Id
       info.CURRENCY             info_CURRENCY,         --币别代码
       info.TERM                 info_TERM,             --贷款期限
       info.MONEY                info_MONEY,            --贷款金额
       info.ENTER_DATE           info_ENTER_DATE,       --贷款录入日期
       info.hypothec_code        info_hypothec_code,    --担保方式代码
       send.BILL_CODE            send_BILL_CODE,        --发放编号（主键）
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --发放编号（输入）
       send.MONEY                send_MONEY,            --发放金额
       send.SEND_DATE            send_SEND_DATE,        --发放日期
       send.STATUS               send_STATUS,           --发放状态
       temp.USEDMONEY,                                  --已发放金额
       cur.cur_name,                                    --币别名称
       corp.corp_name precative_corp_name,              --委托人名称
       typ.type_name                                    --担保方式名称
  from cms_precative_loan_info info
  --最多同时只能有一个发放记录在业务中
  left join cms_precative_loan_send send on  info.bill_code =
                                            send.father_code
                                        and send.status >= -1
                                        and send.status < 102 --102记账完成
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code =
                                            info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code
 where info.status = 97 --补录完成
   and (temp.usedmoney < info.money or temp.usedmoney is null) --发放金额未完;
;
/


--菜单  信贷管理>>委托贷款>>委托贷款发放

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款发放' AND t1.res_url='/cms/cmsPrecativeLoanSendAction.do?method=goMainPage';
  IF VN_COUNT < 1 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  select  (select max(res_code)+1 from bt_sys_res) , '委托贷款发放', 'cms', (select res_code from bt_sys_res where sys_code='cms' and res_name='委托贷款' and father_code=0), '/cms/cmsPrecativeLoanSendAction.do?method=goMainPage', '0', '0', '0', '0', 9, '中远', '', '', '', '', '', null, null, null, null, null, 1, ''
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms' and father_code=0;
  END IF;
  COMMIT; 
END;
/

--审批业务  cms_C3 委托贷款发放

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_approve_business where business_code='cms_C3';
  IF VN_COUNT < 1 THEN
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_C3','cms','委托贷款发放','A,B,C','cms_precative_loan_send','money','next_checker','bill_code','../cms/cmsPrecativeLoanSendShow.jsp','com.byttersoft.cms.form.CmsPrecativeLoanSendForm'
	from dual;
  END IF;
  COMMIT; 
END;
/

--主键生成器
DECLARE
 VN_count number;
begin 
 select count(*) 
 into VN_count
 from bt_key_generator where keyalisename='CMS_PRECATIVE_LOAN_SEND' and genstrate='cu';
 if VN_count<1 then 
    insert into bt_key_generator(id,keyalisename,custgenclass,genstrate)
    values((select max(id)+1 from bt_key_generator),'CMS_PRECATIVE_LOAN_SEND','com.byttersoft.keyservice.usrdefgenerator.CmsPrecativeLoanSendKeyGenerator','cu');
  end if;
  commit;
end; 
/


--旧流程数据处理，装换成send 数据
insert into cms_precative_loan_send
  (bill_code,
   precative_id,
   father_code,
   contract_code,
   money,
   rate,
   send_date,
   deadline_date,
   repay_type,
   op,
   next_checker,
   approves,
   status,
   enter_date,
   rmk,
   voucher_no,
   order_no,
   tallier_code,
   deposit_acc,
   voucher_no2,
   voucher_no1,
   loan_acc,
   float_way,
   rate_entries_effect_date,
   interest_way,
   reference_rate_type,
   repay_cycle,
   points_proportion_select,
   points_proportion_text,
   term,
   corp_id,
   send_time) 
  select info.bill_code,
         info.precative_id,
         info.bill_code,
         info.contract_code,
         info.money,
         info.rate,
         info.start_date,
         info.end_date,
         '02',
         info.op,
         info.next_checker,
         info.approves,
         info.status,
         info.enter_date,
         info.rmk,
         info.voucher_no,
         info.order_no,
         info.tallier_code,
         info.deposit_acc,
         info.voucher_no2,
         info.voucher_no1,
         info.loan_acc,
          '01', --浮动方式固定01 固定利率
         info.rate_entries_effect_date,
          '03', --计息方式固定 01 还本付息
         info.reference_rate_type,
         info.repay_cycle,
         info.points_proportion_select,
         to_number(info.points_proportion_text),
         info.term,
         info.corp_id,
         1 --发放次数固定1
    from cms_precative_loan_info info 
    where info.status>=97  --补录完成以后的数据
    and info.loan_send_out_type is null --新流程之前的数据此字段一定为空
    and info.bill_code not in(select father_code from cms_precative_loan_send) --在发放表中无发放明细
;
commit;

update CMS_PRECATIVE_LOAN_INFO set LOAN_SEND_OUT_TYPE='1',SKIP_LOAN_SEND_OUT='1' where status>=102;

--新建表 CMS_PRECATIVE_LOAN_CCAL 借款发放表
--andy.huang
-- Create table
create table CMS_PROVIDE_LOAN_SEND
(
  bill_code                VARCHAR2(13) not null,
  father_code              VARCHAR2(13),
  contract_code            VARCHAR2(50),
  money                    NUMBER(15,2) not null,
  send_date                DATE not null,
  deadline_date            DATE not null,
  repay_type               CHAR(2) not null,
  surety_explain           VARCHAR2(200),
  repair_op                VARCHAR2(8),
  op                       VARCHAR2(8) not null,
  pl_rate                  NUMBER(8,6),
  deferred_rate            NUMBER(8,6),
  overdue_rate             NUMBER(8,6),
  nextchecker              VARCHAR2(150),
  approves                 VARCHAR2(200),
  status                   NUMBER,
  enter_date               DATE,
  acc_code                 VARCHAR2(50),
  voucher_no               CHAR(15),
  rmk                      VARCHAR2(400),
  order_no                 CHAR(18),
  tallier_code             VARCHAR2(8),
  float_way                VARCHAR2(15),
  rate_entries_effect_date DATE,
  interest_way             VARCHAR2(15),
  reference_rate_type      VARCHAR2(50),
  repay_cycle              VARCHAR2(50),
  points_proportion_select VARCHAR2(50),
  points_proportion_text   NUMBER(15,2),
  corp_id                  NUMBER(15),
  pl_term                  NUMBER default 0 not null,
  cur_code                 CHAR(2),
  loan_send_out_type       VARCHAR2(1),
  is_skip_process          VARCHAR2(1),
  send_times               NUMBER default 0
);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_SEND.bill_code
  is '发放编号(主键)';
comment on column CMS_PROVIDE_LOAN_SEND.father_code
  is '借款申请编号';
comment on column CMS_PROVIDE_LOAN_SEND.contract_code
  is '借款发放编码';
comment on column CMS_PROVIDE_LOAN_SEND.money
  is '发放金额';
comment on column CMS_PROVIDE_LOAN_SEND.send_date
  is '发放日期';
comment on column CMS_PROVIDE_LOAN_SEND.deadline_date
  is '到期日期';
comment on column CMS_PROVIDE_LOAN_SEND.repay_type
  is '还款方式,01 一次性偿还 ;02 分期偿还 ;03不定';
comment on column CMS_PROVIDE_LOAN_SEND.op
  is '操作员';
comment on column CMS_PROVIDE_LOAN_SEND.pl_rate
  is '利率';
comment on column CMS_PROVIDE_LOAN_SEND.deferred_rate
  is '展期利率';
comment on column CMS_PROVIDE_LOAN_SEND.overdue_rate
  is '逾期利率';
comment on column CMS_PROVIDE_LOAN_SEND.nextchecker
  is '下个审批人';
comment on column CMS_PROVIDE_LOAN_SEND.approves
  is '已审批人';
comment on column CMS_PROVIDE_LOAN_SEND.status
  is '状态';
comment on column CMS_PROVIDE_LOAN_SEND.enter_date
  is '录入日期';
comment on column CMS_PROVIDE_LOAN_SEND.acc_code
  is '账号';
comment on column CMS_PROVIDE_LOAN_SEND.voucher_no
  is '记账凭证号';
comment on column CMS_PROVIDE_LOAN_SEND.rmk
  is '备注';
comment on column CMS_PROVIDE_LOAN_SEND.order_no
  is '记账流水号';
comment on column CMS_PROVIDE_LOAN_SEND.tallier_code
  is '记账员';
comment on column CMS_PROVIDE_LOAN_SEND.float_way
  is '浮动方式';
comment on column CMS_PROVIDE_LOAN_SEND.rate_entries_effect_date
  is '利率调整生效日期';
comment on column CMS_PROVIDE_LOAN_SEND.interest_way
  is '计息方式';
comment on column CMS_PROVIDE_LOAN_SEND.reference_rate_type
  is '基准利率类型';
comment on column CMS_PROVIDE_LOAN_SEND.repay_cycle
  is '贷款周期';
comment on column CMS_PROVIDE_LOAN_SEND.points_proportion_select
  is '下拉框选择点数或者比例';
comment on column CMS_PROVIDE_LOAN_SEND.points_proportion_text
  is '输入框维护贷款合同规定的点数或浮动比例';

-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_PROVIDE_LOAN_SEND
  add constraint PK_CMS_PROVIDE_LOAN_SEND primary key (BILL_CODE);
  
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add loan_send_out_type VARCHAR2(1);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_INFO.loan_send_out_type
  is '借款发放方式，1：一次性发放  2：分次发放';
  
 -- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add is_skip_process VARCHAR2(1);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_INFO.is_skip_process
  is '是否跳过发放流程，1：是  0：否';
  
  
  


DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_approve_business
    WHERE BUSINESS_CODE = 'proloansend';
    IF V_COUNT = 0 THEN
      insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('proloansend', 'cms', '借款发放', 'A,B,C', 'CMS_PROVIDE_LOAN_SEND', '', 'money', '', 'nextchecker', 'bill_code', '../cms/provideloansendcheck.jsp', '', '', '', '', 'com.byttersoft.cms.form.ProvideLoanSendForm', '', '', '', '', '', null, null, null, null, null, '');
    END IF;
END;
/

DECLARE
  V_COUNT NUMBER;
  v_parent_code number;
BEGIN
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_sys_res
    WHERE RES_NAME = '借款发放' and SYS_CODE='cms' and res_level=2;
     SELECT RES_CODE
    INTO v_parent_code
    FROM bt_sys_res
    WHERE RES_NAME = '借款管理' and SYS_CODE='cms' and res_level=1;
    IF V_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE)+1 from bt_sys_res), '借款发放', 'cms', v_parent_code, '/cms/provideLoanSend.do?method=toCorpList', '0', '0', null, '0', 4, null, null, null, null, null, null, null, null, null, null, null, 2, null);
    END IF;
END;
/
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_REPAY add send_code VARCHAR2(20);




--增加展期利率
alter table cms_loan_deferred
add DEFERRED_RATE  NUMBER(8,6);

alter table cms_pl_deferred
add DEFERRED_RATE  NUMBER(8,6);

--融资类型
create table CMS_MAIN_TYPE
(
  TYPE_CODE VARCHAR2(10) not null,
  TYPE_NAME VARCHAR2(30) not null,
  RMK       VARCHAR2(100)
);
alter table CMS_MAIN_TYPE
  add constraint PK_CMS_MAIN_TYPE primary key (TYPE_CODE)
;
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='A';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('A','内部贷款','');
	END IF;
  COMMIT; 
END; 
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='B';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('B','银行借款','');
	END IF;
  COMMIT; 
END; 
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='C';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('C','委托贷款','');
	END IF;
  COMMIT; 
END;
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='D';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('D','贸易融资','');
	END IF;
  COMMIT; 
END;
/


CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL AS
select "CONTRACT_CODE","BILL_CODE","RATE_ID","CYCLE_ID","BILL_TYPE_CODE","BILL_TYPE","LOAN_ACC","CORP_ID","LOAN_SEND_OUT_MONEY","BALANCE","CUR_CODE","LOAN_SEND_OUT_DATE","REPAY_DATE","DELAY_DEADLINE_DATE","LOAN_RATE","DEFERRED_RATE","OVERDUE_RATE","NET_CODE","FLOAT_WAY","BORROW_CODE","BORROW_NAME","INTEREST_WAY","RATE_EFFECT_DATE","POINTS_PRO_SELECT","POINTS_PRO_TEXT" from (
--内部贷款
select b.CONTRACT_CODE,--合同编号
       a.bill_code, --业务编号
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'A' bill_type_code,
       '内部贷款' bill_type,
       a.loan_acc,--账号
       a.corp_id,--单位代码
       a.loan_send_out_money,--(本金)发放金额
       (loan_send_out_money - (select nvl(sum(repay_money),0.00) from cms_loan_repay d where d.li_code=a.bill_code and d.status>=102)) balance,--余额
       b.cur_code,--币别
       a.loan_send_out_date,--起息日期
       a.repay_date,--到期日期
       a.repay_date delay_deadline_date,--展期到期日期
       a.loan_rate,--利率
       a.deferred_rate,--展期利率
       a.overdue_rate,--逾期利率
       b.net_code, --网点
       a.float_way, --浮动方式
       b.net_code borrow_code,--借款人 即网点
       (select net_name from bt_net where net_code=b.net_code) borrow_name,--借款人名称
       a.INTEREST_WAY, --计息方式(预提类型) 1季末结息预提,2季末结息不预提,3每月结息,4季末不结息预提,5季末不结息不预提
       a.RATE_ENTRIES_EFFECT_DATE RATE_EFFECT_DATE,--利率调整生效日期
       a.POINTS_PROPORTION_SELECT POINTS_PRO_SELECT ,--比例/点数  1.比例；2点数
       to_number(a.POINTS_PROPORTION_TEXT) points_pro_text --比例/点数值
  from loan_send_out_info a,cms_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and a.corp_id=c.id
 and a.status>=102 and a.status<>110
 and a.interest_way in ('1','2','3','4','01','02','03','04','5','05')
union
select b.CONTRACT_CODE,--合同编号
       a.bill_code, --业务编号
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'C' test_type_code,
       '委托贷款' test_type,
       a.loan_acc,--账号
       b.loan_opp,--单位代码
       a.money,--(本金)发放金额
       (a.money - (select nvl(sum(d.money),0.00) from cms_precative_loan_repay d where d.pl_code=a.bill_code and d.status>=102)) balance,--余额
       b.currency,--币别
       a.SEND_DATE,--起息日期
       a.DEADLINE_DATE,--到期日期
       a.DEADLINE_DATE delay_deadline_date,--展期到期日期
       a.RATE,--利率
       0.00 deferred_rate,--展期利率
       0.00 overdue_rate,--逾期利率
       c.net_code, --网点
       a.float_way, --浮动方式
       (select corp_code from bt_corp where id=b.precative_id) borrow_code,--借款人 即委托单位
       (select corp_name from bt_corp where id=b.precative_id) borrow_name,--借款人名称
       a.INTEREST_WAY, --计息方式(预提类型)
       a.RATE_ENTRIES_EFFECT_DATE,--利率调整生效日期
       a.POINTS_PROPORTION_SELECT,--比例/点数  1.比例；2点数
       a.POINTS_PROPORTION_TEXT --比例/点数值
  from cms_precative_loan_send a,cms_precative_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and a.precative_id=c.id
 and a.status>=102 and a.status<>110
 and a.interest_way in ('1','2','3','4','01','02','03','04','5','05')
union
--银行借款
select b.CONTRACT_NO,--合同编号
       a.bill_code, --业务编号
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'B' test_type_code,
       '银行借款' test_type,
       a.acc_code,--账号
       b.corp_id,--单位代码
       a.money,--(本金)发放金额
       (a.money - (select nvl(sum(d.repay_money),0.00) from cms_provide_loan_repay d where d.send_code=a.bill_code and d.status>=102)) balance,--余额
       b.cur_code,--币别
       a.SEND_DATE,--起息日期
       a.DEADLINE_DATE,--到期日期
       a.DEADLINE_DATE delay_deadline_date,--展期到期日期
       a.pl_RATE,--利率
       b.deferred_rate,--展期利率
       b.overdue_rate,--逾期利率
       b.net_code ,--网点
       a.float_way, --浮动方式
       b.BANK_CODE, --借款人 即银行代码
       (select bank_name from bt_bank where BANK_CODE=b.BANK_CODE) borrow_name,--借款人名称
       a.INTEREST_WAY, --计息方式(每月结息，季末结息预提，季末结息不预提，季末不结息预提)
       a.RATE_ENTRIES_EFFECT_DATE,--利率调整生效日期
       a.POINTS_PROPORTION_SELECT,--比例/点数  1.比例；2点数
       a.POINTS_PROPORTION_TEXT --比例/点数值
  from cms_provide_loan_send a,cms_provide_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and b.corp_id=c.id
 and a.status>=102 and a.status<>110
 and b.cpl_interest_payment<>'002'
 and a.interest_way in ('1','2','3','4','01','02','03','04','5','05')
);

-- Create table
--预提/结息记录表
create table CMS_INTEREST_REC
(
  ID                  NUMBER(10) not null,
  BALANCE_DATE        DATE not null,
  BILL_CODE           VARCHAR2(50) not null, 
  BILL_TYPE           CHAR(1) not null,
  INTEREST_SIGN       CHAR(1) not null,
  INTEREST_TIME       DATE,
STATUS              CHAR(1) default '0'
)
;
comment on column CMS_INTEREST_REC.ID
  is '主键';
comment on column CMS_INTEREST_REC.balance_date
  is '预提/结息截止日期';
comment on column CMS_INTEREST_REC.bill_code
  is '业务编号';
comment on column CMS_INTEREST_REC.BILL_TYPE
  is '业务类型,A银行借款、B内部贷款、C委托贷款、D贸易融资';
comment on column CMS_INTEREST_REC.INTEREST_SIGN
  is '计息标志,1预提,2计息';
comment on column CMS_INTEREST_REC.INTEREST_TIME
  is '计息时间(预提/结息)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_INTEREST_REC
  add constraint PK_CMS_INTEREST_REC primary key (ID)
;
-- Create/Recreate indexes   CMS_INTEREST_REC
create index IDX_CMS_INTEREST_REC on CMS_INTEREST_REC (BALANCE_DATE,BILL_CODE);

--主键
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM tb_generator where gen_name='cms_interest_rec_id';
	IF N_COUNT < 1 THEN
		insert into tb_generator values((select max(id)+1 from tb_generator),'cms_interest_rec_id',1 );
	END IF;
  COMMIT; 
END;
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM tb_generator where gen_name='cms_interest_dtl_id';
	IF N_COUNT < 1 THEN
		insert into tb_generator values((select max(id)+1 from tb_generator),'cms_interest_dtl_id',1 );
	END IF;
  COMMIT; 
END;
/


--融资利息预提/结息表
-- Create table
create table CMS_INTEREST_DTL
(
  ID                  NUMBER(10) unique,
  INTEREST_TIME       DATE not null,
  BALANCE_DATE        DATE not null,
  CONTRACT_CODE       VARCHAR2(50) not null,
  BILL_CODE           VARCHAR2(50) not null,
  BILL_TYPE           CHAR(1) not null,
  NET_CODE            CHAR(4) NOT NULL,
  CORP_ID             NUMBER(10) not null,
  LOAN_MONEY          NUMBER(14,2) default 0,
  BALANCE             NUMBER(14,2) default 0,
  CUR_CODE            char(4)  null,
  INTEREST_TYPE       CHAR(1) not null,
  INTEREST_START_DATE DATE not null,
  BLN_INST_DATE       DATE not null,
  DAYS                NUMBER(10) not null,
  CUMULATION          NUMBER(14,2) not null,
  INTEREST_RATE       NUMBER(8,6) not null,
  INTEREST            NUMBER(14,2) not null,
  NATURAL_INTEREST    NUMBER(14,2) not null,--
  BORROW_CODE         VARCHAR2(50)  null,--
  BORROW_NAME         VARCHAR2(200)  null,--
  INTEREST_SIGN       CHAR(1) not null,
  STATUS              CHAR(1) default '0',
  RMK                 VARCHAR2(20),
  statusZone          VARCHAR2(10)
)
;
  
comment on column cms_interest_dtl.INTEREST_TIME
  is '计息时间';
comment on column cms_interest_dtl.BALANCE_DATE
  is '时间(即所计利息的月份)';
comment on column cms_interest_dtl.CONTRACT_CODE
  is '合同编号';
comment on column cms_interest_dtl.bill_code
  is '业务编号';
comment on column cms_interest_dtl.bill_type
  is '业务类型';
comment on column cms_interest_dtl.NET_CODE
  is '网点';
comment on column cms_interest_dtl.CORP_ID
  is '单位ID';
comment on column cms_interest_dtl.loan_money
  is '本金';
comment on column cms_interest_dtl.balance
  is '余额';
comment on column cms_interest_dtl.cur_code
  is '币别';
comment on column cms_interest_dtl.INTEREST_TYPE
  is '利息类型';
comment on column cms_interest_dtl.INTEREST_START_DATE
  is '起息日期';
comment on column cms_interest_dtl.BLN_INST_DATE
  is '结束日期';
comment on column cms_interest_dtl.DAYS
  is '天数';
comment on column cms_interest_dtl.CUMULATION
  is '积数';
comment on column cms_interest_dtl.INTEREST_RATE
  is '利率';
comment on column cms_interest_dtl.INTEREST
  is '利息';
comment on column cms_interest_dtl.NATURAL_INTEREST
  is '利息折算成本位币';
comment on column cms_interest_dtl.BORROW_CODE
  is '借款人代码';
comment on column cms_interest_dtl.BORROW_NAME
  is '借款人名称';
comment on column cms_interest_dtl.INTEREST_SIGN
  is '预提/结息,1预提,2结息';
comment on column cms_interest_dtl.STATUS
  is '状态(反流程备用,默认0)';
comment on column cms_interest_dtl.RMK
  is '备注(反流程备用)';
comment on column cms_interest_dtl.statusZone
  is '单据状态（正常，展期，逾期）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table cms_interest_dtl
  add constraint PK_cms_interest_dtl primary key (BILL_CODE,  INTEREST_TIME, INTEREST_TYPE, INTEREST_START_DATE);


--菜单
--delete from BT_SYS_RES t where t.sys_code='cms' and t.res_name in ('融资利息管理','利息匡算','利息预提','结息');
--一级菜单 信贷管理->融资利息管理
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='融资利息管理';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			values( (select max(RES_CODE) + 1 from bt_sys_res),'融资利息管理','cms',0,'','0','0','0','0',4,1,'');
  	END IF;
  	COMMIT;
END;
/

--二级菜单 信贷管理->利息匡算
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='利息匡算';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'利息匡算','cms',RES_CODE,'/cms/rateInRoughlyCalc.jsp','0','0','0','0',1,2,''
         		from bt_sys_res
         			where res_name = '融资利息管理' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
/

--二级菜单 信贷管理->利息预提
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='利息预提';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'利息预提','cms',RES_CODE,'/cms/rateInProvision.jsp','0','0','0','0',2,2,''
         		from bt_sys_res
         			where res_name = '融资利息管理' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
/
--二级菜单 信贷管理->结息
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='结息';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'结息','cms',RES_CODE,'/cms/rateInEnd.jsp','0','0','0','0',3,2,''
         		from bt_sys_res
         			where res_name = '融资利息管理' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
/







	--修改日期：2012.11.27
	--修改人：吴结兵
	--修改内容：中国远洋
	--修改原因：中国远洋脚本更新(融资利息查询)

	--创建视图
	CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL_VIEW AS
	SELECT net.net_name, --网点
	       dtl.CONTRACT_CODE, --合同编号
	       dtl.BILL_CODE, --业务编号
	       type.type_name, --融资类型
	       corp.corp_name, --单位名称 取bt_corp
	       dtl.LOAN_MONEY, --本金
	       dtl.BALANCE, --余额
	       cur.cur_name, --币别 名称取bt_currency
	       dtl.INTEREST_START_DATE, --起息日期
	       dtl.BLN_INST_DATE, --结束日期
	       dtl.DAYS, --天数
	       dtl.CUMULATION, --积数
	       dtl.INTEREST_RATE, --利率
	       dtl.INTEREST, --利息金额
	       dtl.NATURAL_INTEREST, -- 利息折算成本位币
	       dtl.BORROW_NAME, --借款人
	       interest.interest_name, --计息类型 名称取fc_interest_type
	       dtl.INTEREST_SIGN, --业务类型,1预提,2结息
	       dtl.net_code,--查询条件
	       dtl.corp_id,--查询条件
	       dtl.bill_type,--查询条件
	       to_char(dtl.balance_date,'yyyy-MM') as balance_date_str,--查询条件
	       dtl.cur_code, --查询条件
	       DTL.INTEREST_TIME,--查询条件
	       DTL.INTEREST_TYPE--查询条件
	  FROM CMS_INTEREST_DTL dtl
	  inner join bt_net net on net.net_code=dtl.net_code
	  inner join bt_corp corp on dtl.corp_id=corp.id
	  inner join bt_currency cur on dtl.cur_code=cur.cur_code
	  inner join cms_main_type type on type.type_code=dtl.bill_type
	  inner join fc_interest_type interest on dtl.interest_type=interest.interest_code
	 WHERE dtl.STATUS = '0'
	/

	--ZY-XD-06融资信息查询菜单
	DECLARE
	  VN_COUNT    NUMBER;
	BEGIN
	  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'cms' and res_name='利息明细查询';
	  IF VN_COUNT < 1 THEN
	   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
	values((select max(res_code)+1 from bt_sys_res),'利息明细查询','cms',(select res_code from 
	bt_sys_res where res_name='查询' and sys_code='cms'),'/cms/cmsInterestDtlSearch.do?method=beforeOpr','1','0',15);
	  END IF;
	  COMMIT; 
	END;
	/



-- Add/modify columns 
alter table CMS_PL_DEFERRED add expiry_handle_type varchar2(5);

-- Add/modify columns 
alter table CMS_PL_DEFERRED add financ_plans varchar2(100);


DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_param
    WHERE CODE = 'is_financing';
    IF V_COUNT = 0 THEN
      insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('is_financing', 'cms', '展期是否挂融资计划', '0', null, null, '0', 'VALUE = 0，否，VALUE = 1，是', '0,否;1,是', null, null, null, null, 1.00, null, null, null, null);
    END IF;
END;
/


--修改内容:在委托贷款发放表增加字段
--修改人:张均锋
--修改时间:2012-12-10
alter table CMS_PRECATIVE_LOAN_SEND add DEFERRED_REPAY_DATE DATE;
comment on column CMS_PRECATIVE_LOAN_SEND.DEFERRED_REPAY_DATE is '展期后还款日期';

--修改内容:新增委托贷款展期申请表CMS_PRE_DEFERRED
--修改人:黄茜
--修改时间:2012-12-6
create table CMS_PRE_DEFERRED  (
   BILL_CODE            CHAR(13)                        not null,
   PLI_CODE             CHAR(13),
   CORP_ID              NUMBER(10),
   ENTER_DATE           DATE,
   MATURE_DATE          DATE,
   DEFERRED_LIMT        NUMBER,
   ACC_CODE             CHAR(16),
   DEFERRED_REPAY_DATE  DATE,
   EXPIRY_ACT_TYPE      VARCHAR2(10),
   DEFERRED_RATE        NUMBER(8,6),
   CONTRACT_CODE        VARCHAR2(50),
   FINANCING_PLAN_ID    VARCHAR2(100),
   RMK                  VARCHAR2(100),
   NEXT_CHECKER         VARCHAR2(150),
   APPROVES             VARCHAR2(200),
   STATUS               NUMBER,
   REPAIR_OP            VARCHAR2(8),
   OP                   VARCHAR2(8),
   REVERSE1             VARCHAR2(300),
   REVERSE2             VARCHAR2(300),
   REVERSE3             VARCHAR2(300),
   REVERSE4             VARCHAR2(300),
   REVERSE5             VARCHAR2(300),
   REVERSE6             NUMBER(15,2),
   REVERSE7             NUMBER(15,2),
   REVERSE8             NUMBER(15,2),
   REVERSE9             NUMBER(15,2),
   REVERSE10            NUMBER(15,2),
   constraint PK_CMS_PRE_DEFERRED primary key (BILL_CODE)
);
comment on table CMS_PRE_DEFERRED is '委托贷款展期申请表';
comment on column CMS_PRE_DEFERRED.BILL_CODE is '委托贷款展期申请流水号';
comment on column CMS_PRE_DEFERRED.PLI_CODE is '原始委托贷款流水号';
comment on column CMS_PRE_DEFERRED.CORP_ID is '单位ID';
comment on column CMS_PRE_DEFERRED.ENTER_DATE is '录入日期';
comment on column CMS_PRE_DEFERRED.MATURE_DATE is '委托贷款到期日';
comment on column CMS_PRE_DEFERRED.DEFERRED_LIMT is '展期期限';
comment on column CMS_PRE_DEFERRED.ACC_CODE is '结算中心贷款账号';
comment on column CMS_PRE_DEFERRED.DEFERRED_REPAY_DATE is '展期后还款日期';
comment on column CMS_PRE_DEFERRED.EXPIRY_ACT_TYPE is '两种：贷款展期、借新还旧';
comment on column CMS_PRE_DEFERRED.DEFERRED_RATE is '展期利率';
comment on column CMS_PRE_DEFERRED.CONTRACT_CODE is '展期合同号';
comment on column CMS_PRE_DEFERRED.FINANCING_PLAN_ID is '融资计划编号';
comment on column CMS_PRE_DEFERRED.RMK is '备注';
comment on column CMS_PRE_DEFERRED.NEXT_CHECKER is '下个审批人';
comment on column CMS_PRE_DEFERRED.APPROVES is '已审批人';
comment on column CMS_PRE_DEFERRED.STATUS is '状态';
comment on column CMS_PRE_DEFERRED.REPAIR_OP is '补录员';
comment on column CMS_PRE_DEFERRED.OP is '操作员';

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期申请
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期申请' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期申请', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=apply', '0', '1', '0', '0', 10, '委托贷款展期申请', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期修改
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期修改' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期修改', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=edit', '0', '1', '0', '0', 11, '委托贷款展期修改', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期打回
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期打回' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期打回', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=reEdit', '0', '1', '0', '0', 12, '委托贷款展期打回', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/





--修改内容:新增菜单 信贷管理>>委托贷款>>委托贷款展期补录
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='委托贷款展期补录' AND t1.father_code=t2.res_code AND t2.res_name='委托贷款';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '委托贷款展期补录', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=correct', '0', '1', '0', '0', 13, '委托贷款展期补录', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '委托贷款' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--修改内容:审批业务  cms_C4 委托贷款展期
--修改人:张均锋
--修改时间:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_approve_business where business_code='cms_D4';
  IF VN_COUNT < 1 THEN
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_D4','cms','委托贷款展期','A,B,C','CMS_PRE_DEFERRED','money','next_checker','bill_code','../cms/cmsPreDeferred_audit.jsp','com.byttersoft.cms.form.CmsPreDeferredForm'
	from dual;
  END IF;
  COMMIT; 
END;
/




--修改内容:委托贷款发放信息查看视图
--修改人:黄茜
--修改时间:2012-12-7
create or replace view v_cms_pre_loan_send_info as
select send.BILL_CODE            send_BILL_CODE,        --发放编号（主键）
       info.BILL_CODE            info_bill_code,        --委托贷款录入单号
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --委托人单位Id
       info.CURRENCY             info_CURRENCY,         --币别代码
       info.TERM                 info_TERM,             --贷款期限
       info.MONEY                info_MONEY,            --贷款金额
       info.ENTER_DATE           info_ENTER_DATE,       --贷款录入日期
       info.hypothec_code        info_hypothec_code,    --担保方式代码
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --发放编号（输入）
       send.MONEY                send_MONEY,            --发放金额
       send.SEND_DATE            send_SEND_DATE,        --发放日期
       send.STATUS               send_STATUS,           --发放状态
       cur.cur_name,                                    --币别名称
       temp.USEDMONEY,                                  --已发放金额
       corp.corp_name precative_corp_name,              --委托人名称
       typ.type_name                                    --担保方式名称
  from cms_precative_loan_send send
  left join cms_precative_loan_info info on  info.bill_code = send.father_code
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code = info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code;
/
 
--修改内容:新增委托贷款展期申请视图
--修改人:张均锋
--修改时间:2012-12-7
create or replace view V_PRECATIVE_LOAN_SEND_DEFERRED as
select * from (
      select app.BILL_CODE            app_bill_code,        --委托贷款录入单号
             app.PRECATIVE_ID         app_PRECATIVE_ID,     --委托人单位Id
             app.CORP_ID              app_CORP_ID,          --受托人单位id
             app.Loan_Opp             app_loan_Opp,         --借款人单位id（贷款对象）
             app.CURRENCY             app_CURRENCY,         --币别代码
             app.TERM                 app_TERM,             --贷款期限
             app.MONEY                app_MONEY,            --贷款金额
             app.ENTER_DATE           app_ENTER_DATE,       --贷款录入日期
             app.hypothec_code        app_hypothec_code,    --担保方式代码
             typ.type_name            app_hypothec_Name,    --担保方式名称
             send.corp_id             corp_id,         --单位
             send.BILL_CODE           BILL_CODE,       --发放编号（主键）
             send.CONTRACT_CODE       CONTRACT_CODE,   --发放编号（输入）
             send.MONEY               MONEY,           --发放金额
             send.SEND_DATE           SEND_DATE,       --发放日期
             send.STATUS              STATUS,          --发放状态
             send.DEADLINE_DATE       DEADLINE_DATE,    --到期日期
             send.ENTER_DATE,                            --录入日期
             send.term,                                  --期限
             nvl(repay.repay_money,0) repay_money        --已还金额
        from cms_precative_loan_send send
        --最多同时只能有一个发放记录在业务中
        join cms_precative_loan_info app on app.bill_code = send.father_code
        left join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=app.hypothec_code
        left join (select lr.pl_code, sum(lr.money) repay_money
                    from CMS_PRECATIVE_LOAN_REPAY lr where lr.status >= 102
                   group by lr.pl_code) repay on send.Bill_Code = repay.pl_code 
        where send.status >= 102 --已记账
              and not exists (select plr.bill_code from CMS_PRECATIVE_LOAN_REPAY plr where plr.pl_code=send.bill_code and plr.status>=0 and plr.status<102) --不在还款中
              --展期还需要显示，不过虑
              --and not exists (select pd.bill_code from CMS_PRE_DEFERRED pd where send.bill_code=pd.pli_code and (pd.status > -2 and pd.status < 102)) --不在展期中
        ) sd
        --放款还没还完
        where sd.money > sd.repay_money; 
/





update bt_param set name='启用信贷台账管理' where code='is_charging';
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE  RES_NAME='贷款台账管理' and sys_code='cms' and RES_LEVEL=1;
   IF VN_COUNT = 0 THEN
       insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '贷款台账管理', 'cms', 0, '', '0', '1', '0', '0', 0, '', '', '', '', '', '', null, null, null, null, null, 1, '');
   END IF;
end;
/
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款申请录入' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '贷款申请录入', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=1', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款合同生成' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '贷款合同生成', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款发放' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '贷款发放', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款合同设置' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '贷款合同设置', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0'||chr(38)||'opflag=1', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

 delete from bt_sys_res where RES_NAME='贷款台帐' and sys_code='cms' and RES_LEVEL=2;
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '贷款台帐', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/cmsLoanBill.do?method=toList', '0', '1', '0', '0', 4, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 delete from bt_sys_res where RES_NAME='贷款减免' and sys_code='cms' and RES_LEVEL=2;
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '贷款减免', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/cmsLoanAnnul.do?method=initQuery', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 
 delete from bt_sys_res where RES_NAME='贷款还款台账' and sys_code='cms' and RES_LEVEL=2;
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '贷款还款台账', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/cmsLoanRepay.do?method=initQuery', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 
 delete from bt_sys_res where RES_NAME='资金占用费' and sys_code='cms' and RES_LEVEL=2;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '资金占用费', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 delete from bt_sys_res where RES_NAME='计费' and sys_code='cms' and RES_LEVEL=3;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '计费', 'cms', (select res_code from bt_sys_res where res_name='资金占用费' and sys_code='cms'), '/cms/billing.do?method=toList', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 delete from bt_sys_res where RES_NAME='核算占用费' and sys_code='cms' and RES_LEVEL=3;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '核算占用费', 'cms', (select res_code from bt_sys_res where res_name='资金占用费' and sys_code='cms'), '/cms/accountingFee.do?method=toList', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 delete from bt_sys_res where RES_NAME='缴费记录' and sys_code='cms' and RES_LEVEL=3;
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '缴费记录', 'cms', (select res_code from bt_sys_res where res_name='资金占用费' and sys_code='cms'), '/cms/cmsPaymentRecord.do?method=toList', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 
 DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款申请录入' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '贷款申请录入', 'cms', (select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms'), '/cms/loan_add.jsp', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/
   DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款发放' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '贷款发放', 'cms', (select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

     DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款合同生成' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '贷款合同生成', 'cms', (select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='贷款合同设置' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '贷款合同设置', 'cms', (select res_code from bt_sys_res where res_name='贷款管理' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0'||chr(38)||'opflag=1', '0', '1', '0', '0', 13, '', '', '', '', '', '', null, null, null, null, null, 2, ''); 
   END IF;
end;
/
commit;


--修改日期：20121228
--修改人：huangxuean
--修改内容：调整借款以前的数据
--将借款记录插入发放表
insert into CMS_PROVIDE_LOAN_SEND(BILL_CODE,father_code,contract_code,money,SEND_DATE,DEADLINE_DATE,repay_type,
               corp_id,rmk,NEXTCHECKER,APPROVES,op,status,PL_RATE,DEFERRED_RATE,OVERDUE_RATE,ACC_CODE,
         voucher_no,order_no,tallier_code,float_way,rate_entries_effect_date,interest_way,
               REFERENCE_RATE_TYPE,REPAY_CYCLE,POINTS_PROPORTION_SELECT,POINTS_PROPORTION_TEXT,ENTER_DATE,LOAN_SEND_OUT_TYPE,IS_SKIP_PROCESS,CUR_CODE)
select replace(bill_code,'B1','C3'),
       loan.bill_code,
       loan.contract_no,
       loan.PL_MONEY,
        loan.PL_DATE,
  loan.REPAY_DATE,
       loan.repay_type,
       loan.corp_id,
       loan.RMK,
       loan.NEXT_CHECKER,
       loan.APPROVES,
       loan.op,
       loan.status,
       loan.PL_RATE,
       loan.DEFERRED_RATE,
       loan.OVERDUE_RATE,
       loan.ACC_CODE,
       loan.VOUCHER_NO,
       loan.ORDER_NO,
       loan.TALLIER_CODE,
       loan.FLOAT_WAY,
       loan.RATE_ENTRIES_EFFECT_DATE,
       loan.INTEREST_WAY,
       loan.REFERENCE_RATE_TYPE,
       loan.REPAY_CYCLE,
       loan.POINTS_PROPORTION_SELECT,
       loan.POINTS_PROPORTION_TEXT,
       loan.ENTER_DATE,
       '1',
       '1',
       loan.CUR_CODE
  from CMS_PROVIDE_LOAN_info loan
 where
    status in (102, 103, 104)
   and PL_MONEY >= (select nvl(sum(repay_money), 0)
                       from cms_provide_loan_repay
                      where loan.bill_code = cms_provide_loan_repay.pli_code
                        and cms_provide_loan_repay.status <> -2)
   and not exists(select 1 from CMS_PROVIDE_LOAN_SEND send where  send.father_code = loan.bill_code); 
 update CMS_PROVIDE_LOAN_INFO set LOAN_SEND_OUT_TYPE='1',IS_SKIP_PROCESS='1' where status>=102;

   --修改还款表中的li_code
 update CMS_PROVIDE_LOAN_REPAY
    set send_code = (select replace(loan.bill_code, 'B1', 'C3')
                     from CMS_PROVIDE_LOAN_INFO loan
                    where status in (102, 103, 104)
                      and pli_code = loan.bill_code
                      and loan.pl_money >=
                          (select nvl(sum(repay_money), 0)
                             from CMS_PROVIDE_LOAN_REPAY r
                            where loan.bill_code =
                                  r.pli_code
                              and r.status <> -2))
  where exists
  (select 1
           from CMS_PROVIDE_LOAN_INFO loan
          where status in (102, 103, 104)
            and pli_code = bill_code
            and loan.pl_money >=
                (select nvl(sum(repay_money), 0)
                   from CMS_PROVIDE_LOAN_REPAY
                  where loan.bill_code = CMS_PROVIDE_LOAN_REPAY.pli_code
                    and CMS_PROVIDE_LOAN_REPAY.status <> -2));
                        
                    
        commit; 

  

--修改展期表中的                                         
update cms_pl_deferred d
   set d.pli_code = (select replace(bill_code, 'B1', 'C3')
                    from cms_provide_loan_info loan
                   where status in (102, 103, 104)
                     and pli_code = bill_code
                     and pl_money >=
                         (select nvl(sum(repay_money), 0)
                            from cms_provide_loan_repay
                           where loan.bill_code =
                                 cms_provide_loan_repay.pli_code
                             and cms_provide_loan_repay.status <> -2))
 where exists
 (select 1
          from cms_provide_loan_info loan
         where status in (102, 103, 104)
           and pli_code = bill_code
           and loan.pl_money >=
               (select nvl(sum(repay_money), 0)
                  from cms_provide_loan_repay
                 where loan.bill_code = cms_provide_loan_repay.pli_code
                   and cms_provide_loan_repay.status <> -2));

-- 中间业务费 
alter table CMS_PROVIDE_LOAN_SEND add interbusexpenses NUMBER(15,2)  default 0.00;

UPDATE CMS_PROVIDE_LOAN_SEND t SET t.interbusexpenses=0.00 WHERE t.interbusexpenses is null;
UPDATE CMS_PROVIDE_LOAN_SEND t SET t.POINTS_PROPORTION_TEXT=0.00 WHERE t.POINTS_PROPORTION_TEXT is null;
alter table cms_loan_deferred add expiry_handle_type varchar2(5);

--修改日期：20121226
--修改人：李鹏飞
--修改内容：添加字段

DECLARE
  V_CNT_0 INTEGER;

BEGIN
  SELECT COUNT(1) INTO V_CNT_0 FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'CMS_PROVIDE_LOAN_SEND' AND COLUMN_NAME = 'RATETIMEOFTAKEEFFECT';
  IF V_CNT_0 = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE CMS_PROVIDE_LOAN_SEND ADD RATETIMEOFTAKEEFFECT Date';
  END IF;
END;
/

--修改日期：2012.12.31
--修改人：andy.huang
--修改内容：中国远洋
--修改原因：中国远洋脚本更新
--展期到期处理类型
alter table cms_loan_deferred add expiry_handle_type varchar2(5);
