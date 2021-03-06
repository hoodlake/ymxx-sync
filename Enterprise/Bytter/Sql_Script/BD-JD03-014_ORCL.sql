-- 增加资金归集日计总表
-- 修改日期：20120821
-- 修改原因：vp5975
-- 修改人： 费滔
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '资金归集日计总表',
         'fqs',
         RES_CODE ,
         '/monitor/CashSweep.do?method=initReport'||chr(38)||'netCode=1000',
         '0',
         '0',
         '0',
         '0',
         8,
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
         2,
         ''
  from bt_sys_res
   where res_name = '内部账号查询'
   and sys_code='fqs';
commit;
insert into  BT_SYS_RES
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
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '资金归集日计明细表',
         'fqs',
         RES_CODE,
         '/monitor/CashSweep.do?method=queryCashSweepDeteil'||chr(38)||'netCode=1000', 
         '0',
         '0',
         '0',
         '0',
         9,
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
         2,
         ''
  from bt_sys_res
   where res_name = '内部账号查询'
   and sys_code='fqs';
commit;
