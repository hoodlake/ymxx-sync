--修改日期：20120807
--修改人：祁继鸿
--修改内容：更新代发工资菜单对应路径
--参数设置：
--工资单制单
update bt_sys_res set res_url='/netbank/allWageList.jsp' where sys_code='nis' and res_name='代发工资制单' ;
--工资单修改
update bt_sys_res set res_url='/netbank/allWageModifyList.jsp' where sys_code='nis' and res_name='代发工资制单修改' ;
--代发工资结果查询
update bt_sys_res set res_url='/netbank/allWageResultList.jsp' where sys_code='nis' and res_name='代发工资结果查询' ;
--代发工资结果异常处理
update bt_sys_res set res_url='/netbank/allWageExceptionList.jsp' where sys_code='nis' and res_name='代发工资结果异常处理' ;
--更新明细表增加字段return_msg
alter table nis_wage_detail add return_msg varchar(150);

commit;

