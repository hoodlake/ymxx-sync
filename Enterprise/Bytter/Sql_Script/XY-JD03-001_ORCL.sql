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
);


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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');
 
 
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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');


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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');


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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');



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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');


--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ��½����ʵ���
--�������ã�
create table NIS_WAGE
(
  wage_no        CHAR(12) not null,
  wage_title     VARCHAR2(100),
  corp_code      VARCHAR2(20),
  payer_acc      VARCHAR2(30),
  payer_bank     VARCHAR2(100),
  bank_type      CHAR(4),
  wages          NUMBER(15,2),
  wageday        DATE,
  wish_payday    DATE,
  status         INTEGER,
  voucher_stat   CHAR(1),
  billcode       VARCHAR2(16),
  op             VARCHAR2(30),
  enter_date     DATE default sysdate,
  op_name        VARCHAR2(30),
  checkers       VARCHAR2(150),
  super_checkers VARCHAR2(150),
  approves       VARCHAR2(150),
  nextchecker    VARCHAR2(150)
);
alter table NIS_WAGE
  add constraint PK_NIS_WAGE primary key (WAGE_NO);
-- Add comments to the table 
comment on table NIS_WAGE
  is '�������ʱ�';
-- Add comments to the columns 
comment on column NIS_WAGE.wage_no
  is '���ʱ��';
comment on column NIS_WAGE.wage_title
  is '���ʱ���';
comment on column NIS_WAGE.corp_code
  is '���λ';
comment on column NIS_WAGE.payer_acc
  is '�����˺�';
comment on column NIS_WAGE.payer_bank
  is '�������';
comment on column NIS_WAGE.bank_type
  is '�������';
comment on column NIS_WAGE.wages
  is '�����ܶ�';
comment on column NIS_WAGE.wageday
  is '���ʷ�������';
comment on column NIS_WAGE.wish_payday
  is '����֧������';
comment on column NIS_WAGE.status
  is '״̬ 0���ݴ棻11����������-1����أ�95������ͨ��';
comment on column NIS_WAGE.voucher_stat
  is '����״̬ ��bis_voucher_stat��';
comment on column NIS_WAGE.billcode
  is '������';
comment on column NIS_WAGE.op
  is '������Աcode';
comment on column NIS_WAGE.enter_date
  is '¼��ʱ��';
comment on column NIS_WAGE.op_name
  is '����������';
comment on column NIS_WAGE.checkers
  is '������Ա';
comment on column NIS_WAGE.super_checkers
  is '�ϼ�������';
comment on column NIS_WAGE.approves
  is '�Ѿ�������';
comment on column NIS_WAGE.nextchecker
  is '��һ��������';


--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ��½����ʵ���ϸ��
--�������ã�
create table NIS_WAGE_DETAIL
(
  wage_dtl_no  CHAR(10) not null,
  user_name    VARCHAR2(50),
  empno        VARCHAR2(50),
  bank_acc     VARCHAR2(30),
  bank_type    CHAR(4),
  wages        NUMBER(15,2),
  wage_no      CHAR(12),
  bill_no      CHAR(12),
  status       INTEGER,
  voucher_stat CHAR(1),
  purpose      VARCHAR2(10),
  rmk          VARCHAR2(100),
  verify       VARCHAR2(32),
  voucher_no   VARCHAR2(12),
  reverse1     VARCHAR2(100),
  reverse2     VARCHAR2(100),
  reverse3     VARCHAR2(100),
  reverse4     VARCHAR2(100),
  reverse5     VARCHAR2(100)
);
alter table NIS_WAGE_DETAIL
  add constraint PK_NIS_WAGE_DETAIL primary key (WAGE_DTL_NO);
-- Add comments to the table 
comment on table NIS_WAGE_DETAIL
  is '����������ϸ��';
-- Add comments to the columns 
comment on column NIS_WAGE_DETAIL.wage_dtl_no
  is '������ϸ���';
comment on column NIS_WAGE_DETAIL.user_name
  is '����';
comment on column NIS_WAGE_DETAIL.empno
  is '����';
comment on column NIS_WAGE_DETAIL.bank_acc
  is '�����˺�';
comment on column NIS_WAGE_DETAIL.bank_type
  is '�������';
comment on column NIS_WAGE_DETAIL.wages
  is 'ʵ������';
comment on column NIS_WAGE_DETAIL.wage_no
  is '�������ʱ�ţ�nis_wage��';
comment on column NIS_WAGE_DETAIL.bill_no
  is '����ţ�nis_billhead��';
comment on column NIS_WAGE_DETAIL.status
  is '״̬ 0���ݴ棻11����������-1����أ�95������ͨ��';
comment on column NIS_WAGE_DETAIL.voucher_stat
  is '����״̬ ��bis_voucher_stat��';
comment on column NIS_WAGE_DETAIL.purpose
  is '��;��nis_wage_purpose��';
comment on column NIS_WAGE_DETAIL.rmk
  is '��ע';
comment on column NIS_WAGE_DETAIL.verify
  is '�����˺�+ʵ������MD5����';
comment on column NIS_WAGE_DETAIL.voucher_no
  is '����ָ��� (voucher_no)';
comment on column NIS_WAGE_DETAIL.reverse1
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL.reverse2
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL.reverse3
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL.reverse4
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL.reverse5
  is '�����ֶ�';


--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ��½�������;��
--�������ã�
create table NIS_WAGE_PURPOSE
(
  code    VARCHAR2(10) not null,
  purpose VARCHAR2(100)
);
alter table NIS_WAGE_PURPOSE
  add constraint PK_NIS_WAGE_PURPOSE primary key (CODE);
-- Add comments to the table 
comment on table NIS_WAGE_PURPOSE
  is '������;��';
-- Add comments to the columns 
comment on column NIS_WAGE_PURPOSE.code
  is '��;���';
comment on column NIS_WAGE_PURPOSE.purpose
  is '��;';
  
--�޸����ڣ�20120807
--�޸��ˣ���̺�
--�޸����ݣ���ʼ��������;������
--�������ã�
--006-���ʣ�022-����047-������008-ˮ�ѣ�007-��ѣ�813-���·ѣ�080-�����ѣ�048-���ñ���
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('006','����');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('022','����');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('047','����');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('008','ˮ��');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('007','���');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('813','���·�');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('080','������');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('048','���ñ���');



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
values
  ('wageIsEncryption',
   'nis',
   '���������Ƿ������ʾʵ�����ʽ��',
   '0',
   null,
   null,
   '0',
   '0,��;1,��',
   '0,��;1,��',
   '',
   '',
   '',
   '',
   1.00,
   (select max(reverse7)+1 from bt_param where sys_code='nis'),
   null,
   null,
   null);
commit;









