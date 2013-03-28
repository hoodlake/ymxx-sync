--修改日期:2012-08-29
--修改人:叶爱军
--修改内容:新增理财新产品表,增加理财产品菜单
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
VALUES ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买', 'cho', 0, '', '0', '1', '0', '0', 7, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1);

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买', 'cho', RES_CODE, '', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品销售';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品同步查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Sign', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买申请', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Purchase', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买申请修改', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Modify', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买结果查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Query', '0', '0', '0', '0', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买';
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品赎回', 'cho', RES_CODE, '', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品销售';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '赎回申请', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'||chr(38)||'methodTarget=Back', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品赎回';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '赎回申请修改', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'||chr(38)||'methodTarget=Modify', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品赎回';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '赎回申请结果查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'||chr(38)||'methodTarget=Query', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品赎回';
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品查询', 'cho', RES_CODE, '', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品销售';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品签约状态查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=State', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品查询';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财资产余额查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=queryMoneyProduct'||chr(38)||'methodTarget=Money', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品查询';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财资产交易明细查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=queryDetailProduct'||chr(38)||'methodTarget=Query', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品查询';
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
COMMIT;


--修改内容：增加理财产品购买申请
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('bankacc_fin', 'cho', '理财产品购买申请', 'A,B,C', 'BIS_FIN_BUY', '', '', '', 'nextchecker', 'VOUCHER_NO', '../chowmatistic/bisFinProductPurchase.jsp', 'com.byttersoft.chowmatistic.form.BisFinProductExcForm');

--修改内容：增加理财产品赎回申请
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('bankacc_bac', 'cho', '理财产品赎回申请', 'A,B,C', 'BIS_FIN_BUY', '', '', '', 'nextchecker', 'VOUCHER_NO', '../chowmatistic/bisFinProductReturn.jsp', 'com.byttersoft.chowmatistic.form.BisFinProductBackForm');
COMMIT;


/*==============================================================*/
/* Table: BIS_FIN_BAL                                           */
/*==============================================================*/
create table BIS_FIN_BAL  (
   PRODNO               VARCHAR2(30)                    not null,
   SHORT_NAME           VARCHAR2(140),
   PRODBAL              NUMBER(15,2),
   DEALSHARES           NUMBER(15,2),
   AVAILBAL             NUMBER(15,2),
   CASHFLAG             CHAR(1),
   BIF_CODE             CHAR(4),
   QUERY_TIME           DATE,
   VOUCHER_STAT         CHAR(1),
   LAST_TIME            DATE,
   RETURN_CODE          VARCHAR2(30),
   RETURN_MSG           VARCHAR2(150),
   constraint PK_BIS_FIN_BAL primary key (PRODNO)
);

comment on table BIS_FIN_BAL is
'理财产品余额查询';

comment on column BIS_FIN_BAL.PRODNO is
'产品代码';

comment on column BIS_FIN_BAL.SHORT_NAME is
'产品简称';

comment on column BIS_FIN_BAL.PRODBAL is
'产品余额';

comment on column BIS_FIN_BAL.DEALSHARES is
'产品份额';

comment on column BIS_FIN_BAL.AVAILBAL is
'可用份额';

comment on column BIS_FIN_BAL.CASHFLAG is
'钞汇标识 0 钞1 汇';

comment on column BIS_FIN_BAL.BIF_CODE is
'银行类别';

/*==============================================================*/
/* Table: BIS_FIN_BUY                                           */
/*==============================================================*/
create table BIS_FIN_BUY  (
   VOUCHER_NO           NUMBER(10)                      not null,
   BIS_TYPE             CHAR(2),
   PRODNO               VARCHAR2(60),
   MOBILE               VARCHAR2(30),
   PHONE                VARCHAR2(30),
   ZIP                  VARCHAR2(30),
   ADDR                 VARCHAR2(100),
   EMAIL                VARCHAR2(30),
   BIF_CODE             CHAR(4),
   ACCTID               VARCHAR2(60),
   AMT                  NUMBER(15,2),
   REDM_AMT             NUMBER(15,2),
   TRANS_TIME           DATE,
   CONTRACT_ID          NUMBER(28),
   BFE_MEMO             VARCHAR2(2000),
   OPER_USER_ID         VARCHAR2(8),
   STATUS               NUMBER(38),
   APPROVES             VARCHAR2(150),
   NEXTCHECKER          VARCHAR2(150),
   CORP_ID              VARCHAR2(150),
   MONEY                VARCHAR2(150),
   constraint PK_BIS_FIN_BUY primary key (VOUCHER_NO)
);

comment on table BIS_FIN_BUY is
'产品购买/赎回';

comment on column BIS_FIN_BUY.VOUCHER_NO is
'主键ID';

comment on column BIS_FIN_BUY.BIS_TYPE is
'交易种类 01:认购,02:申购,05:赎回';

comment on column BIS_FIN_BUY.PRODNO is
'产品代码';

comment on column BIS_FIN_BUY.MOBILE is
'手机号码';

comment on column BIS_FIN_BUY.PHONE is
'电话号码';

comment on column BIS_FIN_BUY.ZIP is
'邮政编码';

comment on column BIS_FIN_BUY.ADDR is
'地址';

comment on column BIS_FIN_BUY.EMAIL is
'邮编';

comment on column BIS_FIN_BUY.BIF_CODE is
'银行编码';

comment on column BIS_FIN_BUY.ACCTID is
'账户';

