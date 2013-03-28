--�޸���:���¾�
--�޸�ʱ��:2012-08-22
--�޸�����:�к����ʽ�Ԥ������µ�Ԥ������
--����ʽ�֧��Ԥ��
create table BT_WARNING_DEZJZC
(
  ID              NUMBER(10) primary key not null,
  STRATEGY_CODE   VARCHAR2(10),
  RUN_TIME        DATE,
  SCAN_DATE_BEGIN DATE,
  SCAN_DATE_END   DATE,
  CORP_CODE       VARCHAR2(4),
  BILL_CODE       VARCHAR2(50),
  AMT             NUMBER(15,2),
  TRANS_DATE      DATE,
  ABS             VARCHAR2(200),
  PAYEE_NAME      VARCHAR2(50),
  STRATEGY_MONEY  NUMBER(15,2),
  CREATE_TIME     DATE,
  STATE           CHAR(1)
);
-- Add comments to the columns 
comment on column BT_WARNING_DEZJZC.ID  is '��������';
comment on column BT_WARNING_DEZJZC.STRATEGY_CODE  is '���Դ���';
comment on column BT_WARNING_DEZJZC.RUN_TIME  is '����ʱ��';
comment on column BT_WARNING_DEZJZC.SCAN_DATE_BEGIN  is 'ɨ�跶Χ��';
comment on column BT_WARNING_DEZJZC.SCAN_DATE_END  is 'ɨ�跶Χֹ';
comment on column BT_WARNING_DEZJZC.CORP_CODE  is '��˾����';
comment on column BT_WARNING_DEZJZC.BILL_CODE  is '��ϸ����';
comment on column BT_WARNING_DEZJZC.AMT  is '���';
comment on column BT_WARNING_DEZJZC.TRANS_DATE  is '��������';
comment on column BT_WARNING_DEZJZC.ABS  is '��;';
comment on column BT_WARNING_DEZJZC.PAYEE_NAME  is '�տ���';
comment on column BT_WARNING_DEZJZC.STRATEGY_MONEY  is '�����޶�';
comment on column BT_WARNING_DEZJZC.CREATE_TIME  is '����ʱ��';
comment on column BT_WARNING_DEZJZC.STATE  is '���������0δ������ʼֵ 1������ 2�Ѿ��� 3δ���� '; 
  
--ʮ��Ԫ������֧��Ԥ��

create table BT_WARNING_SWYZSB
(
  ID              NUMBER(10) primary key not null,
  STRATEGY_CODE   VARCHAR2(10),
  RUN_TIME        DATE,
  SCAN_DATE_BEGIN DATE,
  SCAN_DATE_END   DATE,
  CORP_CODE       VARCHAR2(4),
  BILL_CODE       VARCHAR2(50),
  AMT             NUMBER(15,2),
  TRANS_DATE      DATE,
  ABS             VARCHAR2(200),
  PAYEE_NAME      VARCHAR2(50),
  STRATEGY_MONEY  NUMBER(15,2),
  CREATE_TIME     DATE,
  STATE           CHAR(1)
);
-- Add comments to the columns 
comment on column BT_WARNING_SWYZSB.ID  is '��������';
comment on column BT_WARNING_SWYZSB.STRATEGY_CODE  is '���Դ���';
comment on column BT_WARNING_SWYZSB.RUN_TIME  is '����ʱ��';
comment on column BT_WARNING_SWYZSB.SCAN_DATE_BEGIN  is 'ɨ�跶Χ��';
comment on column BT_WARNING_SWYZSB.SCAN_DATE_END  is 'ɨ�跶Χֹ';
comment on column BT_WARNING_SWYZSB.CORP_CODE  is '��˾����';
comment on column BT_WARNING_SWYZSB.BILL_CODE  is '��ϸ����';
comment on column BT_WARNING_SWYZSB.AMT  is '���';
comment on column BT_WARNING_SWYZSB.TRANS_DATE  is '��������';
comment on column BT_WARNING_SWYZSB.ABS  is '��;';
comment on column BT_WARNING_SWYZSB.PAYEE_NAME  is '�տ���';
comment on column BT_WARNING_SWYZSB.STRATEGY_MONEY  is '�����޶�';
comment on column BT_WARNING_SWYZSB.CREATE_TIME  is '����ʱ��';
comment on column BT_WARNING_SWYZSB.STATE  is '���������0δ������ʼֵ 1������ 2�Ѿ��� 3δ���� '; 
 


--֧��������

--֧��������

create table BT_WARNING_ZCHLR
(
  ID              NUMBER(10) primary key not null,
  STRATEGY_CODE   VARCHAR2(10),
  RUN_TIME        DATE,
  SCAN_DATE_BEGIN DATE,
  SCAN_DATE_END   DATE,
  CORP_CODE       VARCHAR2(4),
  ALL_COUNT       NUMBER,
  WARNING_COUNT   NUMBER,
  CREATE_TIME     DATE,
  STATE           CHAR(1)
);
-- Add comments to the columns 
comment on column BT_WARNING_ZCHLR.ID  is '����Id';
comment on column BT_WARNING_ZCHLR.STRATEGY_CODE  is '���Դ���';
comment on column BT_WARNING_ZCHLR.RUN_TIME  is '����ʱ��';
comment on column BT_WARNING_ZCHLR.SCAN_DATE_BEGIN  is 'ɨ�跶Χ��';
comment on column BT_WARNING_ZCHLR.SCAN_DATE_END  is 'ɨ�跶Χֹ';
comment on column BT_WARNING_ZCHLR.CORP_CODE  is '��˾����';
comment on column BT_WARNING_ZCHLR.ALL_COUNT  is '����֧������';
comment on column BT_WARNING_ZCHLR.WARNING_COUNT  is 'Ԥ������';
comment on column BT_WARNING_ZCHLR.CREATE_TIME  is '����ʱ��';
comment on column BT_WARNING_ZCHLR.STATE  is '���������0δ������ʼֵ 1������2�Ѿ���3δ����';

