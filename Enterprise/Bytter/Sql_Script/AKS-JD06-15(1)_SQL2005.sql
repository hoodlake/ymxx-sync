
--修改人:蒲勇军
--修改时间:2012-10-7
--修改内容:添加收支比例维护菜单 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE)+1 from bt_sys_res) , '收支比例维护', 'fbs', (select res_code from bt_sys_res  where  res_name =  '单位管理' and sys_code = 'fbs'), '/budget/corpInOutPercent.jsp', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, ''
GO

