--�޸����ڣ�2012.12.17
--�޸��ˣ������
--�޸����ݣ�����ó������������ع���


--------����ó��������Ϣ��    ��ṹ�����һ�� ----------
DECLARE
  VC_STR           VARCHAR2(5000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���CMS_FINANC_REQ��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'CMS_FINANC_REQ';
  --���û��������������оͲ�����
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
--------����ó��������Ϣ��          �м�� ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANC_INFO��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_INFO';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_INFO  (
				   GUID                 VARCHAR2(36)                    not null,
				   CODE                 VARCHAR2(14)                    not null,   -----���ʵ����
				   TYPE_CODE            varchar2(10)                    not null,   -----�������
				   BILL_CODE            VARCHAR2(14),                               -----�����Ϣ
				   FOFE_CODE            VARCHAR2(14),                               -----����������Ϣ
				   ENTER_DATE           DATE                            not null,   -----¼������ 
				   OP                   VARCHAR2(8)                     not null,   -----������Ա 
				   EDITOP               VARCHAR2(8),                                -----�༭��Ա 
				   EDIT_DATE            DATE,                                       -----�༭���� 
				   DEPOSIT_DATE         DATE,                                       -----��֤������
				   DEPOSIT_INTER_RATES  NUMBER(6,4),                                -----��֤������
				   ATTACHMENT           varchar2(500),                              -----����   
				   FLAG                 CHAR(1),                                    ---1����ʾ���� 2����ʾ����
				   SKIP                 CHAR(1),                                    ---�Ƿ��������͹��� 1.��ʾ����  
				   CREDIT_NO           varchar2(20),                                --����֤��
				   FPH                 varchar2(50),                                ---��Ʊ��
				   FPMONEY             NUMBER(15,2),    							---��Ʊ��� 
				   REC_DATE            DATE,                                        --�տ����� 
				   ISSUE_WAY           varchar2(10),							    ---���ŷ�ʽ 
				   constraint PK_FINANC_INFO primary key (CODE)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------����ʹ������Ϣ�� ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANC_LOAN_USER��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_LOAN_USER';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_LOAN_USER  (
				   GUID                 CHAR(40)                        not null,
				   REQ_CODE             char(14)                        not null,   ----���ʵ����
				   LOAN_USER            VARCHAR(80)                     not null,   ---����ʹ����
				   AMOUNT               NUMBER(18, 2),                              ---���
				   constraint PK_FINANC_LOAN_USER primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------����ó���������� ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANC_TYPE��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_TYPE';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_TYPE  (
				   GUID                 CHAR(40)                        not null,
				   TYPE_CODE            VARCHAR2(10)                    not null,   ---���ͱ��
				   NAME                 VARCHAR(100)                    not null,   ---����
				   constraint PK_FINANC_TYPE primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------������������Ϣ�� ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FOFE_FINANC_INFO��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FOFE_FINANC_INFO';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FOFE_FINANC_INFO  (
				   GUID                 VARCHAR2(36)                    not null,
				   BILL_CODE            CHAR(13)                        not null,   --���ʵ����
				   REQ_DATE             DATE,                                       --��������
				   ARRIVE_DATE          DATE,                                       --���ݵ�������
				   DIS_DATE             DATE,                                       --��Ϣ����
				   RATE                 NUMBER(6,4),                      			--����
				   LOAN                 NUMBER(8,4),                    			--��Ϣ
				   MONEY                NUMBER(18,2),                               --���˽��
				   OP                   VARCHAR2(8),                                --¼�����Ա
				   ENTRY_DATE           DATE,                                       --¼��ʱ��
				   EDIT_OP              VARCHAR2(8),                                --�޸Ĳ���Ա
				   EDIT_DATE            DATE,                                       --�޸�����
				   constraint PK_FOFE_FINANC_INFO primary key (BILL_CODE)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--------����ó�����ʴ���ű� ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANC_LOAN_ORIGINATIOIN��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_LOAN_ORIGINATIOIN';
  --���û��������������оͲ�����
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
--��Ӳ˵�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó������' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó������', 'lcs', '0', '', '0', '0', '0', '0', 29, '', '', '', '', '', '', null, null, null, null, null, 1, '');
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
   WHERE res_name='����ó����������' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó����������', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=save', '0', '0', '0', '0', 1, '����ó����������', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='����ó�����������޸�' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó�����������޸�', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=tempsave', '0', '0', '0', '0', 2, '����ó�����������޸�', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='����ó������������' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó������������', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=callback', '0', '0', '0', '0', 3, '����ó������������', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='����ó���������벹¼' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó���������벹¼', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=record', '0', '0', '0', '0', 4, '����ó���������벹¼', '', '', '', '', '', null, null, null, null, null, 2, '');
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
   WHERE res_name='����ó�����ʴ����' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʴ����', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=open', '0', '0', '0', '0', 5, '����ó�����ʷ���', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
--���������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interfin1';
  IF VN_COUNT < 1 THEN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin1', 'lcs', '����ó����������', 'A,B,C', 'cms_financ_req', 'pl_money', 'next_checker', 'bill_code', '../interfinance/InterFinancShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancForm');
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
	values ('lcs_interopen', 'lcs', '����ó�����ʷ���', 'A,B,C', 'financ_loan_originatioin', 'loan_amount', 'next_checker', 'bill_code', '../interfinance/InterFinancOpenShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancOpenForm');
  END IF;
  COMMIT; 
END;
/
--��ӱ������
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