--修改日期：20120910
--修改人：叶爱军
--修改内容：user00031873
--修改内容：增加TRANS_TIME字段
--ALTER TABLE BIS_FIN_CONTRACT ADD TRANS_TIME VARCHAR(40);
--GO

UPDATE BT_SYS_RES SET RES_NAME = '理财产品购买' WHERE SYS_CODE = 'cho' AND RES_NAME = '理财产品销售';
GO

UPDATE BT_APPROVE_BUSINESS SET MONEY_FIELD = 'AMT' WHERE SYS_CODE = 'cho' AND BUSINESS_CODE = 'bankacc_fin';
UPDATE BT_APPROVE_BUSINESS SET MONEY_FIELD = 'REDM_AMT' WHERE SYS_CODE = 'cho' AND BUSINESS_CODE = 'bankacc_bac';
GO

--IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BIS_FIN_DTL]') AND name = N'PK_BIS_FIN_DTL')
--ALTER TABLE [dbo].[BIS_FIN_DTL] DROP CONSTRAINT [PK_BIS_FIN_DTL]
--GO
--ALTER TABLE BIS_FIN_DTL ADD CONSTRAINT PK_SERIAL_ID PRIMARY KEY (SERIAL_ID);
--GO

--IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BIS_FIN_HIS_DTL]') AND name = N'PK_BIS_FIN_HIS_DTL')
--ALTER TABLE [dbo].[BIS_FIN_HIS_DTL] DROP CONSTRAINT [PK_BIS_FIN_HIS_DTL]
--GO
--ALTER TABLE BIS_FIN_HIS_DTL ADD CONSTRAINT PK_SERIAL_ID_HIS PRIMARY KEY (SERIAL_ID);
--GO

ALTER VIEW V_BIS_FIN_PRODUCT_INFO AS
SELECT P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE WHEN P.RETURN_TYPE=1 THEN '收益率' ELSE '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
       P.AGREEMCONTENT,
       CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       P.VOUCHER_STAT,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE NOT EXISTS (SELECT I.PRODNO
          FROM BIS_FIN_PRODUCT_INFO I
         WHERE I.PRODNO = P.PRODNO
           AND I.SBSCRFLG = '0'
           AND I.PURCHFLG = '0')
GO
ALTER VIEW V_BIS_FIN_PRODUCT_SIGN AS
SELECT F.CONTRACT_ID,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET=1 THEN
	         '个人'
             WHEN P.TARGET=2 THEN
			 '公司'
			 WHEN P.TARGET=3 THEN
			 '全部'
			 WHEN P.TARGET=4 THEN
			 '同业'
	    END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE WHEN P.RETURN_TYPE=1 THEN '收益率'
	         ELSE '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
       CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       F.VOUCHER_STAT,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN
             (CASE WHEN F.VOUCHER_STAT = '0' THEN
                   '已签约'
                   WHEN F.VOUCHER_STAT = '2' THEN
                   '银行处理失败'
                   WHEN F.VOUCHER_STAT = '3' THEN
                   '准备发送'
                   WHEN F.VOUCHER_STAT = '9' THEN
                   '接口处理失败'
              END)
       WHEN F.SIGNFLG = '1' THEN
       '签约中'
       WHEN F.SIGNFLG = '2' THEN
       '未签约'
       WHEN F.SIGNFLG = '3' THEN
       '签约失败'
       END) AS SIGNFLG_NAME,
       P.RETURN_MSG,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       (CASE
         WHEN P.SBSCRFLG = 0 THEN
          0
         WHEN P.SBSCRFLG = 1 AND ( CONVERT(CHAR(10),getdate(), 120) BETWEEN
               CONVERT(CHAR(10),P.DTSTART, 120) and
               CONVERT(CHAR(10),P.DTEND, 120)) THEN
          1
         ELSE
          0
       END) AS IS_SBSCRFLG
  FROM BIS_FIN_CONTRACT F
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
GO
ALTER VIEW V_BIS_FIN_PRODUCT_MODY AS
SELECT E.VOUCHER_NO,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE WHEN P.RETURN_TYPE = '1' THEN '收益率' WHEN P.RETURN_TYPE = '2' THEN '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
       CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE WHEN E.STATUS = '500' THEN '暂存' WHEN E.STATUS = '450' THEN '打回' END) AS VOUCHER_STAT_NAME,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN
             (CASE WHEN F.VOUCHER_STAT = '0' THEN
                   '已签约'
                   WHEN F.VOUCHER_STAT = '2' THEN
                   '银行处理失败'
                   WHEN F.VOUCHER_STAT = '3' THEN
                   '准备发送'
                   WHEN F.VOUCHER_STAT = '9' THEN
                   '接口处理失败'
              END)
       WHEN F.SIGNFLG = '1' THEN
       '签约中'
       WHEN F.SIGNFLG = '2' THEN
       '未签约'
       WHEN F.SIGNFLG = '3' THEN
       '签约失败'
       END) AS SIGNFLG_NAME,
       P.RETURN_MSG,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
        CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       F.ACCTID,
       E.CONTRACT_ID,
       F.SIGN_USER_ID,
        CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       E.AMT,
       E.BIS_TYPE,
       (CASE WHEN E.BIS_TYPE = '01' THEN '认购' WHEN E.BIS_TYPE = '02' THEN '申购' END) AS BIS_TYPE_NAME
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
  LEFT JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE F.SIGNFLG = '0'
   AND  CONVERT(CHAR(10),F.SIGN_TIME, 120) =  CONVERT(CHAR(10),getdate(), 120)
