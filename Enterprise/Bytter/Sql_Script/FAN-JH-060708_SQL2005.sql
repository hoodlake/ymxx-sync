--中心利润导入功能
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER（利润中心维护表）                   */
/*==============================================================*/
IF NOT EXISTS (SELECT 1 
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('ERP_PROFIT_CENTER')
                  AND   TYPE = 'U')
		create table ERP_PROFIT_CENTER(
		   ID                   NUMERIC(30),
		   PROFIT_CENTER_CODE   VARCHAR(100),
		   PROFIT_CENTER_NAME   VARCHAR(100),
		   CORP_CODE            CHAR(4),
		   RMK                  VARCHAR(100) 
		);
GO
alter table ERP_PROFIT_CENTER add  constraint PK_ERP_PROFIT_CENTER primary key (ID);

/*==============================================================*/
/* Menu:利润中心导入菜单                                        */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists=COUNT(*) FROM bt_sys_res
   WHERE res_name = '利润中心导入' and sys_code = 'exchange';
   IF @menu_exists = 0 
   BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '利润中心导入', 'exchange',   
             (select res_code from bt_sys_res where res_name='数据处理' and sys_code='exchange'), 
             '/netbank/profitCenterImport.do?method=toSelectCorp', '0', '1', '0', '0', 3, '', 2, '');
   END;
END; 
GO
/*==============================================================*/
/* 主键:利润中心表的主键                                        */
/*==============================================================*/
DECLARE
   @id_exists int;
BEGIN
   SELECT @id_exists=COUNT(*) FROM tb_generator WHERE gen_name = 'ERP_PROFIT_CENTER_ID';
   IF @id_exists = 0
   BEGIN
      insert into tb_generator(id,gen_name,gen_value)values((select max(id) from tb_generator)+1,'ERP_PROFIT_CENTER_ID',1000);
   END;
END;
GO




--数据字典维护完善
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER（利润中心维护表）                   */
/*==============================================================*/
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_DICTIONARY_TYPE')
                  AND   TYPE = 'U')
create table BT_DICTIONARY_TYPE(
   	DATA_TYPE_CODE       NUMERIC(10) not null,
   	DATA_TYPE_NAME       varchar(100),
  	RMK                  varchar(100),
	CONSTRAINT PK_BT_DICTIONARY_TYPE PRIMARY KEY (DATA_TYPE_CODE)
)
GO


--初始化“数据字典数据类型表”数据
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('10','销户类型','销户类型,用于账号管理');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('11','总账科目','总账科目,ERP系统基础资料');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('12','预算代码','预算代码,ERP系统基础资料');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('13','记账码','记账码,ERP系统基础资料');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('14','特别总账标识','特别总账标识,ERP系统基础资料');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('15','事物类型','事物类型,ERP系统基础资料');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('16','税码','税码,ERP系统基础资料');
insert into BT_DICTIONARY_TYPE (DATA_TYPE_CODE,DATA_TYPE_NAME,RMK) values ('17','原因代码','原因代码,ERP系统基础资料');
commit;














--模版定义 
/*==============================================================*/
/* 1.Table: ERP_TEMPLATE_DATADEFINE（凭证模版数据定义表）       */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DATADEFINE';
   IF @tb_exists <> 0 BEGIN
      DROP TABLE ERP_TEMPLATE_DATADEFINE cascade constraints;
   END;
