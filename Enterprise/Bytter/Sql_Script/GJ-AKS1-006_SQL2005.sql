--修改日期：2012.12.17
--修改人：蔡瑾钊
--修改内容：国际贸易融资申请相关功能


--------国际贸易融资信息表    表结构与借款表一样 ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('CMS_FINANC_REQ')
                  AND   TYPE = 'U')
	create table CMS_FINANC_REQ
	(
	  GUID                	   VARCHAR(36)                    not null,
	  BILL_CODE                VARCHAR(13) not null,
	  CORP_ID                  NUMERIC(10) not null,
	  CONTRACT_NO              VARCHAR(50),
	  PL_MONEY                 NUMERIC(15,2) not null,
	  PL_TERM                  NUMERIC ,
	  NET_CODE                 CHAR(4) not null,
	  BANK_CODE                CHAR(4),
	  PL_ACCOUNT               VARCHAR(50),
	  CUR_CODE                 CHAR(2) not null,
	  PL_PURPOSE               VARCHAR(100)  ,
	  PL_DATE                  DATETIME ,
	  REPAY_DATE               DATETIME ,
	  REPAY_TYPE               VARCHAR(2) ,
	  PL_CLASS                 VARCHAR(2) not null,
	  PL_TYPE                  VARCHAR(2) not null,
	  SURETY_EXPLAIN           VARCHAR(200),
	  REPAIR_OP                VARCHAR(8),
	  OP                       VARCHAR(8) not null,
	  PL_RATE                  NUMERIC(8,6),
	  DEFERRED_RATE            NUMERIC(8,6),
	  OVERDUE_RATE             NUMERIC(8,6),
	  NEXT_CHECKER             VARCHAR(150),
	  APPROVES                 VARCHAR(200),
	  STATUS                   NUMERIC,
	  ENTER_DATE               DATETIME,
	  ACC_CODE                 VARCHAR(50),
	  VOUCHER_NO               CHAR(15),
	  RMK                      VARCHAR(400),
	  ORDER_NO                 CHAR(18),
	  TALLIER_CODE             VARCHAR(8),
	  RATION_CODE              VARCHAR(20),
	  BANK_NAME                VARCHAR(100),
	  BANK_TYPE                VARCHAR(4),
	  REVERSE1                 VARCHAR(300),
	  REVERSE2                 VARCHAR(300),
	  REVERSE3                 VARCHAR(300),
	  REVERSE4                 VARCHAR(300),
	  REVERSE5                 VARCHAR(300),
	  REVERSE6                 NUMERIC(15,2),
	  REVERSE7                 NUMERIC(15,2),
	  REVERSE8                 NUMERIC(15,2),
	  REVERSE9                 NUMERIC(15,2),
	  REVERSE10                NUMERIC(15,2),
	  ITEM_CODE                VARCHAR(20),
	  EXCHANGERATE             NUMERIC(15,2),
	  IS_RMB_RAT               CHAR(1),
	  BAILMONEY                NUMERIC(15,2) default 0,
	  CLC_ID                   VARCHAR(10),
	  RATETIMEOFTAKEEFFECT     DATETIME,
	  BAILMONEY_RATE           NUMERIC,
	  BAILMONEY_CONTRACT       VARCHAR(50),
	  FLOAT_WAY                VARCHAR(15),
	  RATE_ENTRIES_EFFECT_DATE DATETIME,
	  INTEREST_WAY             VARCHAR(15),
	  REFERENCE_RATE_TYPE      VARCHAR(50),
	  REPAY_CYCLE              VARCHAR(50),
	  POINTS_PROPORTION_SELECT VARCHAR(50),
	  POINTS_PROPORTION_TEXT   VARCHAR(50),
	  INTERBUSEXPENSES         NUMERIC(15,2),
	  USERS                    VARCHAR(80),
	  CREDIT_CONTRACT_NO       VARCHAR(40),
	  INSIDE_CONTRACT_NO       VARCHAR(40),
	  PROJECT_NAME             VARCHAR(80),
	  PAY_INTEREST             VARCHAR(3),
	  RATMODEL                 char(1),
	  CPL_INTEREST_PAYMENT     VARCHAR(3),
	  constraint PK_CMS_FINANC_REQ primary key (GUID) 
	)
