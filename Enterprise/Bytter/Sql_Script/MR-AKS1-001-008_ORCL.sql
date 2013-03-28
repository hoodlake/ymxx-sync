--修改时间2012-11-03
--修改人 邹仁斌 
--修改内容   贸易融资


---更新贸易融资所在的位置  
/*
update bt_sys_res set res_order=4 where sys_code='cms' and res_order=3 and res_url is null ; 
commit;  

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资', 'cms', 0, '', '0', '0', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 1, '');
commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资申请录入', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=save', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit ; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资申请暂存', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=tempsave', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');
commit ;

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资申请打回', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=callback', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资信息补录', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=record', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资贷款发放', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=open', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资合同生成', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=contract', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit; 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '贸易融资还款申请', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='贸易融资' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=repayment', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;  

--国际贸易融资申请审批流
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_interfin1', 'lcs', '国际贸易融资申请', 'A,B,C', 'cms_financ_req', 'pl_money', 'next_checker', 'bill_code', '../interfinance/InterFinancShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancForm');

commit; 
  
---国际贸易融资申请发放   
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('lcs_interopen', 'lcs', '国际贸易融资发放', 'A,B,C', 'financ_loan_originatioin', 'loan_amount', 'next_checker', 'bill_code', '../interfinance/InterFinancOpenShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancOpenForm');
commit; 

  
---还没加页面  
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
values ('cms_tradefin1', 'cms', '贸易融资申请', 'A,B,C', 'cms_financ_req', 'pl_money', 'next_checker', 'bill_code', '', 'com.byttersoft.cms.form.FinancForm');

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

---为了更新脚本不存错，暂时脚本

delete table  CMS_FINANC_REQ ;  
delete table  FINANC_INFO ;  
delete table FINANC_LOAN_USER; 
delete table FINANC_TYPE; 
delete table  FOFE_FINANC_INFO ; 
delete table FINANC_LOAN_ORIGINATIOIN ;
--------贸易融资放款还款信息表 ----------
delete table  FINANC_LOAN_REPAY; 
-----------贸易融资展期信息表-------------
delete table FINANC_LOAN_DEFERRED ; 

commit;  


/*===========================================================*/
/* 贸易融资信息表    表结构与借款表一样 */  
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
/* 贸易融资信息表          中间表                                     */
/*============================================================ */
create table FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   -----融资单编号
   TYPE_CODE            varchar2(10)                    not null,   -----融资类别
   BILL_CODE            CHAR(14),                                   -----借款信息
   FOFE_CODE            CHAR(14),                                   -----福费延融信息
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
) ;

comment on column FINANC_INFO.CODE is '生成规则为"RZ+8位时间+4位顺序号"';
comment on column FINANC_INFO.FLAG is '1、表示国内 2、表示国际';
comment on column FINANC_INFO.TYPE_CODE is '融资类别' ; 



/*==============================================================*/
/* 贷款使用人信息                                               */                         
/*==============================================================*/
 

create table FINANC_LOAN_USER  (
   GUID                 CHAR(40)                        not null,
   REQ_CODE             char(14)                        not null,   ----融资单编号
   LOAN_USER            VARCHAR(80)                     not null,   ---贷款使用人
   AMOUNT               NUMBER(18, 2),                              ---金额
   constraint PK_FINANC_LOAN_USER primary key (GUID)
);

comment on column FINANC_LOAN_USER.REQ_CODE is '融资单编号' ;
comment on column FINANC_LOAN_USER.LOAN_USER is '贷款使用人' ; 

/*==============================================================*/
/* 贸易融资类别                                               */                         
/*==============================================================*/ 

create table FINANC_TYPE  (
   GUID                 CHAR(40)                        not null,
   TYPE_CODE            VARCHAR2(10)                    not null,   ---类型编号
   NAME                 VARCHAR(100)                    not null,   ---名称
   constraint PK_FINANC_TYPE primary key (GUID)
);


/*==============================================================*/
/* 福费延融资信息                                               */                         
/*==============================================================*/ 

create table FOFE_FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   --融资单编号
   REQ_DATE             DATE,                                       --申请日期
   ARRIVE_DATE             DATE,                                    --单据到单日期
   DIS_DATE             DATE,                                       --扣息日期
   RATE                 NUMBER(6,4),                      			--利率
   LOAN                 NUMBER(8,4),                    			--利息
   MONEY                NUMBER(18,2),                               --到账金额
   OP                   VARCHAR2(8),                                --录入操作员
   ENTRY_DATE           DATE,                                       --录入时间
   EDIT_OP              VARCHAR2(8),                                --修改操作员
   EDIT_DATE            DATE,                                       --修改日期
   constraint PK_FOFE_FINANC_INFO primary key (CODE)
);
comment on column FOFE_FINANC_INFO.REQ_DATE is '申请日期' ;
comment on column FOFE_FINANC_INFO.END_DATE is '单据到单日期' ; 
comment on column FOFE_FINANC_INFO.DIS_DATE is '扣息日期' ; 
comment on column FOFE_FINANC_INFO.RATE is '利率' ; 
comment on column FOFE_FINANC_INFO.LOAN is '利息' ;
comment on column FOFE_FINANC_INFO.MONEY is '到账金额' ;

commit; 

--贸易融资贷款发放 

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
'主键';

comment on column FINANC_LOAN_ORIGINATIOIN.REPAY_TYPE is 
'还款方式';

comment on column FINANC_LOAN_ORIGINATIOIN.LOAN_AMOUNT is 
'发放金额';

comment on column FINANC_LOAN_ORIGINATIOIN.INTEREST_CAL_WAY is 
'计息方式';

comment on column FINANC_LOAN_ORIGINATIOIN.SERVICINIG_WAY is 
'付息方式';

comment on column FINANC_LOAN_ORIGINATIOIN.FLOAT_WAY_TP is 
'cms_loan_info的bill_code';

comment on column FINANC_LOAN_ORIGINATIOIN.DEFERRED_RATE is 
'展期率';

comment on column FINANC_LOAN_ORIGINATIOIN.OVERDUE_RATE is 
'过期率';

comment on column FINANC_LOAN_ORIGINATIOIN.STATUS is 
'状态';

comment on column FINANC_LOAN_ORIGINATIOIN.ENTRY_DATE is 
'录入日期'; 

--------贸易融资放款还款信息表 ----------
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
'HK+8位日期+3位顺序号';

comment on column FINANC_LOAN_REPAY.REPAY_MONEY is 
'还款金额 ';

comment on column FINANC_LOAN_REPAY.REPAY_DATE is 
'还款日期 ';

 comment on column FINANC_LOAN_REPAY.REPAY_ACCRUAL is 
'还款利息 ';
 
 comment on column FINANC_LOAN_REPAY.ENTER_DATE is 
'录入日期 ';   

-------------------贸易融资展期信息表------------------------
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
'ZQ+8位日期+3位顺序号'; 
comment on column FINANC_LOAN_DEFERRED.BILL_NO is 
'展期单号'; 
 comment on column FINANC_LOAN_DEFERRED.LOAN_BILL_CODE is 
'借款发放编码'; 
 comment on column FINANC_LOAN_DEFERRED.DELAY_TO is 
'展期到期日期'; 
 comment on column FINANC_LOAN_DEFERRED.DELAY_DAYS is 
'展期期限(天）'; 
 comment on column FINANC_LOAN_DEFERRED.INTEREST_RATE is 
'展期利率'; 
 comment on column FINANC_LOAN_DEFERRED.VOUCHER_NO is 
'记账凭证号'; 
 


