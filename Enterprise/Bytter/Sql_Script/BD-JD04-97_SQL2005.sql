--修改人：陈春燕
--修改日期：2013-01-21
--修改原因: BD-JD04-97[雷沃贴现、反贴现需求]
------新增内部贴现反贴现台账管理系统参数
DECLARE
  @VN_COUNT  INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)   FROM BT_PARAM   WHERE CODE = 'DARDMC'    and SYS_CODE = 'ads';
  IF @VN_COUNT < 1 
 BEGIN
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
    END;
  COMMIT;
END;
GO
----------------新增内部贴现/饭贴现菜单
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
   WHERE RES_NAME='内部贴现/反贴现' and SYS_CODE='ads';
  IF @VN_COUNT < 1 BEGIN
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
   END;
  COMMIT;
END;
GO

----------------新增内部贴现/反贴现申请
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现申请' and SYS_CODE='ads';
  IF @VN_COUNT < 1 BEGIN
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
    END;
  COMMIT;
END;
GO


----------------新增内部贴现/反贴现修改
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现修改' and SYS_CODE='ads';
  IF @VN_COUNT < 1 BEGIN
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
         '/AB/discountAndtReverseDiscount.do?method=updatelist&Type=0',
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
    END;
  COMMIT;
END;
GO

----------------新增内部贴现/反贴现打回
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现打回' and SYS_CODE='ads';
  IF @VN_COUNT < 1 BEGIN
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
         '/AB/discountAndtReverseDiscount.do?method=updatelist&Type=-1',
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
   END;
  COMMIT;
END;
GO

----------------新增反贴现补录
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_RES
   WHERE RES_NAME='反贴现补录' and SYS_CODE='ads';
  IF @VN_COUNT < 1 BEGIN
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
   END;
  COMMIT;
END;
GO

------------贴现利率维护
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM TB_CREDIT_PERIOD
   WHERE CODE='R008' and periodname='贴现';
  IF @VN_COUNT < 1 BEGIN
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
   END;
  COMMIT;
END;
GO

------新增贴现反贴现审批业务表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('AB_DISCOUNTANDREVERSE_DISCOUNT')
                  AND   TYPE = 'U')

CREATE TABLE AB_DISCOUNTANDREVERSE_DISCOUNT 
  (ID NUMERIC(28,0) NOT NULL , 
  BUSINESS_NO VARCHAR(20) NOT NULL,
  ACCBOOK_ID CHAR(1) NOT NULL , 
  APP_CORP_ID NUMERIC NOT NULL , 
  APP_CORP_NAME VARCHAR(200), 
  RELATION_ACCOUNT VARCHAR(50), 
  RELATION_ACCOUNT_BALANCE NUMERIC NOT NULL , 
  AVG_DISCOUNT_DAYS NUMERIC , 
  RELATED_BILL_IDS VARCHAR(500), 
  DISCOUNT_ACCRUAL NUMERIC(18,2), 
  DISCOUNT_RATE NUMERIC(18,2), 
  BILL_MONEY NUMERIC(18,2) , 
  DISCOUNT_AMT NUMERIC(18,2) , 
  PROPOSE_DATE datetime NOT NULL , 
  PROPOSER VARCHAR(20) NOT NULL,
  BUSINESS_TYPE CHAR(1) NOT NULL,
  REMARK VARCHAR(1000) , 
  ATTACHMENT VARCHAR(200), 
  RESULT NUMERIC, 
  NEXT_CHECKER VARCHAR(500), 
  APPROVES VARCHAR(500), 
  STATUS NUMERIC,
  CONSTRAINT PK_AB_DDRDISCOUNT PRIMARY KEY (ID)
  )
  go
------新增贴现反贴现业务审批表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('AB_MESSAGE')
                  AND   TYPE = 'U')
CREATE TABLE AB_MESSAGE 
   (ID NUMERIC(28,0) NOT NULL ,
  BILL_ID NUMERIC(28,0) NOT NULL,
  BILL_NO VARCHAR(20) NOT NULL,
  OPERATE_DATE datetime NOT NULL , 
  OPERATER VARCHAR(10), 
  OPERATER_NAME VARCHAR(40),
  OPERATE_TYPE VARCHAR(40),
  BUSINESS_NAME VARCHAR(20),
  MESSAGE VARCHAR(200),
  CONSTRAINT PK_AB_MESSAGE PRIMARY KEY (ID) )
  go
----------------AB_RECEIVE  add column INNE_RDISCOUNTED_STATE
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='INNE_RDISCOUNTED_STATE')
  
 ALTER TABLE AB_RECEIVE ADD INNE_RDISCOUNTED_STATE CHAR(1) default 0
go
----------------AB_RECEIVE  add column inner_discount_business_type
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='INNER_DISCOUNTED_BUSINESS_TYPE')

 ALTER TABLE AB_RECEIVE ADD INNER_DISCOUNTED_BUSINESS_TYPE CHAR(1)
go
-------------------新增 贴现/反贴现 审批流程定义
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_approve_business
   WHERE BUSINESS_CODE = 'ads_50'
     and SYS_CODE = 'ads'
     and BUSINESS_NAME = '贴现/反贴现';
  IF @VN_COUNT < 1 BEGIN
   insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_50', 'ads', '贴现/反贴现', 'A,B,C', 'ab_discountandreverse_discount', 'BUSINESS_NO', 'BILL_MONEY', '', 'NEXT_CHECKER', 'ID', '../AB/discountAndReverseDiscount/innerDiscountCheck.jsp', '', '', '', '', 'com.bettersoft.ab.form.DiscountAndReverseDiscountForm', '', '', '', '', '', null, null, null, null, null, '');
    END;
  COMMIT;
END;
GO

---------------------贴现反贴现查询菜单
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)

    FROM BT_SYS_RES
   WHERE RES_NAME='贴现/反贴现查询' and SYS_CODE='ads';
  IF @VN_COUNT < 1 BEGIN
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
         '贴现/反贴现查询',
         'ads',
         RES_CODE,       
         '/AB/query/queryDiscountAndReDiscount.jsp',
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
   where res_name = '查询统计'  and SYS_CODE = 'ads';
   END;
  COMMIT;
END;
GO
