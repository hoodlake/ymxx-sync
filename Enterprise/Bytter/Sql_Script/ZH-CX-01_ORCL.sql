--修改日期：2012.12.13
--修改人：李广
--修改内容：中海船务报表统计页面显示
--修改原因：新增功能

DECLARE 
VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='fqs' AND t1.res_code='2007' AND t1.father_code='9218';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,func_flag,res_type,link_target,status,res_order,res_level) 
   values('2007','资金流量状况表','fqs','9218','/monitor/report/zhcwzjllb_query.jsp','0','1','0','0','1','2');
  END IF;
  COMMIT;
END; 
/