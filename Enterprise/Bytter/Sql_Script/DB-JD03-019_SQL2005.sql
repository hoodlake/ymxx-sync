--�޸���:���¾�
--�޸�ʱ��:2012-08-22
--�޸�����:�к����ʽ�Ԥ������µ�Ԥ������
--����ʽ�֧��Ԥ��
create table BT_WARNING_DEZJZC
(
  ID              NUMERIC(10) primary key not null,
  STRATEGY_CODE   VARCHAR(10),
  RUN_TIME        DATETIME,
  SCAN_DATE_BEGIN DATETIME,
  SCAN_DATE_END   DATETIME,
  CORP_CODE       VARCHAR(4),
  BILL_CODE       VARCHAR(50),
  AMT             NUMERIC(15,2),
  TRANS_DATE      DATETIME,
  ABS             VARCHAR(200),
  PAYEE_NAME      VARCHAR(50),
  STRATEGY_MONEY  NUMERIC(15,2),
  CREATE_TIME     DATETIME,
  STATE           CHAR(1)
)
GO
--ʮ��Ԫ������֧��Ԥ��

create table BT_WARNING_SWYZSB
(
  ID              NUMERIC(10) primary key not null,
  STRATEGY_CODE   VARCHAR(10),
  RUN_TIME        DATETIME,
  SCAN_DATE_BEGIN DATETIME,
  SCAN_DATE_END   DATETIME,
  CORP_CODE       VARCHAR(4),
  BILL_CODE       VARCHAR(50),
  AMT             NUMERIC(15,2),
  TRANS_DATE      DATETIME,
  ABS             VARCHAR(200),
  PAYEE_NAME      VARCHAR(50),
  STRATEGY_MONEY  NUMERIC(15,2),
  CREATE_TIME     DATETIME,
  STATE           CHAR(1)
)
GO



--֧��������

--֧��������

create table BT_WARNING_ZCHLR
(
  ID              NUMERIC(10) primary key not null,
  STRATEGY_CODE   VARCHAR(10),
  RUN_TIME        DATETIME,
  SCAN_DATE_BEGIN DATETIME,
  SCAN_DATE_END   DATETIME,
  CORP_CODE       VARCHAR(4),
  ALL_COUNT       NUMERIC,
  WARNING_COUNT   NUMERIC,
  CREATE_TIME     DATETIME,
  STATE           CHAR(1)
)
GO

create table BT_WARNING_ZCHLR_DETAIL
(
  ID         NUMERIC(10) primary key not null,
  WARNING_ID NUMERIC(10),
  CORP_CODE  VARCHAR(4),
  RUN_TIME   DATETIME,
  TRANS_DATE DATETIME,
  ABS        VARCHAR(200),
  PAYEE_NAME VARCHAR(50),
  BANK_ACC   VARCHAR(50),
  BILL_CODE  VARCHAR(50),
  AMT        NUMERIC(15,2),
  CUR        CHAR(2)
) 
GO

--ΪԤ����������˻������ֶ�
alter table BT_WARNING_STRATEGY add ACC_NATURE_IDS VARCHAR(255) 
GO
--ΪԤ����ϸ��Ӱ���������
alter table BT_WARNING_STRATEGY_DETAIL ADD RMK_OPERATOR VARCHAR(4)
GO

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
SELECT '01', 'Ԥ�����', '09', '����˻�֧��', '������ϸ���'
GO
insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
SELECT '01', 'Ԥ�����', '10', '��Ԫ������֧��', '������ϸ���'
GO
insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
SELECT '01', 'Ԥ�����', '11', '֧��������', '������ϸ���'
GO

----������

insert into tb_generator(gen_name,gen_value) SELECT 'BT_WARNING_DEZJZC_ID',1
GO
insert into tb_generator(gen_name,gen_value) SELECT 'BT_WARNING_SWYZSB_ID',1
GO
insert into tb_generator(gen_name,gen_value) SELECT 'BT_WARNING_ZCHLR_ID',1
GO
insert into tb_generator(gen_name,gen_value) SELECT 'BT_WARNING_ZCHLR_DETAIL_ID',1
GO
--ע��Ԥ�����͵�ɨ������

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
SELECT ISNULL((select max(id) + 1 from BT_WARNING_SCAN),1) , '09', '2012-04-10', '2', 1, '0', 0, '1', '2012-04-10'
GO
insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
SELECT (select max(id) + 1 from BT_WARNING_SCAN) , '10', '2012-04-10', '2', 1, '0', 0, '1', '2012-04-10'
GO
insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
SELECT (select max(id) + 1 from BT_WARNING_SCAN) , '11', '2012-04-10', '2', 1, '0', 0, '1', '2012-04-10'
GO
---����˵�

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), '����˻�֧��', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'+char(38)+'viewType=9', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), 'ʮ��Ԫ������֧��', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'+char(38)+'viewType=10', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), '֧��������', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'+char(38)+'viewType=11', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
GO

--ϵͳ���� --���뻧  
--ADD BY PUYJ 2012-08-29 18:57:27 ������뻧�������
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('PayOutAccType', 'adm', '���뻧����', '200', null, null, '', '', '', '', '', '', '', null, null, null, null, null);
GO
update BT_WARNING_DICTIONARY b set CODE_NAME = 'ʮ��Ԫ������֧��' where b.class_name = 'Ԥ�����' and b.code = '10' ;
GO


---���뻧�޸ĳ�Ϊ֧����
--- add by puyj 2012-08-30 09:21:36 �޸����뻧����Ϊ֧��������
UPDATE BT_PARAM P SET P.NAME = '֧��������' where p.sys_code ='adm' and p.code = 'PayOutAccType'; 
GO


---���Ԥ���޶�˵���ַ���
-- add by puyj 2012-08-31 16:42:46
ALTER TABLE BT_WARNING_DEZJZC ADD  STRATEGY_DETAIL_STR VARCHAR2(40);
GO
ALTER TABLE BT_WARNING_SWYZSB ADD  STRATEGY_DETAIL_STR VARCHAR2(40);
GO