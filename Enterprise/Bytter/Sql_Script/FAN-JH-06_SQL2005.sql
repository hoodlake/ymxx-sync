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
		   PROFIT_CENTER_CODE   VARCHAR(20),
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
   	DATA_TYPE_NAME       varchar(50),
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














