--�޸�ʱ��2012-11-03
--�޸��� ���ʱ� 
--�޸�����   ó������


---����ó���������ڵ�λ��  
/*
update bt_sys_res set res_order=4 where sys_code='cms' and res_order=3 and res_url is null ; 
commit;  

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó������', 'cms', 0, '', '0', '0', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 1, '');
commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó����������¼��', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=save', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit ; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó�����������ݴ�', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=tempsave', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');
commit ;

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó������������', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=callback', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó��������Ϣ��¼', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=record', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó�����ʴ����', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=open', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó�����ʺ�ͬ����', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=contract', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó�����ʻ�������', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=repayment', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;  

--����ó����������������
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_interfin1', 'lcs', '����ó����������', 'A,B,C', 'cms_financ_req', 'pl_money', 'next_checker', 'bill_code', '../interfinance/InterFinancShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancForm');

commit; 
  
---����ó���������뷢��   
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_interopen', 'lcs', '����ó�����ʷ���', 'A,B,C', 'financ_loan_originatioin', 'loan_amount', 'next_checker', 'bill_code', '../interfinance/InterFinancOpenShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancOpenForm');
commit; 

  
---��û��ҳ��  
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('cms_tradefin1', 'cms', 'ó����������', 'A,B,C', 'cms_financ_req', 'pl_money', 'next_checker', 'bill_code', '', 'com.byttersoft.cms.form.FinancForm');

commit;  
*/ 


/**
 * 
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

 */

---Ϊ�˸��½ű��������ʱ�ű�

delete table  CMS_FINANC_REQ ;  
delete table  FINANC_INFO ;  
delete table FINANC_LOAN_USER; 
delete table FINANC_TYPE; 
delete table  FOFE_FINANC_INFO ; 
delete table FINANC_LOAN_ORIGINATIOIN ;
--------ó�����ʷſ����Ϣ�� ----------
delete table  FINANC_LOAN_REPAY; 
-----------ó������չ����Ϣ��-------------
delete table FINANC_LOAN_DEFERRED ; 

commit;  


/*===========================================================*/
/* ó��������Ϣ��    ��ṹ�����һ�� */  
/*==========================================================*/
create table CMS_FINANC_REQ
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
) ;


/*==============================================================*/
/* ó��������Ϣ��          �м��                                     */
/*============================================================ */
create table FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   -----���ʵ����
   TYPE_CODE            varchar2(10)                    not null,   -----�������
   BILL_CODE            CHAR(14),                                   -----�����Ϣ
   FOFE_CODE            CHAR(14),                                   -----����������Ϣ
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
) ;

comment on column FINANC_INFO.CODE is '���ɹ���Ϊ"RZ+8λʱ��+4λ˳���"';
comment on column FINANC_INFO.FLAG is '1����ʾ���� 2����ʾ����';
comment on column FINANC_INFO.TYPE_CODE is '�������' ; 



/*==============================================================*/
/* ����ʹ������Ϣ                                               */                         
/*==============================================================*/
 

create table FINANC_LOAN_USER  (
   GUID                 CHAR(40)                        not null,
   REQ_CODE             char(14)                        not null,   ----���ʵ����
   LOAN_USER            VARCHAR(80)                     not null,   ---����ʹ����
   AMOUNT               NUMBER(18, 2),                              ---���
   constraint PK_FINANC_LOAN_USER primary key (GUID)
);

comment on column FINANC_LOAN_USER.REQ_CODE is '���ʵ����' ;
comment on column FINANC_LOAN_USER.LOAN_USER is '����ʹ����' ; 

/*==============================================================*/
/* ó���������                                               */                         
/*==============================================================*/ 

create table FINANC_TYPE  (
   GUID                 CHAR(40)                        not null,
   TYPE_CODE            VARCHAR2(10)                    not null,   ---���ͱ��
   NAME                 VARCHAR(100)                    not null,   ---����
   constraint PK_FINANC_TYPE primary key (GUID)
);


/*==============================================================*/
/* ������������Ϣ                                               */                         
/*==============================================================*/ 

create table FOFE_FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   --���ʵ����
   REQ_DATE             DATE,                                       --��������
   ARRIVE_DATE             DATE,                                    --���ݵ�������
   DIS_DATE             DATE,                                       --��Ϣ����
   RATE                 NUMBER(6,4),                      			--����
   LOAN                 NUMBER(8,4),                    			--��Ϣ
   MONEY                NUMBER(18,2),                               --���˽��
   OP                   VARCHAR2(8),                                --¼�����Ա
   ENTRY_DATE           DATE,                                       --¼��ʱ��
   EDIT_OP              VARCHAR2(8),                                --�޸Ĳ���Ա
   EDIT_DATE            DATE,                                       --�޸�����
   constraint PK_FOFE_FINANC_INFO primary key (CODE)
);
comment on column FOFE_FINANC_INFO.REQ_DATE is '��������' ;
comment on column FOFE_FINANC_INFO.END_DATE is '���ݵ�������' ; 
comment on column FOFE_FINANC_INFO.DIS_DATE is '��Ϣ����' ; 
comment on column FOFE_FINANC_INFO.RATE is '����' ; 
comment on column FOFE_FINANC_INFO.LOAN is '��Ϣ' ;
comment on column FOFE_FINANC_INFO.MONEY is '���˽��' ;

