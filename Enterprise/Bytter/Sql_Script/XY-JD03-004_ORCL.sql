--�޸�����:2012-08-29
--�޸���:Ҷ����
--�޸�����:��������²�Ʒ��,������Ʋ�Ʒ�˵�
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
VALUES ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ����', 'cho', 0, '', '0', '1', '0', '0', 7, '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1);

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ����', 'cho', RES_CODE, '', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒͬ����ѯ', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Sign', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ��������', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Purchase', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ���������޸�', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Modify', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ��������ѯ', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=Query', '0', '0', '0', '0', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ���', 'cho', RES_CODE, '', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '�������', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'||chr(38)||'methodTarget=Back', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ���';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��������޸�', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'||chr(38)||'methodTarget=Modify', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ���';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '�����������ѯ', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=bisFinBack'||chr(38)||'methodTarget=Query', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ���';
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�Ʒ��ѯ', 'cho', RES_CODE, '', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ����';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��Ʋ�ƷǩԼ״̬��ѯ', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=synBisFinProduct'||chr(38)||'methodTarget=State', '0', '0', '0', '0', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ��ѯ';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '����ʲ�����ѯ', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=queryMoneyProduct'||chr(38)||'methodTarget=Money', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ��ѯ';

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '����ʲ�������ϸ��ѯ', 'cho', RES_CODE, '/chowmatistic/bisFinProduct.jsp?url=queryDetailProduct'||chr(38)||'methodTarget=Query', '0', '0', '0', '0', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES WHERE RES_NAME = '��Ʋ�Ʒ��ѯ';
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
COMMIT;


--�޸����ݣ�������Ʋ�Ʒ��������
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('bankacc_fin', 'cho', '��Ʋ�Ʒ��������', 'A,B,C', 'BIS_FIN_BUY', '', '', '', 'nextchecker', 'VOUCHER_NO', '../chowmatistic/bisFinProductPurchase.jsp', 'com.byttersoft.chowmatistic.form.BisFinProductExcForm');

--�޸����ݣ�������Ʋ�Ʒ�������
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('bankacc_bac', 'cho', '��Ʋ�Ʒ�������', 'A,B,C', 'BIS_FIN_BUY', '', '', '', 'nextchecker', 'VOUCHER_NO', '../chowmatistic/bisFinProductReturn.jsp', 'com.byttersoft.chowmatistic.form.BisFinProductBackForm');
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
'��Ʋ�Ʒ����ѯ';

comment on column BIS_FIN_BAL.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_BAL.SHORT_NAME is
'��Ʒ���';

comment on column BIS_FIN_BAL.PRODBAL is
'��Ʒ���';

comment on column BIS_FIN_BAL.DEALSHARES is
'��Ʒ�ݶ�';

comment on column BIS_FIN_BAL.AVAILBAL is
'���÷ݶ�';

comment on column BIS_FIN_BAL.CASHFLAG is
'�����ʶ 0 ��1 ��';

comment on column BIS_FIN_BAL.BIF_CODE is
'�������';

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
'��Ʒ����/���';

comment on column BIS_FIN_BUY.VOUCHER_NO is
'����ID';

comment on column BIS_FIN_BUY.BIS_TYPE is
'�������� 01:�Ϲ�,02:�깺,05:���';

comment on column BIS_FIN_BUY.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_BUY.MOBILE is
'�ֻ�����';

comment on column BIS_FIN_BUY.PHONE is
'�绰����';

comment on column BIS_FIN_BUY.ZIP is
'��������';

comment on column BIS_FIN_BUY.ADDR is
'��ַ';

comment on column BIS_FIN_BUY.EMAIL is
'�ʱ�';

comment on column BIS_FIN_BUY.BIF_CODE is
'���б���';

comment on column BIS_FIN_BUY.ACCTID is
'�˻�';

comment on column BIS_FIN_BUY.AMT is
'���׽��';

comment on column BIS_FIN_BUY.REDM_AMT is
'��طݶ�';

comment on column BIS_FIN_BUY.TRANS_TIME is
'����ʱ��';

comment on column BIS_FIN_BUY.CONTRACT_ID is
'ǩԼID';

comment on column BIS_FIN_BUY.BFE_MEMO is
'��ע';

comment on column BIS_FIN_BUY.OPER_USER_ID is
'������';

comment on column BIS_FIN_BUY.STATUS is
'״̬';

comment on column BIS_FIN_BUY.APPROVES is
'������';

