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
   PROFIT_CENTER_CODE   VARCHAR2(20),
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
   DATA_TYPE_NAME       varchar2(50),
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


















