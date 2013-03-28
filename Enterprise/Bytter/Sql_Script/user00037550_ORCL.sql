--修改日期：2013.01.08
--修改人：刘之三
--修改内容：资金预算预算追加菜单顺序
--修改原因：资金预算预算追加菜单顺序
update BT_SYS_RES set res_order='2' WHERE sys_code='fbs' and father_code='46' and res_name='半年预算';
update BT_SYS_RES set res_order='3' WHERE sys_code='fbs' and father_code='46' and res_name='季预算';
update BT_SYS_RES set res_order='4' WHERE sys_code='fbs' and father_code='46' and res_name='月预算';
update BT_SYS_RES set res_order='5' WHERE sys_code='fbs' and father_code='46' and res_name='旬预算';
commit;