--修改日期：2012-11-02
--修改人：卢燕南
--修改内容：新增数据字典表
--修改原因：中远——ZY-ZH-04

--新增“数据字典表”
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
'数据字典表';
comment on column BT_DICTIONARY.CLASS is
'10：销户类型';
comment on column BT_DICTIONARY.CLASS_NAME is
'根据数据类型默认填写对应的中文值
10-销户类型';
comment on column BT_DICTIONARY.SYS_CODE is
'对应的系统硬编码';
comment on column BT_DICTIONARY.RMK is
'备注';

--新增菜单项：基础平台>>基础数据维护>>数据字典维护
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
   '数据字典维护',
   'adm',
   (select RES_CODE
      from bt_sys_res
     where sys_code = 'adm'
       and RES_NAME = '基础数据维护'),
   '/admin/dictionary.do?method=queryList',
   '0',
   '1',
   '0',
   '0',
   10,
   '数据字典维护',
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