comment on column BIS_FIN_BUY.AMT is
'交易金额';

comment on column BIS_FIN_BUY.REDM_AMT is
'赎回份额';

comment on column BIS_FIN_BUY.TRANS_TIME is
'交易时间';

comment on column BIS_FIN_BUY.CONTRACT_ID is
'签约ID';

comment on column BIS_FIN_BUY.BFE_MEMO is
'备注';

comment on column BIS_FIN_BUY.OPER_USER_ID is
'操作人';

comment on column BIS_FIN_BUY.STATUS is
'状态';

comment on column BIS_FIN_BUY.APPROVES is
'处理人';

comment on column BIS_FIN_BUY.NEXTCHECKER is
'下一处理人';

comment on column BIS_FIN_BUY.CORP_ID is
'单位ID';

comment on column BIS_FIN_BUY.MONEY is
'金额';

/*==============================================================*/
/* Table: BIS_FIN_CONTRACT                                      */
/*==============================================================*/
create table BIS_FIN_CONTRACT  (
   CONTRACT_ID          VARCHAR2(28)                    not null,
   PRODNO               VARCHAR2(30),
   ACCTID               VARCHAR2(60),
   SIGNFLG              CHAR(1),
   AGRM                 CHAR(1),
   TRANS_TYPE           char(2),
   QUERY_TYPE           char(1),
   BIF_CODE             char(4),
   RETURN_TIME          DATE,
   VOUCHER_STAT         CHAR(1),
   REQ_DATE             DATE,
   RETURN_MSG           VARCHAR2(150),
   SIGN_CORP            CHAR(4),
   SIGN_TIME            DATE,
   SIGN_USER_ID         VARCHAR2(8),
   constraint PK_BIS_FIN_CONTRACT primary key (CONTRACT_ID)
);

comment on table BIS_FIN_CONTRACT is
'理财产品签约解约表';

comment on column BIS_FIN_CONTRACT.CONTRACT_ID is
'主键ID';

comment on column BIS_FIN_CONTRACT.PRODNO is
'产品代码';

comment on column BIS_FIN_CONTRACT.ACCTID is
'账户代号';

comment on column BIS_FIN_CONTRACT.SIGNFLG is
'0-签约 1-解约';

comment on column BIS_FIN_CONTRACT.AGRM is
'协议书编号';

comment on column BIS_FIN_CONTRACT.TRANS_TYPE is
'交易类型(01:理财产品,02:第三方存管)';

comment on column BIS_FIN_CONTRACT.QUERY_TYPE is
'查询类型(0:普通存管,1:融资融券)';

comment on column BIS_FIN_CONTRACT.BIF_CODE is
'银行类别';

comment on column BIS_FIN_CONTRACT.VOUCHER_STAT is
'状态';

comment on column BIS_FIN_CONTRACT.REQ_DATE is
'请求时间';

comment on column BIS_FIN_CONTRACT.SIGN_CORP is
'签约部门';

comment on column BIS_FIN_CONTRACT.SIGN_TIME is
'签约时间';

comment on column BIS_FIN_CONTRACT.SIGN_USER_ID is
'签约人ID';

/*==============================================================*/
/* Table: BIS_FIN_DTL                                           */
/*==============================================================*/
create table BIS_FIN_DTL  (
   SERIAL_ID            VARCHAR2(32)                    not null,
   PRODNO               VARCHAR2(30),
   SHORTNAME            VARCHAR2(140),
   APPLYAMT             NUMBER(15,2),
   SHAREAPPLY           NUMBER(15,2),
   CASHFLAG             CHAR(1),
   DEALAMT              NUMBER(15,2),
   BANK_SERIAL_ID       VARCHAR2(30),
   BIF_CODE             CHAR(4),
   DEALSHARES           NUMBER(15,2),
   TRNSTATUS            CHAR(1),
   ACCEPTNO             VARCHAR2(40),
   TRNCODE              VARCHAR2(40),
   TRANS_TIME           DATE,
   REC_TIME             DATE,
   ACCTID               VARCHAR2(60),
   CUR                  CHAR(2),
   BUSN_NAME            VARCHAR2(60),
   BROKER               VARCHAR2(30),
   TRANS_TYPE           VARCHAR2(2),
   RETURN_MSG           VARCHAR2(150),
   constraint PK_BIS_FIN_DTL primary key (SERIAL_ID)
);

comment on table BIS_FIN_DTL is
'理财产品历史记录';

comment on column BIS_FIN_DTL.SERIAL_ID is
'主键ID';

comment on column BIS_FIN_DTL.PRODNO is
'产品代码';

comment on column BIS_FIN_DTL.SHORTNAME is
'产品简称';

comment on column BIS_FIN_DTL.APPLYAMT is
'申请金额';

comment on column BIS_FIN_DTL.SHAREAPPLY is
'申请份额';

comment on column BIS_FIN_DTL.CASHFLAG is
'钞汇标识 0 钞1 汇';

comment on column BIS_FIN_DTL.DEALAMT is
'成交金额';

comment on column BIS_FIN_DTL.BIF_CODE is
'银行类别';

comment on column BIS_FIN_DTL.DEALSHARES is
'成交份额';

comment on column BIS_FIN_DTL.TRNSTATUS is
'交易处理状态';

comment on column BIS_FIN_DTL.ACCEPTNO is
'业务受理编号';

comment on column BIS_FIN_DTL.TRNCODE is
'交易代码';

comment on column BIS_FIN_DTL.TRANS_TIME is
'交易日期';