create table BT_WARNING_ZCHLR_DETAIL
(
  ID         NUMBER(10) primary key not null,
  WARNING_ID NUMBER(10),
  CORP_CODE  VARCHAR2(4),
  RUN_TIME   DATE,
  TRANS_DATE DATE,
  ABS        VARCHAR2(200),
  PAYEE_NAME VARCHAR2(50),
  BANK_ACC   VARCHAR2(50),
  BILL_CODE  VARCHAR2(50),
  AMT        NUMBER(15,2),
  CUR        CHAR(2)
) ;
-- Add comments to the columns 
comment on column BT_WARNING_ZCHLR_DETAIL.ID  is '����ID';
comment on column BT_WARNING_ZCHLR_DETAIL.WARNING_ID  is '������ID';
comment on column BT_WARNING_ZCHLR_DETAIL.CORP_CODE  is '��˾����';
comment on column BT_WARNING_ZCHLR_DETAIL.RUN_TIME  is '����ʱ��';
comment on column BT_WARNING_ZCHLR_DETAIL.TRANS_DATE  is '��������';
comment on column BT_WARNING_ZCHLR_DETAIL.ABS  is '��;';
comment on column BT_WARNING_ZCHLR_DETAIL.PAYEE_NAME  is '�Է���λ';
comment on column BT_WARNING_ZCHLR_DETAIL.BANK_ACC  is '�˺�';
comment on column BT_WARNING_ZCHLR_DETAIL.BILL_CODE  is '��ϸ����';
comment on column BT_WARNING_ZCHLR_DETAIL.AMT  is '���׽��';
comment on column BT_WARNING_ZCHLR_DETAIL.CUR  is '�ұ�';


--ΪԤ����������˻������ֶ�
alter table BT_WARNING_STRATEGY add ACC_NATURE_IDS varchar2(255); 

--ΪԤ����ϸ��Ӱ���������
alter table BT_WARNING_STRATEGY_DETAIL ADD RMK_OPERATOR varchar2(4);

comment on column BT_WARNING_STRATEGY.ACC_NATURE_IDS is '�˻�����'; 

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
values ('01', 'Ԥ�����', '09', '����˻�֧��', '������ϸ���');

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
values ('01', 'Ԥ�����', '10', '��Ԫ������֧��', '������ϸ���');

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
values ('01', 'Ԥ�����', '11', '֧��������', '������ϸժҪ'); 


----������

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_DEZJZC_ID',1);

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_SWYZSB_ID',1);

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_ZCHLR_ID',1);

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_ZCHLR_DETAIL_ID',1);

--ע��Ԥ�����͵�ɨ������

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
values ((select max(id) + 1 from BT_WARNING_SCAN) , '09', to_date('2012-04-10', 'yyyy-MM-dd'), '2', 1, '0', 0, '1', to_date('2012-04-10', 'yyyy-MM-dd'));

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
values ((select max(id) + 1 from BT_WARNING_SCAN) , '10', to_date('2012-04-10', 'yyyy-MM-dd'), '2', 1, '0', 0, '1', to_date('2012-04-10', 'yyyy-MM-dd'));

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
values ((select max(id) + 1 from BT_WARNING_SCAN) , '11', to_date('2012-04-10', 'yyyy-MM-dd'), '2', 1, '0', 0, '1', to_date('2012-04-10', 'yyyy-MM-dd'));

---����˵�

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '����˻�֧��', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'||chr(38)||'viewType=9', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), 'ʮ��Ԫ������֧��', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'||chr(38)||'viewType=10', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '֧��������', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'||chr(38)||'viewType=11', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;


--ϵͳ���� --���뻧  
--ADD BY PUYJ 2012-08-29 18:57:27 ������뻧�������
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('PayOutAccType', 'adm', '���뻧����', '200', null, null, '', '', '', '', '', '', '', null, null, null, null, null);

update BT_WARNING_DICTIONARY b set CODE_NAME = 'ʮ��Ԫ������֧��' where b.class_name = 'Ԥ�����' and b.code = '10' ;

commit;

---���뻧�޸ĳ�Ϊ֧����
--- add by puyj 2012-08-30 09:21:36 �޸����뻧����Ϊ֧��������
UPDATE BT_PARAM P SET P.NAME = '֧��������' where p.sys_code ='adm' and p.code = 'PayOutAccType'; 
commit;

---���Ԥ���޶�˵���ַ���
-- add by puyj 2012-08-31 16:42:46
ALTER TABLE BT_WARNING_DEZJZC ADD  STRATEGY_DETAIL_STR VARCHAR2(40);

comment on column BT_WARNING_DEZJZC.STRATEGY_DETAIL_STR
  is 'Ԥ���޶�˵��';

ALTER TABLE BT_WARNING_SWYZSB ADD  STRATEGY_DETAIL_STR VARCHAR2(40);

comment on column BT_WARNING_SWYZSB.STRATEGY_DETAIL_STR
  is 'Ԥ���޶�˵��';










