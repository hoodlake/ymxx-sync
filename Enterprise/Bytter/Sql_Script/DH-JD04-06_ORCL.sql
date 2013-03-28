--修改日期：2013.01.22
--修改人：李程
--修改内容：德豪国际结算
--修改原因：新增功能报关单录入，报关单统计
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = '报关单' and sys_code = 'lcs';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2,
   REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   values((select max(res_code) + 1 from bt_sys_res), '报关单', 'lcs', 0, '','0', '0', '0', '0', 30, '报关单','', '', '', '', '', null, null, null, null, null, 1, '');
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='lcs' AND t1.res_name='录入报关单' AND t1.father_code=t2.res_code AND t2.res_name='报关单';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'录入报关单','lcs',res_code,'/credit/customsFormAdd.jsp'
   ,'0','1','0','0',2,'录入报关单','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '报关单' and sys_code = 'lcs';
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='lcs' AND t1.res_name='报关单统计' AND t1.father_code=t2.res_code AND t2.res_name='报关单';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'报关单统计','lcs',res_code,'/credit/customsFormStatistics.jsp'
   ,'0','1','0','0',2,'报关单统计','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '报关单' and sys_code = 'lcs';
  END IF;
  COMMIT; 
END;
/






DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'LC_BILL_CUSTOMS';
  IF VN_COUNT < 1 THEN
  
    VC_STR := 'CREATE TABLE LC_BILL_CUSTOMS (
       ID NUMBER PRIMARY KEY,
       UUID VARCHAR2(32),
       CORPS VARCHAR2(150),
       RENDER_NO VARCHAR2(150),
       RECORD_NO VARCHAR2(150),
       CUSTOMS_DATE DATE,
       ABLED NUMBER DEFAULT 0  
)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE VC_STR VARCHAR2(2000);
VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'CUSTOMS_RELATIONS';
  IF VN_COUNT < 1 THEN
  
    VC_STR := 'CREATE TABLE CUSTOMS_RELATIONS (
       ID NUMBER PRIMARY KEY,
       CID VARCHAR2(32),
       ARRIVAL_NO VARCHAR2(20),
       ABLED NUMBER DEFAULT 0
  )';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
commit;
