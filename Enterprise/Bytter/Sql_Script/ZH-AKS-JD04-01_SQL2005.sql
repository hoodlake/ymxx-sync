--修改人：刘建勇
--修改时间:2012-12-24
--修改内容:日明细和历史明细归类到明细表，可通过明细表进行展开，再显示当日明细和历史明细：
--新增菜单：明细
GO
DECLARE
  @BSR_COUNT INT;
BEGIN
	SELECT @BSR_COUNT = COUNT(*)
    FROM BT_SYS_RES T1 ,BT_SYS_RES T2  
    WHERE T1.RES_NAME='明细' AND T1.SYS_CODE='fqs' AND T2.RES_NAME='银行数据报表'  
    AND T2.RES_CODE=T1.FATHER_CODE;  
  	IF @BSR_COUNT < 1
  	   BEGIN
	  	    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET,STATUS, RES_ORDER, RMK, REVERSE1,
				REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)  
			SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), '明细', 'fqs', (select s2.res_code from bt_sys_res s2 where s2.res_name='银行数据报表' 
				and s2.sys_code = 'fqs' ), '', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, ''
			FROM  BT_SYS_RES WHERE res_name = '银行数据报表' and sys_code = 'fqs';
  	   END;
END;
GO

UPDATE  BT_SYS_RES  SET   FATHER_CODE=(SELECT RES_CODE FROM BT_SYS_RES WHERE RES_NAME='明细' AND SYS_CODE='fqs'),  RES_LEVEL=3
WHERE  RES_NAME='银行当日明细' OR  RES_NAME='银行历史明细'  AND SYS_CODE='fqs';

GO

DECLARE
  @BSR_COUNT INT;
BEGIN
	SELECT @BSR_COUNT = COUNT(*)
    FROM BT_SYS_RES T1 ,BT_SYS_RES T2  
    WHERE T1.RES_NAME='余额' AND T1.SYS_CODE='fqs' AND T2.RES_NAME='银行数据报表'  
    AND T2.RES_CODE=T1.FATHER_CODE;  
  	IF @BSR_COUNT < 1
  	   BEGIN
	  	    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET,STATUS, RES_ORDER, RMK, REVERSE1,
				REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)  
			SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), '余额', 'fqs', (select s2.res_code from bt_sys_res s2 where s2.res_name='银行数据报表' 
				and s2.sys_code = 'fqs' ), '', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, ''
			FROM  BT_SYS_RES WHERE res_name = '银行数据报表' and sys_code = 'fqs';
  	   END;
END;
GO

UPDATE  BT_SYS_RES  SET   FATHER_CODE=(SELECT RES_CODE FROM BT_SYS_RES WHERE RES_NAME='余额' AND SYS_CODE='fqs'  AND FATHER_CODE=(SELECT RES_CODE FROM BT_SYS_RES WHERE RES_NAME='银行数据报表')),  RES_LEVEL=3
WHERE  RES_NAME='银行当前余额' OR  RES_NAME='银行历史余额'  AND SYS_CODE='fqs';

GO
