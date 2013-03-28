--�޸����ڣ�2013.01.22
--�޸��ˣ����
--�޸����ݣ��º����ʽ���
--�޸�ԭ���������ܱ��ص�¼�룬���ص�ͳ��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = '���ص�' and sys_code = 'lcs';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2,
   REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   values((select max(res_code) + 1 from bt_sys_res), '���ص�', 'lcs', 0, '','0', '0', '0', '0', 30, '���ص�','', '', '', '', '', null, null, null, null, null, 1, '');
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='lcs' AND t1.res_name='¼�뱨�ص�' AND t1.father_code=t2.res_code AND t2.res_name='���ص�';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'¼�뱨�ص�','lcs',res_code,'/credit/customsFormAdd.jsp'
   ,'0','1','0','0',2,'¼�뱨�ص�','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ص�' and sys_code = 'lcs';
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='lcs' AND t1.res_name='���ص�ͳ��' AND t1.father_code=t2.res_code AND t2.res_name='���ص�';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'���ص�ͳ��','lcs',res_code,'/credit/customsFormStatistics.jsp'
   ,'0','1','0','0',2,'���ص�ͳ��','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ص�' and sys_code = 'lcs';
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
