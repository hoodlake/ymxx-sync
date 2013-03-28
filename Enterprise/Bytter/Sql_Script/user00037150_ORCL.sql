--删除贷款管理下面的贷款台账菜单
delete from bt_sys_res where RES_NAME='贷款台账' and sys_code='cms' and father_code=(select res_code from bt_sys_res where RES_NAME='贷款管理' and sys_code='cms');
commit;