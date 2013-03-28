--修改内容:抵质押物登记新增字段
--修改人:吴结兵
--修改时间:2012-12-07
--折旧率
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'GUA_MORTGAGE_INFO' AND COLUMN_NAME = 'DEPRECIATION_RATE';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table gua_mortgage_info add depreciation_rate number(8,6)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
