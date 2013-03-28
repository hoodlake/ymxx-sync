--修改日期：2012-11-07
--修改人：卢燕南
--修改内容：新增菜单
--修改原因：中远——ZY-ZH-06

--新增菜单项：账户管理>>查询>>账户属性差异查询
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
   RES_LEVEL,
   RES_ROLE)
values
  ((select max(RES_CODE) + 1 from bt_sys_res),
   '账户属性差异查询',
   'bankacc',
   (select RES_CODE
      from bt_sys_res
     where sys_code = 'bankacc'
       and RES_NAME = '查询'),
   '/bankacc/queryDifference.do?method=queryList',
   '',
   '0',
   '',
   '0',
   2,
   '账户属性差异查询',
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
   2,
   '');

commit;