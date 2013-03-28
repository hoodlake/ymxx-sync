--修改日期：2012.12.25
--修改人：李程
--修改内容：德豪交单查询菜单错误
--修改原因：德豪交单查询菜单错误
update bt_sys_res set res_url = '/credit/allQueryPresenting.jsp' where res_name = '交单查询' and sys_code = 'lcs';
go