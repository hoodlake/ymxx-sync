--修改日期：2013-02-27
--修改人：周兵
--修改内容：新增菜单
--修改原因：中化工程——BD-JD04-109日均余额功能

--新增菜单项：首页>>综合查询系统>>内部账号查询>>科目账户日均余额

declare
@VN_COUNT decimal
begin 
select @VN_COUNT = count(*) from bt_sys_res where res_name = '科目账户日均余额' and sys_code = 'fqs';
if (@VN_COUNT = 0 ) 
begin  
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select ( select max(res_code)+1 from bt_sys_res ) , '科目账户日均余额', 'fqs', ( select min(res_code) from bt_sys_res r where r.res_name = '内部账号查询' and r.sys_code = 'fqs'  ), '/monitor/balance/query_avg.jsp', '0', '1', '0', '0', 3, ' ', '', '', '', '', '', null, null, null, null, null, 2, '' ;

end;
end;

go 

