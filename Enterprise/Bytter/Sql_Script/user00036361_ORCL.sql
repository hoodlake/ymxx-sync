--修改人  ：胡双
--修改日期：2012-12-20
--修改内容：新增参数：自开票据登记付款账号是否必填项
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param  WHERE sys_code='ads' AND code='PAYNO';
  IF VN_COUNT < 1 THEN
   INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('PAYNO','ads','自开票据付款账号是否必填',0,0,'0 否;1 是','0,否;1,是',1);
  END IF;
  COMMIT; 
END;
/
