--张少举 
--新增
--付款模版匹配
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
/* 4.Table: ERP_TEMPLATE_STORE（模版主表）                 */
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

comment on table  ERP_TEMPLATE_STORE is '凭证模版表';
comment on column ERP_TEMPLATE_STORE.CORP_CODE is '单位编码（关联BT_CORP）';
comment on column ERP_TEMPLATE_STORE.REFER_CODE is '参考凭证编号';
comment on column ERP_TEMPLATE_STORE.VOUCHER_PRE_TEXT is '凭证抬头文本';
comment on column ERP_TEMPLATE_STORE.VOUCHER_TYPE_CODE is '凭证类别（关联ERP_VOUCHER_TYPE）';
comment on column ERP_TEMPLATE_STORE.TYPE_CODE is '模版类型编码（关联ERP_TEMPLATE_TYPE）';
comment on column ERP_TEMPLATE_STORE.TEMPLATE_NAME is '模版名称';
comment on column ERP_TEMPLATE_STORE.TEMPLATE_CODE is '模版编码';
comment on column ERP_TEMPLATE_STORE.ABS is '摘要';
comment on column ERP_TEMPLATE_STORE.PURPOSE is '用途';
comment on column ERP_TEMPLATE_STORE.RMK is '备注';
comment on column ERP_TEMPLATE_STORE.REVERSE1 is '自定义一';
comment on column ERP_TEMPLATE_STORE.REVERSE2 is '自定义二';


/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DTL_STORE（模版分录表）               */
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
comment on table ERP_TEMPLATE_DTL_STORE is '凭证模版分录表';
comment on column ERP_TEMPLATE_DTL_STORE.TEMPLATE_ID is '关联ERP_TEMPLATE';
comment on column ERP_TEMPLATE_DTL_STORE.ENTRY_CODE is '分录编码';
comment on column ERP_TEMPLATE_DTL_STORE.LOAN_DIRECTION is '借贷方向 0,借 1,贷';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_CODE is '科目编号';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_NAME is '科目名称';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_CLASS is '科目大类';
comment on column ERP_TEMPLATE_DTL_STORE.SUBJECT_TYPE is '科目类型';
comment on column ERP_TEMPLATE_DTL_STORE.COST_CENTER_CODE is '成本中心 取数ERP_COST_CENTER';
comment on column ERP_TEMPLATE_DTL_STORE.CASH_FLOW_CODE is '现金流量代码';
comment on column ERP_TEMPLATE_DTL_STORE.ACCOUNT_CODE is '记账代码  bt_dictionary表  class=13';
comment on column ERP_TEMPLATE_DTL_STORE.ACCOUNT_TYPE is '账户类型';
comment on column ERP_TEMPLATE_DTL_STORE.PAYMENT_REASON_CODE is '付款原因代码  bt_dictionary表  class=17';
comment on column ERP_TEMPLATE_DTL_STORE.LEDGER_SIGN is '总账标识  bt_dictionary表  class=14';
comment on column ERP_TEMPLATE_DTL_STORE.TRANS_TYPE is '事物类型  bt_dictionary表  class=15';
comment on column ERP_TEMPLATE_DTL_STORE.ASSIGN is '分配';
comment on column ERP_TEMPLATE_DTL_STORE.TRADE_PARTNER is '贸易伙伴';
comment on column ERP_TEMPLATE_DTL_STORE.TAX_CODE is '税码  bt_dictionary表  class=16';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_ITEM_CODE is '预算代码  bt_dictionary表  class=12';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_REVERSE1 is '自定义一';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_REVERSE2 is '自定义二';
comment on column ERP_TEMPLATE_DTL_STORE.DTL_ABS is '摘要';




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




