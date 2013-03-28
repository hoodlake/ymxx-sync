

-- 修改日期：2012-10-26
-- 修改人：蒲勇军
-- 修改原因：添加自动扫描参数设定菜单
-- 修改内容：添加自动扫描参数设定菜单

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '自动扫描参数设定', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='策略维护' and s2.sys_code = 'fwg' ), '/fundwarning/strategyAction.do?method=getWarningScan', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '');


commit ;

-- 修改日期：2012-10-31
-- 修改人：蒲勇军
-- 修改原因：修改自动扫描参数设定菜单,扫描策略以单位为标准
-- 修改内容：修改自动扫描参数设定菜单,扫描策略以单位为标准
alter table bt_warning_scan add corp_code varchar2(4); 

update bt_sys_res r set r.res_url = '/fundwarning/btWarningScan_corp.jsp' where r.res_name = '自动扫描参数设定' and r.sys_code =  'fwg';

delete from tb_generator g where g.gen_name = 'BT_WARNING_SCAN_ID'; 

insert into tb_generator (id,gen_name,gen_value)
values ((select max(id)+1 from tb_generator ),'BT_WARNING_SCAN_ID', (select max(id)+1 from bt_warning_scan) );


commit;

