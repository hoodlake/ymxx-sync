--修改日期：20121015
--修改人：祁继鸿
--修改内容：增加录入付款单帐号透支时参数
--参数设置：
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('account_overdraft', 'nis', '录入付款单帐号透支时', '0', null, null, '0', '0,只提醒不控制;1,控制', '0,只提醒不控制;1,控制', '', '', '', '', 1.00, 35.00, null, null, null);
commit;