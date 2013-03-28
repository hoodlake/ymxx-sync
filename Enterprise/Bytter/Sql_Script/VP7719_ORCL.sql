--修改日期：2013-02-20 16:19:02
--修改人：蒲勇军
--修改内容：隐藏参数,银行存款余额汇总表离线账户余额取值选择
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='aqs_bank_balance_way' AND SYS_CODE='adm';
  IF VN_COUNT < 1 THEN
   insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('aqs_bank_balance_way', 'adm', '银行存款余额汇总表离线余额取数', '0', null, null, '0', '取数来源 0,取自历史余额表;1,取自历史明细表; ', '0,取自历史余额表;1,取自历史明细表', '', '', '', '', null, null, null, null, null);
  COMMIT;
 END IF; 
END;
/
