--修改日期：2012.9.1
--修改人：张少举
--修改内容：BTS-JD1-0031 增加余额区间利率信息
--修改原因：需求需要
--增加表字段


alter table FC_INSTRATE_ADJUST add useInterzoneAdjust int;
alter table FC_INSTRATE_ADJUST add interzoneRate varchar(2048);
--begin lipf 2012-10-18
--贷款状态
alter table FC_INSTRATE_ADJUST add billStatus varchar(10);
--调整方式
alter table FC_INSTRATE_ADJUST add changType varchar(10);
--end




--修改日期：2012.9.19
--修改人：李鹏飞
--修改内容：BTS-JD1-0031 增加余额区间利率信息
--修改原因：需求需要
--增加表字段
-- Create table
-- Create table
create table FC_INSTRATE_ADJUST_REF
(
  ID           int not null,
  EXECUTE_TIME datetime,
  ACCOUNT      VARCHAR(50),
  DOWN_LIMIT   VARCHAR(50),
  UP_LIMIT     VARCHAR(50),
  NEW_RATE     int,
  REF_ID       int
);


-- Create/Recreate primary, unique and foreign key constraints 
alter table FC_INSTRATE_ADJUST_REF
  add constraint PK_ID primary key (ID);
  
--修改标题  
update  BT_SYS_RES set RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView'+char(38)+char(38)+'title=1' where  RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView' and res_name='内部利率维护';
update BT_SYS_RES set RES_URL ='/check/fcInstrateAdjustCheck.do?method=list'+char(38)+char(38)+'title=1' where  RES_URL ='/check/fcInstrateAdjustCheck.do?method=list' and res_name='利率维护复核' and father_code=(select res_code from bt_sys_res where res_name = '内部定价' and sys_code='amm');
go




