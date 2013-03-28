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
          '01', --计息方式固定 01 还本付息
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