comment on column BIS_FIN_BUY.NEXTCHECKER is
'��һ������';

comment on column BIS_FIN_BUY.CORP_ID is
'��λID';

comment on column BIS_FIN_BUY.MONEY is
'���';

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
'��Ʋ�ƷǩԼ��Լ��';

comment on column BIS_FIN_CONTRACT.CONTRACT_ID is
'����ID';

comment on column BIS_FIN_CONTRACT.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_CONTRACT.ACCTID is
'�˻�����';

comment on column BIS_FIN_CONTRACT.SIGNFLG is
'0-ǩԼ 1-��Լ';

comment on column BIS_FIN_CONTRACT.AGRM is
'Э������';

comment on column BIS_FIN_CONTRACT.TRANS_TYPE is
'��������(01:��Ʋ�Ʒ,02:���������)';

comment on column BIS_FIN_CONTRACT.QUERY_TYPE is
'��ѯ����(0:��ͨ���,1:������ȯ)';

comment on column BIS_FIN_CONTRACT.BIF_CODE is
'�������';

comment on column BIS_FIN_CONTRACT.VOUCHER_STAT is
'״̬';

comment on column BIS_FIN_CONTRACT.REQ_DATE is
'����ʱ��';

comment on column BIS_FIN_CONTRACT.SIGN_CORP is
'ǩԼ����';

comment on column BIS_FIN_CONTRACT.SIGN_TIME is
'ǩԼʱ��';

comment on column BIS_FIN_CONTRACT.SIGN_USER_ID is
'ǩԼ��ID';

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
'��Ʋ�Ʒ��ʷ��¼';

comment on column BIS_FIN_DTL.SERIAL_ID is
'����ID';

comment on column BIS_FIN_DTL.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_DTL.SHORTNAME is
'��Ʒ���';

comment on column BIS_FIN_DTL.APPLYAMT is
'������';

comment on column BIS_FIN_DTL.SHAREAPPLY is
'����ݶ�';

comment on column BIS_FIN_DTL.CASHFLAG is
'�����ʶ 0 ��1 ��';

comment on column BIS_FIN_DTL.DEALAMT is
'�ɽ����';

comment on column BIS_FIN_DTL.BIF_CODE is
'�������';

comment on column BIS_FIN_DTL.DEALSHARES is
'�ɽ��ݶ�';

comment on column BIS_FIN_DTL.TRNSTATUS is
'���״���״̬';

comment on column BIS_FIN_DTL.ACCEPTNO is
'ҵ��������';

comment on column BIS_FIN_DTL.TRNCODE is
'���״���';

comment on column BIS_FIN_DTL.TRANS_TIME is
'��������';

comment on column BIS_FIN_DTL.ACCTID is
'�˻�����';

comment on column BIS_FIN_DTL.CUR is
'�ұ�';

comment on column BIS_FIN_DTL.BUSN_NAME is
'ҵ������';

comment on column BIS_FIN_DTL.BROKER is
'ȯ������';

comment on column BIS_FIN_DTL.TRANS_TYPE is
'��������(0:��Ʋ�Ʒ,1:���������)';

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
'��Ʋ�Ʒ������';

comment on column BIS_FIN_EXC.VOUCHER_NO is
'Ʊ�ݺ�';

comment on column BIS_FIN_EXC.ACCTID is
'�˻�����';

comment on column BIS_FIN_EXC.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_EXC.BIS_TYPE is
'�������� 01:�Ϲ�,02:�깺,03:��������,05:���,06:�������,07:��ת֤��08:֤ת��';

comment on column BIS_FIN_EXC.MOBILE is
'�ֻ�����';

comment on column BIS_FIN_EXC.PHONE is
'�绰����';

comment on column BIS_FIN_EXC.ZIP is
'��������';

comment on column BIS_FIN_EXC.ADDR is
'��ַ';

comment on column BIS_FIN_EXC.EMAIL is
'��������';

comment on column BIS_FIN_EXC.ACCEPTNO is
'ҵ��������';

comment on column BIS_FIN_EXC.AMT is
'���׽��';

comment on column BIS_FIN_EXC.REDM_AMT is
'��طݶ�';

comment on column BIS_FIN_EXC.BIF_CODE is
'�������';

comment on column BIS_FIN_EXC.RETURN_TIME is
'����ʱ��';

comment on column BIS_FIN_EXC.REQ_DATE is
'����ʱ��';

