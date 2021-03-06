--修改日期：2012.8.22
--修改人：张少举
--修改内容：XD-JD03-001 创建基准利率表，贷款期限表以及货币贷款利率表 增加创建子菜单的脚本
--修改原因：新的模块，以前没有表
--创建基准利率表
create table TB_BASE_RATE
(
       base_rate_id   number(15) not null,		--基准利率列表的主键
       code varchar2(32) not null,				--基准利率的编码
       baseTypeName   varchar2(128),			--基准类型的名称
       timeOfTakeEffect date,					--基准类型生效日期
       isBankBaseRate number(1),				--是否是 央行基准利率
       remark varchar2(128)                     --备注信息
);
alter table TB_BASE_RATE
  add constraint PK_TB_BASE_RATE_ID primary key (BASE_RATE_ID);
alter table TB_BASE_RATE
  add constraint idx_TB_BASE_RATE_code unique (CODE);

--创建贷款周期表
create table TB_CREDIT_PERIOD
(
       credit_period_id number(15) not null,        --贷款期限表的主键
       code varchar2(32) not null,                  --贷款周期的编码
       periodName varchar2(128),                    --贷款周期的名称
       period number(2),                            --贷款期数
       periodCycle number(1),                       --贷款期数类型（年，半年，季度，月，周，天）
       moneyType number(2),                         --货币类型（人民币，美元，欧元，港币）
       creditDays number(6)                         --贷款的总天数
);
alter table TB_CREDIT_PERIOD
  add constraint PK_TB_CREDIT_PERIOD_ID primary key (credit_period_id);
  
--去掉唯一约束 2012-09-20
--alter table TB_CREDIT_PERIOD
-- add constraint idx_TB_CREDIT_PERIOD_code unique (CODE);

--创建贷款利率维护表
create table TB_Loan_Rate_Maintence
(
       loan_rate_maintence_id number(15) not null,    --贷款利率表的主键
       base_rate_id number(15),                       --外键，关联基准利率表
       credit_period_id number(15),                   --外键，关联贷款期限表
       rate number(5,2),                              --基准利率，百分数
       rateUpLimit number(5),                         --利率上限
       rateDownLimit number(5),                       --利率下限
       timeOfTakeEffect date,                         --生效时间
       timeOfLastModifier date,                       --最近修改时间
       isRMBLoanRate number(1),                       --是否是人民贷款利率
       status number(1),                              --该贷款利率的业务流状态（提交，复核通过，审核通过）
       isValid number(1),                             --该贷款利率的状态（启用，禁用）
       borrowType number(1)--拆借类型（同业拆入，同业拆出）
);

  


alter table TB_Loan_Rate_Maintence
  add constraint PK_TB_Loan_Rate_Maintence_ID primary key (loan_rate_maintence_id);
alter table TB_LOAN_RATE_MAINTENCE
  add constraint FK_TB_LOAN_RATE_01 foreign key (BASE_RATE_ID)
  references tb_base_rate (BASE_RATE_ID);
alter table TB_LOAN_RATE_MAINTENCE
  add constraint FK_TB_LOAN_RATE_02 foreign KEY(credit_period_id) 
  REFERENCES TB_CREDIT_PERIOD(credit_period_id);
  
--修改日期：2012.8.22
--修改人：张少举
--修改内容：XD-JD03-006 贷款利率表添加打回说明的字段
--修改原因：表结构不完整
--创建基准利率表
alter table tb_loan_rate_maintence add returnDescribe varchar2(1024);
commit;

--插入定价管理主菜单
insert into bt_sys(sys_code,sys_name,first_page,valid_sign,rmk) values('amm','定价管理系统','admin','1','定价管理');
--插入定价管理系统的子菜单
--一级菜单，内部定价
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  values( (select max(RES_CODE) + 1 from bt_sys_res),'内部定价','amm',0,'','0','0','0','0',1,1,'');
--一级菜单，外部定价
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  values( (select max(RES_CODE) + 1 from bt_sys_res),'外部定价','amm',0,'','0','0','0','0',2,1,'');
----一级菜单，查询
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  values( (select max(RES_CODE) + 1 from bt_sys_res),'查询',    'amm',0,'','0','0','0','0',3,1,'');
--二级菜单，内部定价
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'内部利率维护','amm',RES_CODE,'/admin/fcInstrateAdjustAction.do?method=listView','0','0','0','0',1,2,''
         from bt_sys_res
         where res_name = '内部定价' and sys_code='amm';
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'利率维护复核','amm',RES_CODE,'/check/fcInstrateAdjustCheck.do?method=list','0','0','0','0',2,2,''
         from bt_sys_res
         where res_name = '内部定价' and sys_code='amm';
