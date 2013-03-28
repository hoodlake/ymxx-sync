--修改人：陈春燕
--修改日期：2013-01-21
--修改原因: BD-JD04-97[雷沃贴现、反贴现需求]
------新增内部贴现反贴现台账管理系统参数
DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE = 'DARDMC'
     and SYS_CODE = 'ads';
  IF VN_COUNT < 1 THEN
    insert into bt_param
      (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
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
       REVERSE10)
    values
      ('DARDMC',
       'ads',
       '启用内部贴现/反贴现台账管理',
       '0',
       null,
       null,
       '0',
       '0 否;1 是(DiscountAndReverseDiscountMenuControl)',
       '0,否;1,是',
       '',
       '',
       '',
       '',
       1.00,
       null,
       null,
       null,
       null);
  END IF;
  COMMIT;
END;
/
----------------新增内部贴现/饭贴现菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_NAME='内部贴现/反贴现' and SYS_CODE='ads';
  IF VN_COUNT < 1 THEN
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '内部贴现/反贴现',
         'ads',
         RES_CODE,
         '',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '库存票据业务';
  END IF;
  COMMIT; 
END;
/
----------------新增内部贴现/反贴现申请
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现申请' and SYS_CODE='ads';
  IF VN_COUNT < 1 THEN
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '贴现/反贴现申请',
         'ads',
         RES_CODE,
        -- '/AB/allocation.do?method=allocationList'||'&'||'opType=0',
         '/AB/discountAndtReverseDiscount.do?method=treeView',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '内部贴现/反贴现' and father_code >0;
  END IF;
  COMMIT; 
END;
/

----------------新增内部贴现/反贴现修改
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现修改' and SYS_CODE='ads';
  IF VN_COUNT < 1 THEN
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '贴现/反贴现修改',
         'ads',
         RES_CODE,       
         '/AB/discountAndtReverseDiscount.do?method=updatelist'||'&'||'Type=0',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '内部贴现/反贴现' and father_code >0;
  END IF;
  COMMIT; 
END;
/
----------------新增内部贴现/反贴现打回
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现打回' and SYS_CODE='ads';
  IF VN_COUNT < 1 THEN
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '贴现/反贴现打回',
         'ads',
         RES_CODE,       
         '/AB/discountAndtReverseDiscount.do?method=updatelist'||'&'||'Type=-1',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '内部贴现/反贴现' and father_code >0;
  END IF;
  COMMIT; 
END;
/
----------------新增反贴现补录
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_NAME='反贴现补录' and SYS_CODE='ads';
  IF VN_COUNT < 1 THEN
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '反贴现补录',
         'ads',
         RES_CODE,       
         '/AB/discountAndtReverseDiscount.do?method=recordList',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '内部贴现/反贴现' and father_code >0;
  END IF;
  COMMIT; 
END;
/
------------贴现利率维护
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM TB_CREDIT_PERIOD
   WHERE CODE='R008' and periodname='贴现';
  IF VN_COUNT < 1 THEN
  insert into TB_CREDIT_PERIOD
    (credit_period_id,
     code,
     periodname,
     period,
     periodcycle,
     moneytype,
     creditdays,
     issysvalue)
    select (select max(credit_period_id) + 1
              from TB_CREDIT_PERIOD), 'R008', '贴现', 0, 7, '1', '1', '1'
      from TB_CREDIT_PERIOD
     where credit_period_id =
           (select max(credit_period_id) from TB_CREDIT_PERIOD);
    
  END IF;
  COMMIT; 
