--修改人:吴生火
--修改时间:2012-11-11
--修改内容:财务公司开户账号位数
insert into fc_param (PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
values ( 'sys_acc_num', '内部账号位数是否取16位', '1', '0为内部账号位数取20位1为内部账号位数取16位', '', '', '');

commit;


