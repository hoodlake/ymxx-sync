--修改日期:2012-08-29
--修改人:叶爱军
--修改内容:新增理财新产品表,增加理财产品菜单
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买', 'cho', 0, '', '0', '1', '0', '0', 7, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买', 'cho', RES_CODE, '', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品销售'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品同步查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'+char(38)+'methodTarget=Sign', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买申请', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'+char(38)+'methodTarget=Purchase', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买申请修改', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'+char(38)+'methodTarget=Modify', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品购买结果查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'+char(38)+'methodTarget=Query', '0', '0', '0', '0', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品购买'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品赎回', 'cho', RES_CODE, '', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品销售'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '赎回申请', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'+char(38)+'methodTarget=Back', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品赎回'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '赎回申请修改', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'+char(38)+'methodTarget=Modify', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品赎回'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '赎回申请结果查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'+char(38)+'methodTarget=Query', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品赎回'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品查询', 'cho', RES_CODE, '', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品销售'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财产品签约状态查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'+char(38)+'methodTarget=State', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品查询'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财资产余额查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=queryMoneyProduct'+char(38)+'methodTarget=Money', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品查询'
GO
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '理财资产交易明细查询', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=queryDetailProduct'+char(38)+'methodTarget=Query', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '理财产品查询'
GO


--修改内容：增加理财产品购买申请
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('bankacc_fin', 'cho', '理财产品购买申请', 'A,B,C', 'BIS_FIN_BUY', '', '', '', 'nextchecker', 'VOUCHER_NO', '../chowmatistic/bisFinProductPurchase.jsp', 'com.byttersoft.chowmatistic.form.BisFinProductExcForm')
GO
--修改内容：增加理财产品赎回申请
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('bankacc_bac', 'cho', '理财产品赎回申请', 'A,B,C', 'BIS_FIN_BUY', '', '', '', 'nextchecker', 'VOUCHER_NO', '../chowmatistic/bisFinProductReturn.jsp', 'com.byttersoft.chowmatistic.form.BisFinProductBackForm')
GO


/*==============================================================*/
/* Table: BIS_FIN_BAL                                           */
/*==============================================================*/
create table BIS_FIN_BAL (
   PRODNO               VARCHAR(30)         not null,
   SHORT_NAME           VARCHAR(140)        null,
   PRODBAL              NUMERIC(15,2)         null,
   DEALSHARES           NUMERIC(15,2)         null,
   AVAILBAL             NUMERIC(15,2)         null,
   CASHFLAG             CHAR(1)              null,
   BIF_CODE             CHAR(4)              null,
   QUERY_TIME           DATETIME                 null,
   VOUCHER_STAT         CHAR(1)              null,
   LAST_TIME            DATETIME                 null,
   RETURN_CODE          VARCHAR(30)         null,
   RETURN_MSG           VARCHAR(150)        null,
   constraint PK_BIS_FIN_BAL primary key nonclustered (PRODNO)
)
GO

