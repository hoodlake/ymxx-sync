--�޸����ڣ�2012.10.29
--�޸��ˣ�����
--�޸����ݣ��ײż�����������������ά������������
--�޸�ԭ���ײż�����������������ά������������
create table bt_Calendar_relevance  (
   id                   VARCHAR2(30)   not null  primary key ,
   CDATE                DATE,
   WORK_DAY_SIGN        Integer    default 1,
   MONTH_END_SIGN       Integer    default 1,
   YEAR_END_SIGN        Integer default 1,
   START_DATE           DATE,
   END_DATE             DATE,
   CORP_ID              NUMBER(10)
);

comment on column bt_Calendar_relevance.CDATE  is '����';
comment on column bt_Calendar_relevance.WORK_DAY_SIGN  is '�ܱ�ʶ';
comment on column bt_Calendar_relevance.MONTH_END_SIGN  is '��δ��ʶ';
comment on column bt_Calendar_relevance.YEAR_END_SIGN  is '��δ��ʶ';
comment on column bt_Calendar_relevance.START_DATE  is '������ʼ����';
comment on column bt_Calendar_relevance.END_DATE  is '������������';
comment on column bt_Calendar_relevance.CORP_ID  is '����ID';

--����ϵͳ�˵� 
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
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '��������������ά��',
         'adm',
         res_code,
         '/admin/calendarAction.do?method=toCorpSelectView',
         '0',
         '1',
         '0',
         '0',
         7,
         '��������������ά��',
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
         3
    from bt_sys_res
   where res_name = '��������ά��'
     and sys_code = 'adm' 
     and res_level = '1';
    
  commit;

