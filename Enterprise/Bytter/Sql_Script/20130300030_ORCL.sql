--�޸����ڣ�2013.03.05
--�޸��ˣ����پ�
--�޸����ݣ������� �����ֵ�ά��
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
