--修改日期：20121031
--修改人：叶爱军
--需求编号：SX-AKS1-002
--修改内容：综合单项的共享额度
IF EXISTS(SELECT 1  FROM SYSOBJECTS WHERE XTYPE = 'FN' AND NAME='FUN_GET_PROCESS_MONEY_SIN')
DROP FUNCTION FUN_GET_PROCESS_MONEY_SIN
GO
CREATE FUNCTION FUN_GET_PROCESS_MONEY_SIN(@V_RATION_CODE VARCHAR, @V_ITEM_CODE VARCHAR, @V_COMPCODE VARCHAR)
  RETURNS NUMERIC AS
BEGIN
  DECLARE @V_PROCESS_MONEY NUMERIC(15, 2)
  SELECT @V_PROCESS_MONEY = ISNULL(SUM(T.V_PROCESS_MONEY), 0)
  FROM (SELECT (CASE WHEN LEN(RC.ITEM_CODE) = 9 THEN RC.MONEY ELSE 0 END) AS V_PROCESS_MONEY
  FROM RAT_COMPOSITIVE_DETAIL RC JOIN RAT_URATION RU ON RC.RAT_CODE = RU.RATION_CODE AND RC.REF_CODE = RU.BILLNO
  AND PATINDEX(RU.COMP_ITEM_CODE, RC.ITEM_CODE) >= 1 WHERE RC.REF_TYPE = '6' AND RC.RAT_CODE = @V_RATION_CODE AND RU.RATION_CODE = @V_RATION_CODE
  AND PATINDEX(RC.ITEM_CODE, @V_ITEM_CODE) >= 1 AND RU.STATUS IN ('1', '2')
  AND RC.COMP_CODE IN (SELECT RBD.COMPCODE FROM RAT_BKRATION_DIS RBD WHERE RBD.RAT_CODE = @V_RATION_CODE AND RBD.DISTRIBUTE_WAY = '2') GROUP BY RC.ITEM_CODE, RC.REF_CODE, RC.MONEY) T
  RETURN @V_PROCESS_MONEY
END
GO

--修改日期：20121031
--修改人：叶爱军
--需求编号：SX-AKS1-002
--修改内容：综合组合项的共享额度
IF EXISTS(SELECT 1  FROM SYSOBJECTS WHERE XTYPE = 'FN' AND NAME='FUN_GET_PROCESS_MONEY_COM')
DROP FUNCTION FUN_GET_PROCESS_MONEY_COM
GO
CREATE FUNCTION FUN_GET_PROCESS_MONEY_COM(@V_RATION_CODE VARCHAR, @V_ITEM_CODE VARCHAR, @V_COMPCODE VARCHAR)
  RETURNS NUMERIC AS
BEGIN
  DECLARE @V_PROCESS_MONEY NUMERIC(15, 2)
  SELECT @V_PROCESS_MONEY = ISNULL(SUM(T.V_PROCESS_MONEY), 0)
  FROM (SELECT DISTINCT RC.REF_CODE, RC.MONEY AS V_PROCESS_MONEY
  FROM RAT_COMPOSITIVE_DETAIL RC JOIN RAT_URATION RU ON RC.RAT_CODE = RU.RATION_CODE AND RC.REF_CODE = RU.BILLNO
  AND PATINDEX(RU.COMP_ITEM_CODE, RC.ITEM_CODE) >= 1 WHERE RC.REF_TYPE = '6' AND RC.RAT_CODE = @V_RATION_CODE AND RU.RATION_CODE = @V_RATION_CODE
  AND PATINDEX(RC.ITEM_CODE, @V_ITEM_CODE) >= 1 AND RU.STATUS IN ('1', '2')
  AND RC.COMP_CODE IN (SELECT RBD.COMPCODE FROM RAT_BKRATION_DIS RBD WHERE RBD.RAT_CODE = @V_RATION_CODE AND RBD.DISTRIBUTE_WAY = '2') GROUP BY RC.ITEM_CODE, RC.REF_CODE, RC.MONEY) T
  RETURN @V_PROCESS_MONEY
END
GO