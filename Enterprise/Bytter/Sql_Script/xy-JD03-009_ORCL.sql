--�޸����ڣ�20120821
--�޸��ˣ�  �ന��
--�޸�����: 1.TB_GENERATOR������ӵ�������ܱ��ID�ֶ�;
--          2.�����������������;
--          3.��������ܲ˵�����;
--          4.BT_BANK_ACC����Ƿ�ǩԼ�˺��ֶ�;
--          5.���� ֤���ʽ��˺ű�֤���ʽ��˺������˺�ά�������������ܱ��������������ѯ������������ʽ��ѯ��
--          6.�����˺Ź���˵�(�����˺Ź�ϵά�� ) 
--TB_GENERATOR������ӵ�������ܱ��ID�ֶ�;
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'SEC_ACC_MTC_ID', 1);
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'THIRD_ID', 1);
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'VOUCHER_CODE', 1);
insert into TB_GENERATOR (ID, GEN_NAME, GEN_VALUE) values ((select max(ID)+1 from TB_GENERATOR), 'BIS_QUERY_DEP_CMD_ID', 1);
--��������
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('thirddep', 'cho', '���֤��', 'A,B,C', 'FC_THIRD_DEP', '', 'amt', '', 'nextchecker', 'THIRD_ID', '../chowmatistic/fcThirdCheck.jsp', '', '', '', '', 'com.byttersoft.chowmatistic.form.FcThirdDepForm', '', '', '', '', '', null, null, null, null, null, '');
--ɾ������Ӳ˵�
delete from bt_sys_res where FATHER_CODE in (select res_code from bt_sys_res  where res_name='֤���ʽ��˺�ά��'  and sys_code='cho' and res_level=2);
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='��ͨ���' and sys_code='cho');
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='�����ڄ�' and sys_code='cho');
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho');
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='���������' and sys_code='cho');
delete from bt_sys_res where res_name='���������';
--���1���˵�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '���������', 'cho', 0, '', '0', '0', '0', '0', 3, '���������', '', '', '', '', '', null, null, null, null, null, 1, '');
--���2���˵�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '֤���ʽ��˺�ά��', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 1, '֤���ʽ��˺�ά��', '', '', '', '', '', null, null, null, null, null, 2, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '��ͨ���', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 2, '��ͨ���', '', '', '', '', '', null, null, null, null, null, 2, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�����ڄ�', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 3, '�����ڄ�', '', '', '', '', '', null, null, null, null, null, 2, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 4, '��ѯ', '', '', '', '', '', null, null, null, null, null, 2, '');
--���3���˵�
--1
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '֤���ʽ��˺�ά��', 'cho', (select res_code from bt_sys_res  where res_name='֤���ʽ��˺�ά��' and res_level=2), '/chowmatistic/createSecuritiesfundsAccount.jsp', '0', '1', '0', '0', 1, '֤���ʽ��˺�ά��', '', '', '', '', '', null, null, null, null, null, 3, '');
--2
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '��ͨ���¼��', 'cho', (select res_code from bt_sys_res  where res_name='��ͨ���'), '/chowmatistic/createOrdinaryDeposit.jsp', '0', '1', '0', '0', 1, '��ͨ���¼��', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�޸���ͨ��ܵ���', 'cho', (select res_code from bt_sys_res  where res_name='��ͨ���'), '/chowmatistic/updateOrdinaryDeposit.jsp', '0', '1', '0', '0', 2, '�޸���ͨ��ܵ���', '', '', '', '', '', null, null, null, null, null, 3, '');
--3
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�����ڄ�¼��', 'cho', (select res_code from bt_sys_res  where res_name='�����ڄ�'), '/chowmatistic/createSecFinancing.jsp', '0', '1', '0', '0', 1, '�����ڄ�¼��', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�޸������ڄ�����', 'cho', (select res_code from bt_sys_res  where res_name='�����ڄ�'), '/chowmatistic/updateSecFinancing.jsp', '0', '1', '0', '0', 2, '�޸������ڄ�����', '', '', '', '', '', null, null, null, null, null, 3, '');
--4
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), 'ǩԼ��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdSign.jsp', '0', '1', '0', '0', 1, 'ǩԼ��ѯ', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '��ϸ��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdDetail.jsp', '0', '1', '0', '0', 2, '��ϸ��ѯ', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�ʽ��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdFund.jsp', '0', '1', '0', '0', 3, '�ʽ��ѯ', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '��ѯ����ָ��', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdIns.jsp', '0', '1', '0', '0', 4, '��ѯ����ָ��', '', '', '', '', '', null, null, null, null, null, 3, '');
--
alter table BT_BANK_ACC add SIGN_FLG CHAR(1);
comment on column BT_BANK_ACC.SIGN_FLG is '�Ƿ�ǩԼ�˺�';
--����
-- Create table
create table FC_SEC_ACC
(
  SEC_ACC_NUM VARCHAR2(50),
  SEC_TRADER  VARCHAR2(200),
  SEC_ACC     VARCHAR2(50),
  CUR         CHAR(2),
  VALID_SIGN  CHAR(1),
  RMK         VARCHAR2(100),
  CORP_ID     NUMBER(10),
  STATUS      NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column FC_SEC_ACC.SEC_ACC_NUM
  is '�������';
comment on column FC_SEC_ACC.SEC_TRADER
  is '��������';
comment on column FC_SEC_ACC.SEC_ACC
  is '֤���ʽ��˺�';
comment on column FC_SEC_ACC.CUR
  is '�ұ� ';
comment on column FC_SEC_ACC.VALID_SIGN
  is '��Ч��ʶ';
comment on column FC_SEC_ACC.RMK
  is '��ע';
comment on column FC_SEC_ACC.CORP_ID
  is '��λID';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FC_SEC_ACC
  add constraint UNIQ_FC_SEC_ACC_1 unique (SEC_ACC)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create table
create table FC_SEC_ACC_MTC
(
  SEC_ACC_MTC_ID NUMBER,
  SEC_ACC        VARCHAR2(50),
  BANK_ACC       VARCHAR2(50),
  PREFERRED_SIGN CHAR(1),
  OP             VARCHAR2(20),
  OP_CODE        VARCHAR2(20),
  OP_DATE        DATE,
  STATUS         NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column FC_SEC_ACC_MTC.SEC_ACC_MTC_ID
  is '���';
comment on column FC_SEC_ACC_MTC.SEC_ACC
  is '֤���ʽ��˺�';
comment on column FC_SEC_ACC_MTC.BANK_ACC
  is '�����˺�';
comment on column FC_SEC_ACC_MTC.PREFERRED_SIGN
  is '��ѡ�˺�';
comment on column FC_SEC_ACC_MTC.OP
  is '����Ա';
comment on column FC_SEC_ACC_MTC.OP_CODE
  is '����Ա����';
comment on column FC_SEC_ACC_MTC.OP_DATE
  is '����ʱ��';
-- Create table
create table FC_THIRD_DEP
(
  THIRD_ID       NUMBER,
  BANK_ACC       VARCHAR2(50),
  AVAIL_BAL      NUMBER(15,2),
  WISH_PAYDAY    DATE,
  INTERFACE_ID   VARCHAR2(12),
  APPOINT_ID     NUMBER,
  SEC_ACC        VARCHAR2(50),
  SEC_AVAIL_BAL  NUMBER(15,2),
  AMT            NUMBER(15,2),
  BURSAR_BILL_NO VARCHAR2(40),
  BILL_TYPE      CHAR(2),
  FUND_PASS      VARCHAR2(50),
  THIRD_TYPE     CHAR(2),
  STATUS         NUMBER(10),
  OP             VARCHAR2(20),
  OP_CODE        VARCHAR2(20),
  APPROVES       NVARCHAR2(200),
  NEXTCHECKER    VARCHAR2(100),
  CORP_ID        NUMBER(38),
  OP_DATE        DATE,
  ISSUE_DATE     DATE,
  voucher_no     varchar2(12)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column FC_THIRD_DEP.BANK_ACC
  is '�����˻�';
comment on column FC_THIRD_DEP.AVAIL_BAL
  is '�������';
comment on column FC_THIRD_DEP.WISH_PAYDAY
  is '������������';
comment on column FC_THIRD_DEP.INTERFACE_ID
  is '�ӿڴ���';
comment on column FC_THIRD_DEP.APPOINT_ID
  is 'ԤԼ��ˮ��';
comment on column FC_THIRD_DEP.SEC_ACC
  is '֤���ʽ��˺�';
comment on column FC_THIRD_DEP.SEC_AVAIL_BAL
  is '֤����ȡ���';
comment on column FC_THIRD_DEP.AMT
  is '���׽��';
comment on column FC_THIRD_DEP.BURSAR_BILL_NO
  is '���ƾ֤��';
comment on column FC_THIRD_DEP.BILL_TYPE
  is 'ת�˷�ʽ 1����ת֤��2֤��ת���� ';
comment on column FC_THIRD_DEP.FUND_PASS
  is '�ʽ�̨������';
comment on column FC_THIRD_DEP.THIRD_TYPE
  is '�����������1.��ͨ��2.�����ڄ� ';
comment on column FC_THIRD_DEP.STATUS
  is '10--�ύ����
-1--���
95����ͨ��
0--�ݴ�
-2--ɾ��
';
comment on column FC_THIRD_DEP.OP is '����Ա';
comment on column FC_THIRD_DEP.OP_CODE is '����Ա����';
comment on column FC_THIRD_DEP.APPROVES is '��������Ա';
comment on column FC_THIRD_DEP.NEXTCHECKER is '��һ��������';
comment on column FC_THIRD_DEP.CORP_ID is '��λID';
comment on column FC_THIRD_DEP.OP_DATE is '����ʱ��';
comment on column FC_THIRD_DEP.ISSUE_DATE is 'ǩ������';
create table bis_depository_bal
(
  ACCT_ID         VARCHAR2(60),
  acct_NAME      VARCHAR2(60),
  FUNDACCT_ID     VARCHAR2(60),         
  BROKER            VARCHAR2(30),   
  avail_bal        number(15,2),
  bif_code            char(4),
  return_code    VARCHAR2(30),
  return_msg     VARCHAR2(60),
  query_TIME     DATE,                     
  last_TIME       DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table bis_depository_bal
  add constraint PK_bis_depository_bal primary key (ACCT_ID,bif_code)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table BIS_QUERY_DEP_CMD
(
  CMD_ID      number,
  ACCTID      VARCHAR2(60),
  PWD         VARCHAR2(60),
  RETURN_MSG  VARCHAR2(100),
  RETURN_CODE VARCHAR2(20),
  req_time    date,
  return_time date,
  BIF_CODE    CHAR(4),
  finish_sign char(1)         
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
  alter table BIS_QUERY_DEP_CMD
  add constraint PK_BIS_QUERY_DEP_CMD primary key (CMD_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
CREATE OR REPLACE VIEW V_FC_THIRD_HISTORY
AS
  SELECT SERIAL_ID,
         APPLYAMT,
         DEALAMT,
         BANK_SERIAL_ID,
         BIF_CODE,
         TRNSTATUS,
         TRNCODE,
         TRANS_TIME,
         REC_TIME,
         ACCTID,
         CUR,
         BUSN_NAME,
         BROKER,
         TRANS_TYPE
  FROM   (SELECT SERIAL_ID,
                 APPLYAMT,
                 DEALAMT,
                 BANK_SERIAL_ID,
                 BIF_CODE,
                 TRNSTATUS,
                 TRNCODE,
                 TRANS_TIME,
                 REC_TIME,
                 ACCTID,
                 CUR,
                 BUSN_NAME,
                 BROKER,
                 TRANS_TYPE
          FROM   BIS_FIN_DTL
          WHERE  TRANS_TYPE = '1'
          UNION
          SELECT SERIAL_ID,
                 APPLYAMT,
                 DEALAMT,
                 BANK_SERIAL_ID,
                 BIF_CODE,
                 TRNSTATUS,
                 TRNCODE,
                 TRANS_TIME,
                 REC_TIME,
                 ACCTID,
                 CUR,
                 BUSN_NAME,
                 BROKER,
                 TRANS_TYPE
          FROM   BIS_FIN_HIS_DTL
          WHERE  TRANS_TYPE = '1');
declare
  v_param_value bt_param.param_value1%type;
begin
  select param_value1 into v_param_value from bt_param where CODE = 'systemVersion';
  if v_param_value != 3 then --�����ֽ�����
  
		-- �����˺Ź���˵�
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻�����','bankacc',res_code,
		'','0','1','0','0',2,'�˻�����','','','','','',null,null,null,null,null,2  
		from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc';
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����˺�ά��  ','bankacc',res_code,
		'/newBankacc/maintainBtBankaccAction.do?method=initMaintainBtBankacc'
		,'0','1','0','0',1,'�����˺�ά��  ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		);

----�����˺Ź�ϵά��---
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����˺Ź�ϵά��  ','bankacc',res_code,
		'/newBankacc/bankaccRelation.do?method=toList'
		,'0','1','0','0',1,'�����˺Ź�ϵά��  ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'¼����ϸ','bankacc',res_code,
		'/newBankacc/bankaccDtlAction.do?method=toInitBankaccDtl'
		,'0','1','0','0',2,'¼����ϸ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'¼�����','bankacc',res_code,
		'/newBankacc/bankaccBalAction.do?method=toInitBankaccBal'
		,'0','1','0','0',3,'¼�����','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		);


		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����Ǽ�','bankacc',res_code,
		'/newBankacc/bankaccCloseAction.do?method=toBankaccClose'||chr(38)||'pageType=init'
		,'0','1','0','0',9,'�����Ǽ�','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'��������','bankacc',res_code,
		'/newBankacc/bankaccCloseAction.do?method=toBankaccClose'||chr(38)||'pageType=check'
		,'0','1','0','0',10,'��������','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		);


		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,
		RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,
		REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		values ((select max(RES_CODE) + 1  from bt_sys_res), '��ѯͳ��', 'bankacc', 0, '', '0', '0', '0',
		'0', 8, '��ѯͳ��', '', '', '', '', '', null, null, null, null, null, 1 );

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����˻�','bankacc',res_code,''
		,'0','1','0','0',1,'�����˻�','','','','','',null,null,null,null,null,2 
		from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc';

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻���ѯ','bankacc',res_code,'/newBankacc/maintainBtBankaccAction.do?method=doBankaccQuery'
		,'0','1','0','0',1,'�˻���ѯ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�����˻�' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc' 
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻�������ϸ��ѯ','bankacc',res_code,'/newBankacc/bankaccDtlAction.do?method=toInitBankaccDtl'||chr(38)||'isQuery=true'
		,'0','1','0','0',2,'�˻�������ϸ��ѯ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�����˻�' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc' 
		);

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻�����ѯ','bankacc',res_code,'/newBankacc/bankaccBalAction.do?method=toInitBankaccBal'||chr(38)||'isQuery=true'
		,'0','1','0','0',2,'�˻�����ѯ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�����˻�' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc' 
		);

 end if;
end;
/
commit;
