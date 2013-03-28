--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ������������д�������ϵͳ����
--�������ã�
insert into bt_approve_business
(
    BUSINESS_CODE,
    SYS_CODE,
    BUSINESS_NAME,
    BUSINESS_LEVEL,
    TABLE_NAME,
    BILL_CODE_FIELD2,
    MONEY_FIELD,
    TABLE_FIELD,
    NEXT_CHECKER_FIELD,
    BILL_CODE_FIELD,
    URL1,
    CLASS_PATH   
)
values
(
  'nis_wage',
  'nis',
  '��������',
  'A,B,C',
  'nis_wage',
  '',
  'money',
  '',
  'nextchecker',
  'wage_no',
  '../netbank/wageCheck.jsp',
  'com.byttersoft.netbank.form.NisWageForm'   
)
GO
--�޸����ڣ�20120723
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ������ʲ˵�
--�������ã�
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
select
   (select max(res_code) + 1 from bt_sys_res),
   '��������',
   'nis',
   0,
   '',
   '0',
   '0',
   '0',
   '0',
   14,
   '��������',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   1,
   ''
GO 
 
--�޸����ڣ�20120723
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ��������Ƶ��˵�
--�������ã�
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
select 
   (select max(res_code) + 1 from bt_sys_res),
   '���������Ƶ�',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '��������'),
   '/netbank/nisWageAction.do?method=toList',
   '0',
   '0',
   '0',
   '0',
   1,
   '���������Ƶ�',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''
GO

--�޸����ڣ�20120723
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ��������Ƶ��޸Ĳ˵�
--�������ã�
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
SELECT 
   (select max(res_code) + 1 from bt_sys_res),
   '���������Ƶ��޸�',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '��������'),
   '/netbank/nisWageAction.do?method=toModifyList',
   '0',
   '0',
   '0',
   '0',
   2,
   '���������Ƶ��޸�',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''
GO

--�޸����ڣ�20120801
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ������ʽ����ѯ
--�������ã�
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
SELECT 
   (select max(res_code) + 1 from bt_sys_res),
   '�������ʽ����ѯ',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '��������'),
   '/netbank/nisWageAction.do?method=toWageResultList',
   '0',
   '0',
   '0',
   '0',
   3,
   '�������ʽ����ѯ',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''
GO


--�޸����ڣ�20120802
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ������ʽ���쳣����
--�������ã�
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
SELECT
   (select max(res_code) + 1 from bt_sys_res),
   '�������ʽ���쳣����',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '��������'),
   '/netbank/nisWageAction.do?method=toWageExceptionList',
   '0',
   '0',
   '0',
   '0',
   4,
   '�������ʽ���쳣����',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''
GO


--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ��½����ʵ���
--�������ã�
create table NIS_WAGE
(
  wage_no        CHAR(12) not null,
  wage_title     VARCHAR(100),
  corp_code      VARCHAR(20),
  payer_acc      VARCHAR(30),
  payer_bank     VARCHAR(100),
  bank_type      CHAR(4),
  wages          NUMERIC(15,2),
  wageday        DATETIME,
  wish_payday    DATETIME,
  status         INTEGER,
  voucher_stat   CHAR(1),
  billcode       VARCHAR(16),
  op             VARCHAR(30),
  enter_date     DATETIME default getdate(),
  op_name        VARCHAR(30),
  checkers       VARCHAR(150),
  super_checkers VARCHAR(150),
  approves       VARCHAR(150),
  nextchecker    VARCHAR(150)
)
GO
alter table NIS_WAGE
  add constraint PK_NIS_WAGE primary key (WAGE_NO)
GO

--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ��½����ʵ���ϸ��
--�������ã�
create table NIS_WAGE_DETAIL
(
  wage_dtl_no  CHAR(10) not null,
  user_name    VARCHAR(50),
  empno        VARCHAR(50),
  bank_acc     VARCHAR(30),
  bank_type    CHAR(4),
  wages        NUMERIC(15,2),
  wage_no      CHAR(12),
  bill_no      CHAR(12),
  status       INTEGER,
  voucher_stat CHAR(1),
  purpose      VARCHAR(10),
  rmk          VARCHAR(100),
  verify       VARCHAR(32),
  voucher_no   VARCHAR(12),
  reverse1     VARCHAR(100),
  reverse2     VARCHAR(100),
  reverse3     VARCHAR(100),
  reverse4     VARCHAR(100),
  reverse5     VARCHAR(100)
)
GO
alter table NIS_WAGE_DETAIL
  add constraint PK_NIS_WAGE_DETAIL primary key (WAGE_DTL_NO)
GO

--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ��½�������;��
--�������ã�
create table NIS_WAGE_PURPOSE
(
  code    VARCHAR(10) not null,
  purpose VARCHAR(100)
)
GO
alter table NIS_WAGE_PURPOSE
  add constraint PK_NIS_WAGE_PURPOSE primary key (CODE)
GO
  
--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ���ʼ��������;������
--�������ã�
--006-���ʣ�022-����047-������008-ˮ�ѣ�007-��ѣ�813-���·ѣ�080-�����ѣ�048-���ñ���
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('006','����')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('022','����')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('047','����')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('008','ˮ��')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('007','���')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('813','���·�')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('080','������')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('048','���ñ���')
GO


--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ����Ӵ��������Ƿ������ʾʵ�����ʽ��ϵͳ����
--�������ã�
--���������Ƿ������ʾʵ�����ʽ�����¼��
insert into bt_param
  (CODE,
   SYS_CODE,
   NAME,
   PARAM_VALUE1,
   PARAM_VALUE2,
   PARAM_VALUE3,
   PARAM_TYPE,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10)
SELECT
   'wageIsEncryption',
   'nis',
   '���������Ƿ������ʾʵ�����ʽ��',
   '0',
   null,
   null,
   '0',
   '0,��1,��',
   '0,��1,��',
   '',
   '',
   '',
   '',
   1.00,
   (select max(reverse7)+1 from bt_param where sys_code='nis'),
   null,
   null,
   null
GO








