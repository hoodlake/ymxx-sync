
--修改人:蒲勇军
--修改时间:2012-10-7
--修改内容:自动更新离线账户历史余额菜单
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('autoBuildHisBal', 'adm', '自动更新离线账户历史余额', '0', null, null, '0', '', '0,否;1,是(更新历史余额天数:3天)', '', '', '', '', 1, 10.00, null, null, null);
commit;
