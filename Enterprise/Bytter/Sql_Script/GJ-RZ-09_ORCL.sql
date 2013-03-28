--修改日期：20121129
--修改人：胡韶珍
--修改原因：GJ-RZ-09 
--增加菜单：信贷管理-查询-企业/银行信贷汇总表
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='企业/银行信贷汇总表' AND t1.father_code=t2.res_code AND t2.res_name='查询';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select   (select max(RES_CODE) + 1 from bt_sys_res),'企业/银行信贷汇总统计表','cms',res_code,'/cms/corpBankLoanQuery.jsp'
   ,'0','1','0','0',2,'企业/银行信贷汇总统计表','','','','','',null,null,null,null,null,2   
    from bt_sys_res  where res_name = '查询' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/


--修改日期：20121129
--修改人：冯辉
--修改原因：GJ-RZ-09 
--取最新利率视图
create or replace view view_new_exchange_rate as
select a.cur_code cur_code,nvl(d.new_exchange_rate,a.cur_exrate) new_exchange_rate  from bt_currency a left join
(select b.cur_code, b.new_exchange_rate  from fc_excrate_adjust b ,
 (select cur_code, max(adjust_time)  max_adjust_time from fc_excrate_adjust
group by cur_code ) c
where b.cur_code = c.cur_code
and b.adjust_time = c.max_adjust_time
) d
on a.cur_code = d.cur_code 
/

--银行信贷汇总统计表
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
    WHERE res_name = '银行信贷汇总统计表' and sys_code = 'cms' and res_level = 2;
   IF VN_COUNT = 0 THEN
	insert into BT_SYS_RES   
	  (RES_CODE, 
	   RES_NAME,
	   SYS_CODE,
	   FATHER_CODE, 
	   RES_URL,
	   FUNC_FLAG,
	   RES_TYPE,
	   LINK_TARGET,
	   STATUS,
	   RES_ORDER,
	   RMK,
	   REVERSE1,
	   REVERSE2,
	   REVERSE3,
	   REVERSE4,
	   REVERSE5,
	   REVERSE6,
	   REVERSE7,
	   REVERSE8,
	   REVERSE9,
	   REVERSE10,
	   RES_LEVEL)
	  select (select max(RES_CODE) + 1 from bt_sys_res),
	         '银行信贷汇总统计表',
	         'cms',
	         res_code,
	         '/cms/corpBankLoanQuery.jsp',
	         '0',
	         '1',
	         '0',
	         '0',
	         2,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         2
	  from bt_sys_res
	   where res_name = '查询'
	   and sys_code='cms';
end if;
commit;
end;
/

--银行信贷汇总统计表
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
    WHERE res_name = '企业信贷汇总统计表' and sys_code = 'cms' and res_level = 2;
   IF VN_COUNT = 0 THEN
	insert into BT_SYS_RES   
	  (RES_CODE, 
	   RES_NAME,
	   SYS_CODE,
	   FATHER_CODE, 
	   RES_URL,
	   FUNC_FLAG,
	   RES_TYPE,
	   LINK_TARGET,
	   STATUS,
	   RES_ORDER,
	   RMK,
	   REVERSE1,
	   REVERSE2,
	   REVERSE3,
	   REVERSE4,
	   REVERSE5,
	   REVERSE6,
	   REVERSE7,
	   REVERSE8,
	   REVERSE9,
	   REVERSE10,
	   RES_LEVEL)
	  select (select max(RES_CODE) + 1 from bt_sys_res),
	         '企业信贷汇总统计表',
	         'cms',
	         res_code,
	         '/cms/corpLoanQuery.jsp',
	         '0',
	         '1',
	         '0',
	         '0',
	         2,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         null,
	         2
	  from bt_sys_res
	   where res_name = '查询'
	   and sys_code='cms';
end if;
commit;
end;
/