

-- 修改日期：2012-10-26
-- 修改人：蒲勇军
-- 修改原因：添加自动扫描参数设定菜单
-- 修改内容：添加自动扫描参数设定菜单

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE)+1 from bt_sys_res ), '自动扫描参数设定', 'fwg', (select res_code from bt_sys_res  where res_name='策略维护' and sys_code = 'fwg' ), '/fundwarning/strategyAction.do?method=getWarningScan', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, ''

GO

-- 修改日期：2012-10-31
-- 修改人：蒲勇军
-- 修改原因：修改自动扫描参数设定菜单,扫描策略以单位为标准
-- 修改内容：修改自动扫描参数设定菜单,扫描策略以单位为标准
alter table bt_warning_scan add corp_code varchar(4)
go

update bt_sys_res  set res_url = '/fundwarning/btWarningScan_corp.jsp' where res_name = '自动扫描参数设定' and sys_code =  'fwg'

go

delete from tb_generator  where gen_name = 'BT_WARNING_SCAN_ID'; 
go
insert into tb_generator (id,gen_name,gen_value)
select(select max(id)+1 from tb_generator ),'BT_WARNING_SCAN_ID', (select max(id)+1 from bt_warning_scan) ;
go





