--修改日期：2013.03.05
--修改人：张少举
--修改内容：富安娜 数据字典维护
--数据字典维护完善
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER（利润中心维护表）                   */
/*==============================================================*/
DECLARE
  @tb_exists int;
BEGIN
  SELECT COUNT(*) INTO tb_exists FROM tabs WHERE table_name='BT_DICTIONARY_TYPE';
   IF @tb_exists <> 0 THEN
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
