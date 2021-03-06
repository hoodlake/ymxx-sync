--修改人：叶爱军
--修改时间：2012-11-21 
--描述：理财产品签约状态 
ALTER VIEW V_BIS_FIN_STATES_QUERY AS
SELECT F.CONTRACT_ID,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       P.PRODNO,
       F.BIF_CODE,
       P.PRODNAME,
       F.ACCTID,
       P.TARGET,
       F.SIGNFLG,
        CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       (CASE
         WHEN F.SIGNFLG = 0 THEN
          '已签约'
         WHEN F.SIGNFLG = 1 THEN
          '签约中'
         WHEN F.SIGNFLG = 2 THEN
          '未签约'
         WHEN F.SIGNFLG = 3
          '签约失败'
       END) AS SIGNFLG_NAME,
       (CASE
         WHEN F.SIGNFLG = 0 THEN
          0
         WHEN F.SIGNFLG = 1 THEN
          0
         WHEN F.SIGNFLG = 2 THEN
          0
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 2 THEN
          0
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 9 AND  CONVERT(CHAR(10),F.SIGN_TIME, 120) =  CONVERT(CHAR(10),getdate(),120) THEN
          1
         ELSE
          0
       END) AS IS_RESET,
       F.VOUCHER_STAT,
       (CASE WHEN F.VOUCHER_STAT = 0 THEN
             '签约成功'
             WHEN F.VOUCHER_STAT = 2 THEN
             '银行处理失败'
             WHEN F.VOUCHER_STAT = 3 THEN
             '准备发送'
             WHEN F.VOUCHER_STAT = 9 THEN
             '接口处理失败'
             END
       ) AS VOUCHER_STAT_NAME,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
GO