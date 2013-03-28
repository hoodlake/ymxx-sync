--修改日期：2012-11-02
--修改人：卢燕南
--修改内容：新增数据字典表
--修改原因：中远——ZY-ZH-04

--新增“数据字典表”
create table BT_DICTIONARY  (
   CLASS                numeric(10)                    not null,
   CLASS_NAME           VARCHAR(40),
   CODE                 VARCHAR(50)                    not null,
   NAME                 VARCHAR(40)                    not null,
   SYS_CODE             VARCHAR(50),
   RMK                  VARCHAR(150),
   constraint PK_BT_DICTIONARY primary key (CLASS, CODE)
);

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
  select (select max(res_code) + 1 from bt_sys_res),
   '数据字典维护',
   'adm',
   RES_CODE,
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
   2 from BT_SYS_RES WHERE SYS_CODE = 'adm' AND RES_NAME = '基础数据维护';
   
   go