END;
go
create table ERP_TEMPLATE_DATADEFINE  (
   ID                   NUMBER not null,
   FIELD_CODE           VARCHAR(100),
   FIELD_NAME           VARCHAR(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR(100),
   IS_TEMPLATE_DTL      CHAR(1),
   constraint PK_ERP_TEMPLATE_DATADEFINE primary key (ID)
);
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
    @tb_exists int;
BEGIN 
    SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_TYPE';
    IF @tb_exists <> 0 BEGIN
       DROP TABLE ERP_TEMPLATE_TYPE cascade constraints;
    END;
END;
GO
create table ERP_TEMPLATE_TYPE  (
   ID                   NUMERIC(10) not null,
   TYPE_CODE            VARCHAR(100) unique,
   TYPE_NAME            VARCHAR(100),
   GENERAL_RANGE        NUMERIC(10),
   MATCHING_FIELD       VARCHAR(100),
   RMK                  VARCHAR(200),
   MODIFY_DATE          DATE default SYSDATE,
   constraint PK_ERP_TEMPLATE_TYPE primary key (ID)
);


/*==============================================================*/
/* 3.Table: ERP_TEMPLATE_DATADEFINE（模版类型详情表）           */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN 
   SELECT @tb_exists=COUNT(*)  FROM tabs t WHERE t.table_name='ERP_TEMPLATE_TYPE_DTL';
   IF @tb_exists <> 0 BEGIN
      DROP TABLE ERP_TEMPLATE_TYPE_DTL cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_TYPE_DTL  (
   ID                   NUMERIC not null,
   FIELD_CODE           VARCHAR(100),
   FIELD_NAME           VARCHAR(100),
   IS_SHOW              CHAR(1),
   IS_NOT_NULL          CHAR(1),
   SHOW_NAME            VARCHAR(100),
   IS_TEMPLATE_DTL      CHAR(1),
   TYPE_CODE            VARCHAR(100),
   constraint PK_ERP_TEMPLATE_TYPE_DTL primary key (ID)
);


/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_DATADEFINE（模版主表）                 */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE  (
   ID                   NUMERIC(10) not null,
   CORP_CODE            VARCHAR(4),
   REFER_CODE           VARCHAR(100),
   VOUCHER_PRE_TEXT     VARCHAR(100),
   REFER                VARCHAR(100),
   PAY_TYPE             VARCHAR(100),
   ITEM_CODE            VARCHAR(100),
   VOUCHER_TYPE_CODE    VARCHAR(100),
   TYPE_CODE            VARCHAR(100),
   TEMPLATE_NAME        VARCHAR(100),
   TEMPLATE_CODE        VARCHAR(100),
   ABS                  VARCHAR(100),
   PURPOSE              VARCHAR(100),
   RMK                  VARCHAR(100),
   REVERSE1             VARCHAR(100),
   REVERSE2             VARCHAR(100),
   constraint PK_ERP_TEMPLATE primary key (ID)
);

/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DATADEFINE（模版分录表）               */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DTL';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE_DTL cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_DTL  (
   ID                   NUMERIC(10)                      not null,
   TEMPLATE_ID          NUMERIC(10),
   ENTRY_CODE           VARCHAR(100),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR(100),
   SUBJECT_NAME         VARCHAR(100),
   SUBJECT_CLASS        VARCHAR(100),
   SUBJECT_TYPE         VARCHAR(100),
   COST_CENTER_CODE     VARCHAR(100),
   CASH_FLOW_CODE       VARCHAR(100),
   ACCOUNT_CODE         VARCHAR(100),
   ACCOUNT_TYPE         VARCHAR(100),
   PAYMENT_REASON_CODE  VARCHAR(100),
   LEDGER_SIGN          VARCHAR(100),
   TRANS_TYPE           VARCHAR(100),
   ASSIGN               VARCHAR(100),
   TRADE_PARTNER        VARCHAR(100),
   TAX_CODE             VARCHAR(100),
   DTL_ITEM_CODE        VARCHAR(100),
   DTL_REVERSE1         VARCHAR(100),
   DTL_REVERSE2         VARCHAR(100),
   DTL_ABS              VARCHAR(200),
   constraint PK_ERP_TEMPLATE_DTL primary key (ID)
);


--初始化菜单
/*==============================================================*/
/* Menu:模版类型维护（二级菜单）                                */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = '数据发送' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '数据发送', 'exchange',0, 
             '', '0', '0', '0', '0', 3, '数据发送', 1, '');
   END;
END;
go
/*==============================================================*/
/* Menu:模版类型维护（三级菜单）                                */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
   FROM bt_sys_res
   WHERE res_name = '模版定义' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '模版定义', 'exchange',   
             (select res_code from bt_sys_res where res_name='数据发送' and sys_code='exchange'), 
             '', '0', '1', '0', '0', 1, '模版定义', 2, '');
   END;
END;
GO
/*==============================================================*/
/* Menu:模版类型维护（四级菜单）                                */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = '模版维护' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '模版维护', 'exchange',   
             (select res_code from bt_sys_res where res_name='模版定义' and sys_code='exchange'), 
             '/dataExchange/erpTemplate.do?method=initContent', '0', '1', '0', '0', 2, '', 3, '');
   END;
END;
go
/*==============================================================*/
/* Menu:模版维护（四级菜单）                                    */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = '模版类型维护' and sys_code = 'exchange';
   IF @menu_exists = 0 BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '模版类型维护', 'exchange',   
             (select res_code from bt_sys_res where res_name='模版定义' and sys_code='exchange'), 
             '/dataExchange/erpTemplateType.do?method=initContent', '0', '1', '0', '0', 1, '', 3, '');
   END;