--二级菜单，外部定价
--基准利率维护
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'基准利率维护','amm',RES_CODE,'/amm/base_rate_type_maintence.jsp','0','0','0','0',1,2,''
         from bt_sys_res
         where res_name = '外部定价' and sys_code='amm';
  
--开始  
--修改人：李鹏飞
--修改原因：菜单页面的跳转需按公司规定的规范来开发
select * from bt_sys_res where res_url = '/amm/base_rate_type_maintence.jsp';
update bt_sys_res set res_url='/amm/baseRate.do?method=toList' where res_url= '/amm/base_rate_type_maintence.jsp' ;
commit;
--结束


--贷款期限维护
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'贷款期限维护','amm',RES_CODE,'/amm/credit_period_maintence.jsp','0','0','0','0',2,2,''
         from bt_sys_res
         where res_name = '外部定价' and sys_code='amm';
         
--开始  
--修改人：李鹏飞
--修改原因：菜单页面的跳转需按公司规定的规范来开发         
select * from bt_sys_res where res_url = '/amm/creditPeriod.do?method=toList';
update bt_sys_res set res_url='/amm/creditPeriod.do?method=toList' where  res_url= '/amm/credit_period_maintence.jsp' ;
commit;
--结束

--人民币贷款利率维护      
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'人民币贷款利率维护','amm',RES_CODE,'/amm/rmb_load_rate_maintence.jsp','0','0','0','0',3,2,''
         from bt_sys_res
         where res_name = '外部定价' and sys_code='amm';

--开始  
--修改人：李鹏飞
--修改原因：菜单页面的跳转需按公司规定的规范来开发          
select * from bt_sys_res where res_url = '/amm/rmbLoanRateMaintence.do?method=toList';
update bt_sys_res set res_url='/amm/rmbLoanRateMaintence.do?method=toList' where res_url= '/amm/rmb_load_rate_maintence.jsp' ;
commit;
--结束


--外币贷款利率维护      
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'外币贷款利率维护','amm',RES_CODE,'/amm/foreign_currency_load_rate_maintence.jsp','0','0','0','0',4,2,''
         from bt_sys_res
         where res_name = '外部定价' and sys_code='amm';
         
--开始  
--修改人：李鹏飞
--修改原因：菜单页面的跳转需按公司规定的规范来开发           
select * from bt_sys_res where res_url = '/amm/fcLoanRateMaintence.do?method=toList';
update bt_sys_res set res_url='/amm/fcLoanRateMaintence.do?method=toList' where res_url='/amm/foreign_currency_load_rate_maintence.jsp' ;
commit;
--结束


--贷款利率复核
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'贷款利率复核','amm',RES_CODE,'/amm/loan_rate_check.jsp','0','0','0','0',5,2,''
         from bt_sys_res
         where res_name = '外部定价' and sys_code='amm';
--二级菜单，查询
--人民币贷款利率查询    
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'人民币贷款利率查询','amm',RES_CODE,'/amm/rmb_load_rate_query.jsp','0','0','0','0',1,2,''
         from bt_sys_res
         where res_name = '查询' and sys_code='amm';

--开始  
--修改人：李鹏飞
--修改原因：菜单页面的跳转需按公司规定的规范来开发 
select * from bt_sys_res where res_url = '/amm/rmb_load_rate_query.jsp';
update bt_sys_res set res_url='/amm/rmbQueryLoanRateMaintence.do?method=toList' where res_url='/amm/rmb_load_rate_query.jsp' ;
commit;
--结束

