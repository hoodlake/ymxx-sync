--�޸����ڣ�2012.12.17
--�޸��ˣ������
--�޸����ݣ�����ó������������ع���


--------����ó��������Ϣ��    ��ṹ�����һ�� ----------
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

--------����ó��������Ϣ��          �м�� ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_INFO')
                  AND   TYPE = 'U')
	create table FINANC_INFO  (
	   GUID                 VARCHAR(36)                    not null,
	   CODE                 VARCHAR(14)                    not null,   -----���ʵ����
	   TYPE_CODE            VARCHAR(10)                    not null,   -----�������
	   BILL_CODE            VARCHAR(14),                               -----�����Ϣ
	   FOFE_CODE            VARCHAR(14),                               -----����������Ϣ
	   ENTER_DATE           DATETIME                            not null,   -----¼������ 
	   OP                   VARCHAR(8)                     not null,   -----������Ա 
	   EDITOP               VARCHAR(8),                                -----�༭��Ա 
	   EDIT_DATE            DATETIME,                                       -----�༭���� 
	   DEPOSIT_DATE         DATETIME,                                       -----��֤������
	   DEPOSIT_INTER_RATES  NUMERIC(6,4),                                -----��֤������
	   ATTACHMENT           VARCHAR(500),                              -----����   
	   FLAG                 CHAR(1),                                    ---1����ʾ���� 2����ʾ����
	   SKIP                 CHAR(1),                                    ---�Ƿ��������͹��� 1.��ʾ����  
	   CREDIT_NO           VARCHAR(20),                                --����֤��
	   FPH                 VARCHAR(50),                                ---��Ʊ��
	   FPMONEY             NUMERIC(15,2),    							---��Ʊ��� 
	   REC_DATE            DATETIME,                                        --�տ����� 
	   ISSUE_WAY           VARCHAR(10),							    ---���ŷ�ʽ 
	   constraint PK_FINANC_INFO primary key (CODE)
	)
GO

--------����ʹ������Ϣ�� ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_LOAN_USER')
                  AND   TYPE = 'U')
	create table FINANC_LOAN_USER  (
	   GUID                 CHAR(40)                        not null,
	   REQ_CODE             char(14)                        not null,   ----���ʵ����
	   LOAN_USER            VARCHAR(80)                     not null,   ---����ʹ����
	   AMOUNT               NUMERIC(18, 2),                              ---���
	   constraint PK_FINANC_LOAN_USER primary key (GUID)
	)
GO

--------����ó���������� ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_TYPE')
                  AND   TYPE = 'U')
	create table FINANC_TYPE  (
	   GUID                 CHAR(40)                        not null,
	   TYPE_CODE            VARCHAR(10)                    not null,   ---���ͱ��
	   NAME                 VARCHAR(100)                    not null,   ---����
	   constraint PK_FINANC_TYPE primary key (GUID)
	)
GO

--------������������Ϣ�� ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FOFE_FINANC_INFO')
                  AND   TYPE = 'U')
	create table FOFE_FINANC_INFO  (
	   GUID                 VARCHAR(36)                    not null,
	   BILL_CODE            CHAR(13)                        not null,   --���ʵ����
	   REQ_DATE             DATETIME,                                       --��������
	   ARRIVE_DATE          DATETIME,                                       --���ݵ�������
	   DIS_DATE             DATETIME,                                       --��Ϣ����
	   RATE                 NUMERIC(6,4),                      			--����
	   LOAN                 NUMERIC(8,4),                    			--��Ϣ
	   MONEY                NUMERIC(18,2),                               --���˽��
	   OP                   VARCHAR(8),                                --¼�����Ա
	   ENTRY_DATE           DATETIME,                                       --¼��ʱ��
	   EDIT_OP              VARCHAR(8),                                --�޸Ĳ���Ա
	   EDIT_DATE            DATETIME,                                       --�޸�����
	   constraint PK_FOFE_FINANC_INFO primary key (BILL_CODE)
	)
GO

--------����ó�����ʴ���ű� ----------
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

--��Ӳ˵�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó������' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó������', 'lcs', '0', '', '0', '0', '0', '0', 17, '', '', '', '', '', '', null, null, null, null, null, 1, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó����������' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó����������', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=save', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó�����������޸�' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó�����������޸�', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=tempsave', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó������������' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó������������', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=callback', '0', '0', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó���������벹¼' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó���������벹¼', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=record', '0', '0', '0', '0', 4, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó�����ʴ����' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʴ����', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=open', '0', '0', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

--���������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interfin1';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin1', 'lcs', '����ó����������', 'A,B,C', 'cms_financ_req', 'pl_money',  'next_checker', 'bill_code', '../interfinance/InterFinancShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancForm');
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
	values ('lcs_interopen', 'lcs', '����ó�����ʷ���', 'A,B,C', 'financ_loan_originatioin', 'loan_amount',  'next_checker', 'bill_code', '../interfinance/InterFinancOpenShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancOpenForm');
    END;
END;
GO

--��ӱ������
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