--修改人:蔡瑾钊
--修改时间:2012-10-12
--修改内容:新建表及添加初始数据
create table FINANIC_COST_TYPE  (
   GUID                 VARCHAR2(40) NOT NULL, --主键
   TYPE_CODE            VARCHAR2(40), --类型编码
   TYPE_NAME            VARCHAR2(80), --类型名称
   IS_DEFAULT           INT, --默认值
   COM_MENT            VARCHAR2(255), --备注
   constraint TYPE_CODE_UNIQUE unique(TYPE_CODE),
   constraint TYPE_NAME_UNIQUE unique(TYPE_NAME)
);
alter table FINANIC_COST_TYPE
   add constraint PK_FINANIC_COST_TYPE primary key (GUID);
insert into finanic_cost_type values('c4905cc2d4e146a5b46d5e63afe3ffb9','001','手续费',0,'系统预设');

insert into finanic_cost_type values('695fe648a3384cf6bc98a7a66b55b66f','002','其他费用',0,'系统预设');

insert into BT_SYS_RES   
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
  values ((select max(RES_CODE) + 1 from bt_sys_res),
         '费用管理',
         'cms',
         '0',
         '',
         '0',
         '1',
         '0',
         '0',
         3,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         1);
                 

insert into BT_SYS_RES   
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
         '费用类型维护',
         'cms',
         res_code,
         '/cms/costType.do?method=toList',
         '0',
         '1',
         '0',
         '0',
         1,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '费用管理'
   and sys_code='cms';
commit;