--外币贷款利率查询
insert into BT_SYS_RES
  (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),'外币贷款利率查询','amm',RES_CODE,'/amm/foreign_currency_load_rate_query.jsp','0','0','0','0',2,2,''
         from bt_sys_res
         where res_name = '查询' and sys_code='amm';

--开始  
--修改人：李鹏飞
--修改原因：菜单页面的跳转需按公司规定的规范来开发 
select * from bt_sys_res where res_url = '/amm/foreign_currency_load_rate_query.jsp';
update bt_sys_res set res_url='/amm/fcQueryLoanRateMaintence.do?method=toList' where res_url='/amm/foreign_currency_load_rate_query.jsp' ;
commit;

--利率复核
update bt_sys_res set res_url='/amm/loan_rate_check.do?method=toList' where res_url='/amm/loan_rate_check.jsp' ;
commit;
--结束

--修改日期：2012.9.15
--修改人：李鹏飞
--修改内容：XD-JD03-001 期限利率表里面”系统预设值“
--修改原因：表结构不完整
--创建期限利率表
alter table TB_CREDIT_PERIOD add isSysValue varchar2(10);
commit;


--修改日期：2012.9.17
--修改人：李鹏飞
--修改内容：XD-JD03-001 
--修改原因：数据类型调整
--创建期限利率表
alter table tb_loan_rate_maintence  modify rate NUMBER(12,6) ;


alter table TB_CREDIT_PERIOD  modify MONEYTYPE VARCHAR2(10);


alter table TB_CREDIT_PERIOD  modify PERIOD NUMBER;


alter table tb_base_rate  modify REMARK VARCHAR2(400);


--2012-09-27 user00032968
alter table TB_CREDIT_PERIOD  modify PERIOD NUMBER(12);

--系统预设值 
INSERT INTO TB_BASE_RATE (base_rate_id,code,  basetypename,  timeoftakeeffect,   isbankbaserate,  remark)
VALUES(1,'001','央行基准利率',sysdate,1,'央行基准利率');
commit;

INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(1,'R001','六个月以内（含六个月）', 6,'4',1,180,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(2,'R002','六个月至一年（含一年）', 1,'1',1,360,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(3,'R003','一年至三年（含三年）', 3,'1',1,1080,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(4,'R004','三年至五年（含五年）', 5,'1',1,1800,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,     periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(5,'R005','五年以上' ,'1',1,1800,'1');
commit;

INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(6,'W001','隔夜', 1,'6',2,1,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(7,'W002','一周', 1,'5',2,7,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(8,'W003','两周', 2,'5',2,14,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(9,'W004','一个月', 1,'4',2,30,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,  period,   periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(10,'W005','二个月' ,2,'4',2,60,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(11,'W006','三个月', 3,'4',2,90,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(12,'W007','四个月', 4,'4',2,120,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(13,'W008','五个月', 5,'4',2,150,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(14,'W009','六个月', 6,'4',2,180,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,    period, periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(15,'W010','七个月' ,7,'4',2,210,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(16,'W011','八个月', 8,'4',2,240,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(17,'W012','九个月', 9,'4',2,270,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(18,'W013','十个月', 10,'4',2,300,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(19,'W014','十一个月', 11,'4',2,330,'1');
INSERT INTO Tb_Credit_Period (credit_period_id,  code,   periodname,   period,  periodcycle,  moneytype,  creditdays,  issysvalue)
VALUES(20,'W015','十二个月' ,12,'4',2,360,'1');
commit;








--添加一列 2012-09-27 12:10
alter table tb_loan_rate_maintence add moneyType varchar2(10);

--修改日期：2012.9.27
--修改人：黄茜
--修改内容：贷款期限维护，基准利率维护 初始化种子表
--修改原因：user00032969、user00032869、user00032468贷款期限录入和基准利率维护添加失败，违反唯一约束

insert into TB_GENERATOR(id,gen_name,gen_value)values(TB_GENERATOR_SEQ.Nextval,'credit_period_id',21);

insert into TB_GENERATOR(id,gen_name,gen_value)values(TB_GENERATOR_SEQ.Nextval,'TB_BASE_RATE',2);

commit;

