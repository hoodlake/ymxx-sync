--�޸����ڣ�20120821
--�޸��ˣ�  �ന��
--�޸�����: 1.TB_GENERATOR������ӵ�������ܱ��ID�ֶ�;
--          2.�����������������;
--          3.��������ܲ˵�����;
--          4.BT_BANK_ACC����Ƿ�ǩԼ�˺��ֶ�;
--          5.���� ֤���ʽ��˺ű�֤���ʽ��˺������˺�ά�������������ܱ��������������ѯ������������ʽ��ѯ��
--          6.�����˺Ź���˵�(�����˺Ź�ϵά�� ) 
--TB_GENERATOR������ӵ�������ܱ��ID�ֶ�;
insert into TB_GENERATOR (GEN_NAME, GEN_VALUE) 
select 'SEC_ACC_MTC_ID', 1
go
insert into TB_GENERATOR (GEN_NAME, GEN_VALUE) 
select 'THIRD_ID', 1
go
insert into TB_GENERATOR (GEN_NAME, GEN_VALUE) 
select 'VOUCHER_CODE', 1
go
insert into TB_GENERATOR (GEN_NAME, GEN_VALUE) 
select 'BIS_QUERY_DEP_CMD_ID', 1
go
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
select 'thirddep', 'cho', '���֤��', 'A,B,C', 'FC_THIRD_DEP', '', 'amt', '', 'nextchecker', 'THIRD_ID', '../chowmatistic/fcThirdCheck.jsp', '', '', '', '', 'com.byttersoft.chowmatistic.form.FcThirdDepForm', '', '', '', '', '', null, null, null, null, null, ''
go
delete from bt_sys_res where FATHER_CODE in (select res_code from bt_sys_res  where res_name='֤���ʽ��˺�ά��'  and sys_code='cho' and res_level=2)
go
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='��ͨ���' and sys_code='cho')
go
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='�����ڄ�' and sys_code='cho')
go
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho')
go
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='���������' and sys_code='cho')
go
delete from bt_sys_res where res_name='���������'
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '���������', 'cho', 0, '', '0', '0', '0', '0', 3, '���������', '', '', '', '', '', null, null, null, null, null, 1, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '֤���ʽ��˺�ά��', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 1, '֤���ʽ��˺�ά��', '', '', '', '', '', null, null, null, null, null, 2, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��ͨ���', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 2, '��ͨ���', '', '', '', '', '', null, null, null, null, null, 2, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '�����ڄ�', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 3, '�����ڄ�', '', '', '', '', '', null, null, null, null, null, 2, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='���������'), '', '0', '1', '0', '0', 4, '��ѯ', '', '', '', '', '', null, null, null, null, null, 2, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '֤���ʽ��˺�ά��', 'cho', (select res_code from bt_sys_res  where res_name='֤���ʽ��˺�ά��' and res_level=2), '/chowmatistic/createSecuritiesfundsAccount.jsp', '0', '1', '0', '0', 1, '֤���ʽ��˺�ά��', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��ͨ���¼��', 'cho', (select res_code from bt_sys_res  where res_name='��ͨ���'), '/chowmatistic/createOrdinaryDeposit.jsp', '0', '1', '0', '0', 1, '��ͨ���¼��', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '�޸���ͨ��ܵ���', 'cho', (select res_code from bt_sys_res  where res_name='��ͨ���'), '/chowmatistic/updateOrdinaryDeposit.jsp', '0', '1', '0', '0', 2, '�޸���ͨ��ܵ���', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '�����ڄ�¼��', 'cho', (select res_code from bt_sys_res  where res_name='�����ڄ�'), '/chowmatistic/createSecFinancing.jsp', '0', '1', '0', '0', 1, '�����ڄ�¼��', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '�޸������ڄ�����', 'cho', (select res_code from bt_sys_res  where res_name='�����ڄ�'), '/chowmatistic/updateSecFinancing.jsp', '0', '1', '0', '0', 2, '�޸������ڄ�����', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), 'ǩԼ��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdSign.jsp', '0', '1', '0', '0', 1, 'ǩԼ��ѯ', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��ϸ��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdDetail.jsp', '0', '1', '0', '0', 2, '��ϸ��ѯ', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '�ʽ��ѯ', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdFund.jsp', '0', '1', '0', '0', 3, '�ʽ��ѯ', '', '', '', '', '', null, null, null, null, null, 3, ''
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��ѯ����ָ��', 'cho', (select res_code from bt_sys_res  where res_name='��ѯ' and sys_code='cho'), '/chowmatistic/queryThirdIns.jsp', '0', '1', '0', '0', 4, '��ѯ����ָ��', '', '', '', '', '', null, null, null, null, null, 3, ''
go
alter table BT_BANK_ACC add SIGN_FLG CHAR(1)
go
--����
-- Create table
create table FC_SEC_ACC
(
  SEC_ACC_NUM VARCHAR(50) not null,
  SEC_TRADER  VARCHAR(200),
  SEC_ACC     VARCHAR(50),
  CUR         CHAR(2),
  VALID_SIGN  CHAR(1),
  RMK         VARCHAR(100),
  CORP_ID     NUMERIC(10),
  STATUS      NUMERIC(10)
)
go
alter table FC_SEC_ACC add constraint UNIQ_FC_SEC_ACC_1 primary key (SEC_ACC_NUM) 
go
-- Create table
create table FC_SEC_ACC_MTC
(
  SEC_ACC_MTC_ID INT not null,
  SEC_ACC        VARCHAR(50),
  BANK_ACC       VARCHAR(50),
  PREFERRED_SIGN CHAR(1),
  OP             VARCHAR(20),
  OP_CODE        VARCHAR(20),
  OP_DATE        DATETIME,
  STATUS         NUMERIC(10)
)
go
alter table FC_SEC_ACC_MTC add constraint UNIQ_FC_SEC_ACC_MTC_1 primary key (SEC_ACC_MTC_ID) 
go
-- Create table 
create table FC_THIRD_DEP
(
  THIRD_ID       INT not null,
  BANK_ACC       VARCHAR(50),
  AVAIL_BAL      NUMERIC(15,2),
  WISH_PAYDAY    DATETIME,
  INTERFACE_ID   VARCHAR(12),
  APPOINT_ID     INT,
  SEC_ACC        VARCHAR(50),
  SEC_AVAIL_BAL  NUMERIC(15,2),
  AMT            NUMERIC(15,2),
  BURSAR_BILL_NO VARCHAR(40),
  BILL_TYPE      CHAR(2),
  FUND_PASS      VARCHAR(50),
  THIRD_TYPE     CHAR(2),
  STATUS         NUMERIC(10),
  OP             VARCHAR(20),
  OP_CODE        VARCHAR(20),
  APPROVES       NVARCHAR(200),
  NEXTCHECKER    VARCHAR(100),
  CORP_ID        NUMERIC(38),
  OP_DATE        DATETIME,
  ISSUE_DATE     DATETIME,
  voucher_no     varchar(12)
)
go
alter table FC_THIRD_DEP add constraint UNIQ_FC_THIRD_DEP_1 primary key (THIRD_ID) 
go
create table bis_depository_bal
(
  ACCT_ID         VARCHAR(60) not null,
  acct_NAME      VARCHAR(60),
  FUNDACCT_ID     VARCHAR(60),         
  BROKER            VARCHAR(30),   
  avail_bal        NUMERIC(15,2),
  bif_code            char(4) not null,
  return_code     VARCHAR(30),
  return_msg      VARCHAR(60),
  query_TIME      DATETIME,                     
  last_TIME       DATETIME
)
go
alter table bis_depository_bal add constraint PK_bis_depository_bal primary key (ACCT_ID,bif_code)
go
create table BIS_QUERY_DEP_CMD
(
  CMD_ID      INT not null,
  ACCTID      VARCHAR(60),
  PWD         VARCHAR(60),
  RETURN_MSG  VARCHAR(100),
  RETURN_CODE VARCHAR(20),
  req_time    DATETIME,
  return_time DATETIME,
  BIF_CODE    CHAR(4),
  finish_sign CHAR(1)         
)
go
alter table BIS_QUERY_DEP_CMD add constraint PK_BIS_QUERY_DEP_CMD primary key (CMD_ID)
go 
CREATE VIEW V_FC_THIRD_HISTORY
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
          WHERE  TRANS_TYPE = '1') as b
