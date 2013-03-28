--修改日期：2012-12-10
--修改人：卢燕南
--修改内容：修改活期转通知补录菜单位置
--修改原因：user00036131

--修改活期转通知补录菜单位置
update bt_sys_res set res_order = 2 where res_name = '活期转通知补录';

go