END;
/
------新增贴现反贴现审批业务表
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN 
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'AB_DISCOUNTANDREVERSE_DISCOUNT';
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE AB_DISCOUNTANDREVERSE_DISCOUNT 
     (ID NUMBER(28,0) NOT NULL , 
  BUSINESS_NO VARCHAR2(20) NOT NULL,
  ACCBOOK_ID CHAR(1) NOT NULL , 
  APP_CORP_ID NUMBER NOT NULL , 
  APP_CORP_NAME VARCHAR2(200), 
  RELATION_ACCOUNT VARCHAR2(50), 
  RELATION_ACCOUNT_BALANCE NUMBER NOT NULL , 
  AVG_DISCOUNT_DAYS NUMBER , 
  RELATED_BILL_IDS VARCHAR2(500), 
  DISCOUNT_ACCRUAL NUMBER(18,2), 
  DISCOUNT_RATE NUMBER(18,2), 
  BILL_MONEY NUMBER(18,2) , 
  DISCOUNT_AMT NUMBER(18,2) , 
  PROPOSE_DATE DATE NOT NULL , 
  PROPOSER VARCHAR2(20) NOT NULL,
  BUSINESS_TYPE CHAR(1) NOT NULL,
  REMARK VARCHAR2(1000) , 
  ATTACHMENT VARCHAR2(200), 
  RESULT NUMBER, 
  NEXT_CHECKER VARCHAR2(500), 
  APPROVES VARCHAR2(500), 
  STATUS NUMBER,
  CONSTRAINT PK_AB_DDRDISCOUNT PRIMARY KEY (ID)
  )';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
------新增贴现反贴现业务审批表
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN 
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'AB_MESSAGE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE AB_MESSAGE 
     (ID NUMBER(28,0) NOT NULL ,
  BILL_ID NUMBER(28,0) NOT NULL,
  BILL_NO VARCHAR2(20) NOT NULL,
  OPERATE_DATE DATE NOT NULL , 
  OPERATER VARCHAR2(10), 
  OPERATER_NAME VARCHAR2(40),
  OPERATE_TYPE VARCHAR2(40),
  BUSINESS_NAME VARCHAR2(20),
  MESSAGE VARCHAR2(200),
  CONSTRAINT PK_AB_MESSAGE PRIMARY KEY (ID) )';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
----------------AB_RECEIVE  add column INNE_RDISCOUNTED_STATE
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_RECEIVE' AND COLUMN_NAME = 'INNE_RDISCOUNTED_STATE';
  
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE AB_RECEIVE ADD INNE_RDISCOUNTED_STATE CHAR(1) default 0';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
----------------AB_RECEIVE  add column inner_discount_business_type
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_RECEIVE' AND COLUMN_NAME = 'INNER_DISCOUNTED_BUSINESS_TYPE';
  
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE AB_RECEIVE ADD INNER_DISCOUNTED_BUSINESS_TYPE CHAR(1) ';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
-------------------新增 贴现/反贴现 审批流程定义
DECLARE
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_approve_business
   WHERE BUSINESS_CODE = 'ads_50'
     and SYS_CODE = 'ads'
     and BUSINESS_NAME = '贴现/反贴现';
  IF VN_COUNT < 1 THEN
   insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_50', 'ads', '贴现/反贴现', 'A,B,C', 'ab_discountandreverse_discount', 'BUSINESS_NO', 'BILL_MONEY', '', 'NEXT_CHECKER', 'ID', '../AB/discountAndReverseDiscount/innerDiscountCheck.jsp', '', '', '', '', 'com.bettersoft.ab.form.DiscountAndReverseDiscountForm', '', '', '', '', '', null, null, null, null, null, '');
  END IF;
  COMMIT;
END;
/
---------------------


DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现查询' and SYS_CODE='ads';
  IF VN_COUNT < 1 THEN
  INSERT INTO BT_SYS_RES
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
   RES_LEVEL,
   RES_ROLE)
VALUES
  ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),
   '贴现/反贴现查询',
   'ads',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'ads'
       AND RES_NAME = '查询统计'),
   '/AB/query/queryDiscountAndReDiscount.jsp',
   '0',
   '1',
   '0',
   '0',
   (SELECT MAX(RES_ORDER) + 1
      FROM BT_SYS_RES
     WHERE FATHER_CODE = (SELECT RES_CODE
                            FROM BT_SYS_RES
                           WHERE SYS_CODE = 'ads'
                             AND RES_NAME = '查询统计')),
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   2,
   '');
  END IF;
  COMMIT; 
END;
/




