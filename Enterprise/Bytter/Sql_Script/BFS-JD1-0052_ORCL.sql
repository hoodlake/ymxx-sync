--�޸����ڣ�2012.8.1
--�޸��ˣ�����
--�޸����ݣ�BFS-JD1-0052����������ֱ���ƽ̨
--�޸�ԭ��BFS-JD1-0052����������ֱ���ƽ̨

--�����˵������ֱ���ƽ̨ά����
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
values ((select max(RES_CODE)+1 from bt_sys_res), '���ֱ���ƽ̨ά��', 'adm', 0, '', '0', '1', '0', '0', 1, '���ֱ���ƽ̨ά��', '', '', '', '', '', null, null, null, null, null,3);

--�����˵����������䶨�塱
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
values ((select max(RES_CODE)+1 from bt_sys_res), '�������䶨��', 'adm', (select res_code from bt_sys_res where res_name='���ֱ���ƽ̨ά��' and sys_code='adm'), '/admin/doOfferRangeAction.do?method=listView', '0', '1', '0', '0', 1, '�������䶨��', '', '', '', '', '', null, null, null, null, null,1);

--�����˵������ֱ���ƽ̨��
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
values ((select max(RES_CODE)+1 from bt_sys_res), '���ֱ���ƽ̨', 'ads', 0, '', '0', '1', '0', '0', 1, '���ֱ���ƽ̨', '', '', '', '', '', null, null, null, null, null,2);

--�����˵������ֱ���¼�롱
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
values ((select max(RES_CODE)+1 from bt_sys_res), '���ֱ���¼��', 'ads', (select res_code from bt_sys_res where res_name='���ֱ���ƽ̨' and sys_code='ads'), '/AB/discountoffer/discountOfferInput.jsp', '0', '1', '0', '0', 1, '���ֱ���¼��', '', '', '', '', '', null, null, null, null, null,1);

--�����˵������ֱ��۲�ѯ��
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
values ((select max(RES_CODE)+1 from bt_sys_res), '���ֱ��۲�ѯ', 'ads', (select res_code from bt_sys_res where res_name='���ֱ���ƽ̨' and sys_code='ads'), '/AB/discountoffer/discountOfferList.jsp', '0', '1', '0', '0', 1, '���ֱ��۲�ѯ', '', '', '', '', '', null, null, null, null, null,3);

--�����˵������ֱ����޸ġ�
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
values ((select max(RES_CODE)+1 from bt_sys_res), '���ֱ����޸�', 'ads', (select res_code from bt_sys_res where res_name='���ֱ���ƽ̨' and sys_code='ads'), '/discountoffer/queryDOAction.do?method=listViewForUpdate', '0', '1', '0', '0', 1, '���ֱ����޸�', '', '', '', '', '', null, null, null, null, null,2);


--�������䶨���
--id,or_left:����������Χ��or_right:���������ҷ�Χ��valid_sign:��Ч��־-0����Ч��1����Ч
create table DO_OFFER_RANGE
(
  id         NUMBER(28) not null,
  or_left    int ,
  or_right   int ,
  valid_sign char(1) ,
  status char(1)
);

alter table DO_OFFER_RANGE
  add constraint ID_PRIMARY_KEY primary key (ID);
  
--���ֱ�����Ϣ����
--id;db_province:������������ʡ��db_city:�������������У�db_type�������������
--db_name��������������code��discount_money�����ֶ�ȣ�tb_province����Ʊ����ʡ��
--tb_city����Ʊ�����У�tb_type����Ʊ�������tb_name����Ʊ�������ƣ�
--contanctor����ϵ�ˣ�tel����ϵ�绰��operator_code���Ƶ���code��operator_date���Ƶ����ڣ�
create table DO_INFO_MAIN
(
  id             NUMBER(28) not null,
  db_province    varchar(50) ,
  db_city        varchar(50) ,
  db_type_code        CHAR(4) ,
  db_type        varchar(150) ,
  db_name_code        CHAR(4) ,
  db_name        varchar(150) ,
  discount_money numeric(15,2) ,
  tb_province    varchar(50) ,
  tb_city        varchar(50) ,
  tb_type_code        CHAR(4) ,
  tb_type        varchar2(150),
  tb_name_code        CHAR(4) ,
  tb_name        varchar2(150),
  contanctor     varchar(50) ,
  tel            varchar(20) ,
  operator_code  varchar(8) ,
  operator_date  date ,
  operator_name  VARCHAR2(20)
)
;

alter table DO_INFO_MAIN
  add constraint PK_DO_INFO_MAIN_ID primary key (ID);
  
--��������
create sequence DO_IFNO_MAIN_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


--���ֱ�����Ϣ��ͱ������䶨������ϵ��
--id;do_info_main_id:���ֱ�����Ϣ���id��do_offer_range_id���������䶨����id
--discount_reate��������
create table DO_INFO_SIDE
(
  id                NUMBER(28) not null,
  do_info_main_id   NUMBER(28) ,
  do_offer_range_id NUMBER(28) ,
  discount_rate    NUMBER(15,2) 
);

create sequence DO_IFNO_SIDE_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;

alter table DO_INFO_SIDE
  add constraint PK_DO_INFO_SIDE_ID primary key (ID);
  
commit;