GO

--------国际贸易融资信息表          中间表 ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_INFO')
                  AND   TYPE = 'U')
	create table FINANC_INFO  (
	   GUID                 VARCHAR(36)                    not null,
	   CODE                 VARCHAR(14)                    not null,   -----融资单编号
	   TYPE_CODE            VARCHAR(10)                    not null,   -----融资类别
	   BILL_CODE            VARCHAR(14),                               -----借款信息
	   FOFE_CODE            VARCHAR(14),                               -----福费延融信息
	   ENTER_DATE           DATETIME                            not null,   -----录入日期 
	   OP                   VARCHAR(8)                     not null,   -----操作人员 
	   EDITOP               VARCHAR(8),                                -----编辑人员 
	   EDIT_DATE            DATETIME,                                       -----编辑日期 
	   DEPOSIT_DATE         DATETIME,                                       -----保证金日期
	   DEPOSIT_INTER_RATES  NUMERIC(6,4),                                -----保证金利率
	   ATTACHMENT           VARCHAR(500),                              -----附件   
	   FLAG                 CHAR(1),                                    ---1、表示国内 2、表示国际
	   SKIP                 CHAR(1),                                    ---是否跳过发送功能 1.表示跳过  
	   CREDIT_NO           VARCHAR(20),                                --信用证号
	   FPH                 VARCHAR(50),                                ---发票号
	   FPMONEY             NUMERIC(15,2),    							---发票金额 
	   REC_DATE            DATETIME,                                        --收款日期 
	   ISSUE_WAY           VARCHAR(10),							    ---借款发放方式 
	   constraint PK_FINANC_INFO primary key (CODE)
	)
GO

--------贷款使用人信息表 ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_LOAN_USER')
                  AND   TYPE = 'U')
	create table FINANC_LOAN_USER  (
	   GUID                 CHAR(40)                        not null,
	   REQ_CODE             char(14)                        not null,   ----融资单编号
	   LOAN_USER            VARCHAR(80)                     not null,   ---贷款使用人
	   AMOUNT               NUMERIC(18, 2),                              ---金额
	   constraint PK_FINANC_LOAN_USER primary key (GUID)
	)
GO

--------国际贸易融资类别表 ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_TYPE')
                  AND   TYPE = 'U')
	create table FINANC_TYPE  (
	   GUID                 CHAR(40)                        not null,
	   TYPE_CODE            VARCHAR(10)                    not null,   ---类型编号
	   NAME                 VARCHAR(100)                    not null,   ---名称
	   constraint PK_FINANC_TYPE primary key (GUID)
	)
GO

--------福费延融资信息表 ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FOFE_FINANC_INFO')
                  AND   TYPE = 'U')
	create table FOFE_FINANC_INFO  (
	   GUID                 VARCHAR(36)                    not null,
	   BILL_CODE            CHAR(13)                        not null,   --融资单编号
	   REQ_DATE             DATETIME,                                       --申请日期
	   ARRIVE_DATE          DATETIME,                                       --单据到单日期
	   DIS_DATE             DATETIME,                                       --扣息日期
	   RATE                 NUMERIC(6,4),                      			--利率
	   LOAN                 NUMERIC(8,4),                    			--利息
	   MONEY                NUMERIC(18,2),                               --到账金额
	   OP                   VARCHAR(8),                                --录入操作员
	   ENTRY_DATE           DATETIME,                                       --录入时间
	   EDIT_OP              VARCHAR(8),                                --修改操作员
	   EDIT_DATE            DATETIME,                                       --修改日期
	   constraint PK_FOFE_FINANC_INFO primary key (BILL_CODE)
	)