GO
ALTER VIEW V_BIS_FIN_PRODUCT_QUEY AS
SELECT E.VOUCHER_NO,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       (CASE WHEN P.RETURN_TYPE = '1' THEN '收益率' WHEN P.RETURN_TYPE = '2' THEN '净值' END) AS RETURN_TYPE_NAME,
       P.DTSTART,
       P.DTEND,
       P.INTRSTEDTSTART,
       P.EXPIREDATE,
       P.DTEXCHANGE,
       P.REFVALUE,
       P.MANAGEMENTFEE,
       P.SBSCRFEE,
       P.PURCHFEE,
       P.REDMFEE,
       P.SBSCRFLG,
       (CASE WHEN P.SBSCRFLG = '0' THEN '不可操作' WHEN P.SBSCRFLG = '1' THEN '可操作' END) AS SBSCRFLG_NAME,
       P.PURCHFLG,
       (CASE WHEN P.PURCHFLG = '0' THEN '不可操作' WHEN P.PURCHFLG = '1' THEN '可操作' END) AS PURCHFLG_NAME,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       P.SBSCRMINAMT,
       P.SBSCRINCAMT,
       P.PURCHMINAMT,
       P.PURCHINCAMT,
       P.HOLDMINAMT,
       P.HOLDMAXAMT,
       P.REDMMINAMT,
       P.REDMINCAMT,
        CONVERT(CHAR(20),P.RETURN_TIME, 120) AS RETURN_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS + ''
         WHEN S.VOUCHER_STAT IS NOT NULL THEN
          RTRIM(LTRIM(S.VOUCHER_STAT))
       END) AS VOUCHER_STAT,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          (CASE WHEN E.STATUS = '550' THEN
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
            END)
         ELSE
          (CASE WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '3' THEN
                 '准备发送'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '9' THEN
                 '接口处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '2' THEN
                 '银行处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '0' THEN
                 '交易成功'
           END)
       END) AS VOUCHER_STAT_NAME,
       (CASE
          WHEN S.VOUCHER_STAT = '2' THEN
           1
          WHEN S.VOUCHER_STAT = '9' THEN
           1
          ELSE
           0
        END) AS IS_INVAIL,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN '已签约' WHEN F.SIGNFLG = '1' THEN '签约中' WHEN F.SIGNFLG = '2' THEN '未签约' WHEN F.SIGNFLG = '3' THEN '签约失败' END) AS SIGNFLG_NAME,
       S.RETURN_MSG,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       CONVERT(CHAR(20),F.SIGN_TIME, 120) AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       E.CORP_ID,
       CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       E.AMT,
       E.BIS_TYPE,
       (CASE WHEN E.BIS_TYPE = '01' THEN '认购' WHEN E.BIS_TYPE = '02' THEN '申购' END) AS BIS_TYPE_NAME
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
  LEFT JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE <= '02'
GO
ALTER VIEW V_BIS_FIN_PRODUCT_BACK AS
SELECT E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE WHEN F.CASHFLAG = '0' THEN '钞' WHEN F.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       F.PRODBAL,
       F.AVAILBAL,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       SUM(CASE WHEN E.BIS_TYPE = '01' AND S.VOUCHER_STAT = '0' THEN 1 WHEN E.BIS_TYPE = '02' AND S.VOUCHER_STAT = '0' THEN 1 ELSE 0 END) AS PURCHASE_COUNT,
       SUM(CASE WHEN E.BIS_TYPE = '05' AND S.VOUCHER_STAT = '0' THEN 1 ELSE 0 END) AS BACK_COUNT,
       P.REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
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
           p.RETURN_MSG
GO
ALTER VIEW V_BIS_FIN_PRODUCT_BKED AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE WHEN F.CASHFLAG = '0' THEN '钞' WHEN F.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       F.PRODBAL,
       F.AVAILBAL,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       E.REDM_AMT,
       CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE WHEN E.STATUS = '500' THEN '暂存' WHEN E.STATUS = '450' THEN '打回' END) AS VOUCHER_STAT_NAME,
       P.REDMMINAMT,
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
  WHERE E.BIS_TYPE = '05'
