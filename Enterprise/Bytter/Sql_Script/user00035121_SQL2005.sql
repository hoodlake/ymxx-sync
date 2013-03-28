--修改人：雷艳雄
--修改时间：2012-11-21
--描述：产品赎回 显示日志问题

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER VIEW [dbo].[V_BIS_FIN_PRODUCT_BKQY] AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '钞'
         WHEN F.CASHFLAG = '1' THEN
          '汇'
       END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       CONVERT(MONEY, ROUND(F.PRODBAL, 2), 120) AS PRODBAL,
       CONVERT(MONEY, ROUND(F.AVAILBAL, 2), 120) AS AVAILBAL,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       E.REDM_AMT,
       CONVERT(CHAR(20), E.TRANS_TIME, 120) AS TRANS_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS + ''
         ELSE
          S.VOUCHER_STAT
       END) AS VOUCHER_STAT,
       (CASE
          WHEN S.VOUCHER_STAT IS NULL THEN
           (CASE
          WHEN E.STATUS = '550' THEN
           '审批中'
          WHEN E.STATUS = '500' THEN
           '暂存'
          WHEN E.STATUS = '450' THEN
           '打回'
          WHEN E.STATUS = '95' THEN
           '审批通过'
          WHEN E.STATUS = '250' THEN
           '删除'
          WHEN E.STATUS = '200' THEN
           '无效'
          WHEN E.STATUS = '150' THEN
           '过期'
          WHEN E.STATUS = '11' THEN
           '待审批'
        END) ELSE(CASE
         WHEN LTRIM(S.VOUCHER_STAT) = '3' THEN
          '准备发送'
         WHEN LTRIM(S.VOUCHER_STAT) = '9' THEN
          '接口处理失败'
         WHEN LTRIM(S.VOUCHER_STAT) = '2' THEN
          '银行处理失败'
         WHEN LTRIM(S.VOUCHER_STAT) = '0' THEN
          '交易成功'
       END) END) AS VOUCHER_STAT_NAME,
       (CASE
         WHEN S.VOUCHER_STAT = '2' THEN
          1
         WHEN S.VOUCHER_STAT = '9' THEN
          1
         ELSE
          0
       END) AS IS_INVAIL,
       CONVERT(MONEY, ROUND(P.REDMMINAMT, 2), 120) AS REDMMINAMT,
       S.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID  AND S.BIS_TYPE = '05'
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05'
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER VIEW [dbo].[V_BIS_FIN_PRODUCT_BKED] AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '钞'
         WHEN F.CASHFLAG = '1' THEN
          '汇'
       END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       CONVERT(MONEY, ROUND(F.PRODBAL, 2), 120) AS PRODBAL,
       CONVERT(MONEY, ROUND(F.AVAILBAL, 2), 120) AS AVAILBAL,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       E.REDM_AMT,
       CONVERT(CHAR(20), E.TRANS_TIME, 120) AS TRANS_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE
         WHEN E.STATUS = '500' THEN
          '暂存'
         WHEN E.STATUS = '450' THEN
          '打回'
       END) AS VOUCHER_STAT_NAME,
       CONVERT(MONEY, ROUND(P.REDMMINAMT, 2), 120) AS REDMMINAMT,
	   
	             (SELECT SUM (CASE
                          WHEN BFB.BIS_TYPE = '01' AND BFE.BIS_TYPE = '01' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          WHEN BFB.BIS_TYPE = '02' AND BFE.BIS_TYPE = '02' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          ELSE 0
                       END
                      )
             FROM BIS_FIN_BUY BFB JOIN BIS_FIN_EXC BFE
                  ON BFB.VOUCHER_NO = BFE.THIRD_ID
            WHERE BFB.CORP_ID = E.CORP_ID AND BFB.PRODNO = E.PRODNO)
                                                            AS PURCHASE_COUNT,
          (SELECT SUM (CASE
                          WHEN BFB.BIS_TYPE = '05' AND BFE.BIS_TYPE = '05' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          ELSE 0
                       END
                      )
             FROM BIS_FIN_BUY BFB JOIN BIS_FIN_EXC BFE
                  ON BFB.VOUCHER_NO = BFE.THIRD_ID
            WHERE BFB.CORP_ID = E.CORP_ID AND BFB.PRODNO = E.PRODNO)
                                                                AS BACK_COUNT,
	   
	   
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05'
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER VIEW [dbo].[V_BIS_FIN_PRODUCT_BACK] AS
SELECT E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE
         WHEN P.TARGET = 1 THEN
          '个人'
         WHEN P.TARGET = 2 THEN
          '公司'
         WHEN P.TARGET = 3 THEN
          '全部'
         WHEN P.TARGET = 4 THEN
          '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE
         WHEN F.CASHFLAG = '0' THEN
          '钞'
         WHEN F.CASHFLAG = '1' THEN
          '汇'
       END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       CONVERT(MONEY, ROUND(F.PRODBAL, 2), 120) AS PRODBAL,
       CONVERT(MONEY, ROUND(F.AVAILBAL, 2), 120) AS AVAILBAL,
       P.REDMFLG,
       (CASE
         WHEN P.REDMFLG = '0' THEN
          '不可操作'
         WHEN P.REDMFLG = '1' THEN
          '可操作'
       END) AS REDMFLG_NAME,
       SUM(CASE
             WHEN E.BIS_TYPE = '01' AND S.VOUCHER_STAT = '0' THEN
              1
             WHEN E.BIS_TYPE = '02' AND S.VOUCHER_STAT = '0' THEN
              1
             ELSE
              0
           END) AS PURCHASE_COUNT,
       SUM(CASE
             WHEN E.BIS_TYPE = '05' AND S.VOUCHER_STAT = '0' THEN
              1
             ELSE
              0
           END) AS BACK_COUNT,
       CONVERT(MONEY, ROUND(P.REDMMINAMT, 2), 120) AS REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  JOIN BIS_FIN_PRODUCT_INFO P 
  ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  JOIN BIS_FIN_BAL F 
  ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T 
  ON E.CORP_ID = T.ID LEFT JOIN BIS_BIF_INIT B 
  ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 GROUP BY E.CORP_ID,
          T.CORP_NAME,
          E.BIF_CODE,
          B.NAME,
          E.ACCTID,
          E.PRODNO,
          P.PRODNAME,
          P.TARGET,
          F.CASHFLAG,
          P.DTSTART,
          P.DTEND,
          P.CURRENCY,
          C.CUR_NAME,
          F.PRODBAL,
          F.AVAILBAL,
          P.REDMFLG,
          P.REDMMINAMT,
          P.RETURN_MSG
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