comment on column BIS_FIN_EXC.VOUCHER_STAT is
'״̬';

comment on column BIS_FIN_EXC.TRANS_TIME is
'����ʱ��';

comment on column BIS_FIN_EXC.PWD is
'̨������';

comment on column BIS_FIN_EXC.THIRD_ID is
'����ID';

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
'��Ʋ�Ʒ��ʷ��¼';

comment on column BIS_FIN_HIS_DTL.SERIAL_ID is
'����ID';

comment on column BIS_FIN_HIS_DTL.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_HIS_DTL.SHORTNAME is
'��Ʒ���';

comment on column BIS_FIN_HIS_DTL.APPLYAMT is
'������';

comment on column BIS_FIN_HIS_DTL.SHAREAPPLY is
'����ݶ�';

comment on column BIS_FIN_HIS_DTL.CASHFLAG is
'�����ʶ 0 ��1 ��';

comment on column BIS_FIN_HIS_DTL.DEALAMT is
'�ɽ����';

comment on column BIS_FIN_HIS_DTL.BIF_CODE is
'�������';

comment on column BIS_FIN_HIS_DTL.DEALSHARES is
'�ɽ��ݶ�';

comment on column BIS_FIN_HIS_DTL.TRNSTATUS is
'���״���״̬';

comment on column BIS_FIN_HIS_DTL.ACCEPTNO is
'ҵ��������';

comment on column BIS_FIN_HIS_DTL.TRNCODE is
'���״���';

comment on column BIS_FIN_HIS_DTL.TRANS_TIME is
'��������';

comment on column BIS_FIN_HIS_DTL.ACCTID is
'�˻�����';

comment on column BIS_FIN_HIS_DTL.CUR is
'�ұ�';

comment on column BIS_FIN_HIS_DTL.BUSN_NAME is
'ҵ������';

comment on column BIS_FIN_HIS_DTL.BROKER is
'ȯ������';

comment on column BIS_FIN_HIS_DTL.TRANS_TYPE is
'��������(0:��Ʋ�Ʒ,1:���������)';

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
'��Ʋ�Ʒ������־';

comment on column BIS_FIN_OPER_LOG.BL_ID is
'����';

comment on column BIS_FIN_OPER_LOG.BL_TIME is
'����ʱ��';

comment on column BIS_FIN_OPER_LOG.BL_NO is
'��Ʒ���';

comment on column BIS_FIN_OPER_LOG.BL_CODE is
'�����˻�';

comment on column BIS_FIN_OPER_LOG.BL_NAME is
'������';

comment on column BIS_FIN_OPER_LOG.BL_TYPE is
'��������';

comment on column BIS_FIN_OPER_LOG.BL_MEMO is
'���';

comment on column BIS_FIN_OPER_LOG.BL_MODULE is
'ģ������';

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
'��Ʋ�Ʒ��Ϣ��ѯ��';

comment on column BIS_FIN_PRODUCT_INFO.PRODNO is
'��Ʒ����';

comment on column BIS_FIN_PRODUCT_INFO.BIF_CODE is
'�������';

comment on column BIS_FIN_PRODUCT_INFO.PRODNAME is
'��Ʒ���';

comment on column BIS_FIN_PRODUCT_INFO.CURRENCY is
'���۱���';

comment on column BIS_FIN_PRODUCT_INFO.TARGET is
'���۶���1 ���� �����ṩ����2 ��˾ ��3 ȫ�� ��4 ͬҵ';

comment on column BIS_FIN_PRODUCT_INFO.RETURN_TYPE is
'�����ʾ��ʽ 1 ������  2 ��ֵ';

comment on column BIS_FIN_PRODUCT_INFO.DTSTART is
'�Ϲ���ʼ����';

comment on column BIS_FIN_PRODUCT_INFO.DTEND is
'�Ϲ���������';

comment on column BIS_FIN_PRODUCT_INFO.INTRSTEDTSTART is
'�����Ϣ��';

comment on column BIS_FIN_PRODUCT_INFO.EXPIREDATE is
'��Ƶ�����';

comment on column BIS_FIN_PRODUCT_INFO.DTEXCHANGE is
'��ƶҸ���';

comment on column BIS_FIN_PRODUCT_INFO.REFVALUE is
'�ο�������(��ֵ)';

comment on column BIS_FIN_PRODUCT_INFO.MANAGEMENTFEE is
'�����';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRFEE is
'�Ϲ�������';