/*==============================================================*/
/* Table: BIS_FIN_BUY                                           */
/*==============================================================*/
create table BIS_FIN_BUY (
   VOUCHER_NO           NUMERIC(10)           not null,
   BIS_TYPE             CHAR(2)              null,
   PRODNO               VARCHAR(60)         null,
   MOBILE               VARCHAR(30)         null,
   PHONE                VARCHAR(30)         null,
   ZIP                  VARCHAR(30)         null,
   ADDR                 VARCHAR(100)        null,
   EMAIL                VARCHAR(30)         null,
   BIF_CODE             CHAR(4)              null,
   ACCTID               VARCHAR(60)         null,
   AMT                  NUMERIC(15,2)         null,
   REDM_AMT             NUMERIC(15,2)         null,
   TRANS_TIME           DATETIME                 null,
   CONTRACT_ID          NUMERIC(28)           null,
   BFE_MEMO             VARCHAR(2000)       null,
   OPER_USER_ID         VARCHAR(8)          null,
   STATUS               NUMERIC(38)           null,
   APPROVES             VARCHAR(150)        null,
   NEXTCHECKER          VARCHAR(150)        null,
   CORP_ID              VARCHAR(150)        null,
   MONEY                VARCHAR(150)        null,
   constraint PK_BIS_FIN_BUY primary key nonclustered (VOUCHER_NO)
)
GO
/*==============================================================*/
/* Table: BIS_FIN_CONTRACT                                      */
/*==============================================================*/
create table BIS_FIN_CONTRACT (
   CONTRACT_ID          VARCHAR(28)         not null,
   PRODNO               VARCHAR(30)         null,
   ACCTID               VARCHAR(60)         null,
   SIGNFLG              CHAR(1)              null,
   AGRM                 CHAR(1)              null,
   TRANS_TYPE           char(2)              null,
   QUERY_TYPE           char(1)              null,
   BIF_CODE             char(4)              null,
   RETURN_TIME          DATETIME                 null,
   VOUCHER_STAT         CHAR(1)              null,
   REQ_DATE             DATETIME                 null,
   RETURN_MSG           VARCHAR(150)        null,
   SIGN_CORP            CHAR(4)              null,
   SIGN_TIME            DATETIME                 null,
   SIGN_USER_ID         VARCHAR(8)          null,
   constraint PK_BIS_FIN_CONTRACT primary key nonclustered (CONTRACT_ID)
)
GO
/*==============================================================*/
/* Table: BIS_FIN_DTL                                           */
/*==============================================================*/
create table BIS_FIN_DTL (
   SERIAL_ID            VARCHAR(32)         not null,
   PRODNO               VARCHAR(30)         null,
   SHORTNAME            VARCHAR(140)        null,
   APPLYAMT             NUMERIC(15,2)         null,
   SHAREAPPLY           NUMERIC(15,2)         null,
   CASHFLAG             CHAR(1)              null,
   DEALAMT              NUMERIC(15,2)         null,
   BANK_SERIAL_ID       VARCHAR(30)         null,
   BIF_CODE             CHAR(4)              null,
   DEALSHARES           NUMERIC(15,2)         null,
   TRNSTATUS            CHAR(1)              null,
   ACCEPTNO             VARCHAR(40)         null,
   TRNCODE              VARCHAR(40)         null,
   TRANS_TIME           DATETIME                 null,
   REC_TIME             DATETIME                 null,
   ACCTID               VARCHAR(60)         null,
   CUR                  CHAR(2)              null,
   BUSN_NAME            VARCHAR(60)         null,
   BROKER               VARCHAR(30)         null,
   TRANS_TYPE           VARCHAR(2)          null,
   RETURN_MSG           VARCHAR(150)        null,
   constraint PK_BIS_FIN_DTL primary key nonclustered (SERIAL_ID)
)
GO
/*==============================================================*/
/* Table: BIS_FIN_EXC                                           */
/*==============================================================*/
create table BIS_FIN_EXC (
   VOUCHER_NO           VARCHAR(28)         not null,
   ACCTID               VARCHAR(60)         null,
   PRODNO               VARCHAR(60)         null,
   BIS_TYPE             CHAR(2)              null,
   MOBILE               VARCHAR(30)         null,
   PHONE                VARCHAR(30)         null,
   ZIP                  VARCHAR(30)         null,
   ADDR                 VARCHAR(100)        null,
   EMAIL                VARCHAR(30)         null,
   ACCEPTNO             VARCHAR(30)         null,
   AMT                  NUMERIC(15,2)         null,
   REDM_AMT             NUMERIC(15,2)         null,
   BIF_CODE             CHAR(4)              null,
   RETURN_TIME          DATETIME                 null,
   REQ_DATE             DATETIME                 null,
   VOUCHER_STAT         CHAR(1)              null,
   TRANS_TIME           DATETIME                 null,
   PWD                  VARCHAR(32)         null,
   THIRD_ID             NUMERIC(10)           null,
   RETURN_MSG           VARCHAR(150)        null,
   constraint PK_BIS_FIN_EXC primary key nonclustered (VOUCHER_NO)
)
GO
/*==============================================================*/
/* Table: BIS_FIN_HIS_DTL                                       */
/*==============================================================*/
create table BIS_FIN_HIS_DTL (
   SERIAL_ID            VARCHAR(32)         not null,
   PRODNO               VARCHAR(30)         null,
   SHORTNAME            VARCHAR(140)        null,
   APPLYAMT             NUMERIC(15,2)         null,
   SHAREAPPLY           NUMERIC(15,2)         null,
   CASHFLAG             CHAR(1)              null,
   DEALAMT              NUMERIC(15,2)         null,
   BANK_SERIAL_ID       VARCHAR(30)         null,
   BIF_CODE             CHAR(4)              null,
   DEALSHARES           NUMERIC(15,2)         null,
   TRNSTATUS            CHAR(1)              null,
   ACCEPTNO             VARCHAR(40)         null,
   TRNCODE              VARCHAR(40)         null,
   TRANS_TIME           DATETIME                 null,
   REC_TIME             DATETIME                 null,
   ACCTID               VARCHAR(60)         null,
   CUR                  CHAR(2)              null,
   BUSN_NAME            VARCHAR(60)         null,
   BROKER               VARCHAR(30)         null,
   TRANS_TYPE           VARCHAR(2)          null,
   RETURN_MSG           VARCHAR(150)        null,
   constraint PK_BIS_FIN_HIS_DTL primary key nonclustered (SERIAL_ID)
)
GO
/*==============================================================*/
/* Table: BIS_FIN_OPER_LOG                                      */
/*==============================================================*/
create table BIS_FIN_OPER_LOG (
   BL_ID                NUMERIC(10)           not null,
   BL_TIME              DATETIME                 null,
   BL_NO                VARCHAR(50)         null,
   BL_CODE              VARCHAR(50)         null,
   BL_NAME              VARCHAR(50)         null,
   BL_TYPE              VARCHAR(10)         null,
   BL_MEMO              VARCHAR(500)        null,
   BL_MODULE            VARCHAR(50)         null,
   constraint PK_BIS_FIN_OPER_LOG primary key nonclustered (BL_ID)
)
GO
/*==============================================================*/
/* Table: BIS_FIN_PRODUCT_INFO                                  */
/*==============================================================*/
create table BIS_FIN_PRODUCT_INFO (
   PRODNO               VARCHAR(30)         not null,
   BIF_CODE             CHAR(4)              not null,
   PRODNAME             VARCHAR(60)         null,
   CURRENCY             CHAR(2)              null,
   TARGET               CHAR(1)              null,
   RETURN_TYPE          CHAR(1)              null,
   DTSTART              DATETIME                 null,
   DTEND                DATETIME                 null,
   INTRSTEDTSTART       DATETIME                 null,
   EXPIREDATE           DATETIME                 null,
   DTEXCHANGE           DATETIME                 null,
   REFVALUE             NUMERIC(15,4)         null,
   MANAGEMENTFEE        NUMERIC(15,2)         null,
   SBSCRFEE             NUMERIC(15,4)         null,
   PURCHFEE             NUMERIC(15,4)         null,
   REDMFEE              NUMERIC(15,4)         null,
   SBSCRFLG             CHAR(1)              null,
   PURCHFLG             CHAR(1)              null,
   REDMFLG              CHAR(1)              null,
   SBSCRMINAMT          NUMERIC(18,2)         null,
   SBSCRINCAMT          NUMERIC(18,2)         null,
   PURCHMINAMT          NUMERIC(18,2)         null,
   PURCHINCAMT          NUMERIC(18,2)         null,
   HOLDMINAMT           NUMERIC(18,2)         null,
   HOLDMAXAMT           NUMERIC(18,2)         null,
   REDMMINAMT           NUMERIC(18,2)         null,
   REDMINCAMT           NUMERIC(18,2)         null,
   AGREEMCONTENT        TEXT                 null,
   VOUCHER_STAT         CHAR(1)              null,
   RETURN_TIME          DATETIME                 null,
   RETURN_MSG           VARCHAR(150)        null,
   constraint PK_BIS_FIN_PRODUCT_INFO primary key nonclustered (PRODNO, BIF_CODE)
)
GO
CREATE VIEW V_BIS_FIN_PRODUCT_INFO AS
SELECT P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
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
       (CASE WHEN P.RETURN_TYPE=1 THEN '收益率' ELSE '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
       P.AGREEMCONTENT,
       CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       P.VOUCHER_STAT,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE NOT EXISTS (SELECT I.PRODNO
          FROM BIS_FIN_PRODUCT_INFO I
         WHERE I.PRODNO = P.PRODNO
           AND I.SBSCRFLG = '0'
           AND I.PURCHFLG = '0')
GO
CREATE VIEW V_BIS_FIN_PRODUCT_SIGN AS
SELECT F.CONTRACT_ID,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET=1 THEN
	         '个人'
             WHEN P.TARGET=2 THEN
			 '公司'
			 WHEN P.TARGET=3 THEN
			 '全部'
			 WHEN P.TARGET=4 THEN
			 '同业'
	    END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE WHEN P.RETURN_TYPE=1 THEN '收益率'
	         ELSE '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
       CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       F.VOUCHER_STAT,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN
             (CASE WHEN F.VOUCHER_STAT = '0' THEN
                   '已签约'
                   WHEN F.VOUCHER_STAT = '2' THEN
                   '银行处理失败'
                   WHEN F.VOUCHER_STAT = '3' THEN
                   '准备发送'
                   WHEN F.VOUCHER_STAT = '9' THEN
                   '接口处理失败'
              END)
       WHEN F.SIGNFLG = '1' THEN
       '签约中'
       WHEN F.SIGNFLG = '2' THEN
       '未签约'
       WHEN F.SIGNFLG = '3' THEN
       '签约失败'
       END) AS SIGNFLG_NAME,
       P.RETURN_MSG,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       (CASE
         WHEN P.SBSCRFLG = 0 THEN
          0
         WHEN P.SBSCRFLG = 1 AND ( CONVERT(CHAR(10),getdate(), 120) BETWEEN
               CONVERT(CHAR(10),P.DTSTART, 120) and
               CONVERT(CHAR(10),P.DTEND, 120)) THEN
          1
         ELSE
          0
       END) AS IS_SBSCRFLG
  FROM BIS_FIN_CONTRACT F
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
GO
CREATE VIEW V_BIS_FIN_PRODUCT_MODY AS
SELECT E.VOUCHER_NO,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
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
       (CASE WHEN P.RETURN_TYPE = '1' THEN '收益率' WHEN P.RETURN_TYPE = '2' THEN '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
       CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE WHEN E.STATUS = '500' THEN '暂存' WHEN E.STATUS = '450' THEN '打回' END) AS VOUCHER_STAT_NAME,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN
             (CASE WHEN F.VOUCHER_STAT = '0' THEN
                   '已签约'
                   WHEN F.VOUCHER_STAT = '2' THEN
                   '银行处理失败'
                   WHEN F.VOUCHER_STAT = '3' THEN
                   '准备发送'
                   WHEN F.VOUCHER_STAT = '9' THEN
                   '接口处理失败'
              END)
       WHEN F.SIGNFLG = '1' THEN
       '签约中'
       WHEN F.SIGNFLG = '2' THEN
       '未签约'
       WHEN F.SIGNFLG = '3' THEN
       '签约失败'
       END) AS SIGNFLG_NAME,
       P.RETURN_MSG,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
        CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       F.ACCTID,
       E.CONTRACT_ID,
       F.SIGN_USER_ID,
        CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       E.AMT,
       E.BIS_TYPE,
       (CASE WHEN E.BIS_TYPE = '01' THEN '认购' WHEN E.BIS_TYPE = '02' THEN '申购' END) AS BIS_TYPE_NAME
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
  LEFT JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE F.SIGNFLG = '0'
   AND  CONVERT(CHAR(10),F.SIGN_TIME, 120) =  CONVERT(CHAR(10),getdate(), 120)
