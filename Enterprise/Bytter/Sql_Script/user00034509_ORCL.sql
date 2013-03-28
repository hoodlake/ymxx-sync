--修改人：李程
--承兑汇票
--库存票据业务表新增“视同现汇”字段
--[VP6753]奥克斯ERP上划下拨接口开发
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_RECEIVE' AND COLUMN_NAME = 'AS_SPOT_EXCHANGE';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
