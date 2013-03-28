--修改内容:新增系统模块－资金管理中心
--修改人:张均锋
--修改时间:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS  WHERE SYS_CODE = 'mec';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS (SYS_CODE, SYS_NAME, SYS_APP, FIRST_PAGE, VALID_SIGN, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', '资金管理中心', null, 'mec', '1', '资金管理中心', null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--修改内容:新增资金管理中心操作权限_录入权限
--修改人:张均锋
--修改时间:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 1;
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 1, '录入', null, null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--修改内容:新增资金管理中心操作权限_查询权限
--修改人:张均锋
--修改时间:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 2;
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 2, '查询', null, null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--修改内容:新增一级菜单 资金管理中心-内存外贷
--修改人:张均锋
--修改时间:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT from bt_sys_res  where res_name = '内存外贷' and sys_code = 'mec';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
   select (select max(res_code) + 1 from bt_sys_res), '内存外贷', 'mec', 0, '','0', '0', '0', '0', 3, '内存外贷','', '', '', '', '', null, null, null, null, null, 1 from dual;
  END IF;
  COMMIT; 
END;
/

--修改内容:新增二级菜单 资金管理中心-内存外贷-基础设置
--修改人:张均锋
--修改时间:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='基础设置' AND t1.father_code=t2.res_code AND t2.res_name='内存外贷';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '基础设置', 'mec', res_code, '/mec/mecBasicSet.do?method=toEdit', '0', '1', '0', '0', 1, '基础设置', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '内存外贷' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增二级菜单 资金管理中心-内存外贷-内部资金上报
--修改人:张均锋
--修改时间:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='内部资金上报' AND t1.father_code=t2.res_code AND t2.res_name='内存外贷';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '内部资金上报', 'mec', res_code, '/mec/mecFundReport.do?method=toTreeList', '0', '1', '0', '0', 2, '内部资金上报', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '内存外贷' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增二级菜单 资金管理中心-内存外贷-提款计划
--修改人:张均锋
--修改时间:2012-11-26
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='提款计划' AND t1.father_code=t2.res_code AND t2.res_name='内存外贷';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '提款计划', 'mec', res_code, '/mec/mecDrawPlan.do?method=toTreeList', '0', '1', '0', '0', 3, '提款计划', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '内存外贷' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/

--修改内容:新增内存外贷基础设置表MEC_BASIC_SET
--修改人:张均锋
--修改时间:2012-11-21
create table MEC_BASIC_SET  (
   ID                   NUMBER NOT NULL,
   MEMORY_BANK          VARCHAR2(100),
   EXTERNAL_CREDIT_BANK VARCHAR2(100),
   MEMORY_UNIT          VARCHAR2(100),
   EXTERNAL_CREDIT_UNIT VARCHAR2(100),
   WITHDRAWALS_MARGIN_RATIO NUMBER(15, 2),
   ENDMONTH_RATIO       NUMBER(15, 2),
   CONSTRAINT PK_MEC_BASIC_SET PRIMARY KEY (ID)
 );
comment on table MEC_BASIC_SET is '内存外贷基础设置表';
comment on column MEC_BASIC_SET.MEMORY_BANK is '内存银行';
comment on column MEC_BASIC_SET.EXTERNAL_CREDIT_BANK is '外贷银行';
comment on column MEC_BASIC_SET.MEMORY_UNIT is '内存单位';
comment on column MEC_BASIC_SET.EXTERNAL_CREDIT_UNIT is '外贷单位';
comment on column MEC_BASIC_SET.WITHDRAWALS_MARGIN_RATIO is '提款保证金比例';
comment on column MEC_BASIC_SET.ENDMONTH_RATIO is '月末保证金比例';

--修改内容:新增离线账号管理表MEC_MANAGER_BANKACC
--修改人:张均锋
--修改时间:2012-11-21
create table MEC_MANAGER_BANKACC  (
     ID                   NUMBER NOT NULL,
     BANKACC              VARCHAR2(30),
     MIN_CAPITAL_VAL      NUMBER(15,2),
     CONSTRAINT PK_MEC_MANAGER_BANKACC PRIMARY KEY (ID)
  );
comment on table MEC_MANAGER_BANKACC is '离线账号管理表';
comment on column MEC_MANAGER_BANKACC.BANKACC is '账号';
comment on column MEC_MANAGER_BANKACC.MIN_CAPITAL_VAL is '最低资金值';

--修改内容:新增内存资金上报表MEC_FUND_REPORT
--修改人:张均锋
--修改时间:2012-11-22
create table MEC_FUND_REPORT  (
   ID                   NUMBER NOT NULL,
   FUND_CODE            VARCHAR2(20),
   CORP_CODE            VARCHAR2(12),
   REPORT_TIME          DATE,
   CREATE_DATE          DATE,
   RMK                  VARCHAR2(100),
   CONSTRAINT PK_MEC_FUND_REPORT PRIMARY KEY (ID)
);
comment on table MEC_FUND_REPORT is '内存资金上报表';
comment on column MEC_FUND_REPORT.FUND_CODE is '编码生成规则：单位编码+日期（YYMMDD）+3位顺序号';
comment on column MEC_FUND_REPORT.CORP_CODE is '上报单位';
comment on column MEC_FUND_REPORT.REPORT_TIME is '上报时间';
comment on column MEC_FUND_REPORT.CREATE_DATE is '录入日期';
comment on column MEC_FUND_REPORT.RMK is '备注';

--修改内容:新增内存资金上报明细表MEC_FUND_REPORT_DT
--修改人:张均锋
--修改时间:2012-11-22
create table MEC_FUND_REPORT_DT  (
   ID                   NUMBER NOT NULL,
   PARENT_ID            NUMBER NOT NULL,
   BANKACC              VARCHAR2(30),
   BANK_CODE            VARCHAR2(50),
   CUR_CODE             VARCHAR2(50),
   BANK_BAL             NUMBER(15,2),
   MIN_CAPITAL_VAL      NUMBER(15,2),
   REDUNDANT_CURRENT    NUMBER(15,2),
   REDUNDANT_REGULAR    NUMBER(15,2),
   DISPOSABLE_FUND      NUMBER(15,2),
   CONSTRAINT PK_MEC_FUND_REPORT_DT PRIMARY KEY (ID)
);
comment on table MEC_FUND_REPORT_DT is '内存资金上报明细表';
comment on column MEC_FUND_REPORT_DT.PARENT_ID is '内存资金上报Id';
comment on column MEC_FUND_REPORT_DT.BANKACC is '账号';
comment on column MEC_FUND_REPORT_DT.BANK_CODE is '银行代码';
comment on column MEC_FUND_REPORT_DT.CUR_CODE is '币别代码';
comment on column MEC_FUND_REPORT_DT.BANK_BAL is '资金余额';
comment on column MEC_FUND_REPORT_DT.MIN_CAPITAL_VAL is '最低资金存量';
comment on column MEC_FUND_REPORT_DT.REDUNDANT_CURRENT is '冗余资金活期部分';
comment on column MEC_FUND_REPORT_DT.REDUNDANT_REGULAR is '冗余资金定期部分';
comment on column MEC_FUND_REPORT_DT.DISPOSABLE_FUND is '可支配零散资金';


--修改内容:新增提款计划表MEC_DRAW_PLAN
--修改人:张均锋
--修改时间:2012-11-26
create table MEC_DRAW_PLAN  (
   ID                   NUMBER NOT NULL, 
   DRAW_CODE            VARCHAR2(20),
   CORP_CODE            VARCHAR2(30),
   BANK_CODE            VARCHAR2(20),
   MONEY                NUMBER(15,2),
   CUR                  VARCHAR2(6),
   LOAN_DATE            DATE,
   RMK                  VARCHAR2(100),
   CREATE_DATE          DATE,
   CONSTRAINT PK_MEC_DRAW_PLAN PRIMARY KEY (ID)
);
comment on table MEC_DRAW_PLAN is '提取计划表'; 
comment on column MEC_DRAW_PLAN.DRAW_CODE is '提取编码生成规则：单位编码+日期（YYMMDD）+3位顺序号';
comment on column MEC_DRAW_PLAN.CORP_CODE is '申请单位';
comment on column MEC_DRAW_PLAN.BANK_CODE is '银行编号';
comment on column MEC_DRAW_PLAN.MONEY is '金额';
comment on column MEC_DRAW_PLAN.CUR is '币别';
comment on column MEC_DRAW_PLAN.LOAN_DATE is '贷款日期';
comment on column MEC_DRAW_PLAN.RMK is '备注';
comment on column MEC_DRAW_PLAN.CREATE_DATE is '录入日期';