GO
ALTER VIEW V_BIS_FIN_PRODUCT_BKQY AS
SELECT E.VOUCHER_NO,
       E.CORP_ID,
       T.CORP_NAME,
       E.BIF_CODE,
       B.NAME AS BIF_NAME,
       E.ACCTID,
       E.PRODNO,
       P.PRODNAME,
       P.TARGET,
       (CASE WHEN P.TARGET = 1 THEN
             '个人'
             WHEN P.TARGET = 2 THEN
             '公司'
             WHEN P.TARGET = 3 THEN
             '全部'
             WHEN P.TARGET = 4 THEN
             '同业'
       END) AS TARGET_NAME,
       F.CASHFLAG,
       (CASE WHEN F.CASHFLAG = '0' THEN '钞' WHEN F.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       P.DTSTART,
       P.DTEND,
       P.CURRENCY,
       C.CUR_NAME,
       F.PRODBAL,
       F.AVAILBAL,
       P.REDMFLG,
       (CASE WHEN P.REDMFLG = '0' THEN '不可操作' WHEN P.REDMFLG = '1' THEN '可操作' END) AS REDMFLG_NAME,
       E.REDM_AMT,
        CONVERT(CHAR(20),E.TRANS_TIME, 120) AS TRANS_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS + ''
         ELSE
          S.VOUCHER_STAT
       END) AS VOUCHER_STAT,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          (CASE WHEN E.STATUS = '550' THEN
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
            END)
         ELSE
          (CASE WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '3' THEN
                 '准备发送'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '9' THEN
                 '接口处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '2' THEN
                 '银行处理失败'
                WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '0' THEN
                 '交易成功'
           END)
       END) AS VOUCHER_STAT_NAME,
       (CASE
          WHEN S.VOUCHER_STAT = '2' THEN
           1
          WHEN S.VOUCHER_STAT = '9' THEN
           1
          ELSE
           0
        END) AS IS_INVAIL,
       P.REDMMINAMT,
       S.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05'
GO
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
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 2 THEN
          '银行处理失败'
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 9 THEN
          '接口处理失败'
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
ALTER VIEW V_BIS_FIN_PRODUCT_MONY AS
SELECT DISTINCT C.CORP_ID,
       T.CORP_NAME,
       D.PRODNO,
       D.SHORT_NAME,
       D.BIF_CODE,
       F.NAME AS BIF_NAME,
       C.ACCTID,
       D.PRODBAL,
       D.DEALSHARES,
       D.CASHFLAG,
       (CASE WHEN D.CASHFLAG = '0' THEN '钞' WHEN D.CASHFLAG = '1' THEN '汇' END) AS CASH_NAME,
       D.AVAILBAL,
       --C.BIS_TYPE,
       --DECODE(C.BIS_TYPE, '01', '认购', '02', '申购', '05', '赎回') AS BIS_TYPE_NAME,
       D.RETURN_MSG
  FROM BIS_FIN_BAL D
  LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
  LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
  LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID
GO
ALTER VIEW V_BIS_FIN_PRODUCT_QYHI AS
SELECT SERIAL_ID,
       CORP_ID,
       CORP_NAME,
       PRODNO,
       SHORTNAME,
       BIF_CODE,
       BIF_NAME,
       ACCTID,
       TRNCODE,
       TRNSTATUS,
       CONVERT(MONEY, ROUND(APPLYAMT, 2), 120) AS APPLYAMT,
       CONVERT(MONEY, ROUND(SHAREAPPLY, 2), 120) AS SHAREAPPLY,
       CASHFLAG,
       CASHFLAG_NAME,
       CONVERT(MONEY, ROUND(DEALAMT, 2), 120) AS DEALAMT,
       CONVERT(MONEY, ROUND(DEALSHARES, 2), 120) AS DEALSHARES,
       TRANS_TIME,
       RETURN_MSG,
       BROKER
  FROM (SELECT DISTINCT D.SERIAL_ID,
               C.CORP_ID,
               T.CORP_NAME,
               D.PRODNO,
               D.SHORTNAME,
               D.BIF_CODE,
               F.NAME AS BIF_NAME,
               D.ACCTID,
               D.TRNCODE,
               D.TRNSTATUS,
               D.APPLYAMT,
               D.SHAREAPPLY,
               D.CASHFLAG,
               (CASE
                 WHEN D.CASHFLAG = '0' THEN
                  '钞'
                 WHEN D.CASHFLAG = '1' THEN
                  '汇'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_DTL D
          LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE
          LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
          LEFT JOIN BT_CORP T ON C.CORP_ID = T.CORP_CODE
         WHERE D.TRANS_TYPE = '0'
        UNION ALL
        SELECT DISTINCT D.SERIAL_ID,
               C.CORP_ID,
               T.CORP_NAME,
               D.PRODNO,
               D.SHORTNAME,
               D.BIF_CODE,
               F.NAME AS BIF_NAME,
               D.ACCTID,
               D.TRNCODE,
               D.TRNSTATUS,
               D.APPLYAMT,
               D.SHAREAPPLY,
               D.CASHFLAG,
               (CASE
                 WHEN D.CASHFLAG = '0' THEN
                  '钞'
                 WHEN D.CASHFLAG = '1' THEN
                  '汇'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_HIS_DTL D
          LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE
          LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
          LEFT JOIN BT_CORP T ON C.CORP_ID = T.CORP_CODE
         WHERE D.TRANS_TYPE = '0') AS B
GO