GO
CREATE VIEW V_BIS_FIN_PRODUCT_QUEY AS
SELECT E.VOUCHER_NO,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
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
       (CASE WHEN P.RETURN_TYPE = '1' THEN '收益率' WHEN P.RETURN_TYPE = '2' THEN '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
        CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS + ''
         WHEN S.VOUCHER_STAT IS NOT NULL THEN
          RTRIM(LTRIM(S.VOUCHER_STAT))
       END) AS VOUCHER_STAT,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          (CASE WHEN E.STATUS = '550' THEN
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
            END)
         ELSE
          (CASE WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '3' THEN
                 '准备发送'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '9' THEN
                 '接口处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '2' THEN
                 '银行处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '0' THEN
                 '交易成功'
           END)
       END) AS VOUCHER_STAT_NAME,
       (CASE
          WHEN S.VOUCHER_STAT = '2' THEN
           1
          WHEN S.VOUCHER_STAT = '9' THEN
           1
          ELSE
           0
        END) AS IS_INVAIL,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN '已签约' WHEN F.SIGNFLG = '1' THEN '签约中' WHEN F.SIGNFLG = '2' THEN '未签约' WHEN F.SIGNFLG = '3' THEN '签约失败' END) AS SIGNFLG_NAME,
       S.RETURN_MSG,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       E.CORP_ID,
       CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       E.AMT,
       E.BIS_TYPE,
       (CASE WHEN E.BIS_TYPE = '01' THEN '认购' WHEN E.BIS_TYPE = '02' THEN '申购' END) AS BIS_TYPE_NAME
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
  LEFT JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE <= '02'
