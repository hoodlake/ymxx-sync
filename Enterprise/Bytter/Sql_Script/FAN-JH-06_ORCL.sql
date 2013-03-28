--中心利润导入功能
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER（利润中心维护表）                   */
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
   PROFIT_CENTER_CODE   VARCHAR2(20),
   PROFIT_CENTER_NAME   VARCHAR2(100),
   CORP_CODE            CHAR(4),
   RMK                  VARCHAR2(100)
);
alter table ERP_PROFIT_CENTER add  constraint PK_ERP_PROFIT_CENTER primary key (ID);
comment on table ERP_PROFIT_CENTER is '利润中心维护表';
comment on column ERP_PROFIT_CENTER.ID is '编号';
comment on column ERP_PROFIT_CENTER.PROFIT_CENTER_CODE is '利润中心编码';
comment on column ERP_PROFIT_CENTER.PROFIT_CENTER_NAME is '利润中心名称';
comment on column ERP_PROFIT_CENTER.CORP_CODE is '公司代码';
comment on column ERP_PROFIT_CENTER.RMK is '备注';
/*==============================================================*/
/* Menu:利润中心导入菜单                                        */
/*==============================================================*/
DECLARE
   menu_exists number;
begin
   SELECT COUNT(*)
    INTO menu_exists 
    FROM bt_sys_res
   WHERE res_name = '利润中心导入' and sys_code = 'exchange';
   IF menu_exists = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '利润中心导入', 'exchange',   
             (select res_code from bt_sys_res where res_name='数据处理' and sys_code='exchange'), 
             '/netbank/profitCenterImport.do?method=toSelectCorp', '0', '1', '0', '0', 3, '', 2, '');
   END IF;
END;
/
/*==============================================================*/
/* 主键:利润中心表的主键                                        */
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


--数据字典维护完善
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER（利润中心维护表）                   */
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
   DATA_TYPE_NAME       varchar2(50),
   RMK                  varchar2(100)
   
);
alter table BT_DICTIONARY_TYPE add constraint PK_BT_DICTIONARY_TYPE primary key (DATA_TYPE_CODE);
comment on table BT_DICTIONARY_TYPE is
'数据字典--数据类型表';

comment on column BT_DICTIONARY_TYPE.DATA_TYPE_CODE is
'10:销户类型
11:总账科目
12:预算代码
13:记账码
14:特别总账标识
15:事物类型
16:税码
17:原因代码';
comment on column BT_DICTIONARY_TYPE.DATA_TYPE_NAME is '数据类型名称';
comment on column BT_DICTIONARY_TYPE.RMK is '备注';

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


















