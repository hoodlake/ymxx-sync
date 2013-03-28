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
   REFER_CODE           VARCHAR2(32),
   VOUCHER_PRE_TEXT     VARCHAR2(60),
   REFER                VARCHAR2(50),
   PAY_TYPE             VARCHAR2(4),
   ITEM_CODE            VARCHAR2(40),
   VOUCHER_TYPE_CODE    CHAR(2),
   TYPE_CODE            VARCHAR2(32),
   TEMPLATE_NAME        VARCHAR2(32),
   TEMPLATE_CODE        VARCHAR2(32),
   ABS                  VARCHAR2(100),
   PURPOSE              VARCHAR2(100),
   RMK                  VARCHAR2(100),
   REVERSE1             VARCHAR2(100),
   REVERSE2             VARCHAR2(100),
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
   ENTRY_CODE           VARCHAR2(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR2(60),
   SUBJECT_NAME         VARCHAR2(100),
   SUBJECT_CLASS        VARCHAR2(100),
   SUBJECT_TYPE         VARCHAR2(100),
   COST_CENTER_CODE     VARCHAR2(20),
   CASH_FLOW_CODE       VARCHAR2(100),
   ACCOUNT_CODE         VARCHAR2(50),
   ACCOUNT_TYPE         VARCHAR2(100),
   PAYMENT_REASON_CODE  VARCHAR2(50),
   LEDGER_SIGN          VARCHAR2(50),
   TRANS_TYPE           VARCHAR2(50),
   ASSIGN               VARCHAR2(100),
   TRADE_PARTNER        VARCHAR2(100),
   TAX_CODE             VARCHAR2(50),
   DTL_ITEM_CODE        VARCHAR2(50),
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
comment on column ERP_TEMPLATE_DTL_STORE.LEDGER_SIGN is '���˱�ʶ  bt_dictionary��  class=14';
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