GO

--------国际贸易融资贷款发放表 ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_LOAN_ORIGINATIOIN')
                  AND   TYPE = 'U')
	create table  FINANC_LOAN_ORIGINATIOIN 
	(
	   GUID                 VARCHAR(36)                       not null,
	   REQ_BILL_NO          VARCHAR(20)                    not null,
	   TIMES                NUMERIC,
	   BILL_CODE            VARCHAR(20),
	   OPEN_CODE            VARCHAR(40),
	   ISSUE_DATE           DATETIME,
	   EXPIRE_DATE          DATETIME,
	   ISSUE_WAY            VARCHAR(2),
	   REPAY_TYPE           VARCHAR(2),
	   PAYMENT_PLAN         VARCHAR(300),
	   LOAN_AMOUNT          NUMERIC(18,2),
	   PAYMENT_AMOUNT       NUMERIC(18,2),
	   INTEREST_CAL_WAY     VARCHAR(2),
	   SERVICINIG_WAY       VARCHAR(2),
	   FLOAT_WAY            VARCHAR(2),
	   FLOAT_WAY_TP         NUMERIC(2),
	   POINTS_PROPORTION_TEXT   VARCHAR(50),
	   POINTS_PROPORTION_SELECT  VARCHAR(50),
	   REPAY_CYCLE			VARCHAR(50),
	   REFERENCE_RATE_TYPE   VARCHAR(50),
	   START_FLOAT_DATE     DATETIME,
	   PL_RATE              NUMERIC(6,4),
	   DEFERRED_RATE        NUMERIC(8,6),
	   OVERDUE_RATE         NUMERIC(8,6),
	   CORP_ID              NUMERIC(10),
	   ATTACHMENT           VARCHAR(500),
	   NEXT_CHECKER         VARCHAR(150),
	   APPROVES             VARCHAR(200),
	   OPERATOR             VARCHAR(8),
	   STATUS               NUMERIC,
	   ENTRY_DATE           DATETIME,
	   RMK                  VARCHAR(200),
	   constraint PK_FINANC_LOAN_ORIGINATIOIN  primary key (GUID)
	)
GO

--添加菜单
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='国际贸易融资' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资', 'lcs', '0', '', '0', '0', '0', '0', 17, '', '', '', '', '', '', null, null, null, null, null, 1, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=save', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请修改' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请修改', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=tempsave', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请打回' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请打回', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=callback', '0', '0', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请补录' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请补录', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=record', '0', '0', '0', '0', 4, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='国际贸易融资贷款发放' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资贷款发放', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=open', '0', '0', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

--添加审批流
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interfin1';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin1', 'lcs', '国际贸易融资申请', 'A,B,C', 'cms_financ_req', 'pl_money',  'next_checker', 'bill_code', '../interfinance/InterFinancShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancForm');
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interopen';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interopen', 'lcs', '国际贸易融资发放', 'A,B,C', 'financ_loan_originatioin', 'loan_amount',  'next_checker', 'bill_code', '../interfinance/InterFinancOpenShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancOpenForm');
    END;
END;
GO

--添加编号生成
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_KEY_GENERATOR
   WHERE TABLENAME='FINANC_LOAN_ORIGINATIOIN' and KEYALISENAME='InterFinancOpenCode';
  IF @VN_COUNT < 1
    BEGIN
	INSERT INTO BT_KEY_GENERATOR (ID, TABLENAME, KEYALISENAME, CUSTGENCLASS, GENSTRATE)
	SELECT ISNULL((SELECT MAX(ID) FROM BT_KEY_GENERATOR), 0) + 1, 'FINANC_LOAN_ORIGINATIOIN', 'InterFinancOpenCode', 'com.byttersoft.intersettle.service.InterFinancOpenKeyGenerator', 'cu';
    END;
END;
GO