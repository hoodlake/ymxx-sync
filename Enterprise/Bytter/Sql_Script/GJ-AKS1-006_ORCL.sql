--修改日期：2012.12.17
--修改人：蔡瑾钊
--修改内容：国际贸易融资申请相关功能


--------国际贸易融资信息表    表结构与借款表一样 ----------
DECLARE
  VC_STR           VARCHAR2(5000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有CMS_FINANC_REQ表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'CMS_FINANC_REQ';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table CMS_FINANC_REQ
				(
				  GUID                	   VARCHAR2(36)                    not null,
				  BILL_CODE                VARCHAR2(13) not null,
				  CORP_ID                  NUMBER(10) not null,
				  CONTRACT_NO              VARCHAR2(50),
				  PL_MONEY                 NUMBER(15,2) not null,
				  PL_TERM                  NUMBER ,
				  NET_CODE                 CHAR(4) not null,
				  BANK_CODE                CHAR(4),
				  PL_ACCOUNT               VARCHAR2(50),
				  CUR_CODE                 CHAR(2) not null,
				  PL_PURPOSE               VARCHAR2(100)  ,
				  PL_DATE                  DATE ,
				  REPAY_DATE               DATE ,
				  REPAY_TYPE               VARCHAR2(2) ,
				  PL_CLASS                 VARCHAR2(2) not null,
				  PL_TYPE                  VARCHAR2(2) not null,
				  SURETY_EXPLAIN           VARCHAR2(200),
				  REPAIR_OP                VARCHAR2(8),
				  OP                       VARCHAR2(8) not null,
				  PL_RATE                  NUMBER(8,6),
				  DEFERRED_RATE            NUMBER(8,6),
				  OVERDUE_RATE             NUMBER(8,6),
				  NEXT_CHECKER             VARCHAR2(150),
				  APPROVES                 VARCHAR2(200),
				  STATUS                   NUMBER,
				  ENTER_DATE               DATE,
				  ACC_CODE                 VARCHAR2(50),
				  VOUCHER_NO               CHAR(15),
				  RMK                      VARCHAR2(400),
				  ORDER_NO                 CHAR(18),
				  TALLIER_CODE             VARCHAR2(8),
				  RATION_CODE              VARCHAR2(20),
				  BANK_NAME                VARCHAR2(100),
				  BANK_TYPE                VARCHAR2(4),
				  REVERSE1                 VARCHAR2(300),
				  REVERSE2                 VARCHAR2(300),
				  REVERSE3                 VARCHAR2(300),
				  REVERSE4                 VARCHAR2(300),
				  REVERSE5                 VARCHAR2(300),
				  REVERSE6                 NUMBER(15,2),
				  REVERSE7                 NUMBER(15,2),
				  REVERSE8                 NUMBER(15,2),
				  REVERSE9                 NUMBER(15,2),
				  REVERSE10                NUMBER(15,2),
				  ITEM_CODE                VARCHAR2(20),
				  EXCHANGERATE             NUMBER(15,2),
				  IS_RMB_RAT               CHAR(1),
				  BAILMONEY                NUMBER(15,2) default 0,
				  CLC_ID                   VARCHAR2(10),
				  RATETIMEOFTAKEEFFECT     DATE,
				  BAILMONEY_RATE           NUMBER,
				  BAILMONEY_CONTRACT       VARCHAR2(50),
				  FLOAT_WAY                VARCHAR2(15),
				  RATE_ENTRIES_EFFECT_DATE DATE,
				  INTEREST_WAY             VARCHAR2(15),
				  REFERENCE_RATE_TYPE      VARCHAR2(50),
				  REPAY_CYCLE              VARCHAR2(50),
				  POINTS_PROPORTION_SELECT VARCHAR2(50),
				  POINTS_PROPORTION_TEXT   VARCHAR2(50),
				  INTERBUSEXPENSES         NUMBER(15,2),
				  USERS                    VARCHAR2(80),
				  CREDIT_CONTRACT_NO       VARCHAR2(40),
				  INSIDE_CONTRACT_NO       VARCHAR2(40),
				  PROJECT_NAME             VARCHAR2(80),
				  PAY_INTEREST             VARCHAR2(3),
				  RATMODEL                 char(1),
				  CPL_INTEREST_PAYMENT     VARCHAR2(3),
				  constraint PK_CMS_FINANC_REQ primary key (GUID) 
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------国际贸易融资信息表          中间表 ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANC_INFO表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_INFO';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_INFO  (
				   GUID                 VARCHAR2(36)                    not null,
				   CODE                 VARCHAR2(14)                    not null,   -----融资单编号
				   TYPE_CODE            varchar2(10)                    not null,   -----融资类别
				   BILL_CODE            VARCHAR2(14),                               -----借款信息
				   FOFE_CODE            VARCHAR2(14),                               -----福费延融信息
				   ENTER_DATE           DATE                            not null,   -----录入日期 
				   OP                   VARCHAR2(8)                     not null,   -----操作人员 
				   EDITOP               VARCHAR2(8),                                -----编辑人员 
				   EDIT_DATE            DATE,                                       -----编辑日期 
				   DEPOSIT_DATE         DATE,                                       -----保证金日期
				   DEPOSIT_INTER_RATES  NUMBER(6,4),                                -----保证金利率
				   ATTACHMENT           varchar2(500),                              -----附件   
				   FLAG                 CHAR(1),                                    ---1、表示国内 2、表示国际
				   SKIP                 CHAR(1),                                    ---是否跳过发送功能 1.表示跳过  
				   CREDIT_NO           varchar2(20),                                --信用证号
				   FPH                 varchar2(50),                                ---发票号
				   FPMONEY             NUMBER(15,2),    							---发票金额 
				   REC_DATE            DATE,                                        --收款日期 
				   ISSUE_WAY           varchar2(10),							    ---借款发放方式 
				   constraint PK_FINANC_INFO primary key (CODE)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------贷款使用人信息表 ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANC_LOAN_USER表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_LOAN_USER';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_LOAN_USER  (
				   GUID                 CHAR(40)                        not null,
				   REQ_CODE             char(14)                        not null,   ----融资单编号
				   LOAN_USER            VARCHAR(80)                     not null,   ---贷款使用人
				   AMOUNT               NUMBER(18, 2),                              ---金额
				   constraint PK_FINANC_LOAN_USER primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------国际贸易融资类别表 ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANC_TYPE表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_TYPE';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_TYPE  (
				   GUID                 CHAR(40)                        not null,
				   TYPE_CODE            VARCHAR2(10)                    not null,   ---类型编号
				   NAME                 VARCHAR(100)                    not null,   ---名称
				   constraint PK_FINANC_TYPE primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------福费延融资信息表 ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FOFE_FINANC_INFO表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FOFE_FINANC_INFO';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FOFE_FINANC_INFO  (
				   GUID                 VARCHAR2(36)                    not null,
				   BILL_CODE            CHAR(13)                        not null,   --融资单编号
				   REQ_DATE             DATE,                                       --申请日期
				   ARRIVE_DATE          DATE,                                       --单据到单日期
				   DIS_DATE             DATE,                                       --扣息日期
				   RATE                 NUMBER(6,4),                      			--利率
				   LOAN                 NUMBER(8,4),                    			--利息
				   MONEY                NUMBER(18,2),                               --到账金额
				   OP                   VARCHAR2(8),                                --录入操作员
				   ENTRY_DATE           DATE,                                       --录入时间
				   EDIT_OP              VARCHAR2(8),                                --修改操作员
				   EDIT_DATE            DATE,                                       --修改日期
				   constraint PK_FOFE_FINANC_INFO primary key (BILL_CODE)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------国际贸易融资贷款发放表 ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有FINANC_LOAN_ORIGINATIOIN表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_LOAN_ORIGINATIOIN';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table  FINANC_LOAN_ORIGINATIOIN 
				(
				   GUID                 varchar2(36)                       not null,
				   REQ_BILL_NO          varchar2(20)                    not null,
				   TIMES                number,
				   BILL_CODE            varchar2(20),
				   OPEN_CODE            varchar2(40),
				   ISSUE_DATE           date,
				   EXPIRE_DATE          date,
				   ISSUE_WAY            varchar2(2),
				   REPAY_TYPE           varchar2(2),
				   PAYMENT_PLAN         varchar2(300),
				   LOAN_AMOUNT          number(18,2),
				   PAYMENT_AMOUNT       number(18,2),
				   INTEREST_CAL_WAY     varchar2(2),
				   SERVICINIG_WAY       varchar2(2),
				   FLOAT_WAY            varchar2(2),
				   FLOAT_WAY_TP         number(2),
				   POINTS_PROPORTION_TEXT   varchar2(50),
				   POINTS_PROPORTION_SELECT  varchar2(50),
				   REPAY_CYCLE			varchar2(50),
				   REFERENCE_RATE_TYPE   varchar2(50),
				   START_FLOAT_DATE     date,
				   PL_RATE              number(6,4),
				   DEFERRED_RATE        number(8,6),
				   OVERDUE_RATE         number(8,6),
				   CORP_ID              number(10),
				   ATTACHMENT           varchar2(500),
				   NEXT_CHECKER         varchar2(150),
				   APPROVES             varchar2(200),
				   OPERATOR             varchar2(8),
				   STATUS               number,
				   ENTRY_DATE           date,
				   RMK                  varchar2(200),
				   constraint PK_FINANC_LOAN_ORIGINATIOIN  primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--添加菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资', 'lcs', '0', '', '0', '0', '0', '0', 29, '', '', '', '', '', '', null, null, null, null, null, 1, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=save', '0', '0', '0', '0', 1, '国际贸易融资申请', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请修改' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请修改', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=tempsave', '0', '0', '0', '0', 2, '国际贸易融资申请修改', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请打回' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请打回', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=callback', '0', '0', '0', '0', 3, '国际贸易融资申请打回', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资申请补录' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资申请补录', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=record', '0', '0', '0', '0', 4, '国际贸易融资申请补录', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资贷款发放' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '国际贸易融资贷款发放', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='国际贸易融资' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=open', '0', '0', '0', '0', 5, '国际贸易融资发放', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
--添加审批流
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interfin1';
  IF VN_COUNT < 1 THEN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin1', 'lcs', '国际贸易融资申请', 'A,B,C', 'cms_financ_req', 'pl_money', 'next_checker', 'bill_code', '../interfinance/InterFinancShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancForm');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interopen';
  IF VN_COUNT < 1 THEN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interopen', 'lcs', '国际贸易融资发放', 'A,B,C', 'financ_loan_originatioin', 'loan_amount', 'next_checker', 'bill_code', '../interfinance/InterFinancOpenShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancOpenForm');
  END IF;
  COMMIT; 
END;
/
--添加编号生成
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_KEY_GENERATOR
   WHERE TABLENAME='FINANC_LOAN_ORIGINATIOIN' and KEYALISENAME='InterFinancOpenCode';
  IF VN_COUNT < 1 THEN
	INSERT INTO BT_KEY_GENERATOR (ID, TABLENAME, KEYALISENAME, CUSTGENCLASS, GENSTRATE)
	VALUES (NVL((SELECT MAX(ID) FROM BT_KEY_GENERATOR), 0) + 1, 'FINANC_LOAN_ORIGINATIOIN', 'InterFinancOpenCode', 'com.byttersoft.intersettle.service.InterFinancOpenKeyGenerator', 'cu');
  END IF;
  COMMIT; 
END;
/