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