GO
CREATE VIEW V_BIS_FIN_PRODUCT_BACK AS
SELECT E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE WHEN F.CASHFLAG = '0' THEN '钞' WHEN F.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       F.PRODBAL,
       F.AVAILBAL,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       SUM(CASE WHEN E.BIS_TYPE = '01' AND S.VOUCHER_STAT = '0' THEN 1 WHEN E.BIS_TYPE = '02' AND S.VOUCHER_STAT = '0' THEN 1 ELSE 0 END) AS PURCHASE_COUNT,
       SUM(CASE WHEN E.BIS_TYPE = '05' AND S.VOUCHER_STAT = '0' THEN 1 ELSE 0 END) AS BACK_COUNT,
       P.REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
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
           p.RETURN_MSG
GO
CREATE VIEW V_BIS_FIN_PRODUCT_BKED AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE WHEN F.CASHFLAG = '0' THEN '钞' WHEN F.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       F.PRODBAL,
       F.AVAILBAL,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       E.REDM_AMT,
       CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE WHEN E.STATUS = '500' THEN '暂存' WHEN E.STATUS = '450' THEN '打回' END) AS VOUCHER_STAT_NAME,
       P.REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
  WHERE E.BIS_TYPE = '05'
GO
CREATE VIEW V_BIS_FIN_PRODUCT_BKQY AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE WHEN F.CASHFLAG = '0' THEN '钞' WHEN F.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       F.PRODBAL,
       F.AVAILBAL,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       E.REDM_AMT,
        CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS + ''
         ELSE
          S.VOUCHER_STAT
       END) AS VOUCHER_STAT,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          (CASE WHEN E.STATUS = '550' THEN
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
            END)
         ELSE
          (CASE WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '3' THEN
                 '准备发送'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '9' THEN
                 '接口处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '2' THEN
                 '银行处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '0' THEN
                 '交易成功'
           END)
       END) AS VOUCHER_STAT_NAME,
       (CASE
          WHEN S.VOUCHER_STAT = '2' THEN
           1
          WHEN S.VOUCHER_STAT = '9' THEN
           1
          ELSE
           0
        END) AS IS_INVAIL,
       P.REDMMINAMT,
       S.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05'
