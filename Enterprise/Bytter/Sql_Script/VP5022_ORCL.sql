--修改日期：2012.9.1
--修改人：张少举
--修改内容：BTS-JD1-0031 增加余额区间利率信息
--修改原因：需求需要
--增加表字段


alter table FC_INSTRATE_ADJUST add (useInterzoneAdjust number(2));
alter table FC_INSTRATE_ADJUST add (interzoneRate varchar2(2048));
--begin lipf 2012-10-18
--贷款状态
alter table FC_INSTRATE_ADJUST add (billStatus varchar2(10));
--调整方式
alter table FC_INSTRATE_ADJUST add (changType varchar2(10));
--end

commit;


--修改日期：2012.9.19
--修改人：李鹏飞
--修改内容：BTS-JD1-0031 增加余额区间利率信息
--修改原因：需求需要
--增加表字段
-- Create table
-- Create table
create table FC_INSTRATE_ADJUST_REF
(
  ID           NUMBER not null,
  EXECUTE_TIME DATE,
  ACCOUNT      VARCHAR2(50),
  DOWN_LIMIT   VARCHAR2(50),
  UP_LIMIT     VARCHAR2(50),
  NEW_RATE     NUMBER(20,6),
  REF_ID       NUMBER(10)
);

-- Create/Recreate primary, unique and foreign key constraints 
alter table FC_INSTRATE_ADJUST_REF  add constraint PK_ID primary key (ID);

--修改标题
update BT_SYS_RES set RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView'||chr(38)||chr(38)||'title=1' where  RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView' and res_name='内部利率维护';
update BT_SYS_RES set RES_URL ='/check/fcInstrateAdjustCheck.do?method=list'||chr(38)||chr(38)||'title=1' where  RES_URL ='/check/fcInstrateAdjustCheck.do?method=list' and res_name='利率维护复核' and father_code=(select res_code from bt_sys_res where res_name = '内部定价' and sys_code='amm');
commit;