comment on column BIS_FIN_DTL.ACCTID is
'账户代号';

comment on column BIS_FIN_DTL.CUR is
'币别';

comment on column BIS_FIN_DTL.BUSN_NAME is
'业务名称';

comment on column BIS_FIN_DTL.BROKER is
'券商名称';

comment on column BIS_FIN_DTL.TRANS_TYPE is
'交易类型(0:理财产品,1:第三方存管)';

/*==============================================================*/
/* Table: BIS_FIN_EXC                                           */
/*==============================================================*/
create table BIS_FIN_EXC  (
   VOUCHER_NO           VARCHAR2(28)                    not null,
   ACCTID               VARCHAR2(60),
   PRODNO               VARCHAR2(60),
   BIS_TYPE             CHAR(2),
   MOBILE               VARCHAR2(30),
   PHONE                VARCHAR2(30),
   ZIP                  VARCHAR2(30),
   ADDR                 VARCHAR2(100),
   EMAIL                VARCHAR2(30),
   ACCEPTNO             VARCHAR2(30),
   AMT                  NUMBER(15,2),
   REDM_AMT             NUMBER(15,2),
   BIF_CODE             CHAR(4),
   RETURN_TIME          DATE,
   REQ_DATE             DATE,
   VOUCHER_STAT         CHAR(1),
   TRANS_TIME           DATE,
   PWD                  VARCHAR2(32),
   THIRD_ID             NUMBER(10),
   RETURN_MSG           VARCHAR2(150),
   constraint PK_BIS_FIN_EXC primary key (VOUCHER_NO)
);

comment on table BIS_FIN_EXC is
'理财产品操作表';

comment on column BIS_FIN_EXC.VOUCHER_NO is
'票据号';

comment on column BIS_FIN_EXC.ACCTID is
'账户代号';

comment on column BIS_FIN_EXC.PRODNO is
'产品代码';

comment on column BIS_FIN_EXC.BIS_TYPE is
'交易种类 01:认购,02:申购,03:撤销购买,05:赎回,06:撤销赎回,07:银转证，08:证转银';

comment on column BIS_FIN_EXC.MOBILE is
'手机号码';

comment on column BIS_FIN_EXC.PHONE is
'电话号码';

comment on column BIS_FIN_EXC.ZIP is
'邮政编码';

comment on column BIS_FIN_EXC.ADDR is
'地址';

comment on column BIS_FIN_EXC.EMAIL is
'电子邮箱';

comment on column BIS_FIN_EXC.ACCEPTNO is
'业务受理编号';

comment on column BIS_FIN_EXC.AMT is
'交易金额';

comment on column BIS_FIN_EXC.REDM_AMT is
'赎回份额';

comment on column BIS_FIN_EXC.BIF_CODE is
'银行类别';

comment on column BIS_FIN_EXC.RETURN_TIME is
'返回时间';

comment on column BIS_FIN_EXC.REQ_DATE is
'请求时间';

comment on column BIS_FIN_EXC.VOUCHER_STAT is
'状态';

comment on column BIS_FIN_EXC.TRANS_TIME is
'交易时间';

comment on column BIS_FIN_EXC.PWD is
'台账密码';

comment on column BIS_FIN_EXC.THIRD_ID is
'购买ID';

/*==============================================================*/
/* Table: BIS_FIN_HIS_DTL                                       */
/*==============================================================*/
create table BIS_FIN_HIS_DTL  (
   SERIAL_ID            VARCHAR2(32)                    not null,
   PRODNO               VARCHAR2(30),
   SHORTNAME            VARCHAR2(140),
   APPLYAMT             NUMBER(15,2),
   SHAREAPPLY           NUMBER(15,2),
   CASHFLAG             CHAR(1),
   DEALAMT              NUMBER(15,2),
   BANK_SERIAL_ID       VARCHAR2(30),
   BIF_CODE             CHAR(4),
   DEALSHARES           NUMBER(15,2),
   TRNSTATUS            CHAR(1),
   ACCEPTNO             VARCHAR2(40),
   TRNCODE              VARCHAR2(40),
   TRANS_TIME           DATE,
   REC_TIME             DATE,
   ACCTID               VARCHAR2(60),
   CUR                  CHAR(2),
   BUSN_NAME            VARCHAR2(60),
   BROKER               VARCHAR2(30),
   TRANS_TYPE           VARCHAR2(2),
   RETURN_MSG           VARCHAR2(150),
   constraint PK_BIS_FIN_HIS_DTL primary key (SERIAL_ID)
);

comment on table BIS_FIN_HIS_DTL is
'理财产品历史记录';

comment on column BIS_FIN_HIS_DTL.SERIAL_ID is
'主键ID';

comment on column BIS_FIN_HIS_DTL.PRODNO is
'产品代码';

comment on column BIS_FIN_HIS_DTL.SHORTNAME is
'产品简称';

comment on column BIS_FIN_HIS_DTL.APPLYAMT is
'申请金额';

comment on column BIS_FIN_HIS_DTL.SHAREAPPLY is
'申请份额';

comment on column BIS_FIN_HIS_DTL.CASHFLAG is
'钞汇标识 0 钞1 汇';

comment on column BIS_FIN_HIS_DTL.DEALAMT is
'成交金额';

comment on column BIS_FIN_HIS_DTL.BIF_CODE is
'银行类别';

comment on column BIS_FIN_HIS_DTL.DEALSHARES is
'成交份额';

