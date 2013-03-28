DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='fqs' AND t1.res_name='中心账号头寸调拨' AND t1.father_code=t2.res_code AND t2.res_name='内部账号查询';
  IF @VN_COUNT < 1 
  BEGIN
   INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, 
   REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '中心账号头寸调拨', 'fqs', RES_CODE, '/monitor/allQueryCash.jsp', '0', '1', '0', '0', 
   (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'fqs'), 
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '内部账号查询' AND T3.SYS_CODE = 'fqs';
  END;
END;
GO