--修改日期：2013.1.21
--修改人：周兵
--修改内容：基础平台下的菜单  收支属性维护   要改为   账户属性维护
--修改原因：要与开户那边保持一致的名字

update bt_sys_res set res_name ='账户属性维护' where res_name ='收支属性维护' and sys_code='adm' and res_url='/admin/accType.do?method=queryAccTypeList';
commit;