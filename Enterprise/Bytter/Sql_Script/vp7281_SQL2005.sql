--修改日期：20121206
--修改人：祁继鸿
--修改内容：修改付款执行菜单
--参数设置：
update  bt_sys_res set RES_URL='/netbank/allMakeupBill.jsp' WHERE FATHER_CODE=15 AND SYS_CODE='nis' and RES_NAME='付款执行';
go