comment on column BIS_FIN_HIS_DTL.TRNSTATUS is
'交易处理状态';

comment on column BIS_FIN_HIS_DTL.ACCEPTNO is
'业务受理编号';

comment on column BIS_FIN_HIS_DTL.TRNCODE is
'交易代码';

comment on column BIS_FIN_HIS_DTL.TRANS_TIME is
'交易日期';

comment on column BIS_FIN_HIS_DTL.ACCTID is
'账户代号';

comment on column BIS_FIN_HIS_DTL.CUR is
'币别';

comment on column BIS_FIN_HIS_DTL.BUSN_NAME is
'业务名称';

comment on column BIS_FIN_HIS_DTL.BROKER is
'券商名称';

comment on column BIS_FIN_HIS_DTL.TRANS_TYPE is
'交易类型(0:理财产品,1:第三方存管)';

/*==============================================================*/
/* Table: BIS_FIN_OPER_LOG                                      */
/*==============================================================*/
create table BIS_FIN_OPER_LOG  (
   BL_ID                NUMBER(10)                      not null,
   BL_TIME              DATE,
   BL_NO                VARCHAR2(50),
   BL_CODE              VARCHAR2(50),
   BL_NAME              VARCHAR2(50),
   BL_TYPE              VARCHAR2(10),
   BL_MEMO              VARCHAR2(500),
   BL_MODULE            VARCHAR2(50),
   constraint PK_BIS_FIN_OPER_LOG primary key (BL_ID)
);

comment on table BIS_FIN_OPER_LOG is
'理财产品操作日志';

comment on column BIS_FIN_OPER_LOG.BL_ID is
'主键';

comment on column BIS_FIN_OPER_LOG.BL_TIME is
'操作时间';

comment on column BIS_FIN_OPER_LOG.BL_NO is
'产品编号';

comment on column BIS_FIN_OPER_LOG.BL_CODE is
'操作账户';

comment on column BIS_FIN_OPER_LOG.BL_NAME is
'操作人';

comment on column BIS_FIN_OPER_LOG.BL_TYPE is
'操作类型';

comment on column BIS_FIN_OPER_LOG.BL_MEMO is
'意见';

comment on column BIS_FIN_OPER_LOG.BL_MODULE is
'模块名称';

/*==============================================================*/
/* Table: BIS_FIN_PRODUCT_INFO                                  */
/*==============================================================*/
create table BIS_FIN_PRODUCT_INFO  (
   PRODNO               VARCHAR2(30)                    not null,
   BIF_CODE             CHAR(4)                         not null,
   PRODNAME             VARCHAR2(60),
   CURRENCY             CHAR(2),
   TARGET               CHAR(1),
   RETURN_TYPE          CHAR(1),
   DTSTART              DATE,
   DTEND                DATE,
   INTRSTEDTSTART       DATE,
   EXPIREDATE           DATE,
   DTEXCHANGE           DATE,
   REFVALUE             NUMBER(15,4),
   MANAGEMENTFEE        NUMBER(15,2),
   SBSCRFEE             NUMBER(15,4),
   PURCHFEE             NUMBER(15,4),
   REDMFEE              NUMBER(15,4),
   SBSCRFLG             CHAR(1),
   PURCHFLG             CHAR(1),
   REDMFLG              CHAR(1),
   SBSCRMINAMT          NUMBER(18,2),
   SBSCRINCAMT          NUMBER(18,2),
   PURCHMINAMT          NUMBER(18,2),
   PURCHINCAMT          NUMBER(18,2),
   HOLDMINAMT           NUMBER(18,2),
   HOLDMAXAMT           NUMBER(18,2),
   REDMMINAMT           NUMBER(18,2),
   REDMINCAMT           NUMBER(18,2),
   AGREEMCONTENT        CLOB,
   VOUCHER_STAT         CHAR(1),
   RETURN_TIME          DATE,
   RETURN_MSG           VARCHAR2(150),
   constraint PK_BIS_FIN_PRODUCT_INFO primary key (PRODNO, BIF_CODE)
);

comment on table BIS_FIN_PRODUCT_INFO is
'理财产品信息查询表';

comment on column BIS_FIN_PRODUCT_INFO.PRODNO is
'产品代码';

comment on column BIS_FIN_PRODUCT_INFO.BIF_CODE is
'银行类别';

comment on column BIS_FIN_PRODUCT_INFO.PRODNAME is
'产品简称';

comment on column BIS_FIN_PRODUCT_INFO.CURRENCY is
'销售币种';

comment on column BIS_FIN_PRODUCT_INFO.TARGET is
'销售对象1 个人 （不提供）；2 公司 ；3 全部 ；4 同业';

comment on column BIS_FIN_PRODUCT_INFO.RETURN_TYPE is
'收益表示方式 1 收益率  2 净值';

comment on column BIS_FIN_PRODUCT_INFO.DTSTART is
'认购开始日期';

comment on column BIS_FIN_PRODUCT_INFO.DTEND is
'认购结束日期';

comment on column BIS_FIN_PRODUCT_INFO.INTRSTEDTSTART is
'理财起息日';

comment on column BIS_FIN_PRODUCT_INFO.EXPIREDATE is
'理财到期日';

comment on column BIS_FIN_PRODUCT_INFO.DTEXCHANGE is
'理财兑付日';

comment on column BIS_FIN_PRODUCT_INFO.REFVALUE is
'参考收益率(净值)';