GO
CREATE VIEW V_BIS_FIN_STATES_QUERY AS
SELECT F.CONTRACT_ID,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       P.PRODNO,
       F.BIF_CODE,
       P.PRODNAME,
       F.ACCTID,
       P.TARGET,
       F.SIGNFLG,
        CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       (CASE
         WHEN F.SIGNFLG = 0 THEN
          '已签约'
         WHEN F.SIGNFLG = 1 THEN
          '签约中'
         WHEN F.SIGNFLG = 2 THEN
          '未签约'
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 2 THEN
          '银行处理失败'
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 9 THEN
          '接口处理失败'
       END) AS SIGNFLG_NAME,
       (CASE
         WHEN F.SIGNFLG = 0 THEN
          0
         WHEN F.SIGNFLG = 1 THEN
          0
         WHEN F.SIGNFLG = 2 THEN
          0
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 2 THEN
          0
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 9 AND  CONVERT(CHAR(10),F.SIGN_TIME, 120) =  CONVERT(CHAR(10),getdate(),120) THEN
          1
         ELSE
          0
       END) AS IS_RESET,
       F.VOUCHER_STAT,
       (CASE WHEN F.VOUCHER_STAT = 0 THEN
             '签约成功'
             WHEN F.VOUCHER_STAT = 2 THEN
             '银行处理失败'
             WHEN F.VOUCHER_STAT = 3 THEN
             '准备发送'
             WHEN F.VOUCHER_STAT = 9 THEN
             '接口处理失败'
             END
       ) AS VOUCHER_STAT_NAME,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
GO
CREATE VIEW V_BIS_FIN_PRODUCT_MONY AS
SELECT DISTINCT C.CORP_ID,
       T.CORP_NAME,
       D.PRODNO,
       D.SHORT_NAME,
       D.BIF_CODE,
       F.NAME AS BIF_NAME,
       C.ACCTID,
       D.PRODBAL,
       D.DEALSHARES,
       D.CASHFLAG,
       (CASE WHEN D.CASHFLAG = '0' THEN '钞' WHEN D.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       D.AVAILBAL,
       --C.BIS_TYPE,
       --DECODE(C.BIS_TYPE, '01', '认购', '02', '申购', '05', '赎回') AS BIS_TYPE_NAME,
       D.RETURN_MSG
  FROM BIS_FIN_BAL D
  LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
  LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
  LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID
GO
CREATE VIEW V_BIS_FIN_PRODUCT_QYHI AS
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
       CONVERT(MONEY, ROUND(APPLYAMT, 2), 120) AS APPLYAMT,
       CONVERT(MONEY, ROUND(SHAREAPPLY, 2), 120) AS SHAREAPPLY,
       CASHFLAG,
       CASHFLAG_NAME,
       CONVERT(MONEY, ROUND(DEALAMT, 2), 120) AS DEALAMT,
       CONVERT(MONEY, ROUND(DEALSHARES, 2), 120) AS DEALSHARES,
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
         WHERE D.TRANS_TYPE = '0') AS B
GO