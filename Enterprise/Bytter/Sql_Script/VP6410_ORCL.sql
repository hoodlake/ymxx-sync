--修改日期：20120829
--修改人：费滔
--修改内容：给银行数据报表菜单下添加资金存量汇总表菜单
--修改原因:VP要求修改

delete from bt_sys_res where  res_name='资金存量汇总表' and res_url = '/aqs/netEveryDateMoney.do?method=getFirstLevelNetInfo';

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
         '资金存量汇总表',
         'fqs',
         RES_CODE,
         '/aqs/netEveryDateMoney.do?method=getFirstLevelNetInfo',
         '0',
         '1',
         '0',
         '0',
         9,
         '资金存量汇总表',
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
         2
    from bt_sys_res
   where res_name = '银行数据报表'
     and sys_code = 'fqs'
	 commit;