comment on column BIS_FIN_PRODUCT_INFO.MANAGEMENTFEE is
'管理费';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRFEE is
'认购手续费';

comment on column BIS_FIN_PRODUCT_INFO.PURCHFEE is
'申购手续费';

comment on column BIS_FIN_PRODUCT_INFO.REDMFEE is
'赎回手续费';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRFLG is
'是否可认购 0不可操作 1可操作';

comment on column BIS_FIN_PRODUCT_INFO.PURCHFLG is
'是否可申购 0不可操作 1可操作';

comment on column BIS_FIN_PRODUCT_INFO.REDMFLG is
'是否可赎回 0不可操作 1可操作';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRMINAMT is
'认购最低金额';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRINCAMT is
'认购递增金额';

comment on column BIS_FIN_PRODUCT_INFO.PURCHMINAMT is
'申购最低金额';

comment on column BIS_FIN_PRODUCT_INFO.PURCHINCAMT is
'申购递增金额';

comment on column BIS_FIN_PRODUCT_INFO.HOLDMINAMT is
'最低持有金额';

comment on column BIS_FIN_PRODUCT_INFO.HOLDMAXAMT is
'最高持有金额';

comment on column BIS_FIN_PRODUCT_INFO.REDMMINAMT is
'赎回最低金额';

comment on column BIS_FIN_PRODUCT_INFO.REDMINCAMT is
'赎回递增金额';

comment on column BIS_FIN_PRODUCT_INFO.AGREEMCONTENT is
'协议书内容';

comment on column BIS_FIN_PRODUCT_INFO.VOUCHER_STAT is
'状态';


CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_INFO AS
SELECT P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '收益率'
         WHEN P.RETURN_TYPE = '2' THEN
          '净值'
       END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       TO_CHAR(ROUND(P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
       TO_CHAR(ROUND(P.MANAGEMENTFEE, 2), '9999999999990.00') AS MANAGEMENTFEE,
       TO_CHAR(ROUND(P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
       TO_CHAR(ROUND(P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
       TO_CHAR(ROUND(P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
       P.SBSCRFLG,
       (CASE
         WHEN P.SBSCRFLG = '0' THEN
          '不可操作'
         WHEN P.SBSCRFLG = '1' THEN
          '可操作'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '不可操作'
         WHEN P.PURCHFLG = '1' THEN
          '可操作'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       TO_CHAR(ROUND(P.SBSCRMINAMT, 2), '9999999999990.00') AS SBSCRMINAMT,
       TO_CHAR(ROUND(P.SBSCRINCAMT, 2), '9999999999990.00') AS SBSCRINCAMT,
       TO_CHAR(ROUND(P.PURCHMINAMT, 2), '9999999999990.00') AS PURCHMINAMT,
       TO_CHAR(ROUND(P.PURCHINCAMT, 2), '9999999999990.00') AS PURCHINCAMT,
       TO_CHAR(ROUND(P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
       TO_CHAR(ROUND(P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       TO_CHAR(ROUND(P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
       P.AGREEMCONTENT,
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
       P.VOUCHER_STAT,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE NOT EXISTS (SELECT I.PRODNO
          FROM BIS_FIN_PRODUCT_INFO I
         WHERE I.PRODNO = P.PRODNO
           AND I.SBSCRFLG = '0'
           AND I.PURCHFLG = '0');
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_SIGN AS
SELECT F.CONTRACT_ID,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '收益率'
         WHEN P.RETURN_TYPE = '2' THEN
          '净值'
       END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       TO_CHAR(ROUND(P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
       TO_CHAR(ROUND(P.MANAGEMENTFEE, 2), '9999999999990.00') AS MANAGEMENTFEE,
       TO_CHAR(ROUND(P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
       TO_CHAR(ROUND(P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
       TO_CHAR(ROUND(P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
       P.SBSCRFLG,
       (CASE
         WHEN P.SBSCRFLG = '0' THEN
          '不可操作'
         WHEN P.SBSCRFLG = '1' THEN
          '可操作'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '不可操作'
         WHEN P.PURCHFLG = '1' THEN
          '可操作'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       TO_CHAR(ROUND(P.SBSCRMINAMT, 2), '9999999999990.00') AS SBSCRMINAMT,
       TO_CHAR(ROUND(P.SBSCRINCAMT, 2), '9999999999990.00') AS SBSCRINCAMT,
       TO_CHAR(ROUND(P.PURCHMINAMT, 2), '9999999999990.00') AS PURCHMINAMT,
       TO_CHAR(ROUND(P.PURCHINCAMT, 2), '9999999999990.00') AS PURCHINCAMT,
       TO_CHAR(ROUND(P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
       TO_CHAR(ROUND(P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       TO_CHAR(ROUND(P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
       F.VOUCHER_STAT,
       F.SIGNFLG,
       (CASE
         WHEN F.SIGNFLG = '0' THEN
          (CASE
         WHEN F.VOUCHER_STAT = '0' THEN
          '已签约'
         WHEN F.VOUCHER_STAT = '2' THEN
          '银行处理失败'
         WHEN F.VOUCHER_STAT = '3' THEN
          '准备发送'
         WHEN F.VOUCHER_STAT = '9' THEN
          '接口处理失败'
       END) WHEN F.SIGNFLG = '1' THEN '签约中' WHEN F.SIGNFLG = '2' THEN '未签约' WHEN F.SIGNFLG = '3' THEN '签约失败' END) AS SIGNFLG_NAME,
       P.RETURN_MSG,
       F.SIGN_CORP AS CORP_ID,
       T.CORP_NAME AS SIGN_CORP_NAME,
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       (CASE
         WHEN P.SBSCRFLG = 0 THEN
          0
         WHEN P.SBSCRFLG = 1 AND (TO_CHAR(SYSDATE, 'YYYY-MM-DD') BETWEEN
              TO_CHAR(P.DTSTART, 'YYYY-MM-DD') AND
              TO_CHAR(P.DTEND, 'YYYY-MM-DD')) THEN
          1
         ELSE
          0
       END) AS IS_SBSCRFLG
  FROM BIS_FIN_CONTRACT F
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.CORP_CODE
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE;
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_MODY AS
SELECT E.VOUCHER_NO,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '收益率'
         WHEN P.RETURN_TYPE = '2' THEN
          '净值'
       END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       TO_CHAR(ROUND(P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
       TO_CHAR(ROUND(P.MANAGEMENTFEE, 2), '9999999999990.00') AS MANAGEMENTFEE,
       TO_CHAR(ROUND(P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
       TO_CHAR(ROUND(P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
       TO_CHAR(ROUND(P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
       P.SBSCRFLG,
       (CASE
         WHEN P.SBSCRFLG = '0' THEN
          '不可操作'
         WHEN P.SBSCRFLG = '1' THEN
          '可操作'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '不可操作'
         WHEN P.PURCHFLG = '1' THEN
          '可操作'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       TO_CHAR(ROUND(P.SBSCRMINAMT, 2), '9999999999990.00') AS SBSCRMINAMT,
       TO_CHAR(ROUND(P.SBSCRINCAMT, 2), '9999999999990.00') AS SBSCRINCAMT,
       TO_CHAR(ROUND(P.PURCHMINAMT, 2), '9999999999990.00') AS PURCHMINAMT,
       TO_CHAR(ROUND(P.PURCHINCAMT, 2), '9999999999990.00') AS PURCHINCAMT,
       TO_CHAR(ROUND(P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
       TO_CHAR(ROUND(P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       TO_CHAR(ROUND(P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE
         WHEN E.STATUS = '500' THEN
          '暂存'
         WHEN E.STATUS = '450' THEN
          '打回'
       END) AS VOUCHER_STAT_NAME,
       F.SIGNFLG,
       (CASE
         WHEN F.SIGNFLG = '0' THEN
          (CASE
         WHEN F.VOUCHER_STAT = '0' THEN
          '已签约'
         WHEN F.VOUCHER_STAT = '2' THEN
          '银行处理失败'
         WHEN F.VOUCHER_STAT = '3' THEN
          '准备发送'
         WHEN F.VOUCHER_STAT = '9' THEN
          '接口处理失败'
       END) WHEN F.SIGNFLG = '1' THEN '签约中' WHEN F.SIGNFLG = '2' THEN '未签约' WHEN F.SIGNFLG = '3' THEN '签约失败' END) AS SIGNFLG_NAME,
       P.RETURN_MSG,
       F.SIGN_CORP AS CORP_ID,
       T.CORP_NAME AS SIGN_CORP_NAME,
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
       F.ACCTID,
       E.CONTRACT_ID,
       F.SIGN_USER_ID,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
       TO_CHAR(ROUND(E.AMT, 2), '9999999999990.00') AS AMT,
       E.BIS_TYPE,
       (CASE
         WHEN E.BIS_TYPE = '01' THEN
          '认购'
         WHEN E.BIS_TYPE = '02' THEN
          '申购'
       END) AS BIS_TYPE_NAME
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
  LEFT JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.CORP_CODE
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE F.SIGNFLG = '0'
   AND TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD');
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_QUEY AS
SELECT E.VOUCHER_NO,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '收益率'
         WHEN P.RETURN_TYPE = '2' THEN
          '净值'
       END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       TO_CHAR(ROUND(P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
       TO_CHAR(ROUND(P.MANAGEMENTFEE, 2), '9999999999990.00') AS MANAGEMENTFEE,
       TO_CHAR(ROUND(P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
       TO_CHAR(ROUND(P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
       TO_CHAR(ROUND(P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
       P.SBSCRFLG,
       (CASE
         WHEN P.SBSCRFLG = '0' THEN
          '不可操作'
         WHEN P.SBSCRFLG = '1' THEN
          '可操作'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '不可操作'
         WHEN P.PURCHFLG = '1' THEN
          '可操作'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       TO_CHAR(ROUND(P.SBSCRMINAMT, 2), '9999999999990.00') AS SBSCRMINAMT,
       TO_CHAR(ROUND(P.SBSCRINCAMT, 2), '9999999999990.00') AS SBSCRINCAMT,
       TO_CHAR(ROUND(P.PURCHMINAMT, 2), '9999999999990.00') AS PURCHMINAMT,
       TO_CHAR(ROUND(P.PURCHINCAMT, 2), '9999999999990.00') AS PURCHINCAMT,
       TO_CHAR(ROUND(P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
       TO_CHAR(ROUND(P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       TO_CHAR(ROUND(P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS || ''
         WHEN S.VOUCHER_STAT IS NOT NULL THEN
          TRIM(S.VOUCHER_STAT)
       END) AS VOUCHER_STAT,
       (CASE
          WHEN S.VOUCHER_STAT IS NULL THEN
           (CASE
          WHEN E.STATUS = '550' THEN
           '审批中'
          WHEN E.STATUS = '500' THEN
           '暂存'
          WHEN E.STATUS = '450' THEN
           '打回'
          WHEN E.STATUS = '95' THEN
           '审批通过'
          WHEN E.STATUS = '250' THEN
           '删除'
          WHEN E.STATUS = '200' THEN
           '无效'
          WHEN E.STATUS = '150' THEN
           '过期'
          WHEN E.STATUS = '11' THEN
           '待审批'
        END) ELSE(CASE
         WHEN TRIM(S.VOUCHER_STAT) = '3' THEN
          '准备发送'
         WHEN TRIM(S.VOUCHER_STAT) = '9' THEN
          '接口处理失败'
         WHEN TRIM(S.VOUCHER_STAT) = '2' THEN
          '银行处理失败'
         WHEN TRIM(S.VOUCHER_STAT) = '0' THEN
          '交易成功'
       END) END) AS VOUCHER_STAT_NAME,
       (CASE
         WHEN S.VOUCHER_STAT = '2' THEN
          1
         WHEN S.VOUCHER_STAT = '9' THEN
          1
         ELSE
          0
       END) AS IS_INVAIL,
       F.SIGNFLG,
       (CASE
         WHEN F.SIGNFLG = '0' THEN
          '已签约'
         WHEN F.SIGNFLG = '1' THEN
          '签约中'
         WHEN F.SIGNFLG = '2' THEN
          '未签约'
         WHEN F.SIGNFLG = '3' THEN
          '签约失败'
       END) AS SIGNFLG_NAME,
       S.RETURN_MSG,
       T.CORP_NAME AS SIGN_CORP_NAME,
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       E.CORP_ID,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
       TO_CHAR(ROUND(E.AMT, 2), '9999999999990.00') AS AMT,
       E.BIS_TYPE,
       (CASE
         WHEN E.BIS_TYPE = '01' THEN
          '认购'
         WHEN E.BIS_TYPE = '02' THEN
          '申购'
       END) AS BIS_TYPE_NAME
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
  LEFT JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.CORP_CODE
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE <= '02';
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BACK AS
SELECT E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '钞'
         WHEN F.CASHFLAG = '1' THEN
          '汇'
       END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       TO_CHAR(ROUND(F.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
       TO_CHAR(ROUND(F.AVAILBAL, 2), '9999999999990.00') AS AVAILBAL,      
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       SUM(CASE
             WHEN E.BIS_TYPE = '01' AND S.VOUCHER_STAT = '0' THEN
              1
             WHEN E.BIS_TYPE = '02' AND S.VOUCHER_STAT = '0' THEN
              1
             ELSE
              0
           END) AS PURCHASE_COUNT,
       SUM(CASE
             WHEN E.BIS_TYPE = '05' AND S.VOUCHER_STAT = '0' THEN
              1
             ELSE
              0
           END) AS BACK_COUNT,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.CORP_CODE
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 GROUP BY E.CORP_ID,
          T.CORP_NAME,
          E.BIF_CODE,
          B.NAME,
          E.ACCTID,
          E.PRODNO,
          P.PRODNAME,
          P.TARGET,
          F.CASHFLAG,
          P.DTSTART,
          P.DTEND,
          P.CURRENCY,
          C.CUR_NAME,
          F.PRODBAL,
          F.AVAILBAL,
          P.REDMFLG,
          P.REDMMINAMT,
          P.RETURN_MSG;
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BKED AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '钞'
         WHEN F.CASHFLAG = '1' THEN
          '汇'
       END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       TO_CHAR(ROUND(F.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
       TO_CHAR(ROUND(F.AVAILBAL, 2), '9999999999990.00') AS AVAILBAL,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       E.REDM_AMT,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE
         WHEN E.STATUS = '500' THEN
          '暂存'
         WHEN E.STATUS = '450' THEN
          '打回'
       END) AS VOUCHER_STAT_NAME,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.CORP_CODE
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05';
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BKQY AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '钞'
         WHEN F.CASHFLAG = '1' THEN
          '汇'
       END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       TO_CHAR(ROUND(F.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
       TO_CHAR(ROUND(F.AVAILBAL, 2), '9999999999990.00') AS AVAILBAL,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       E.REDM_AMT,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS || ''
         ELSE
          TRIM(S.VOUCHER_STAT)
       END) AS VOUCHER_STAT,
       (CASE
          WHEN S.VOUCHER_STAT IS NULL THEN
           (CASE
          WHEN E.STATUS = '550' THEN
           '审批中'
          WHEN E.STATUS = '500' THEN
           '暂存'
          WHEN E.STATUS = '450' THEN
           '打回'
          WHEN E.STATUS = '95' THEN
           '审批通过'
          WHEN E.STATUS = '250' THEN
           '删除'
          WHEN E.STATUS = '200' THEN
           '无效'
          WHEN E.STATUS = '150' THEN
           '过期'
          WHEN E.STATUS = '11' THEN
           '待审批'
        END) ELSE(CASE
         WHEN TRIM(S.VOUCHER_STAT) = '3' THEN
          '准备发送'
         WHEN TRIM(S.VOUCHER_STAT) = '9' THEN
          '接口处理失败'
         WHEN TRIM(S.VOUCHER_STAT) = '2' THEN
          '银行处理失败'
         WHEN TRIM(S.VOUCHER_STAT) = '0' THEN
          '交易成功'
       END) END) AS VOUCHER_STAT_NAME,
       (CASE
         WHEN S.VOUCHER_STAT = '2' THEN
          1
         WHEN S.VOUCHER_STAT = '9' THEN
          1
         ELSE
          0
       END) AS IS_INVAIL,
       TO_CHAR(ROUND(P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
       S.RETURN_MSG
  FROM BIS_FIN_BUY E
  JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.CORP_CODE
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05';
CREATE OR REPLACE VIEW V_BIS_FIN_STATES_QUERY AS
SELECT F.CONTRACT_ID,
       F.SIGN_CORP AS CORP_ID,
       T.CORP_NAME AS SIGN_CORP_NAME,
       P.PRODNO,
       F.BIF_CODE,
       P.PRODNAME,
       F.ACCTID,
       P.TARGET,
       F.SIGNFLG,
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
       (CASE
         WHEN F.SIGNFLG = 0 THEN
          '已签约'
         WHEN F.SIGNFLG = 1 THEN
          '签约中'
         WHEN F.SIGNFLG = 2 THEN
          '未签约'
         WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 2 THEN
          '银行处理失败'
         WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 9 THEN
          '接口处理失败'
       END) AS SIGNFLG_NAME,
       (CASE
         WHEN F.SIGNFLG = 0 THEN
          0
         WHEN F.SIGNFLG = 1 THEN
          0
         WHEN F.SIGNFLG = 2 THEN
          0
         WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 2 THEN
          0
         WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 9 AND
              TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD') =
              TO_CHAR(SYSDATE, 'YYYY-MM-DD') THEN
          1
         ELSE
          0
       END) AS IS_RESET,
       F.VOUCHER_STAT,
       (CASE
         WHEN F.VOUCHER_STAT = 0 THEN
          '签约成功'
         WHEN F.VOUCHER_STAT = 2 THEN
          '银行处理失败'
         WHEN F.VOUCHER_STAT = 3 THEN
          '准备发送'
         WHEN F.VOUCHER_STAT = 9 THEN
          '接口处理失败'
       END) AS VOUCHER_STAT_NAME,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.CORP_CODE;
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_MONY AS
SELECT DISTINCT C.CORP_ID,
                T.CORP_NAME,
                D.PRODNO,
                D.SHORT_NAME,
                D.BIF_CODE,
                F.NAME AS BIF_NAME,
                C.ACCTID,
                TO_CHAR(ROUND(D.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
                TO_CHAR(ROUND(D.DEALSHARES, 2), '9999999999990.00') AS DEALSHARES,
                D.CASHFLAG,
                (CASE
                  WHEN D.CASHFLAG = '0' THEN
                   '钞'
                  WHEN D.CASHFLAG = '1' THEN
                   '汇'
                END) AS CASH_NAME,
                TO_CHAR(ROUND(D.AVAILBAL, 2), '9999999999990.00') AS AVAILBAL,
                D.RETURN_MSG
  FROM BIS_FIN_BAL D
  LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
  LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
  LEFT JOIN BT_CORP T ON C.CORP_ID = T.CORP_CODE;
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_QYHI AS
SELECT SERIAL_ID,
       CORP_ID,
       CORP_NAME,
       PRODNO,
       SHORTNAME,
       BIF_CODE,
       BIF_NAME,
       ACCTID,
       TRNCODE,
       TRNSTATUS,
       TO_CHAR(ROUND(APPLYAMT, 2), '9999999999990.00') AS APPLYAMT,
       TO_CHAR(ROUND(SHAREAPPLY, 2), '9999999999990.00') AS SHAREAPPLY,
       CASHFLAG,
       CASHFLAG_NAME,
       TO_CHAR(ROUND(DEALAMT, 2), '9999999999990.00') AS DEALAMT,
       TO_CHAR(ROUND(DEALSHARES, 2), '9999999999990.00') AS DEALSHARES,
       TRANS_TIME,
       RETURN_MSG,
       BROKER
  FROM (SELECT DISTINCT D.SERIAL_ID,
               C.CORP_ID,
               T.CORP_NAME,
               D.PRODNO,
               D.SHORTNAME,
               D.BIF_CODE,
               F.NAME AS BIF_NAME,
               D.ACCTID,
               D.TRNCODE,
               D.TRNSTATUS,
               D.APPLYAMT,
               D.SHAREAPPLY,
               D.CASHFLAG,
               (CASE
                 WHEN D.CASHFLAG = '0' THEN
                  '钞'
                 WHEN D.CASHFLAG = '1' THEN
                  '汇'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_DTL D
          LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE
          LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
          LEFT JOIN BT_CORP T ON C.CORP_ID = T.CORP_CODE
         WHERE D.TRANS_TYPE = '0'
        UNION ALL
        SELECT DISTINCT D.SERIAL_ID,
               C.CORP_ID,
               T.CORP_NAME,
               D.PRODNO,
               D.SHORTNAME,
               D.BIF_CODE,
               F.NAME AS BIF_NAME,
               D.ACCTID,
               D.TRNCODE,
               D.TRNSTATUS,
               D.APPLYAMT,
               D.SHAREAPPLY,
               D.CASHFLAG,
               (CASE
                 WHEN D.CASHFLAG = '0' THEN
                  '钞'
                 WHEN D.CASHFLAG = '1' THEN
                  '汇'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_HIS_DTL D
          LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE
          LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
          LEFT JOIN BT_CORP T ON C.CORP_ID = T.CORP_CODE
         WHERE D.TRANS_TYPE = '0');