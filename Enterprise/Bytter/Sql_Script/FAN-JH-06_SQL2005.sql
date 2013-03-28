--���������빦��
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER����������ά����                   */
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
/* Menu:�������ĵ���˵�                                        */
/*==============================================================*/
DECLARE
   @menu_exists int;
begin
   SELECT @menu_exists=COUNT(*) FROM bt_sys_res
   WHERE res_name = '�������ĵ���' and sys_code = 'exchange';
   IF @menu_exists = 0 
   BEGIN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL, RES_ROLE)
      values (
             (select max(res_code) + 1 from bt_sys_res), 
             '�������ĵ���', 'exchange',   
             (select res_code from bt_sys_res where res_name='���ݴ���' and sys_code='exchange'), 
             '/netbank/profitCenterImport.do?method=toSelectCorp', '0', '1', '0', '0', 3, '', 2, '');
   END;
END; 
GO
/*==============================================================*/
/* ����:�������ı������                                        */
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




--�����ֵ�ά������
/*==============================================================*/
/* Table: ERP_PROFIT_CENTER����������ά����                   */
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