go
declare
  @v_param_value varchar(100)
begin
  select @v_param_value=param_value1 from bt_param where CODE = 'systemVersion'
  if @v_param_value != '3'   --�����ֽ����
    begin
		----�����˺Ź�ϵά��---
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
	        REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����˺Ź�ϵά��  ','bankacc',res_code,
		'/newBankacc/bankaccRelation.do?method=toList'
		,'0','1','0','0',1,'�����˺Ź�ϵά��  ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		) 
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'¼����ϸ','bankacc',res_code,
		'/newBankacc/bankaccDtlAction.do?method=toInitBankaccDtl'
		,'0','1','0','0',2,'¼����ϸ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		) 
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'¼�����','bankacc',res_code,
		'/newBankacc/bankaccBalAction.do?method=toInitBankaccBal'
		,'0','1','0','0',3,'¼�����','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		) 
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����Ǽ�','bankacc',res_code,
		'/newBankacc/bankaccCloseAction.do?method=toBankaccClose'+char(38)+'pageType=init'
		,'0','1','0','0',9,'�����Ǽ�','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		) 
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'��������','bankacc',res_code,
		'/newBankacc/bankaccCloseAction.do?method=toBankaccClose'+char(38)+'pageType=check'
		,'0','1','0','0',10,'��������','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�˻�����' and sys_code = 'bankacc' and father_code in(
		select RES_CODE from bt_sys_res  where res_name = '�����˻�����' and sys_code = 'bankacc'
		) 
		
		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,
		RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,
		REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1  from bt_sys_res), '��ѯͳ��', 'bankacc', 0, '', '0', '0', '0',
		'0', 8, '��ѯͳ��', '', '', '', '', '', null, null, null, null, null, 1

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�����˻�','bankacc',res_code,''
		,'0','1','0','0',1,'�����˻�','','','','','',null,null,null,null,null,2 
		from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc'

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻���ѯ','bankacc',res_code,'/newBankacc/maintainBtBankaccAction.do?method=doBankaccQuery'
		,'0','1','0','0',1,'�˻���ѯ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�����˻�' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc' 
		)

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻�������ϸ��ѯ','bankacc',res_code,'/newBankacc/bankaccDtlAction.do?method=toInitBankaccDtl'+char(38)+'isQuery=true'
		,'0','1','0','0',2,'�˻�������ϸ��ѯ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�����˻�' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc' 
		)

		insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
		REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
		select (select max(RES_CODE) + 1 from bt_sys_res),'�˻�����ѯ','bankacc',res_code,'/newBankacc/bankaccBalAction.do?method=toInitBankaccBal'+char(38)+'isQuery=true'
		,'0','1','0','0',2,'�˻�����ѯ','','','','','',null,null,null,null,null,3  
		from bt_sys_res  where res_name = '�����˻�' and sys_code = 'bankacc' and father_code in(
		select res_code from bt_sys_res  where res_name = '��ѯͳ��' and sys_code = 'bankacc' 
		)
    end
end
go