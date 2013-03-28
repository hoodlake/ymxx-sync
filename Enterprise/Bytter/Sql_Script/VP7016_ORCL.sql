--修改人:陈春燕
--修改时间:2012-11-2
--修改内容:ZY-CD-01_ORCL.sql 更改ab_operation，测试缺此字段
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_OPERATION' AND COLUMN_NAME = 'RATMODEL';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_OPERATION add RATMODEL char(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/