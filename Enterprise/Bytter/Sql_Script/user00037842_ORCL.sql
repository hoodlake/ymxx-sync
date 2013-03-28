--修改人:陈春燕
--修改时间:2013-01-14
--修改内容: AB_BILL_ALLOCATION_STOCK 新增票据编号；删除是删掉AB_BILL_ALLOCATION_STOCK里的记录
-------- add column BILL_ID
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN 
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_BILL_ALLOCATION_STOCK' AND COLUMN_NAME = 'BILL_ID';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE AB_BILL_ALLOCATION_STOCK ADD BILL_ID NUMBER(28)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