comment on column BIS_FIN_PRODUCT_INFO.PURCHFEE is
'�깺������';

comment on column BIS_FIN_PRODUCT_INFO.REDMFEE is
'���������';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRFLG is
'�Ƿ���Ϲ� 0���ɲ��� 1�ɲ���';

comment on column BIS_FIN_PRODUCT_INFO.PURCHFLG is
'�Ƿ���깺 0���ɲ��� 1�ɲ���';

comment on column BIS_FIN_PRODUCT_INFO.REDMFLG is
'�Ƿ����� 0���ɲ��� 1�ɲ���';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRMINAMT is
'�Ϲ���ͽ��';

comment on column BIS_FIN_PRODUCT_INFO.SBSCRINCAMT is
'�Ϲ��������';

comment on column BIS_FIN_PRODUCT_INFO.PURCHMINAMT is
'�깺��ͽ��';

comment on column BIS_FIN_PRODUCT_INFO.PURCHINCAMT is
'�깺�������';

comment on column BIS_FIN_PRODUCT_INFO.HOLDMINAMT is
'��ͳ��н��';

comment on column BIS_FIN_PRODUCT_INFO.HOLDMAXAMT is
'��߳��н��';

comment on column BIS_FIN_PRODUCT_INFO.REDMMINAMT is
'�����ͽ��';

comment on column BIS_FIN_PRODUCT_INFO.REDMINCAMT is
'��ص������';

comment on column BIS_FIN_PRODUCT_INFO.AGREEMCONTENT is
'Э��������';

comment on column BIS_FIN_PRODUCT_INFO.VOUCHER_STAT is
'״̬';


CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_INFO AS
SELECT P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '������'
         WHEN P.RETURN_TYPE = '2' THEN
          '��ֵ'
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
          '���ɲ���'
         WHEN P.SBSCRFLG = '1' THEN
          '�ɲ���'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '���ɲ���'
         WHEN P.PURCHFLG = '1' THEN
          '�ɲ���'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
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
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '������'
         WHEN P.RETURN_TYPE = '2' THEN
          '��ֵ'
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
          '���ɲ���'
         WHEN P.SBSCRFLG = '1' THEN
          '�ɲ���'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '���ɲ���'
         WHEN P.PURCHFLG = '1' THEN
          '�ɲ���'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
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
          '��ǩԼ'
         WHEN F.VOUCHER_STAT = '2' THEN
          '���д���ʧ��'
         WHEN F.VOUCHER_STAT = '3' THEN
          '׼������'
         WHEN F.VOUCHER_STAT = '9' THEN
          '�ӿڴ���ʧ��'
       END) WHEN F.SIGNFLG = '1' THEN 'ǩԼ��' WHEN F.SIGNFLG = '2' THEN 'δǩԼ' WHEN F.SIGNFLG = '3' THEN 'ǩԼʧ��' END) AS SIGNFLG_NAME,
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
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '������'
         WHEN P.RETURN_TYPE = '2' THEN
          '��ֵ'
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
          '���ɲ���'
         WHEN P.SBSCRFLG = '1' THEN
          '�ɲ���'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '���ɲ���'
         WHEN P.PURCHFLG = '1' THEN
          '�ɲ���'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
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
          '�ݴ�'
         WHEN E.STATUS = '450' THEN
          '���'
       END) AS VOUCHER_STAT_NAME,
       F.SIGNFLG,
       (CASE
         WHEN F.SIGNFLG = '0' THEN
          (CASE
         WHEN F.VOUCHER_STAT = '0' THEN
          '��ǩԼ'
         WHEN F.VOUCHER_STAT = '2' THEN
          '���д���ʧ��'
         WHEN F.VOUCHER_STAT = '3' THEN
          '׼������'
         WHEN F.VOUCHER_STAT = '9' THEN
          '�ӿڴ���ʧ��'
       END) WHEN F.SIGNFLG = '1' THEN 'ǩԼ��' WHEN F.SIGNFLG = '2' THEN 'δǩԼ' WHEN F.SIGNFLG = '3' THEN 'ǩԼʧ��' END) AS SIGNFLG_NAME,
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
          '�Ϲ�'
         WHEN E.BIS_TYPE = '02' THEN
          '�깺'
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
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE
         WHEN P.RETURN_TYPE = '1' THEN
          '������'
         WHEN P.RETURN_TYPE = '2' THEN
          '��ֵ'
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
          '���ɲ���'
         WHEN P.SBSCRFLG = '1' THEN
          '�ɲ���'
       END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE
         WHEN P.PURCHFLG = '0' THEN
          '���ɲ���'
         WHEN P.PURCHFLG = '1' THEN
          '�ɲ���'
       END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
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
           '������'
          WHEN E.STATUS = '500' THEN
           '�ݴ�'
          WHEN E.STATUS = '450' THEN
           '���'
          WHEN E.STATUS = '95' THEN
           '����ͨ��'
          WHEN E.STATUS = '250' THEN
           'ɾ��'
          WHEN E.STATUS = '200' THEN
           '��Ч'
          WHEN E.STATUS = '150' THEN
           '����'
          WHEN E.STATUS = '11' THEN
           '������'
        END) ELSE(CASE
         WHEN TRIM(S.VOUCHER_STAT) = '3' THEN
          '׼������'
         WHEN TRIM(S.VOUCHER_STAT) = '9' THEN
          '�ӿڴ���ʧ��'
         WHEN TRIM(S.VOUCHER_STAT) = '2' THEN
          '���д���ʧ��'
         WHEN TRIM(S.VOUCHER_STAT) = '0' THEN
          '���׳ɹ�'
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
          '��ǩԼ'
         WHEN F.SIGNFLG = '1' THEN
          'ǩԼ��'
         WHEN F.SIGNFLG = '2' THEN
          'δǩԼ'
         WHEN F.SIGNFLG = '3' THEN
          'ǩԼʧ��'
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
          '�Ϲ�'
         WHEN E.BIS_TYPE = '02' THEN
          '�깺'
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
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '��'
         WHEN F.CASHFLAG = '1' THEN
          '��'
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
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
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
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '��'
         WHEN F.CASHFLAG = '1' THEN
          '��'
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
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
       END) AS REDMFLG_NAME,
       E.REDM_AMT,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE
         WHEN E.STATUS = '500' THEN
          '�ݴ�'
         WHEN E.STATUS = '450' THEN
          '���'
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
          '����'
         WHEN P.TARGET = 2 THEN
          '��˾'
         WHEN P.TARGET = 3 THEN
          'ȫ��'
         WHEN P.TARGET = 4 THEN
          'ͬҵ'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '��'
         WHEN F.CASHFLAG = '1' THEN
          '��'
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
          '���ɲ���'
         WHEN P.REDMFLG = '1' THEN
          '�ɲ���'
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
           '������'
          WHEN E.STATUS = '500' THEN
           '�ݴ�'
          WHEN E.STATUS = '450' THEN
           '���'
          WHEN E.STATUS = '95' THEN
           '����ͨ��'
          WHEN E.STATUS = '250' THEN
           'ɾ��'
          WHEN E.STATUS = '200' THEN
           '��Ч'
          WHEN E.STATUS = '150' THEN
           '����'
          WHEN E.STATUS = '11' THEN
           '������'
        END) ELSE(CASE
         WHEN TRIM(S.VOUCHER_STAT) = '3' THEN
          '׼������'
         WHEN TRIM(S.VOUCHER_STAT) = '9' THEN
          '�ӿڴ���ʧ��'
         WHEN TRIM(S.VOUCHER_STAT) = '2' THEN
          '���д���ʧ��'
         WHEN TRIM(S.VOUCHER_STAT) = '0' THEN
          '���׳ɹ�'
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
          '��ǩԼ'
         WHEN F.SIGNFLG = 1 THEN
          'ǩԼ��'
         WHEN F.SIGNFLG = 2 THEN
          'δǩԼ'
         WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 2 THEN
          '���д���ʧ��'
         WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 9 THEN
          '�ӿڴ���ʧ��'
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
          'ǩԼ�ɹ�'
         WHEN F.VOUCHER_STAT = 2 THEN
          '���д���ʧ��'
         WHEN F.VOUCHER_STAT = 3 THEN
          '׼������'
         WHEN F.VOUCHER_STAT = 9 THEN
          '�ӿڴ���ʧ��'
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
                   '��'
                  WHEN D.CASHFLAG = '1' THEN
                   '��'
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
                  '��'
                 WHEN D.CASHFLAG = '1' THEN
                  '��'
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
                  '��'
                 WHEN D.CASHFLAG = '1' THEN
                  '��'
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