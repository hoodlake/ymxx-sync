--修改日期：20121031
--修改人：叶爱军
--需求编号：SX-AKS1-002
--修改内容：币别汇率
ALTER VIEW V_FC_EXCRATE_ADJUST AS
SELECT BC.CUR_CODE,
       BC.CUR_NAME,
       (CASE WHEN FEA.NEW_EXCHANGE_RATE IS NULL THEN BC.CUR_EXRATE ELSE FEA.NEW_EXCHANGE_RATE END) AS NEW_EXCHANGE_RATE,
       (CASE WHEN FEA.ADJUST_TIME IS NULL THEN '1900-01-01' ELSE CONVERT(CHAR(20), FEA.ADJUST_TIME, 120) END) AS ADJUST_TIME
  FROM BT_CURRENCY BC
  LEFT JOIN FC_EXCRATE_ADJUST FEA ON BC.CUR_CODE = FEA.CUR_CODE AND FEA.STATUS = '95';
GO