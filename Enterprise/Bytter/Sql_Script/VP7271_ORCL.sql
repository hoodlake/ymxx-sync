--修改时间2012-12-10
--修改人 刘勇
--修改内容  20121130中原传媒付款单打回信息不显示日志也不显示问题
update bt_param set param_value1=trim(param_value1) where sys_code='nis' and code='budgetsel';
update bt_param set reverse1='0,不挂预算;1,挂预算' where  sys_code='nis' and code='budgetsel';
commit;
