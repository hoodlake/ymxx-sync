--修改日期：2012.11.14
--修改人：周兵
--修改内容：资金头寸预警（曲线）
--修改原因：资金头寸预警（曲线）

DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '资金头寸预警（曲线）' and sys_code = 'fqs' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values (( select max(res_code)+1 from bt_sys_res ) , '资金头寸预警（曲线）', 'fqs', ( select min(res_code) from bt_sys_res r where r.res_name = '资金预测' and r.sys_code = 'fqs'  ), '/allocation/fundAllocation.do?method=toQueryReport', '0', '1', '0', '0', 1, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/
commit;
