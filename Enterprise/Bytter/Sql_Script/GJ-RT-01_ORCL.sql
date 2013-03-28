--时间：2012-12-17
--内容：增加本部单位参数
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isBbCorpParam';
  IF VN_COUNT < 1 THEN
   INSERT INTO bt_param(code, sys_code, NAME, param_value1, rmk,reverse1, reverse6)
   VALUES('isBbCorpParam','cms','本部单位参数设置',0,'设置多个单位以;分隔','说明:设置多个单位以;分隔',0.00);
  END IF;
  COMMIT; 
END;
/

DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
   INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '领导查询'
  and sys_code='wpf' and res_url='/workPicture/infoAction.do?method=picture';  
  IF VN_COUNT < 1 THEN
   
  insert into bt_sys_res
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
   RES_LEVEL,
   RES_ROLE)
  
  select (select max(RES_CODE) + 1 from bt_sys_res),
   '领导查询',
   'wpf',
   9001,
   '/workPicture/infoAction.do?method=picture',
   '0',
   '0',
   '0',
   '0',
   10,
   '',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''  
  from  bt_sys_res  where res_name = '工作台管理'
  and sys_code='wpf' ;
  END IF;
END;  
/


commit; 