--�޸����ڣ�2012-11-02
--�޸��ˣ�¬����
--�޸����ݣ����������ֵ��
--�޸�ԭ����Զ����ZY-ZH-04

--�����������ֵ��
create table BT_DICTIONARY  (
   CLASS                NUMBER(10)                      not null,
   CLASS_NAME           varchar2(40),
   CODE                 varchar2(50)                    not null,
   NAME                 varchar2(40)                    not null,
   SYS_CODE             varchar2(50),
   RMK                  varchar2(150),
   constraint PK_BT_DICTIONARY primary key (CLASS, CODE)
);
comment on table BT_DICTIONARY is
'�����ֵ��';
comment on column BT_DICTIONARY.CLASS is
'10����������';
comment on column BT_DICTIONARY.CLASS_NAME is
'������������Ĭ����д��Ӧ������ֵ
10-��������';
comment on column BT_DICTIONARY.SYS_CODE is
'��Ӧ��ϵͳӲ����';
comment on column BT_DICTIONARY.RMK is
'��ע';

--�����˵������ƽ̨>>��������ά��>>�����ֵ�ά��
insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL)
values
  ((select max(RES_CODE) + 1 from bt_sys_res),
   '�����ֵ�ά��',
   'adm',
   (select RES_CODE
      from bt_sys_res
     where sys_code = 'adm'
       and RES_NAME = '��������ά��'),
   '/admin/dictionary.do?method=queryList',
   '0',
   '1',
   '0',
   '0',
   10,
   '�����ֵ�ά��',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2);

commit;
