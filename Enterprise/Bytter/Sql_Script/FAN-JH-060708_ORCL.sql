--���������빦��
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER����������ά����                   */
/*==============================================================*/
DECLARE
  tb_exists NUMBER; 
BEGIN
  SELECT COUNT(*) INTO tb_exists FROM tabs WHERE table_name='ERP_PROFIT_CENTER';
   IF tb_exists <> 0 THEN
     EXECUTE IMMEDIATE 'DROP TABLE ERP_PROFIT_CENTER cascade constraints';
   END IF;
END;
/
create table ERP_PROFIT_CENTER(  
   ID                   NUMBER(30),
   PROFIT_CENTER_CODE   VARCHAR2(100),
   PROFIT_CENTER_NAME   VARCHAR2(100),
   CORP_CODE            CHAR(4),
   RMK                  VARCHAR2(100)
);
alter table ERP_PROFIT_CENTER add  constraint PK_ERP_PROFIT_CENTER primary key (ID);
comment on table ERP_PROFIT_CENTER is '��������ά����';
comment on column ERP_PROFIT_CENTER.ID is '���';
comment on column ERP_PROFIT_CENTER.PROFIT_CENTER_CODE is '�������ı���';
comment on column ERP_PROFIT_CENTER.PROFIT_CENTER_NAME is '������������';
comment on column ERP_PROFIT_CENTER.CORP_CODE is '��˾����';
comment on column ERP_PROFIT_CENTER.RMK is '��ע';
/*==============================================================*/
/* Menu:�������ĵ���˵�                                        */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '�������ĵ���' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '�������ĵ���', 'exchange',   
             (select res_code from bt_sys_res where res_name='���ݴ���' and sys_code='exchange'), 
             '/netbank/profitCenterImport.do?method=toSelectCorp', '0', '1', '0', '0', 3, '', 2, '');
   END IF;
END;
/
/*==============================================================*/
/* ����:�������ı������                                        */
/*==============================================================*/
DECLARE
   id_exists number;
begin
   SELECT COUNT(*)
    INTO id_exists 
    FROM tb_generator
   WHERE gen_name = 'ERP_PROFIT_CENTER_ID';
   IF id_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)values((select max(id) from tb_generator)+1,'ERP_PROFIT_CENTER_ID',1000);
   END IF;
END;
/
COMMIT;


--�����ֵ�ά������
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER����������ά����                   */
/*==============================================================*/
DECLARE
  tb_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO tb_exists FROM tabs WHERE table_name='BT_DICTIONARY_TYPE';
   IF tb_exists <> 0 THEN
     EXECUTE IMMEDIATE 'DROP TABLE BT_DICTIONARY_TYPE cascade constraints';
   END IF;
END;
/
create table BT_DICTIONARY_TYPE(
   DATA_TYPE_CODE       NUMBER(10) not null,
   DATA_TYPE_NAME       varchar2(100),
   RMK                  varchar2(100)
);
alter table BT_DICTIONARY_TYPE add constraint PK_BT_DICTIONARY_TYPE primary key (DATA_TYPE_CODE);
comment on table BT_DICTIONARY_TYPE is
'�����ֵ�--�������ͱ�';

comment on column BT_DICTIONARY_TYPE.DATA_TYPE_CODE is
'10:��������
11:���˿�Ŀ
12:Ԥ�����
13:������
14:�ر����˱�ʶ
15:��������
16:˰��
17:ԭ�����';
comment on column BT_DICTIONARY_TYPE.DATA_TYPE_NAME is '������������';
comment on column BT_DICTIONARY_TYPE.RMK is '��ע';

--��ʼ���������ֵ��������ͱ�����
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('10','��������','��������,�����˺Ź���');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('11','���˿�Ŀ','���˿�Ŀ,ERPϵͳ��������');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('12','Ԥ�����','Ԥ�����,ERPϵͳ��������');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('13','������','������,ERPϵͳ��������');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('14','�ر����˱�ʶ','�ر����˱�ʶ,ERPϵͳ��������');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('15','��������','��������,ERPϵͳ��������');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('16','˰��','˰��,ERPϵͳ��������');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('17','ԭ�����','ԭ�����,ERPϵͳ��������');
commit;







