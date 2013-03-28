--修改日期：20121030
--修改人：  余川锋
--创建银行实时余额查询菜单
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL,RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '银行实时余额', 'fqs', res_code , '/aqs/bankAccRTBal.do?method=toQuery', '0', '1', '0', '0', 1, '', 2,'' from bt_sys_res where res_name='银行数据报表' and sys_code='fqs' and res_level=1
GO