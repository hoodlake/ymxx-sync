--修改日期：2012.8.1
--修改人：黄茜
--修改内容：BFS-JD1-0052天津物资贴现报价平台
--修改原因：BFS-JD1-0052天津物资贴现报价平台

--新增菜单“贴现报价平台维护”
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
select (select max(RES_CODE)+1 from bt_sys_res), '贴现报价平台维护', 'adm', 0, '', '0', '1', '0', '0', 1, '贴现报价平台维护', '', '', '', '', '', null, null, null, null, null,3
go
--新增菜单“报价区间定义”
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
select (select max(RES_CODE)+1 from bt_sys_res), '报价区间定义', 'adm', (select res_code from bt_sys_res where res_name='贴现报价平台维护' and sys_code='adm'), '/admin/doOfferRangeAction.do?method=listView', '0', '1', '0', '0', 1, '报价区间定义', '', '', '', '', '', null, null, null, null, null,1
go
--新增菜单“贴现报价平台”
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
select (select max(RES_CODE)+1 from bt_sys_res), '贴现报价平台', 'ads', 0, '', '0', '1', '0', '0', 1, '贴现报价平台', '', '', '', '', '', null, null, null, null, null,2
go
--新增菜单“贴现报价录入”
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
select (select max(RES_CODE)+1 from bt_sys_res), '贴现报价录入', 'ads', (select res_code from bt_sys_res where res_name='贴现报价平台' and sys_code='ads'), '/AB/discountoffer/discountOfferInput.jsp', '0', '1', '0', '0', 1, '贴现报价录入', '', '', '', '', '', null, null, null, null, null,1
go
--新增菜单“贴现报价查询”
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
select (select max(RES_CODE)+1 from bt_sys_res), '贴现报价查询', 'ads', (select res_code from bt_sys_res where res_name='贴现报价平台' and sys_code='ads'), '/AB/discountoffer/discountOfferList.jsp', '0', '1', '0', '0', 1, '贴现报价查询', '', '', '', '', '', null, null, null, null, null,3
g
--新增菜单“贴现报价修改”
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10,res_level)
select (select max(RES_CODE)+1 from bt_sys_res), '贴现报价修改', 'ads', (select res_code from bt_sys_res where res_name='贴现报价平台' and sys_code='ads'), '/discountoffer/queryDOAction.do?method=listViewForUpdate', '0', '1', '0', '0', 1, '贴现报价修改', '', '', '', '', '', null, null, null, null, null,2
go

--报价区间定义表
--id,or_left:报价区间左范围；or_right:报价区间右范围；valid_sign:有效标志-0：无效；1：有效
create table DO_OFFER_RANGE
(
  id         NUMERIC(28) not null,
  or_left    int ,
  or_right   int ,
  valid_sign char(1) ,
  status char(1)
)
go
alter table DO_OFFER_RANGE
  add constraint ID_PRIMARY_KEY primary key (ID)
go  
--贴现报价信息主表
--iddb_province:贴现银行所在省；db_city:贴现银行所在市；db_type：贴现银行类别；
--db_name：贴现银行名称code；discount_money：贴现额度；tb_province；出票银行省；
--tb_city：出票银行市；tb_type：出票银行类别；tb_name：出票银行名称；
--contanctor：联系人；tel：联系电话；operator_code：制单人code；operator_date：制单日期；
create table DO_INFO_MAIN
(
  id             NUMERIC(28) IDENTITY(1,1) not null,
  db_province    varchar(50) ,
  db_city        varchar(50) ,
  db_type_code        CHAR(4) ,
  db_type        varchar(150) ,
  db_name_code        CHAR(4) ,
  db_name        varchar(150) ,
  discount_money numeric(15,2) ,
  tb_province    varchar(50) ,
  tb_city        varchar(50) ,
  tb_type_code        CHAR(4) ,
  tb_type        varchar(150),
  tb_name_code        CHAR(4) ,
  tb_name        varchar(150),
  contanctor     varchar(50) ,
  tel            varchar(20) ,
  operator_code  varchar(8) ,
  operator_date  datetime ,
  operator_name  VARCHAR(20)
)
go


alter table DO_INFO_MAIN
  add constraint PK_DO_INFO_MAIN_ID primary key (ID)
go
  



--贴现报价信息表和报价区间定义表的联系表
--iddo_info_main_id:贴现报价信息表的id；do_offer_range_id：报价区间定义表的id
--discount_reate：贴现率
create table DO_INFO_SIDE
(
  id                NUMERIC(28) IDENTITY(1,1) not null,
  do_info_main_id   NUMERIC(28) ,
  do_offer_range_id NUMERIC(28) ,
  discount_rate    NUMERIC(15,2) 
)
go


alter table DO_INFO_SIDE
  add constraint PK_DO_INFO_SIDE_ID primary key (ID)
go

