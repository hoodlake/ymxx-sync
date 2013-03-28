--日期：2013-01-08
--修改人：andy.huang
--修改内容：新增理账管理系统参数是否人工发送指令
declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_param where CODE = 'isHandSendCmd';
if (@VN_COUNT = 0 ) 
begin  
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
      select 'isHandSendCmd', 'cho', '是否人工发送指令', '1', null, null, null, null, '1,是;0,否', null, null, null, null, 1.00, 2.00, null, null, null
end;
end;
go 