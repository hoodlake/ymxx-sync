--修改人:浦勇军
--修改时间:2012-08-22
--修改内容:中海船资金预警添加新的预警类型
--大额资金支出预警
create table BT_WARNING_DEZJZC
(
  ID              NUMBER(10) primary key not null,
  STRATEGY_CODE   VARCHAR2(10),
  RUN_TIME        DATE,
  SCAN_DATE_BEGIN DATE,
  SCAN_DATE_END   DATE,
  CORP_CODE       VARCHAR2(4),
  BILL_CODE       VARCHAR2(50),
  AMT             NUMBER(15,2),
  TRANS_DATE      DATE,
  ABS             VARCHAR2(200),
  PAYEE_NAME      VARCHAR2(50),
  STRATEGY_MONEY  NUMBER(15,2),
  CREATE_TIME     DATE,
  STATE           CHAR(1)
);
-- Add comments to the columns 
comment on column BT_WARNING_DEZJZC.ID  is '序列主键';
comment on column BT_WARNING_DEZJZC.STRATEGY_CODE  is '策略代码';
comment on column BT_WARNING_DEZJZC.RUN_TIME  is '运行时间';
comment on column BT_WARNING_DEZJZC.SCAN_DATE_BEGIN  is '扫描范围起';
comment on column BT_WARNING_DEZJZC.SCAN_DATE_END  is '扫描范围止';
comment on column BT_WARNING_DEZJZC.CORP_CODE  is '公司代码';
comment on column BT_WARNING_DEZJZC.BILL_CODE  is '明细主键';
comment on column BT_WARNING_DEZJZC.AMT  is '金额';
comment on column BT_WARNING_DEZJZC.TRANS_DATE  is '交易日期';
comment on column BT_WARNING_DEZJZC.ABS  is '用途';
comment on column BT_WARNING_DEZJZC.PAYEE_NAME  is '收款人';
comment on column BT_WARNING_DEZJZC.STRATEGY_MONEY  is '策略限额';
comment on column BT_WARNING_DEZJZC.CREATE_TIME  is '创建时间';
comment on column BT_WARNING_DEZJZC.STATE  is '处理意见：0未处理，初始值 1已正常 2已纠正 3未纠正 '; 
  
--十万元整数倍支出预警

create table BT_WARNING_SWYZSB
(
  ID              NUMBER(10) primary key not null,
  STRATEGY_CODE   VARCHAR2(10),
  RUN_TIME        DATE,
  SCAN_DATE_BEGIN DATE,
  SCAN_DATE_END   DATE,
  CORP_CODE       VARCHAR2(4),
  BILL_CODE       VARCHAR2(50),
  AMT             NUMBER(15,2),
  TRANS_DATE      DATE,
  ABS             VARCHAR2(200),
  PAYEE_NAME      VARCHAR2(50),
  STRATEGY_MONEY  NUMBER(15,2),
  CREATE_TIME     DATE,
  STATE           CHAR(1)
);
-- Add comments to the columns 
comment on column BT_WARNING_SWYZSB.ID  is '序列主键';
comment on column BT_WARNING_SWYZSB.STRATEGY_CODE  is '策略代码';
comment on column BT_WARNING_SWYZSB.RUN_TIME  is '运行时间';
comment on column BT_WARNING_SWYZSB.SCAN_DATE_BEGIN  is '扫描范围起';
comment on column BT_WARNING_SWYZSB.SCAN_DATE_END  is '扫描范围止';
comment on column BT_WARNING_SWYZSB.CORP_CODE  is '公司代码';
comment on column BT_WARNING_SWYZSB.BILL_CODE  is '明细主键';
comment on column BT_WARNING_SWYZSB.AMT  is '金额';
comment on column BT_WARNING_SWYZSB.TRANS_DATE  is '交易日期';
comment on column BT_WARNING_SWYZSB.ABS  is '用途';
comment on column BT_WARNING_SWYZSB.PAYEE_NAME  is '收款人';
comment on column BT_WARNING_SWYZSB.STRATEGY_MONEY  is '策略限额';
comment on column BT_WARNING_SWYZSB.CREATE_TIME  is '创建时间';
comment on column BT_WARNING_SWYZSB.STATE  is '处理意见：0未处理，初始值 1已正常 2已纠正 3未纠正 '; 
 


--支出户流入

--支出户流入

create table BT_WARNING_ZCHLR
(
  ID              NUMBER(10) primary key not null,
  STRATEGY_CODE   VARCHAR2(10),
  RUN_TIME        DATE,
  SCAN_DATE_BEGIN DATE,
  SCAN_DATE_END   DATE,
  CORP_CODE       VARCHAR2(4),
  ALL_COUNT       NUMBER,
  WARNING_COUNT   NUMBER,
  CREATE_TIME     DATE,
  STATE           CHAR(1)
);
-- Add comments to the columns 
comment on column BT_WARNING_ZCHLR.ID  is '序列Id';
comment on column BT_WARNING_ZCHLR.STRATEGY_CODE  is '策略代码';
comment on column BT_WARNING_ZCHLR.RUN_TIME  is '运行时间';
comment on column BT_WARNING_ZCHLR.SCAN_DATE_BEGIN  is '扫描范围起';
comment on column BT_WARNING_ZCHLR.SCAN_DATE_END  is '扫描范围止';
comment on column BT_WARNING_ZCHLR.CORP_CODE  is '公司代码';
comment on column BT_WARNING_ZCHLR.ALL_COUNT  is '所有支出笔数';
comment on column BT_WARNING_ZCHLR.WARNING_COUNT  is '预警笔数';
comment on column BT_WARNING_ZCHLR.CREATE_TIME  is '创建时间';
comment on column BT_WARNING_ZCHLR.STATE  is '处理意见：0未处理，初始值 1已正常2已纠正3未纠正';

