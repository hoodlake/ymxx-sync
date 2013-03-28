--修改人：李德成 
--修改日期：2012-12-03
--修改内容：参数“特殊银行借款类别”的多个类别间用英文分号隔开
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_PARAM  where CODE = 'special_bank_loan_type' and sys_code = 'cms';
  IF VN_COUNT >=1 THEN
   update BT_PARAM set REVERSE1='说明：维护个性化借款类别，多个借款类别中间用英文分号隔开' where CODE = 'special_bank_loan_type' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/