commit; 

--ó�����ʴ���� 

create table  FINANC_LOAN_ORIGINATIOIN 
(
   GUID                 char(36)                       not null,
   REQ_BILL_NO          varchar(20)                    not null,
   TIMES                number,
   BILL_CODE            varchar(40),
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
);

comment on column FINANC_LOAN_ORIGINATIOIN.REQ_BILL_NO is 
'����';

comment on column FINANC_LOAN_ORIGINATIOIN.REPAY_TYPE is 
'���ʽ';

comment on column FINANC_LOAN_ORIGINATIOIN.LOAN_AMOUNT is 
'���Ž��';

comment on column FINANC_LOAN_ORIGINATIOIN.INTEREST_CAL_WAY is 
'��Ϣ��ʽ';

comment on column FINANC_LOAN_ORIGINATIOIN.SERVICINIG_WAY is 
'��Ϣ��ʽ';

comment on column FINANC_LOAN_ORIGINATIOIN.FLOAT_WAY_TP is 
'cms_loan_info��bill_code';

comment on column FINANC_LOAN_ORIGINATIOIN.DEFERRED_RATE is 
'չ����';

comment on column FINANC_LOAN_ORIGINATIOIN.OVERDUE_RATE is 
'������';

comment on column FINANC_LOAN_ORIGINATIOIN.STATUS is 
'״̬';

comment on column FINANC_LOAN_ORIGINATIOIN.ENTRY_DATE is 
'¼������'; 

--------ó�����ʷſ����Ϣ�� ----------
create table FINANC_LOAN_REPAY 
(
   GUID                 varchar2(36)                   not null,
   BILL_NO              varchar2(14),
   LOAN_BILL_CODE       varchar2(13)                   not null,
   CORP_ID              number(10)                     not null,
   REPAY_MONEY          number(18,2)                   not null,
   REPAY_DATE           date                           not null,
   REPAY_ACCRUAL        number(6,4),
   ENTER_DATE           date                           not null,
   ACT_COLLECT_MONEY    number(18,2),
   BALANCE              number(18,2),
   NEXT_CHECKER         varchar2(150),
   OP                   varchar2(8)                    not null,
   VOUCHER_NO           varchar2(15),
   APPROVES             varchar2(200),
   RMK                  varchar2(400),
   STATUS               number                         not null,
   REJECT_REASON        varchar2(400),
   constraint PK_FINANC_LOAN_REPAY primary key (GUID)
);

comment on column FINANC_LOAN_REPAY.BILL_NO is 
'HK+8λ����+3λ˳���';

comment on column FINANC_LOAN_REPAY.REPAY_MONEY is 
'������ ';

comment on column FINANC_LOAN_REPAY.REPAY_DATE is 
'�������� ';

 comment on column FINANC_LOAN_REPAY.REPAY_ACCRUAL is 
'������Ϣ ';
 
 comment on column FINANC_LOAN_REPAY.ENTER_DATE is 
'¼������ ';   

-------------------ó������չ����Ϣ��------------------------
create table FINANC_LOAN_DEFERRED 
(
   GUID                 varchar2(36)                   not null,
   BILL_NO              varchar2(14),
   LOAN_BILL_CODE       varchar2(13)                   not null,
   CORP_ID              number(10)                     not null,
   DELAY_TO             date                           not null,
   DELAY_DAYS           number(6)                      not null,
   INTEREST_RATE        number(6,4),
   ENTER_DATE           date                           not null,
   NEXT_CHECKER         varchar2(150),
   OP                   varchar2(8)                    not null,
   VOUCHER_NO           varchar2(15),
   APPROVES             varchar2(200),
   RMK                  varchar2(400),
   STATUS               number                         not null,
   REJECT_REASON        varchar2(400),
   constraint PK_FINANC_LOAN_DEFERRED primary key (GUID)
);

comment on column FINANC_LOAN_DEFERRED.BILL_NO is 
'ZQ+8λ����+3λ˳���'; 
comment on column FINANC_LOAN_DEFERRED.BILL_NO is 
'չ�ڵ���'; 
 comment on column FINANC_LOAN_DEFERRED.LOAN_BILL_CODE is 
'���ű���'; 
 comment on column FINANC_LOAN_DEFERRED.DELAY_TO is 
'չ�ڵ�������'; 
 comment on column FINANC_LOAN_DEFERRED.DELAY_DAYS is 
'չ������(�죩'; 
 comment on column FINANC_LOAN_DEFERRED.INTEREST_RATE is 
'չ������'; 
 comment on column FINANC_LOAN_DEFERRED.VOUCHER_NO is 
'����ƾ֤��'; 
 


