-----------菜单维护------------------------------------------------
--日期：2012-09-20 
--修改人：常广娟
--修改内容：中化财务公司久其接口
--三级菜单

---添加是否已读标识
alter table fc_accbook add is_read VARCHAR2(20);
alter table fc_accbook_dtl add is_read VARCHAR2(20);
alter table fc_accbook_blned add is_read VARCHAR2(20);
alter table fc_accbook_blned_dtl add is_read VARCHAR2(20);

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ((select max(RES_CODE)+1 from bt_sys_res), '手动导入', 'exchange', (select res_code from bt_sys_res where res_name='基础数据' and sys_code='exchange'), '/dataExchange/IntrErpBasicDate.jsp', '0', '1', '0', '0', 1, '手动导入', '', '', '', '', '', null, null, null, null, null);


insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ((select max(RES_CODE)+1 from bt_sys_res), '向中间库手动导入基础数据', 'exchange', (select res_code from bt_sys_res where res_name='基础数据' and sys_code='exchange'), '/dataExchange/IntrErpBasicDateToMid.jsp', '0', '1', '0', '0', 1, '向中间库手动导入基础数据', '', '', '', '', '', null, null, null, null, null);
go