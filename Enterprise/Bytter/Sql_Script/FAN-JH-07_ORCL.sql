--模版定义
/*==============================================================*/ 
/* 1.Table: ERP_TEMPLATE_DATADEFINE（凭证模版数据定义表）       */
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
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR2(100),
   IS_TEMPLATE_DTL      CHAR(1),
   constraint PK_ERP_TEMPLATE_DATADEFINE primary key (ID)
);
--字段注释
comment on table ERP_TEMPLATE_DATADEFINE is '凭证模版数据定义表';
comment on column ERP_TEMPLATE_DATADEFINE.ID is '编号';
comment on column ERP_TEMPLATE_DATADEFINE.FIELD_CODE is '字段英文名';
comment on column ERP_TEMPLATE_DATADEFINE.FIELD_NAME is '字段中文名';
comment on column ERP_TEMPLATE_DATADEFINE.IS_SHOW is '是否显示  0,否 1,是';
comment on column ERP_TEMPLATE_DATADEFINE.IS_NOT_NULL is '是否必填 0,否 1,是';
comment on column ERP_TEMPLATE_DATADEFINE.SHOW_NAME is '显示名称';
comment on column ERP_TEMPLATE_DATADEFINE.IS_TEMPLATE_DTL is '是否凭证分录字段    0;否   1:是';
--初始化“凭证模版数据定义表”数据
insert into ERP_TEMPLATE_DATADEFINE values(1,'VOUCHER_TYPE_CODE','凭证类别','0','0','凭证类别','0');
insert into ERP_TEMPLATE_DATADEFINE values(2,'REFER_CODE','参考凭证编号','0','0','参考凭证编号','0');
insert into ERP_TEMPLATE_DATADEFINE values(3,'VOUCHER_PRE_TEXT','凭证抬头文本','0','0','凭证抬头文本','0');
insert into ERP_TEMPLATE_DATADEFINE values(4,'ITEM_CODE','预算科目','0','0','预算科目','0');
insert into ERP_TEMPLATE_DATADEFINE values(5,'REFER','参照','0','0','参照','0');
insert into ERP_TEMPLATE_DATADEFINE values(6,'ABS','摘要','0','0','摘要','0');
insert into ERP_TEMPLATE_DATADEFINE values(7,'PURPOSE','用途','0','0','用途','0');
insert into ERP_TEMPLATE_DATADEFINE values(8,'PAY_TYPE','结算方式','0','0','结算方式','0');
insert into ERP_TEMPLATE_DATADEFINE values(9,'REVERSE1','自定义一','0','0','自定义一','0');
insert into ERP_TEMPLATE_DATADEFINE values(10,'REVERSE2','自定义二','0','0','自定义二','0');
insert into ERP_TEMPLATE_DATADEFINE values(11,'SUBJECT_CODE','科目代码','0','0','科目代码','1');
insert into ERP_TEMPLATE_DATADEFINE values(12,'SUBJECT_NAME','科目名称','0','0','科目名称','1');
insert into ERP_TEMPLATE_DATADEFINE values(13,'SUBJECT_CLASS','科目大类','0','0','科目大类','1');
insert into ERP_TEMPLATE_DATADEFINE values(14,'SUBJECT_TYPE','科目类型','0','0','科目类型','1');
insert into ERP_TEMPLATE_DATADEFINE values(15,'COST_CENTER_CODE','成本中心','0','0','成本中心','1');
insert into ERP_TEMPLATE_DATADEFINE values(16,'CASH_FLOW_CODE','现金流代码','0','0','现金流代码','1');
insert into ERP_TEMPLATE_DATADEFINE values(17,'ACCOUNT_CODE','记账代码','0','0','记账代码','1');
insert into ERP_TEMPLATE_DATADEFINE values(18,'ACCOUNT_TYPE','账户类型','0','0','账户类型','1');
insert into ERP_TEMPLATE_DATADEFINE values(19,'DTL_ABS','摘要','0','0','摘要','1');
insert into ERP_TEMPLATE_DATADEFINE values(20,'PAYMENT_REASON_CODE','付款原因代码','0','0','付款原因代码','1');
insert into ERP_TEMPLATE_DATADEFINE values(21,'LEDGER_SIGN','总账标识','0','0','总账标识','1');
insert into ERP_TEMPLATE_DATADEFINE values(22,'TRANS_TYPE','事物类型','0','0','事物类型','1');
insert into ERP_TEMPLATE_DATADEFINE values(23,'ASSIGN','分配','0','0','分配','1');
insert into ERP_TEMPLATE_DATADEFINE values(24,'TRADE_PARTNER','贸易伙伴','0','0','贸易伙伴','1');
insert into ERP_TEMPLATE_DATADEFINE values(25,'TAX_CODE','税码','0','0','税码','1');
insert into ERP_TEMPLATE_DATADEFINE values(26,'DTL_ITEM_CODE','预算代码','0','0','预算代码','1');
insert into ERP_TEMPLATE_DATADEFINE values(27,'DTL_REVERSE1','自定义一','0','0','自定义一','1');
insert into ERP_TEMPLATE_DATADEFINE values(28,'DTL_REVERSE2','自定义二','0','0','自定义二','1');



