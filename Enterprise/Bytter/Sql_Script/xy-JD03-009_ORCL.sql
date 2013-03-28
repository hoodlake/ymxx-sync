--修改日期：20120821
--修改人：  余川锋
--修改内容: 1.TB_GENERATOR表中添加第三方存管表的ID字段;
--          2.第三方存管审批定义;
--          3.第三方存管菜单定义;
--          4.BT_BANK_ACC添加是否签约账号字段;
--          5.增加 证劵资金账号表、证劵资金账号银行账号维护表与第三方存管表、第三方存管余额查询、第三方存管资金查询表
--          6.银行账号管理菜单(银行账号关系维护 ) 
--TB_GENERATOR表中添加第三方存管表的ID字段;
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'SEC_ACC_MTC_ID', 1);
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'THIRD_ID', 1);
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'VOUCHER_CODE', 1);
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'BIS_QUERY_DEP_CMD_ID', 1);
--审批定义
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('thirddep', 'cho', '理财证劵', 'A,B,C', 'FC_THIRD_DEP', '', 'amt', '', 'nextchecker', 'THIRD_ID', '../chowmatistic/fcThirdCheck.jsp', '', '', '', '', 'com.byttersoft.chowmatistic.form.FcThirdDepForm', '', '', '', '', '', null, null, null, null, null, '');
--删除已添加菜单
delete from bt_sys_res where FATHER_CODE in (select res_code from bt_sys_res  where res_name='证劵资金账号维护'  and sys_code='cho' and res_level=2);
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='普通存管' and sys_code='cho');
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='融资融劵' and sys_code='cho');
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='查询' and sys_code='cho');
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='第三方存管' and sys_code='cho');
delete from bt_sys_res where res_name='第三方存管';
--添加1级菜单
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '第三方存管', 'cho', 0, '', '0', '0', '0', '0', 3, '第三方存管', '', '', '', '', '', null, null, null, null, null, 1, '');
--添加2级菜单
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '证劵资金账号维护', 'cho', (select res_code from bt_sys_res  where res_name='第三方存管'), '', '0', '1', '0', '0', 1, '证劵资金账号维护', '', '', '', '', '', null, null, null, null, null, 2, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '普通存管', 'cho', (select res_code from bt_sys_res  where res_name='第三方存管'), '', '0', '1', '0', '0', 2, '普通存管', '', '', '', '', '', null, null, null, null, null, 2, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '融资融劵', 'cho', (select res_code from bt_sys_res  where res_name='第三方存管'), '', '0', '1', '0', '0', 3, '融资融劵', '', '', '', '', '', null, null, null, null, null, 2, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '查询', 'cho', (select res_code from bt_sys_res  where res_name='第三方存管'), '', '0', '1', '0', '0', 4, '查询', '', '', '', '', '', null, null, null, null, null, 2, '');
--添加3级菜单
--1
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '证劵资金账号维护', 'cho', (select res_code from bt_sys_res  where res_name='证劵资金账号维护' and res_level=2), '/chowmatistic/createSecuritiesfundsAccount.jsp', '0', '1', '0', '0', 1, '证劵资金账号维护', '', '', '', '', '', null, null, null, null, null, 3, '');
--2
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '普通存管录入', 'cho', (select res_code from bt_sys_res  where res_name='普通存管'), '/chowmatistic/createOrdinaryDeposit.jsp', '0', '1', '0', '0', 1, '普通存管录入', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '修改普通存管单据', 'cho', (select res_code from bt_sys_res  where res_name='普通存管'), '/chowmatistic/updateOrdinaryDeposit.jsp', '0', '1', '0', '0', 2, '修改普通存管单据', '', '', '', '', '', null, null, null, null, null, 3, '');
--3
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '融资融劵录入', 'cho', (select res_code from bt_sys_res  where res_name='融资融劵'), '/chowmatistic/createSecFinancing.jsp', '0', '1', '0', '0', 1, '融资融劵录入', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '修改融资融劵单据', 'cho', (select res_code from bt_sys_res  where res_name='融资融劵'), '/chowmatistic/updateSecFinancing.jsp', '0', '1', '0', '0', 2, '修改融资融劵单据', '', '', '', '', '', null, null, null, null, null, 3, '');
--4
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '签约查询', 'cho', (select res_code from bt_sys_res  where res_name='查询' and sys_code='cho'), '/chowmatistic/queryThirdSign.jsp', '0', '1', '0', '0', 1, '签约查询', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '明细查询', 'cho', (select res_code from bt_sys_res  where res_name='查询' and sys_code='cho'), '/chowmatistic/queryThirdDetail.jsp', '0', '1', '0', '0', 2, '明细查询', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '资金查询', 'cho', (select res_code from bt_sys_res  where res_name='查询' and sys_code='cho'), '/chowmatistic/queryThirdFund.jsp', '0', '1', '0', '0', 3, '资金查询', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '查询付款指令', 'cho', (select res_code from bt_sys_res  where res_name='查询' and sys_code='cho'), '/chowmatistic/queryThirdIns.jsp', '0', '1', '0', '0', 4, '查询付款指令', '', '', '', '', '', null, null, null, null, null, 3, '');
--
alter table BT_BANK_ACC add SIGN_FLG CHAR(1);
comment on column BT_BANK_ACC.SIGN_FLG is '是否签约账号';
--新增
-- Create table
create table FC_SEC_ACC
(
  SEC_ACC_NUM VARCHAR2(50),
  SEC_TRADER  VARCHAR2(200),
  SEC_ACC     VARCHAR2(50),
  CUR         CHAR(2),
  VALID_SIGN  CHAR(1),
  RMK         VARCHAR2(100),
  CORP_ID     NUMBER(10),
  STATUS      NUMBER(10)
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
comment on column FC_SEC_ACC.SEC_ACC_NUM
  is '开户编号';
comment on column FC_SEC_ACC.SEC_TRADER
  is '开户劵商';
comment on column FC_SEC_ACC.SEC_ACC
  is '证劵资金账号';
comment on column FC_SEC_ACC.CUR
  is '币别 ';
comment on column FC_SEC_ACC.VALID_SIGN
  is '有效标识';
comment on column FC_SEC_ACC.RMK
  is '备注';
comment on column FC_SEC_ACC.CORP_ID
  is '单位ID';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FC_SEC_ACC
  add constraint UNIQ_FC_SEC_ACC_1 unique (SEC_ACC)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create table
create table FC_SEC_ACC_MTC
(
  SEC_ACC_MTC_ID NUMBER,
  SEC_ACC        VARCHAR2(50),
  BANK_ACC       VARCHAR2(50),
  PREFERRED_SIGN CHAR(1),
  OP             VARCHAR2(20),
  OP_CODE        VARCHAR2(20),
  OP_DATE        DATE,
  STATUS         NUMBER(10)
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
comment on column FC_SEC_ACC_MTC.SEC_ACC_MTC_ID
  is '编号';
comment on column FC_SEC_ACC_MTC.SEC_ACC
  is '证劵资金账号';
comment on column FC_SEC_ACC_MTC.BANK_ACC
  is '银行账号';
comment on column FC_SEC_ACC_MTC.PREFERRED_SIGN
  is '首选账号';
comment on column FC_SEC_ACC_MTC.OP
  is '操作员';
comment on column FC_SEC_ACC_MTC.OP_CODE
  is '操作员代码';
comment on column FC_SEC_ACC_MTC.OP_DATE
  is '申请时间';
-- Create table
create table FC_THIRD_DEP
(
  THIRD_ID       NUMBER,
  BANK_ACC       VARCHAR2(50),
  AVAIL_BAL      NUMBER(15,2),
  WISH_PAYDAY    DATE,
  INTERFACE_ID   VARCHAR2(12),
  APPOINT_ID     NUMBER,
  SEC_ACC        VARCHAR2(50),
  SEC_AVAIL_BAL  NUMBER(15,2),
  AMT            NUMBER(15,2),
  BURSAR_BILL_NO VARCHAR2(40),
  BILL_TYPE      CHAR(2),
  FUND_PASS      VARCHAR2(50),
  THIRD_TYPE     CHAR(2),
  STATUS         NUMBER(10),
  OP             VARCHAR2(20),
  OP_CODE        VARCHAR2(20),
  APPROVES       NVARCHAR2(200),
  NEXTCHECKER    VARCHAR2(100),
  CORP_ID        NUMBER(38),
  OP_DATE        DATE,
  ISSUE_DATE     DATE,
  voucher_no     varchar2(12)
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
comment on column FC_THIRD_DEP.BANK_ACC
  is '银行账户';
comment on column FC_THIRD_DEP.AVAIL_BAL
  is '可用余额';
comment on column FC_THIRD_DEP.WISH_PAYDAY
  is '期望付款日期';
comment on column FC_THIRD_DEP.INTERFACE_ID
  is '接口代码';
comment on column FC_THIRD_DEP.APPOINT_ID
  is '预约流水号';
comment on column FC_THIRD_DEP.SEC_ACC
  is '证劵资金账号';
comment on column FC_THIRD_DEP.SEC_AVAIL_BAL
  is '证劵可取金额';
comment on column FC_THIRD_DEP.AMT
  is '交易金额';
comment on column FC_THIRD_DEP.BURSAR_BILL_NO
  is '会计凭证号';
comment on column FC_THIRD_DEP.BILL_TYPE
  is '转账方式 1银行转证劵2证劵转银行 ';
comment on column FC_THIRD_DEP.FUND_PASS
  is '资金台帐密码';
comment on column FC_THIRD_DEP.THIRD_TYPE
  is '第三存管类型1.普通，2.融资融劵 ';
comment on column FC_THIRD_DEP.STATUS
  is '10--提交审批
-1--打回
95审批通过
0--暂存
-2--删除
';
comment on column FC_THIRD_DEP.OP is '操作员';
comment on column FC_THIRD_DEP.OP_CODE is '操作员代码';
comment on column FC_THIRD_DEP.APPROVES is '所有审批员';
comment on column FC_THIRD_DEP.NEXTCHECKER is '下一个审批人';
comment on column FC_THIRD_DEP.CORP_ID is '单位ID';
comment on column FC_THIRD_DEP.OP_DATE is '申请时间';
comment on column FC_THIRD_DEP.ISSUE_DATE is '签发日期';
create table bis_depository_bal
(
  ACCT_ID         VARCHAR2(60),
  acct_NAME      VARCHAR2(60),
  FUNDACCT_ID     VARCHAR2(60),         
  BROKER            VARCHAR2(30),   
  avail_bal        number(15,2),
  bif_code            char(4),
  return_code    VARCHAR2(30),
  return_msg     VARCHAR2(60),
  query_TIME     DATE,                     
  last_TIME       DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table bis_depository_bal
  add constraint PK_bis_depository_bal primary key (ACCT_ID,bif_code)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table BIS_QUERY_DEP_CMD
(
  CMD_ID      number,
  ACCTID      VARCHAR2(60),
  PWD         VARCHAR2(60),
  RETURN_MSG  VARCHAR2(100),
  RETURN_CODE VARCHAR2(20),
  req_time    date,
  return_time date,
  BIF_CODE    CHAR(4),
  finish_sign char(1)         
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
  alter table BIS_QUERY_DEP_CMD
  add constraint PK_BIS_QUERY_DEP_CMD primary key (CMD_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
CREATE OR REPLACE VIEW V_FC_THIRD_HISTORY
AS
  SELECT SERIAL_ID,
         APPLYAMT,
         DEALAMT,
         BANK_SERIAL_ID,
         BIF_CODE,
         TRNSTATUS,
         TRNCODE,
         TRANS_TIME,
         REC_TIME,
         ACCTID,
         CUR,
         BUSN_NAME,
         BROKER,
         TRANS_TYPE
  FROM   (SELECT SERIAL_ID,
                 APPLYAMT,
                 DEALAMT,
                 BANK_SERIAL_ID,
                 BIF_CODE,
                 TRNSTATUS,
                 TRNCODE,
                 TRANS_TIME,
                 REC_TIME,
                 ACCTID,
                 CUR,
                 BUSN_NAME,
                 BROKER,
                 TRANS_TYPE
          FROM   BIS_FIN_DTL
          WHERE  TRANS_TYPE = '1'
          UNION
          SELECT SERIAL_ID,
                 APPLYAMT,
                 DEALAMT,
                 BANK_SERIAL_ID,
                 BIF_CODE,
                 TRNSTATUS,
                 TRNCODE,
                 TRANS_TIME,
                 REC_TIME,
                 ACCTID,
                 CUR,
                 BUSN_NAME,
                 BROKER,
                 TRANS_TYPE
          FROM   BIS_FIN_HIS_DTL
          WHERE  TRANS_TYPE = '1');
declare
  v_param_value bt_param.param_value1%type;
begin
  select param_value1 into v_param_value from bt_param where CODE = 'systemVersion';
  if v_param_value != 3 then --不是现金管理的
  
		-- 银行账号管理菜单
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'账户管理','bankacc',res_code,
		'','0','1','0','0',2,'账户管理','','','','','',null,null,null,null,null,2  
		from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc';
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'银行账号维护  ','bankacc',res_code,
		'/newBankacc/maintainBtBankaccAction.do?method=initMaintainBtBankacc'
		,'0','1','0','0',1,'银行账号维护  ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '账户管理' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc'
		);

----银行账号关系维护---
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'银行账号关系维护  ','bankacc',res_code,
		'/newBankacc/bankaccRelation.do?method=toList'
		,'0','1','0','0',1,'银行账号关系维护  ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '账户管理' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc'
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'录入明细','bankacc',res_code,
		'/newBankacc/bankaccDtlAction.do?method=toInitBankaccDtl'
		,'0','1','0','0',2,'录入明细','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '账户管理' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc'
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'录入余额','bankacc',res_code,
		'/newBankacc/bankaccBalAction.do?method=toInitBankaccBal'
		,'0','1','0','0',3,'录入余额','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '账户管理' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc'
		);


		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'销户登记','bankacc',res_code,
		'/newBankacc/bankaccCloseAction.do?method=toBankaccClose'||chr(38)||'pageType=init'
		,'0','1','0','0',9,'销户登记','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '账户管理' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc'
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'销户复核','bankacc',res_code,
		'/newBankacc/bankaccCloseAction.do?method=toBankaccClose'||chr(38)||'pageType=check'
		,'0','1','0','0',10,'销户复核','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '账户管理' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '银行账户管理' and sys_code = 'bankacc'
		);


		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,
		RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,
		REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		values ((select max(RES_CODE) + 1  from bt_sys_res), '查询统计', 'bankacc', 0, '', '0', '0', '0',
		'0', 8, '查询统计', '', '', '', '', '', null, null, null, null, null, 1 );

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'银行账户','bankacc',res_code,''
		,'0','1','0','0',1,'银行账户','','','','','',null,null,null,null,null,2 
		from bt_sys_res  where res_name = '查询统计' and sys_code = 'bankacc';

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'账户查询','bankacc',res_code,'/newBankacc/maintainBtBankaccAction.do?method=doBankaccQuery'
		,'0','1','0','0',1,'账户查询','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '银行账户' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '查询统计' and sys_code = 'bankacc' 
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'账户交易明细查询','bankacc',res_code,'/newBankacc/bankaccDtlAction.do?method=toInitBankaccDtl'||chr(38)||'isQuery=true'
		,'0','1','0','0',2,'账户交易明细查询','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '银行账户' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '查询统计' and sys_code = 'bankacc' 
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'账户余额查询','bankacc',res_code,'/newBankacc/bankaccBalAction.do?method=toInitBankaccBal'||chr(38)||'isQuery=true'
		,'0','1','0','0',2,'账户余额查询','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '银行账户' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '查询统计' and sys_code = 'bankacc' 
		);

 end if;
end;
/
commit;
