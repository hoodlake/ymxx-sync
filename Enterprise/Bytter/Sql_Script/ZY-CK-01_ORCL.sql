--修改日期：2012-11-21
--修改人：卢燕南
--修改内容：添加存款收益管理相应字段和菜单
--修改原因：ZY-CK-01

--添加管理单据信息表中字段
--理财管理单据信息表新增“利率”字段
alter table FC_FINANCING_BILLINFO add INTEREST_RATE NUMBER(8,6);
--理财管理单据信息表新增“单号”字段
alter table FC_FINANCING_BILLINFO add BILL_CODE VARCHAR2(20);
--理财管理单据信息表新增“利率”字段（补录是用到的利率）
alter table FC_FINANCING_BILLINFO add BL_INTEREST_RATE NUMBER(8,6);
--理财管理单据信息表新增“是否补录”字段（0，否(默认)  1，是）
alter table FC_FINANCING_BILLINFO add IS_BL char(1) default 0 ;
--理财管理单据信息表新增“利息”字段（补录是用到的利率）
alter table FC_FINANCING_BILLINFO add BL_INTEREST NUMBER(14,2);

--添加注释
comment on column FC_FINANCING_BILLINFO.INTEREST_RATE is
'利率';
comment on column FC_FINANCING_BILLINFO.BILL_CODE is
'单号';
comment on column FC_FINANCING_BILLINFO.BL_INTEREST_RATE is
'补录利率';
comment on column FC_FINANCING_BILLINFO.IS_BL is
'是否补录 0,否（默认） 1,是';
comment on column FC_FINANCING_BILLINFO.BL_INTEREST is
'补录利息';
comment on column FC_FINANCING_BILLINFO.STATUS is
'状态';
comment on column FC_FINANCING_BILLINFO.BUS_TYPE is
'业务类型';


--新增菜单：首页 >> 理财管理>> 银行理财 >> 活期转定期补录
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '活期转定期补录', 'cho', (select RES_CODE from bt_sys_res where sys_code = 'cho' and RES_NAME = '银行理财管理'), '/chowmatistic/bankBillInfo.do?method=makeupBillInfo'||chr(38)||'busType=10', '0', '1', '0', '0', 0, '活期转定期补录', '', '', '', '', '', null, null, null, null, null, 2, '');

--新增菜单：首页 >> 理财管理>> 银行理财 >> 活期转通知补录
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), '活期转通知补录', 'cho', (select RES_CODE from bt_sys_res where sys_code = 'cho' and RES_NAME = '银行理财管理'), '/chowmatistic/bankBillInfo.do?method=makeupBillInfo'||chr(38)||'busType=12', '0', '1', '0', '0', 2, '活期转通知补录', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;