/*==============================================================*/
/* 2.Table: ERP_TEMPLATE_DATADEFINE（模版类型表）               */
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
   TYPE_CODE            VARCHAR2(20) unique,
   TYPE_NAME            VARCHAR2(50),
   GENERAL_RANGE        NUMBER(10),
   MATCHING_FIELD       VARCHAR2(100),
   RMK                  VARCHAR2(200),
   MODIFY_DATE          DATE default SYSDATE,
   constraint PK_ERP_TEMPLATE_TYPE primary key (ID)
);
comment on table ERP_TEMPLATE_TYPE is '模版类型表';
comment on column ERP_TEMPLATE_TYPE.TYPE_CODE is '模版类型编码';
comment on column ERP_TEMPLATE_TYPE.TYPE_NAME is '模版类型名称';
comment on column ERP_TEMPLATE_TYPE.GENERAL_RANGE is 
'通用范围
1:所有公司通用
2:每个公司不同
3:网点与单位不同';
comment on column ERP_TEMPLATE_TYPE.MATCHING_FIELD is '匹配字段';
comment on column ERP_TEMPLATE_TYPE.RMK is '备注';
comment on column ERP_TEMPLATE_TYPE.MODIFY_DATE is '更新日期';


/*==============================================================*/
/* 3.Table: ERP_TEMPLATE_DATADEFINE（模版类型详情表）           */
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
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR2(100),
   IS_TEMPLATE_DTL      CHAR(1),
   TYPE_CODE            VARCHAR2(32),
   constraint PK_ERP_TEMPLATE_TYPE_DTL primary key (ID)
);
comment on table ERP_TEMPLATE_TYPE_DTL is '模版类型详情表';
comment on column ERP_TEMPLATE_TYPE_DTL.ID is '编号';
comment on column ERP_TEMPLATE_TYPE_DTL.FIELD_CODE is '字段英文名';
comment on column ERP_TEMPLATE_TYPE_DTL.FIELD_NAME is '字段中文名';
comment on column ERP_TEMPLATE_TYPE_DTL.IS_SHOW is '是否显示  0,否 1,是';
comment on column ERP_TEMPLATE_TYPE_DTL.IS_NOT_NULL is '是否必填 0,否 1,是';
comment on column ERP_TEMPLATE_TYPE_DTL.IS_TEMPLATE_DTL is '是否凭证分录字段    0;否   1:是';
comment on column ERP_TEMPLATE_TYPE_DTL.TYPE_CODE is '模版类型编码（关联ERP_TEMPLATE_TYPE）';


/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_DATADEFINE（模版主表）                 */
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
   constraint PK_ERP_TEMPLATE primary key (ID)
);

comment on table  ERP_TEMPLATE is '凭证模版表';
comment on column ERP_TEMPLATE.CORP_CODE is '单位编码（关联BT_CORP）';
comment on column ERP_TEMPLATE.REFER_CODE is '参考凭证编号';
comment on column ERP_TEMPLATE.VOUCHER_PRE_TEXT is '凭证抬头文本';
comment on column ERP_TEMPLATE.VOUCHER_TYPE_CODE is '凭证类别（关联ERP_VOUCHER_TYPE）';
comment on column ERP_TEMPLATE.TYPE_CODE is '模版类型编码（关联ERP_TEMPLATE_TYPE）';
comment on column ERP_TEMPLATE.TEMPLATE_NAME is '模版名称';
comment on column ERP_TEMPLATE.TEMPLATE_CODE is '模版编码';
comment on column ERP_TEMPLATE.ABS is '摘要';
comment on column ERP_TEMPLATE.PURPOSE is '用途';
comment on column ERP_TEMPLATE.RMK is '备注';
comment on column ERP_TEMPLATE.REVERSE1 is '自定义一';
comment on column ERP_TEMPLATE.REVERSE2 is '自定义二';


