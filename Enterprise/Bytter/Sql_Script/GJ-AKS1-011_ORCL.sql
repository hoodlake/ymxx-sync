-- 孙江华--
-- 2013-1-4--

-- 国际贸易融资展期表 
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANCE_TYPE表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANCE_EXTEND';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE FINANCE_EXTEND
           ( GUID VARCHAR2(36) not null, 
             BILL_CODE    VARCHAR2(14) not null,
             FINANCE_CODE VARCHAR2(14) not null,
             ISSUE_CODE   VARCHAR2(36) not null,
             EXPIRY_DATE  DATE not null,
             RATE         NUMBER(6,4) not null,
             CONTRACT_NO  VARCHAR2(30),
             RMK          VARCHAR2(256),
             APPROVES     VARCHAR2(400),
             NEXT_CHECKER VARCHAR2(400),
             STATUS       NUMBER not null,
             OP           VARCHAR2(10) not null,
             ENTER_DATE   DATE not null,
             CORP_ID      NUMBER not null,
             LOAN_MONEY   NUMBER not null,
             BACK_REASON  VARCHAR2(256),
             FLAG         NUMBER)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column FINANCE_EXTEND.BILL_CODE is '展期Code';
comment on column FINANCE_EXTEND.FINANCE_CODE is '贸易融资Code';
comment on column FINANCE_EXTEND.ISSUE_CODE is '发放记录Code';
comment on column FINANCE_EXTEND.EXPIRY_DATE is '展期到期日期';
comment on column FINANCE_EXTEND.RATE is '展期利率';
comment on column FINANCE_EXTEND.CONTRACT_NO is '展期合同号';
comment on column FINANCE_EXTEND.RMK is '备注';
comment on column FINANCE_EXTEND.APPROVES is '已经审批人';
comment on column FINANCE_EXTEND.NEXT_CHECKER is '下一审批人';
comment on column FINANCE_EXTEND.STATUS is '记录状态';
comment on column FINANCE_EXTEND.OP is '操作员';
comment on column FINANCE_EXTEND.ENTER_DATE is '录入时间';
comment on column FINANCE_EXTEND.CORP_ID is '展期单位';
comment on column FINANCE_EXTEND.LOAN_MONEY is '发放金额';
comment on column FINANCE_EXTEND.BACK_REASON is '补录打回原因';
comment on column FINANCE_EXTEND.FLAG is '1:国内贸易融资， 2：国际贸易融资';

alter table FINANCE_EXTEND add constraint FINANCE_EXT_PK primary key (GUID);
alter table FINANCE_EXTEND add constraint FINANCE_EXT_BILLCODE unique (BILL_CODE);

-- 融资类型表
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANCE_TYPE表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANCE_TYPE';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE FINANCE_TYPE(CODE VARCHAR2(10) not null, NAME VARCHAR2(40) not null, FLAG NUMBER not null)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column FINANCE_TYPE.CODE is '融资类型id';
comment on column FINANCE_TYPE.NAME is '融资名称';
comment on column FINANCE_TYPE.FLAG is '1：国内贸易融资，2:国际贸易融资';

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '10';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('10', '打包贷款', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '20';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('20', '进口押汇', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '30';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('30', '出口押汇', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '40';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('40', '福费廷', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '1';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('1', '应收账款保理', 1);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '2';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('2', '订单融资', 1);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '3';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('3', '应收账款', 1);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '4';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('4', '国内信用证代付', 1);
  END IF;
  COMMIT; 
END;
/

-- 增加国际贸易融资展期菜单---
-- 国际贸易融资展期申请--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期申请' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期申请', 'lcs',
  (select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAdd', '0', '1', '0', '0', 23, '国际贸易融资展期申请', 2);
  END IF;
  COMMIT; 
END;
/
--国际贸易融资展期修改--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期修改' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期修改', 'lcs',
  (select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendEdit', '0', '1', '0', '0', 24, '国际贸易融资展期修改', 2);
  END IF;
  COMMIT; 
END;
/
--国际贸易融资展期打回--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期打回' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期打回', 'lcs',
  (select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendBack', '0', '1', '0', '0', 25, '国际贸易融资展期打回', 2);

  END IF;
  COMMIT; 
END;
/
--国际贸易融资展期补录--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期补录' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期补录', 'lcs',
  (select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAddition', '0', '1', '0', '0', 26, '国际贸易融资展期补录', 2);
  END IF;
  COMMIT; 
END;
/
--国际贸易融资查询--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资查询' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资查询', 'lcs',
  (select res_code from bt_sys_res where res_name='查询' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=query', '0', '1', '0', '0', 29, '国际贸易融资展期补录', 2);
  END IF;
  COMMIT; 
END;
/
