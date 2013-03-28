--修改日期：2012.12.21
--修改人：刘之三
--修改内容：资金预警菜单修改
--修改原因：资金预警菜单修改
 
delete from bt_sys_res where RES_NAME='策略预警策略维护' and sys_code='fwg' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='策略维护' and sys_code='fwg')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '预警策略维护', 'fwg', (select res_code from bt_sys_res where res_name='策略维护' and sys_code='fwg'), '/fundwarning/strategyAction.do', '0', '0', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='策略预警策略查询' and sys_code='fwg' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='策略维护' and sys_code='fwg')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '预警策略查询', 'fwg', (select res_code from bt_sys_res where res_name='策略维护' and sys_code='fwg'), '/fundwarning/strategyAction.do?param=search', '0', '0', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