/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DATADEFINE（模版分录表）               */
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
   constraint PK_ERP_TEMPLATE_DTL primary key (ID)
);
comment on table ERP_TEMPLATE_DTL is '凭证模版分录表';
comment on column ERP_TEMPLATE_DTL.TEMPLATE_ID is '关联ERP_TEMPLATE';
comment on column ERP_TEMPLATE_DTL.ENTRY_CODE is '分录编码';
comment on column ERP_TEMPLATE_DTL.LOAN_DIRECTION is '借贷方向 0,借 1,贷';
comment on column ERP_TEMPLATE_DTL.SUBJECT_CODE is '科目编号';
comment on column ERP_TEMPLATE_DTL.SUBJECT_NAME is '科目名称';
comment on column ERP_TEMPLATE_DTL.SUBJECT_CLASS is '科目大类';
comment on column ERP_TEMPLATE_DTL.SUBJECT_TYPE is '科目类型';
comment on column ERP_TEMPLATE_DTL.COST_CENTER_CODE is '成本中心 取数ERP_COST_CENTER';
comment on column ERP_TEMPLATE_DTL.CASH_FLOW_CODE is '现金流量代码';
comment on column ERP_TEMPLATE_DTL.ACCOUNT_CODE is '记账代码  bt_dictionary表  class=13';
comment on column ERP_TEMPLATE_DTL.ACCOUNT_TYPE is '账户类型';
comment on column ERP_TEMPLATE_DTL.PAYMENT_REASON_CODE is '付款原因代码  bt_dictionary表  class=17';
comment on column ERP_TEMPLATE_DTL.LEDGER_SIGN is '总账标识  bt_dictionary表  class=14';
comment on column ERP_TEMPLATE_DTL.TRANS_TYPE is '事物类型  bt_dictionary表  class=15';
comment on column ERP_TEMPLATE_DTL.ASSIGN is '分配';
comment on column ERP_TEMPLATE_DTL.TRADE_PARTNER is '贸易伙伴';
comment on column ERP_TEMPLATE_DTL.TAX_CODE is '税码  bt_dictionary表  class=16';
comment on column ERP_TEMPLATE_DTL.DTL_ITEM_CODE is '预算代码  bt_dictionary表  class=12';
comment on column ERP_TEMPLATE_DTL.DTL_REVERSE1 is '自定义一';
comment on column ERP_TEMPLATE_DTL.DTL_REVERSE2 is '自定义二';
comment on column ERP_TEMPLATE_DTL.DTL_ABS is '摘要';


--初始化菜单
/*==============================================================*/
/* Menu:模版类型维护（二级菜单）                                */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '数据发送' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '数据发送', 'exchange',0, 
             '', '0', '0', '0', '0', 3, '数据发送', 1, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:模版类型维护（三级菜单）                                */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '模版定义' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '模版定义', 'exchange',   
             (select res_code from bt_sys_res where res_name='数据发送' and sys_code='exchange'), 
             '', '0', '1', '0', '0', 1, '模版定义', 2, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:模版类型维护（四级菜单）                                */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '模版维护' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '模版维护', 'exchange',   
             (select res_code from bt_sys_res where res_name='模版定义' and sys_code='exchange'), 
             '/dataExchange/erpTemplate.do?method=initContent', '0', '1', '0', '0', 1, '', 3, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:模版维护（四级菜单）                                    */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '模版类型维护' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '模版类型维护', 'exchange',   
             (select res_code from bt_sys_res where res_name='模版定义' and sys_code='exchange'), 
             '/dataExchange/erpTemplateType.do?method=initContent', '0', '1', '0', '0', 2, '', 3, '');
   END IF;
END;
/
/*==============================================================*/
/* Menu:主键生成                                                */
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