create table BT_WARNING_ZCHLR_DETAIL
(
  ID         NUMBER(10) primary key not null,
  WARNING_ID NUMBER(10),
  CORP_CODE  VARCHAR2(4),
  RUN_TIME   DATE,
  TRANS_DATE DATE,
  ABS        VARCHAR2(200),
  PAYEE_NAME VARCHAR2(50),
  BANK_ACC   VARCHAR2(50),
  BILL_CODE  VARCHAR2(50),
  AMT        NUMBER(15,2),
  CUR        CHAR(2)
) ;
-- Add comments to the columns 
comment on column BT_WARNING_ZCHLR_DETAIL.ID  is '序列ID';
comment on column BT_WARNING_ZCHLR_DETAIL.WARNING_ID  is '主数据ID';
comment on column BT_WARNING_ZCHLR_DETAIL.CORP_CODE  is '公司代码';
comment on column BT_WARNING_ZCHLR_DETAIL.RUN_TIME  is '运行时间';
comment on column BT_WARNING_ZCHLR_DETAIL.TRANS_DATE  is '交易日期';
comment on column BT_WARNING_ZCHLR_DETAIL.ABS  is '用途';
comment on column BT_WARNING_ZCHLR_DETAIL.PAYEE_NAME  is '对方单位';
comment on column BT_WARNING_ZCHLR_DETAIL.BANK_ACC  is '账号';
comment on column BT_WARNING_ZCHLR_DETAIL.BILL_CODE  is '明细主键';
comment on column BT_WARNING_ZCHLR_DETAIL.AMT  is '交易金额';
comment on column BT_WARNING_ZCHLR_DETAIL.CUR  is '币别';


--为预警策略添加账户性质字段
alter table BT_WARNING_STRATEGY add ACC_NATURE_IDS varchar2(255); 

--为预警明细添加包含操作符
alter table BT_WARNING_STRATEGY_DETAIL ADD RMK_OPERATOR varchar2(4);

comment on column BT_WARNING_STRATEGY.ACC_NATURE_IDS is '账户性质'; 

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
values ('01', '预警类别', '09', '大额账户支出', '交易明细金额');

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
values ('01', '预警类别', '10', '万元整数倍支出', '交易明细金额');

insert into BT_WARNING_DICTIONARY (CLASS_ID, CLASS_NAME, CODE, CODE_NAME, RMK)
values ('01', '预警类别', '11', '支出户流入', '交易明细摘要'); 


----表主键

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_DEZJZC_ID',1);

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_SWYZSB_ID',1);

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_ZCHLR_ID',1);

insert into tb_generator(id,gen_name,gen_value) values((select max(t2.id)+1 from tb_generator t2 ),'BT_WARNING_ZCHLR_DETAIL_ID',1);

--注册预警类型到扫描器中

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
values ((select max(id) + 1 from BT_WARNING_SCAN) , '09', to_date('2012-04-10', 'yyyy-MM-dd'), '2', 1, '0', 0, '1', to_date('2012-04-10', 'yyyy-MM-dd'));

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
values ((select max(id) + 1 from BT_WARNING_SCAN) , '10', to_date('2012-04-10', 'yyyy-MM-dd'), '2', 1, '0', 0, '1', to_date('2012-04-10', 'yyyy-MM-dd'));

insert into BT_WARNING_SCAN (ID, TYPE_CODE, LAST_RUN_TIME, CYCLE, INTERVAL, IS_FORWARD_DELAY, FORWARD_TIME, STATE, START_TIME)
values ((select max(id) + 1 from BT_WARNING_SCAN) , '11', to_date('2012-04-10', 'yyyy-MM-dd'), '2', 1, '0', 0, '1', to_date('2012-04-10', 'yyyy-MM-dd'));

---报表菜单

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '大额账户支出', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='预警展示处理' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'||chr(38)||'viewType=9', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '十万元整数倍支出', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='预警展示处理' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'||chr(38)||'viewType=10', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '支出户流入', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='预警展示处理' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryCondition'||chr(38)||'viewType=11', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');

commit;


--系统参数 --收入户  
--ADD BY PUYJ 2012-08-29 18:57:27 添加收入户代码参数
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('PayOutAccType', 'adm', '收入户代码', '200', null, null, '', '', '', '', '', '', '', null, null, null, null, null);

update BT_WARNING_DICTIONARY b set CODE_NAME = '十万元整数倍支出' where b.class_name = '预警类别' and b.code = '10' ;

commit;

---收入户修改成为支出户
--- add by puyj 2012-08-30 09:21:36 修改收入户代码为支出户代码
UPDATE BT_PARAM P SET P.NAME = '支出户代码' where p.sys_code ='adm' and p.code = 'PayOutAccType'; 
commit;

---添加预警限额说明字符串
-- add by puyj 2012-08-31 16:42:46
ALTER TABLE BT_WARNING_DEZJZC ADD  STRATEGY_DETAIL_STR VARCHAR2(40);

comment on column BT_WARNING_DEZJZC.STRATEGY_DETAIL_STR
  is '预警限额说明';

ALTER TABLE BT_WARNING_SWYZSB ADD  STRATEGY_DETAIL_STR VARCHAR2(40);

comment on column BT_WARNING_SWYZSB.STRATEGY_DETAIL_STR
  is '预警限额说明';