--ģ�涨��
/*==============================================================*/ 
/* 1.Table: ERP_TEMPLATE_DATADEFINE��ƾ֤ģ�����ݶ����       */
/*==============================================================*/
DECLARE 
   tb_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DATADEFINE';
   IF tb_exists <> 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE_DATADEFINE cascade constraints';
   END IF;
END;
/
create table ERP_TEMPLATE_DATADEFINE  (
   ID                   NUMBER not null,
   FIELD_CODE           VARCHAR2(100),
   FIELD_NAME           VARCHAR2(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR2(100),
   IS_TEMPLATE_DTL      CHAR(1),
   constraint PK_ERP_TEMPLATE_DATADEFINE primary key (ID)
);
--�ֶ�ע��
comment on table ERP_TEMPLATE_DATADEFINE is 'ƾ֤ģ�����ݶ����';
comment on column ERP_TEMPLATE_DATADEFINE.ID is '���';
comment on column ERP_TEMPLATE_DATADEFINE.FIELD_CODE is '�ֶ�Ӣ����';
comment on column ERP_TEMPLATE_DATADEFINE.FIELD_NAME is '�ֶ�������';
comment on column ERP_TEMPLATE_DATADEFINE.IS_SHOW is '�Ƿ���ʾ  0,�� 1,��';
comment on column ERP_TEMPLATE_DATADEFINE.IS_NOT_NULL is '�Ƿ���� 0,�� 1,��';
comment on column ERP_TEMPLATE_DATADEFINE.SHOW_NAME is '��ʾ����';
comment on column ERP_TEMPLATE_DATADEFINE.IS_TEMPLATE_DTL is '�Ƿ�ƾ֤��¼�ֶ�    0;��   1:��';
--��ʼ����ƾ֤ģ�����ݶ��������
insert into ERP_TEMPLATE_DATADEFINE values(1,'VOUCHER_TYPE_CODE','ƾ֤���','0','0','ƾ֤���','0');
insert into ERP_TEMPLATE_DATADEFINE values(2,'REFER_CODE','�ο�ƾ֤���','0','0','�ο�ƾ֤���','0');
insert into ERP_TEMPLATE_DATADEFINE values(3,'VOUCHER_PRE_TEXT','ƾ̧֤ͷ�ı�','0','0','ƾ̧֤ͷ�ı�','0');
insert into ERP_TEMPLATE_DATADEFINE values(4,'ITEM_CODE','Ԥ���Ŀ','0','0','Ԥ���Ŀ','0');
insert into ERP_TEMPLATE_DATADEFINE values(5,'REFER','����','0','0','����','0');
insert into ERP_TEMPLATE_DATADEFINE values(6,'ABS','ժҪ','0','0','ժҪ','0');
insert into ERP_TEMPLATE_DATADEFINE values(7,'PURPOSE','��;','0','0','��;','0');
insert into ERP_TEMPLATE_DATADEFINE values(8,'PAY_TYPE','���㷽ʽ','0','0','���㷽ʽ','0');
insert into ERP_TEMPLATE_DATADEFINE values(9,'REVERSE1','�Զ���һ','0','0','�Զ���һ','0');
insert into ERP_TEMPLATE_DATADEFINE values(10,'REVERSE2','�Զ����','0','0','�Զ����','0');
insert into ERP_TEMPLATE_DATADEFINE values(11,'SUBJECT_CODE','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(12,'SUBJECT_NAME','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(13,'SUBJECT_CLASS','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(14,'SUBJECT_TYPE','��Ŀ����','0','0','��Ŀ����','1');
insert into ERP_TEMPLATE_DATADEFINE values(15,'COST_CENTER_CODE','�ɱ�����','0','0','�ɱ�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(16,'CASH_FLOW_CODE','�ֽ�������','0','0','�ֽ�������','1');
insert into ERP_TEMPLATE_DATADEFINE values(17,'ACCOUNT_CODE','���˴���','0','0','���˴���','1');
insert into ERP_TEMPLATE_DATADEFINE values(18,'ACCOUNT_TYPE','�˻�����','0','0','�˻�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(19,'DTL_ABS','ժҪ','0','0','ժҪ','1');
insert into ERP_TEMPLATE_DATADEFINE values(20,'PAYMENT_REASON_CODE','����ԭ�����','0','0','����ԭ�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(21,'LEDGER_SIGN','���˱�ʶ','0','0','���˱�ʶ','1');
insert into ERP_TEMPLATE_DATADEFINE values(22,'TRANS_TYPE','��������','0','0','��������','1');
insert into ERP_TEMPLATE_DATADEFINE values(23,'ASSIGN','����','0','0','����','1');
insert into ERP_TEMPLATE_DATADEFINE values(24,'TRADE_PARTNER','ó�׻��','0','0','ó�׻��','1');
insert into ERP_TEMPLATE_DATADEFINE values(25,'TAX_CODE','˰��','0','0','˰��','1');
insert into ERP_TEMPLATE_DATADEFINE values(26,'DTL_ITEM_CODE','Ԥ�����','0','0','Ԥ�����','1');
insert into ERP_TEMPLATE_DATADEFINE values(27,'DTL_REVERSE1','�Զ���һ','0','0','�Զ���һ','1');
insert into ERP_TEMPLATE_DATADEFINE values(28,'DTL_REVERSE2','�Զ����','0','0','�Զ����','1');



/*==============================================================*/
/* 2.Table: ERP_TEMPLATE_DATADEFINE��ģ�����ͱ�               */
/*==============================================================*/
DECLARE
    tb_exists NUMBER;
BEGIN 
    SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE_TYPE';
    IF tb_exists <> 0 THEN
       EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE_TYPE cascade constraints';
    END IF;
END;
/
create table ERP_TEMPLATE_TYPE  (
   ID                   NUMBER(10) not null,
   TYPE_CODE            VARCHAR2(100) unique,
   TYPE_NAME            VARCHAR2(100),
   GENERAL_RANGE        NUMBER(10),
   MATCHING_FIELD       VARCHAR2(100),
   RMK                  VARCHAR2(200),
   MODIFY_DATE          DATE default SYSDATE,
   constraint PK_ERP_TEMPLATE_TYPE primary key (ID)
);
comment on table ERP_TEMPLATE_TYPE is 'ģ�����ͱ�';
comment on column ERP_TEMPLATE_TYPE.TYPE_CODE is 'ģ�����ͱ���';
comment on column ERP_TEMPLATE_TYPE.TYPE_NAME is 'ģ����������';
comment on column ERP_TEMPLATE_TYPE.GENERAL_RANGE is 
'ͨ�÷�Χ
1:���й�˾ͨ��
2:ÿ����˾��ͬ
3:�����뵥λ��ͬ';
comment on column ERP_TEMPLATE_TYPE.MATCHING_FIELD is 'ƥ���ֶ�';
comment on column ERP_TEMPLATE_TYPE.RMK is '��ע';
comment on column ERP_TEMPLATE_TYPE.MODIFY_DATE is '��������';


/*==============================================================*/
/* 3.Table: ERP_TEMPLATE_DATADEFINE��ģ�����������           */
/*==============================================================*/
DECLARE 
   tb_exists NUMBER;
BEGIN 
   SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE_TYPE_DTL';
   IF tb_exists <> 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE_TYPE_DTL cascade constraints';
   END IF;
END;
/
create table ERP_TEMPLATE_TYPE_DTL  (
   ID                   NUMBER not null,
   FIELD_CODE           VARCHAR2(100),
   FIELD_NAME           VARCHAR2(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR2(100),
   IS_TEMPLATE_DTL      CHAR(1),
   TYPE_CODE            VARCHAR2(100),
   constraint PK_ERP_TEMPLATE_TYPE_DTL primary key (ID)
);
comment on table ERP_TEMPLATE_TYPE_DTL is 'ģ�����������';
comment on column ERP_TEMPLATE_TYPE_DTL.ID is '���';
comment on column ERP_TEMPLATE_TYPE_DTL.FIELD_CODE is '�ֶ�Ӣ����';
comment on column ERP_TEMPLATE_TYPE_DTL.FIELD_NAME is '�ֶ�������';
comment on column ERP_TEMPLATE_TYPE_DTL.IS_SHOW is '�Ƿ���ʾ  0,�� 1,��';
comment on column ERP_TEMPLATE_TYPE_DTL.IS_NOT_NULL is '�Ƿ���� 0,�� 1,��';
comment on column ERP_TEMPLATE_TYPE_DTL.IS_TEMPLATE_DTL is '�Ƿ�ƾ֤��¼�ֶ�    0;��   1:��';
comment on column ERP_TEMPLATE_TYPE_DTL.TYPE_CODE is 'ģ�����ͱ��루����ERP_TEMPLATE_TYPE��';


/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_DATADEFINE��ģ������                 */
/*==============================================================*/
DECLARE 
   tb_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE';
   IF tb_exists <>0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE cascade constraints';
   END IF;
END;
/
create table ERP_TEMPLATE  (
   ID                   NUMBER(10) not null,
   CORP_CODE            VARCHAR2(4),
   REFER_CODE           VARCHAR2(100),
   VOUCHER_PRE_TEXT     VARCHAR2(100),
   REFER                VARCHAR2(100),
   PAY_TYPE             VARCHAR2(100),
   ITEM_CODE            VARCHAR2(100),
   VOUCHER_TYPE_CODE    VARCHAR2(100),
   TYPE_CODE            VARCHAR2(100),
   TEMPLATE_NAME        VARCHAR2(100),
   TEMPLATE_CODE        VARCHAR2(100),
   ABS                  VARCHAR2(100),
   PURPOSE              VARCHAR2(100),
   RMK                  VARCHAR2(100),
   REVERSE1             VARCHAR2(100),
   REVERSE2             VARCHAR2(100),
   constraint PK_ERP_TEMPLATE primary key (ID)
);

comment on table  ERP_TEMPLATE is 'ƾ֤ģ���';
comment on column ERP_TEMPLATE.CORP_CODE is '��λ���루����BT_CORP��';
comment on column ERP_TEMPLATE.REFER_CODE is '�ο�ƾ֤���';
comment on column ERP_TEMPLATE.VOUCHER_PRE_TEXT is 'ƾ̧֤ͷ�ı�';
comment on column ERP_TEMPLATE.VOUCHER_TYPE_CODE is 'ƾ֤��𣨹���ERP_VOUCHER_TYPE��';
comment on column ERP_TEMPLATE.TYPE_CODE is 'ģ�����ͱ��루����ERP_TEMPLATE_TYPE��';
comment on column ERP_TEMPLATE.TEMPLATE_NAME is 'ģ������';
comment on column ERP_TEMPLATE.TEMPLATE_CODE is 'ģ�����';
comment on column ERP_TEMPLATE.ABS is 'ժҪ';
comment on column ERP_TEMPLATE.PURPOSE is '��;';
comment on column ERP_TEMPLATE.RMK is '��ע';
comment on column ERP_TEMPLATE.REVERSE1 is '�Զ���һ';
comment on column ERP_TEMPLATE.REVERSE2 is '�Զ����';


/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DATADEFINE��ģ���¼��               */
/*==============================================================*/
DECLARE 
   tb_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DTL';
   IF tb_exists <>0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE_DTL cascade constraints';
   END IF;
END;
/
create table ERP_TEMPLATE_DTL  (
   ID                   NUMBER(10)                      not null,
   TEMPLATE_ID          NUMBER(10),
   ENTRY_CODE           VARCHAR2(100),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR2(100),
   SUBJECT_NAME         VARCHAR2(100),
   SUBJECT_CLASS        VARCHAR2(100),
   SUBJECT_TYPE         VARCHAR2(100),
   COST_CENTER_CODE     VARCHAR2(100),
   CASH_FLOW_CODE       VARCHAR2(100),
   ACCOUNT_CODE         VARCHAR2(100),
   ACCOUNT_TYPE         VARCHAR2(100),
   PAYMENT_REASON_CODE  VARCHAR2(100),
   LEDGER_SIGN          VARCHAR2(100),
   TRANS_TYPE           VARCHAR2(100),
   ASSIGN               VARCHAR2(100),
   TRADE_PARTNER        VARCHAR2(100),
   TAX_CODE             VARCHAR2(100),
   DTL_ITEM_CODE        VARCHAR2(100),
   DTL_REVERSE1         VARCHAR2(100),
   DTL_REVERSE2         VARCHAR2(100),
   DTL_ABS              VARCHAR2(200),
   constraint PK_ERP_TEMPLATE_DTL primary key (ID)
);
comment on table ERP_TEMPLATE_DTL is 'ƾ֤ģ���¼��';
comment on column ERP_TEMPLATE_DTL.TEMPLATE_ID is '����ERP_TEMPLATE';
comment on column ERP_TEMPLATE_DTL.ENTRY_CODE is '��¼����';
comment on column ERP_TEMPLATE_DTL.LOAN_DIRECTION is '������� 0,�� 1,��';
comment on column ERP_TEMPLATE_DTL.SUBJECT_CODE is '��Ŀ���';
comment on column ERP_TEMPLATE_DTL.SUBJECT_NAME is '��Ŀ����';
comment on column ERP_TEMPLATE_DTL.SUBJECT_CLASS is '��Ŀ����';
comment on column ERP_TEMPLATE_DTL.SUBJECT_TYPE is '��Ŀ����';
comment on column ERP_TEMPLATE_DTL.COST_CENTER_CODE is '�ɱ����� ȡ��ERP_COST_CENTER';
comment on column ERP_TEMPLATE_DTL.CASH_FLOW_CODE is '�ֽ���������';
comment on column ERP_TEMPLATE_DTL.ACCOUNT_CODE is '���˴���  bt_dictionary��  class=13';
comment on column ERP_TEMPLATE_DTL.ACCOUNT_TYPE is '�˻�����';
comment on column ERP_TEMPLATE_DTL.PAYMENT_REASON_CODE is '����ԭ�����  bt_dictionary��  class=17';
comment on column ERP_TEMPLATE_DTL.LEDGER_SIGN is '���˱�ʶ  bt_dictionary��  class=14';
comment on column ERP_TEMPLATE_DTL.TRANS_TYPE is '��������  bt_dictionary��  class=15';
comment on column ERP_TEMPLATE_DTL.ASSIGN is '����';
comment on column ERP_TEMPLATE_DTL.TRADE_PARTNER is 'ó�׻��';
comment on column ERP_TEMPLATE_DTL.TAX_CODE is '˰��  bt_dictionary��  class=16';
comment on column ERP_TEMPLATE_DTL.DTL_ITEM_CODE is 'Ԥ�����  bt_dictionary��  class=12';
comment on column ERP_TEMPLATE_DTL.DTL_REVERSE1 is '�Զ���һ';
comment on column ERP_TEMPLATE_DTL.DTL_REVERSE2 is '�Զ����';
comment on column ERP_TEMPLATE_DTL.DTL_ABS is 'ժҪ';


--��ʼ���˵�
/*==============================================================*/
/* Menu:ģ������ά���������˵���                                */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '���ݷ���' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '���ݷ���', 'exchange',0, 
             '', '0', '0', '0', '0', 3, '���ݷ���', 1, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:ģ������ά���������˵���                                */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = 'ģ�涨��' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             'ģ�涨��', 'exchange',   
             (select res_code from bt_sys_res where res_name='���ݷ���' and sys_code='exchange'), 
             '', '0', '1', '0', '0', 1, 'ģ�涨��', 2, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:ģ������ά�����ļ��˵���                                */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = 'ģ��ά��' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             'ģ��ά��', 'exchange',   
             (select res_code from bt_sys_res where res_name='ģ�涨��' and sys_code='exchange'), 
             '/dataExchange/erpTemplate.do?method=initContent', '0', '1', '0', '0', 2, '', 3, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:ģ��ά�����ļ��˵���                                    */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = 'ģ������ά��' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             'ģ������ά��', 'exchange',   
             (select res_code from bt_sys_res where res_name='ģ�涨��' and sys_code='exchange'), 
             '/dataExchange/erpTemplateType.do?method=initContent', '0', '1', '0', '0', 1, '', 3, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:��������                                                */
/*==============================================================*/
DECLARE 
   record_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO record_exists FROM tb_generator t where t.gen_name='erptemplatetypedetailid';
   IF record_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatetypedetailid',
             '100'
      );    
   END IF;
END;
/
DECLARE 
   record_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO record_exists FROM tb_generator t where t.gen_name='erptemplatetypeid';
   IF record_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatetypeid',
             '100'
      );    
   END IF;
END;
/
DECLARE 
   record_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO record_exists FROM tb_generator t where t.gen_name='erptemplateid';
   IF record_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplateid',
             '100'
      );    
   END IF;
END;
/
DECLARE 
   record_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO record_exists FROM tb_generator t where t.gen_name='erptemplatedetailid';
   IF record_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatedetailid',
             '100'
      );    
   END IF;
END;
/
COMMIT;







--���پ� 
--����
--����ģ��ƥ��
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'TEMPLATE_ID_1';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add TEMPLATE_ID_1 NUMBER(10)';
     END IF;
  END;
/
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'TEMPLATE_ID_2';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add TEMPLATE_ID_2 NUMBER(10)';
     END IF;
  END;
/
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'COST_CENTER_CODE';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add COST_CENTER_CODE VARCHAR2(20)';
     END IF;
  END;
/

/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_STORE��ģ������                 */
/*==============================================================*/
DECLARE 
   tb_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE_STORE';
   IF tb_exists <>0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE_STORE cascade constraints';
   END IF;
END;
/
create table ERP_TEMPLATE_STORE  (
   ID                   NUMBER(10) not null,
   CORP_CODE            VARCHAR2(4),
   REFER_CODE           VARCHAR2(100),
   VOUCHER_PRE_TEXT     VARCHAR2(100),
   REFER                VARCHAR2(100),
   PAY_TYPE             VARCHAR2(100),
   ITEM_CODE            VARCHAR2(100),
   VOUCHER_TYPE_CODE    VARCHAR2(100),
   TYPE_CODE            VARCHAR2(100),
   TEMPLATE_NAME        VARCHAR2(100),
   TEMPLATE_CODE        VARCHAR2(100),
   ABS                  VARCHAR2(100),
   PURPOSE              VARCHAR2(100),
   RMK                  VARCHAR2(100),
   REVERSE1             VARCHAR2(100),
   REVERSE2             VARCHAR2(100),
   TEMPLATE_ID			NUMBER(10),
   constraint PK_ERP_TEMPLATE_STORE primary key (ID)
);

comment on table  ERP_TEMPLATE_STORE is 'ƾ֤ģ���';
comment on column ERP_TEMPLATE_STORE.CORP_CODE is '��λ���루����BT_CORP��';
comment on column ERP_TEMPLATE_STORE.REFER_CODE is '�ο�ƾ֤���';
comment on column ERP_TEMPLATE_STORE.VOUCHER_PRE_TEXT is 'ƾ̧֤ͷ�ı�';
comment on column ERP_TEMPLATE_STORE.VOUCHER_TYPE_CODE is 'ƾ֤��𣨹���ERP_VOUCHER_TYPE��';
comment on column ERP_TEMPLATE_STORE.TYPE_CODE is 'ģ�����ͱ��루����ERP_TEMPLATE_TYPE��';
comment on column ERP_TEMPLATE_STORE.TEMPLATE_NAME is 'ģ������';
comment on column ERP_TEMPLATE_STORE.TEMPLATE_CODE is 'ģ�����';
comment on column ERP_TEMPLATE_STORE.ABS is 'ժҪ';
comment on column ERP_TEMPLATE_STORE.PURPOSE is '��;';
comment on column ERP_TEMPLATE_STORE.RMK is '��ע';
comment on column ERP_TEMPLATE_STORE.REVERSE1 is '�Զ���һ';
comment on column ERP_TEMPLATE_STORE.REVERSE2 is '�Զ����';


/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DTL_STORE��ģ���¼��               */
/*==============================================================*/
DECLARE 
   tb_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO tb_exists FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DTL_STORE';
   IF tb_exists <>0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ERP_TEMPLATE_DTL_STORE cascade constraints';
   END IF;
END;
/
create table ERP_TEMPLATE_DTL_STORE  (
   ID                   NUMBER(10)                      not null,
   TEMPLATE_ID          NUMBER(10),
   ENTRY_CODE           VARCHAR2(100),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR2(100),
   SUBJECT_NAME         VARCHAR2(100),
   SUBJECT_CLASS        VARCHAR2(100),
   SUBJECT_TYPE         VARCHAR2(100),
   COST_CENTER_CODE     VARCHAR2(100),
   CASH_FLOW_CODE       VARCHAR2(100),
   ACCOUNT_CODE         VARCHAR2(100),
   ACCOUNT_TYPE         VARCHAR2(100),
   PAYMENT_REASON_CODE  VARCHAR2(100),
   LEDGER_SIGN          VARCHAR2(100),
   TRANS_TYPE           VARCHAR2(100),
   ASSIGN               VARCHAR2(100),
   TRADE_PARTNER        VARCHAR2(100),
   TAX_CODE             VARCHAR2(100),
   DTL_ITEM_CODE        VARCHAR2(100),
   DTL_REVERSE1         VARCHAR2(100),
   DTL_REVERSE2         VARCHAR2(100),
   DTL_ABS              VARCHAR2(200),
   constraint PK_ERP_TEMPLATE_DTL_STORE primary key (ID)
);
comment on table ERP_TEMPLATE_DTL_STORE is 'ƾ֤ģ���¼��';
comment on column ERP_TEMPLATE_DTL_STORE.TEMPLATE_ID is '����ERP_TEMPLATE';
comment on column ERP_TEMPLATE_DTL_STORE.ENTRY_CODE is '��¼����';
comment on column ERP_TEMPLATE_DTL_STORE.LOAN_DIRECTION is '������� 0,�� 1,��';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_CODE is '��Ŀ���';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_NAME is '��Ŀ����';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_CLASS is '��Ŀ����';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_TYPE is '��Ŀ����';
comment on column ERP_TEMPLATE_DTL_STORE.COST_CENTER_CODE is '�ɱ����� ȡ��ERP_COST_CENTER';
comment on column ERP_TEMPLATE_DTL_STORE.CASH_FLOW_CODE is '�ֽ���������';
comment on column ERP_TEMPLATE_DTL_STORE.ACCOUNT_CODE is '���˴���  bt_dictionary��  class=13';
comment on column ERP_TEMPLATE_DTL_STORE.ACCOUNT_TYPE is '�˻�����';
comment on column ERP_TEMPLATE_DTL_STORE.PAYMENT_REASON_CODE is '����ԭ�����  bt_dictionary��  class=17';
comment on column ERP_TEMPLATE_DTL.LEDGER_SIGN is '���˱�ʶ  bt_dictionary��  class=14';
comment on column ERP_TEMPLATE_DTL_STORE.TRANS_TYPE is '��������  bt_dictionary��  class=15';
comment on column ERP_TEMPLATE_DTL_STORE.ASSIGN is '����';
comment on column ERP_TEMPLATE_DTL_STORE.TRADE_PARTNER is 'ó�׻��';
comment on column ERP_TEMPLATE_DTL_STORE.TAX_CODE is '˰��  bt_dictionary��  class=16';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_ITEM_CODE is 'Ԥ�����  bt_dictionary��  class=12';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_REVERSE1 is '�Զ���һ';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_REVERSE2 is '�Զ����';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_ABS is 'ժҪ';




DECLARE 
   record_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO record_exists FROM tb_generator t where t.gen_name='erptemplatestoreid';
   IF record_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatestoreid',
             '100'
      );    
   END IF;
END;
/
DECLARE 
   record_exists NUMBER;
BEGIN
   SELECT COUNT(*) INTO record_exists FROM tb_generator t where t.gen_name='erptemplatedetailstoreid';
   IF record_exists = 0 THEN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatedetailstoreid',
             '100'
      );    
   END IF;
END;
/
COMMIT;