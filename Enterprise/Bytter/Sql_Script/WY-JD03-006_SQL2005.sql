--add by puyj 
--2012-08-02 19:49:53 
---付款审批时间参数
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('nisAllowWorkTime', 'nis', '付款审批时间范围', '0:00#-#0:00', null, null, '0', '付款审批时间范围', ';至', '', '', '', '', 3.00, 44.00, null, null, null)
go