END;
go
/*==============================================================*/
/* Menu:主键生成                                                */
/*==============================================================*/
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatetypedetailid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatetypedetailid',
             '100'
      );    
   END;
END;
go
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists= COUNT(*) FROM tb_generator t where t.gen_name='erptemplatetypeid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatetypeid',
             '100'
      );    
   END;
END;
go
DECLARE 
   @record_exists int;
BEGIN
   SELECT  @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplateid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplateid',
             '100'
      );    
   END;
END;
GO
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatedetailid';
   IF @record_exists = 0
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatedetailid',
             '100'
      );    
   END;
END;
GO
COMMIT;











--张少举 
--新增
--付款模版匹配


IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TEMPLATE_ID_1' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
	alter table NIS_BILLHEAD add TEMPLATE_ID_1 NUMERIC(10)
GO
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TEMPLATE_ID_2' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
	alter table NIS_BILLHEAD add TEMPLATE_ID_2 NUMERIC(10)
GO
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'COST_CENTER_CODE' AND LTRIM(B.NAME) = 'NIS_BILLHEAD')
	alter table NIS_BILLHEAD add COST_CENTER_CODE VARCHAR(10)
GO


/*==============================================================*/
/* 4.Table: ERP_TEMPLATE_DATADEFINE（模版主表）                 */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_STORE  (
   ID                   NUMERIC(10) not null,
   CORP_CODE            VARCHAR(4),
   REFER_CODE           VARCHAR(100),
   VOUCHER_PRE_TEXT     VARCHAR(100),
   REFER                VARCHAR(100),
   PAY_TYPE             VARCHAR(100),
   ITEM_CODE            VARCHAR(100),
   VOUCHER_TYPE_CODE    CHAR(100),
   TYPE_CODE            VARCHAR(100),
   TEMPLATE_NAME        VARCHAR(100),
   TEMPLATE_CODE        VARCHAR(100),
   ABS                  VARCHAR(100),
   PURPOSE              VARCHAR(100),
   RMK                  VARCHAR(100),
   REVERSE1             VARCHAR(100),
   REVERSE2             VARCHAR(100),
   TEMPLATE_ID			NUMERIC(10),
   constraint PK_ERP_TEMPLATE primary key (ID)
);

/*==============================================================*/
/* 5.Table: ERP_TEMPLATE_DATADEFINE（模版分录表）               */
/*==============================================================*/
DECLARE 
   @tb_exists int;
BEGIN
   SELECT @tb_exists=COUNT(*) FROM tabs t WHERE t.table_name='ERP_TEMPLATE_DTL';
   IF @tb_exists <>0 BEGIN
      DROP TABLE ERP_TEMPLATE_DTL cascade constraints;
   END;
END;
GO
create table ERP_TEMPLATE_DTL_STORE  (
   ID                   NUMERIC(10)                      not null,
   TEMPLATE_ID          NUMERIC(10),
   ENTRY_CODE           VARCHAR(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR(60),
   SUBJECT_NAME         VARCHAR(100),
   SUBJECT_CLASS        VARCHAR(100),
   SUBJECT_TYPE         VARCHAR(100),
   COST_CENTER_CODE     VARCHAR(20),
   CASH_FLOW_CODE       VARCHAR(100),
   ACCOUNT_CODE         VARCHAR(50),
   ACCOUNT_TYPE         VARCHAR(100),
   PAYMENT_REASON_CODE  VARCHAR(50),
   LEDGER_SIGN          VARCHAR(50),
   TRANS_TYPE           VARCHAR(50),
   ASSIGN               VARCHAR(100),
   TRADE_PARTNER        VARCHAR(100),
   TAX_CODE             VARCHAR(50),
   DTL_ITEM_CODE        VARCHAR(50),
   DTL_REVERSE1         VARCHAR(100),
   DTL_REVERSE2         VARCHAR(100),
   DTL_ABS              VARCHAR(200),
   constraint PK_ERP_TEMPLATE_DTL primary key (ID)
);



DECLARE 
   @record_exists int;
BEGIN
   SELECT  @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatestoreid';
   IF @record_exists = 0 BEGIN
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatestoreid',
             '100'
      );    
   END;
END;
GO
DECLARE 
   @record_exists int;
BEGIN
   SELECT @record_exists=COUNT(*) FROM tb_generator t where t.gen_name='erptemplatedetailstoreid';
   IF @record_exists = 0
      insert into tb_generator(id,gen_name,gen_value)
      values(
             (select max(id)+1 from tb_generator),
             'erptemplatedetailstoreid',
             '100'
      );    
   END;
END;
GO
COMMIT;