IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'SELL_TARGET' AND LTRIM(B.NAME) = 'BIS_FIN_PRODUCT_INFO')
	ALTER TABLE BIS_FIN_PRODUCT_INFO ADD SELL_TARGET CHAR(1);
GO
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TARGET' AND LTRIM(B.NAME) = 'BIS_FIN_PRODUCT_INFO')
	ALTER TABLE BIS_FIN_PRODUCT_INFO ALTER COLUMN TARGET CHAR(1) NOT NULL;
GO
ALTER TABLE BIS_FIN_PRODUCT_INFO DROP CONSTRAINT PK_BIS_FIN_PRODUCT_INFO;
GO
ALTER TABLE BIS_FIN_PRODUCT_INFO ADD CONSTRAINT PK_BIS_FIN_PRODUCT_INFO PRIMARY KEY (PRODNO, BIF_CODE, TARGET);
GO

-- BIS_FIN_BUY
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TARGET' AND LTRIM(B.NAME) = 'BIS_FIN_BUY')
	ALTER TABLE BIS_FIN_BUY ADD TARGET CHAR(1);
GO
-- BIS_FIN_CONTRACT
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TARGET' AND LTRIM(B.NAME) = 'BIS_FIN_CONTRACT')
	ALTER TABLE BIS_FIN_CONTRACT ADD TARGET CHAR(1);
GO
-- ADD COMMENTS TO THE COLUMNS

GO
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'TARGET' AND LTRIM(B.NAME) = 'BIS_FIN_BAL')
	ALTER TABLE BIS_FIN_BAL ADD TARGET CHAR(1);
GO

IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_MONY_QUERY')
DROP VIEW V_BIS_FIN_PRODUCT_MONY_QUERY;
GO
CREATE   VIEW V_BIS_FIN_PRODUCT_MONY_QUERY AS
SELECT DISTINCT C.CORP_ID, T.CORP_NAME, D.PRODNO, D.SHORT_NAME, D.BIF_CODE,
                   F.NAME AS BIF_NAME, C.ACCTID,
                   ROUND (D.PRODBAL, 2) AS PRODBAL,
                   ROUND (D.DEALSHARES, 2) AS DEALSHARES,
                   D.CASHFLAG,
                   (CASE
                       WHEN D.CASHFLAG = '0'
                          THEN '钞'
                       WHEN D.CASHFLAG = '1'
                          THEN '汇'
                    END
                   ) AS CASH_NAME,
                   ROUND (D.AVAILBAL, 2) AS AVAILBAL,
                   D.RETURN_MSG
              FROM BIS_FIN_BAL D LEFT JOIN BIS_FIN_BUY C ON C.PRODNO =
                                                                      D.PRODNO
                   LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                   LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID;
-------
GO
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_QYHI_QUERY')
DROP VIEW V_BIS_FIN_PRODUCT_QYHI_QUERY;
GO
CREATE  VIEW V_BIS_FIN_PRODUCT_QYHI_QUERY AS
SELECT SERIAL_ID, CORP_ID, CORP_NAME, PRODNO, SHORTNAME,
          BIF_CODE, BIF_NAME, ACCTID, TRNCODE, TRNSTATUS,
           ROUND (APPLYAMT, 2)  AS APPLYAMT,
           ROUND (SHAREAPPLY, 2)  AS SHAREAPPLY,
          CASHFLAG, CASHFLAG_NAME,
           ROUND (DEALAMT, 2)  AS DEALAMT,
           ROUND (DEALSHARES, 2)  AS DEALSHARES,
          TRANS_TIME, RETURN_MSG, BROKER
     FROM (SELECT DISTINCT D.SERIAL_ID, --C.CONTRACT_ID,
                           ACC.CORP_ID, CP.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME,
                           D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_DTL D
                           JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                           JOIN BT_BANK_ACC ACC ON D.ACCTID = ACC.BANK_ACC
                           JOIN BT_CORP CP ON CP.ID = ACC.CORP_ID
                         AND  D.TRANS_TYPE = '0'
            UNION ALL
            SELECT DISTINCT D.SERIAL_ID, --C.CONTRACT_ID,
                           ACC.CORP_ID, CP.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME,
                           D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_HIS_DTL D
                           JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                           JOIN BT_BANK_ACC ACC ON D.ACCTID = ACC.BANK_ACC
                           JOIN BT_CORP CP ON CP.ID = ACC.CORP_ID
                         AND  D.TRANS_TYPE = '0') AS T;
GO
--------------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_INFO_QUERY')
DROP VIEW V_BIS_FIN_PRODUCT_INFO_QUERY;
GO
CREATE VIEW V_BIS_FIN_PRODUCT_INFO_QUERY AS
SELECT P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME, P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '收益率'
              WHEN P.RETURN_TYPE = '2'
                 THEN '净值'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
           ROUND (P.REFVALUE, 2)  AS REFVALUE,
           ROUND (P.MANAGEMENTFEE, 2) AS MANAGEMENTFEE,
           ROUND (P.SBSCRFEE, 2)  AS SBSCRFEE,
           ROUND (P.PURCHFEE, 2)  AS PURCHFEE,
           ROUND (P.REDMFEE, 2)  AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '不可操作'
              WHEN P.SBSCRFLG = '1'
                 THEN '可操作'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '不可操作'
              WHEN P.PURCHFLG = '1'
                 THEN '可操作'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
           ROUND (P.SBSCRMINAMT, 2) AS SBSCRMINAMT,
           ROUND (P.SBSCRINCAMT, 2) AS SBSCRINCAMT,
           ROUND (P.PURCHMINAMT, 2) AS PURCHMINAMT,
           ROUND (P.PURCHINCAMT, 2) AS PURCHINCAMT,
           ROUND (P.HOLDMINAMT, 2)  AS HOLDMINAMT,
           ROUND (P.HOLDMAXAMT, 2)  AS HOLDMAXAMT,
           ROUND (P.REDMMINAMT, 2)  AS REDMMINAMT,
           ROUND (P.REDMINCAMT, 2)  AS REDMINCAMT,
          P.AGREEMCONTENT,
          CONVERT (VARCHAR(24),P.RETURN_TIME, 120) AS RETURN_TIME,
          P.VOUCHER_STAT, P.RETURN_MSG
     FROM BIS_FIN_PRODUCT_INFO P LEFT JOIN BIS_BIF_INIT B
          ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE;
GO
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_SIGN')
DROP VIEW V_BIS_FIN_PRODUCT_SIGN;
GO

CREATE  VIEW V_BIS_FIN_PRODUCT_SIGN AS
SELECT F.CONTRACT_ID, P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME,
          P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '收益率'
              WHEN P.RETURN_TYPE = '2'
                 THEN '净值'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
           ROUND (P.REFVALUE, 2) AS REFVALUE,
           ROUND (P.MANAGEMENTFEE, 2) AS MANAGEMENTFEE,
           ROUND (P.SBSCRFEE, 2) AS SBSCRFEE,
          ROUND (P.PURCHFEE, 2) AS PURCHFEE,
          ROUND (P.REDMFEE, 2) AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '不可操作'
              WHEN P.SBSCRFLG = '1'
                 THEN '可操作'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '不可操作'
              WHEN P.PURCHFLG = '1'
                 THEN '可操作'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
          ROUND (P.SBSCRMINAMT, 2) AS SBSCRMINAMT,
          ROUND (P.SBSCRINCAMT, 2) AS SBSCRINCAMT,
          ROUND (P.PURCHMINAMT, 2) AS PURCHMINAMT,
          ROUND (P.PURCHINCAMT, 2) AS PURCHINCAMT,
          ROUND (P.HOLDMINAMT, 2) AS HOLDMINAMT,
          ROUND (P.HOLDMAXAMT, 2) AS HOLDMAXAMT,
          ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
          ROUND (P.REDMINCAMT, 2) AS REDMINCAMT,
          CONVERT (VARCHAR(24),P.RETURN_TIME, 120) AS RETURN_TIME,
          F.VOUCHER_STAT, F.SIGNFLG,
          (CASE
              WHEN F.SIGNFLG = '0'
                 THEN (CASE
                          WHEN F.VOUCHER_STAT = '0'
                             THEN '已签约'
                          WHEN F.VOUCHER_STAT = '1'
                             THEN '结果待查'
                          WHEN F.VOUCHER_STAT = '2'
                             THEN '银行处理失败'
                          WHEN F.VOUCHER_STAT = '3'
                             THEN '准备发送'
                          WHEN F.VOUCHER_STAT = '9'
                             THEN '接口处理失败'
                       END
                      )
              WHEN F.SIGNFLG = '1'
                 THEN '签约中'
              WHEN F.SIGNFLG = '2'
                 THEN '未签约'
              WHEN F.SIGNFLG = '3'
                 THEN '签约失败'
           END
          ) AS SIGNFLG_NAME,
          F.RETURN_MSG, F.SIGN_CORP AS CORP_ID, T.CORP_NAME AS SIGN_CORP_NAME,
          CONVERT (VARCHAR(24),F.SIGN_TIME, 120) AS SIGN_TIME,
          F.ACCTID, F.SIGN_USER_ID,
          (CASE
              WHEN P.SBSCRFLG = 0
                 THEN 0
              WHEN P.SBSCRFLG = 1
              AND  CONVERT (VARCHAR(24),GETDATE(), 110) BETWEEN  CONVERT (VARCHAR(24),P.DTSTART, 110)
                                                       AND  CONVERT (VARCHAR(24),P.DTEND, 110)
              
                 THEN 1
              ELSE 0
           END
          ) AS IS_SBSCRFLG
     FROM BIS_FIN_CONTRACT F LEFT JOIN BIS_FIN_PRODUCT_INFO P
          ON P.PRODNO = F.PRODNO AND P.BIF_CODE=F.BIF_CODE AND P.TARGET=F.TARGET
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE;
GO 
------

IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_BACK')
DROP VIEW V_BIS_FIN_PRODUCT_BACK;
GO
CREATE VIEW V_BIS_FIN_PRODUCT_BACK AS
SELECT   E.CORP_ID, T.CORP_NAME, E.BIF_CODE, B.NAME AS BIF_NAME, E.ACCTID,
            E.PRODNO, P.PRODNAME, P.TARGET,
            (CASE
                WHEN P.TARGET = 1
                   THEN '个人'
                WHEN P.TARGET = 2
                   THEN '公司'
                WHEN P.TARGET = 3
                   THEN '全部'
                WHEN P.TARGET = 4
                   THEN '同业'
             END
            ) AS TARGET_NAME,
            F.CASHFLAG,
            (CASE
                WHEN F.CASHFLAG = '0'
                   THEN '钞'
                WHEN F.CASHFLAG = '1'
                   THEN '汇'
             END
            ) AS CASH_NAME,
            P.DTSTART, P.DTEND, P.CURRENCY, C.CUR_NAME,
            ROUND (F.PRODBAL, 2) AS PRODBAL,
            ROUND (F.AVAILBAL, 2) AS AVAILBAL,
            P.REDMFLG,
            (CASE
                WHEN P.REDMFLG = '0'
                   THEN '不可操作'
                WHEN P.REDMFLG = '1'
                   THEN '可操作'
             END
            ) AS REDMFLG_NAME,
            SUM (CASE
                    WHEN E.BIS_TYPE = '01' AND S.BIS_TYPE = '01' AND S.VOUCHER_STAT = '0'
                       THEN 1
                    WHEN E.BIS_TYPE = '02' AND S.BIS_TYPE = '02' AND S.VOUCHER_STAT = '0'
                       THEN 1
                    ELSE 0
                 END
                ) AS PURCHASE_COUNT,
            SUM (CASE
                    WHEN E.BIS_TYPE = '05' AND S.BIS_TYPE = '05' AND S.VOUCHER_STAT = '0'
                       THEN 1
                    ELSE 0
                 END
                ) AS BACK_COUNT,
            ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
            P.RETURN_MSG
       FROM BIS_FIN_BUY E JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
            JOIN BIS_FIN_PRODUCT_INFO P
            ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE AND E.TARGET=P.TARGET
            JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
            LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
            LEFT JOIN BIS_BIF_INIT B
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
            P.RETURN_MSG;
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_BKED')
DROP VIEW V_BIS_FIN_PRODUCT_BKED;
GO
CREATE  VIEW V_BIS_FIN_PRODUCT_BKED AS
SELECT E.VOUCHER_NO, E.CORP_ID, T.CORP_NAME, E.BIF_CODE,
          B.NAME AS BIF_NAME, E.ACCTID, E.PRODNO, P.PRODNAME, P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          F.CASHFLAG,
          (CASE
              WHEN F.CASHFLAG = '0'
                 THEN '钞'
              WHEN F.CASHFLAG = '1'
                 THEN '汇'
           END
          ) AS CASH_NAME,
          P.DTSTART, P.DTEND, P.CURRENCY, C.CUR_NAME,
          ROUND (F.PRODBAL, 2) AS PRODBAL,
          ROUND (  F.AVAILBAL,2) AS AVAILBAL,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
          E.REDM_AMT,
          CONVERT(VARCHAR(24),E.TRANS_TIME, 120) AS TRANS_TIME,
          E.STATUS AS VOUCHER_STAT,
          (CASE
              WHEN E.STATUS = '500'
                 THEN '暂存'
              WHEN E.STATUS = '450'
                 THEN '打回'
           END
          ) AS VOUCHER_STAT_NAME,
          ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
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
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
          AND E.TARGET=P.TARGET
          JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
          LEFT JOIN BIS_BIF_INIT B
          ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE = '05';
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_BKQY')
DROP VIEW V_BIS_FIN_PRODUCT_BKQY;
GO
CREATE VIEW V_BIS_FIN_PRODUCT_BKQY AS
SELECT E.VOUCHER_NO, E.CORP_ID, T.CORP_NAME, E.BIF_CODE,
          B.NAME AS BIF_NAME, E.ACCTID, E.PRODNO, P.PRODNAME, P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          F.CASHFLAG,
          (CASE
              WHEN F.CASHFLAG = '0'
                 THEN '钞'
              WHEN F.CASHFLAG = '1'
                 THEN '汇'
           END
          ) AS CASH_NAME,
          P.DTSTART, P.DTEND, P.CURRENCY, C.CUR_NAME,
          ROUND (F.PRODBAL, 2) AS PRODBAL,
          ROUND (E.AVAILBAL, 2) AS AVAILBAL,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
          E.REDM_AMT,
          CONVERT(VARCHAR(24),E.TRANS_TIME, 120) AS TRANS_TIME,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN E.STATUS + ''
              ELSE RTRIM(LTRIM(S.VOUCHER_STAT))
           END
          ) AS VOUCHER_STAT,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN (CASE
                          WHEN E.STATUS = '550'
                             THEN '审批中'
                          WHEN E.STATUS = '500'
                             THEN '暂存'
                          WHEN E.STATUS = '450'
                             THEN '打回'
                          WHEN E.STATUS = '95'
                             THEN '审批通过'
                          WHEN E.STATUS = '250'
                             THEN '删除'
                          WHEN E.STATUS = '200'
                             THEN '无效'
                          WHEN E.STATUS = '150'
                             THEN '过期'
                          WHEN E.STATUS = '11'
                             THEN '待审批'
                          ELSE '审批中'
                       END
                      )
              ELSE (CASE
                       WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '3'
                          THEN '准备发送'
                        WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '1'
                          THEN '数据报文报错'
                       WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '9'
                          THEN '接口处理失败'
                       WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '2'
                          THEN '银行处理失败'
                       WHEN RTRIM(LTRIM(S.VOUCHER_STAT)) = '0'
                          THEN '交易成功'
                    END
                   )
           END
          ) AS VOUCHER_STAT_NAME,
          (CASE
              WHEN S.VOUCHER_STAT = '2'
                 THEN 1
               WHEN S.VOUCHER_STAT = '1'
                 THEN 1
              WHEN S.VOUCHER_STAT = '9'
                 THEN 1
              ELSE 0
           END
          ) AS IS_INVAIL,
          ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
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
          S.RETURN_MSG
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID AND S.BIS_TYPE = '05'
          LEFT JOIN BIS_FIN_PRODUCT_INFO P
          ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE AND E.TARGET=P.TARGET
          JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
          LEFT JOIN BIS_BIF_INIT B
          ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE = '05';
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_INFO')
DROP VIEW V_BIS_FIN_PRODUCT_INFO;
GO
CREATE  VIEW V_BIS_FIN_PRODUCT_INFO AS
SELECT P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME, P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '收益率'
              WHEN P.RETURN_TYPE = '2'
                 THEN '净值'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          ROUND (P.REFVALUE, 2) AS REFVALUE,
          ROUND (P.MANAGEMENTFEE, 2) AS MANAGEMENTFEE,
          ROUND (P.SBSCRFEE, 2) AS SBSCRFEE,
          ROUND (P.PURCHFEE, 2) AS PURCHFEE,
          ROUND (P.REDMFEE, 2) AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '不可操作'
              WHEN P.SBSCRFLG = '1'
                 THEN '可操作'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '不可操作'
              WHEN P.PURCHFLG = '1'
                 THEN '可操作'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
          ROUND (P.SBSCRMINAMT, 2) AS SBSCRMINAMT,
          ROUND (P.SBSCRINCAMT, 2) AS SBSCRINCAMT,
          ROUND (P.PURCHMINAMT, 2) AS PURCHMINAMT,
          ROUND (P.PURCHINCAMT, 2) AS PURCHINCAMT,
          ROUND (P.HOLDMINAMT, 2) AS HOLDMINAMT,
          ROUND (P.HOLDMAXAMT, 2) AS HOLDMAXAMT,
          ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
          ROUND (P.REDMINCAMT, 2) AS REDMINCAMT,
          P.AGREEMCONTENT,
          CONVERT(VARCHAR(24),P.RETURN_TIME, 120) AS RETURN_TIME,
          P.VOUCHER_STAT, P.RETURN_MSG
     FROM BIS_FIN_PRODUCT_INFO P LEFT JOIN BIS_BIF_INIT B
          ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE NOT EXISTS (
             SELECT I.PRODNO
               FROM BIS_FIN_PRODUCT_INFO I
              WHERE I.PRODNO = P.PRODNO
                AND I.SBSCRFLG = '0'
                AND I.PURCHFLG = '0');
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_MODY')
DROP VIEW V_BIS_FIN_PRODUCT_MODY;
GO
CREATE  VIEW V_BIS_FIN_PRODUCT_MODY AS
SELECT E.VOUCHER_NO, P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME,
          P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '收益率'
              WHEN P.RETURN_TYPE = '2'
                 THEN '净值'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          ROUND (P.REFVALUE, 2) AS REFVALUE,
          ROUND (P.MANAGEMENTFEE, 2) AS MANAGEMENTFEE,
          ROUND (P.SBSCRFEE, 2) AS SBSCRFEE,
          ROUND (P.PURCHFEE, 2) AS PURCHFEE,
          ROUND (P.REDMFEE, 2) AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '不可操作'
              WHEN P.SBSCRFLG = '1'
                 THEN '可操作'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '不可操作'
              WHEN P.PURCHFLG = '1'
                 THEN '可操作'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
          ROUND (P.SBSCRMINAMT, 2) AS SBSCRMINAMT,
          ROUND (P.SBSCRINCAMT, 2) AS SBSCRINCAMT,
          ROUND (P.PURCHMINAMT, 2) AS PURCHMINAMT,
          ROUND (P.PURCHINCAMT, 2) AS PURCHINCAMT,
          ROUND (P.HOLDMINAMT, 2) AS HOLDMINAMT,
          ROUND (P.HOLDMAXAMT, 2) AS HOLDMAXAMT,
          ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
          ROUND (P.REDMINCAMT, 2) AS REDMINCAMT,
          CONVERT(VARCHAR(24),P.RETURN_TIME, 120) AS RETURN_TIME,
          E.STATUS AS VOUCHER_STAT,
          (CASE
              WHEN E.STATUS = '500'
                 THEN '暂存'
              WHEN E.STATUS = '450'
                 THEN '打回'
           END
          ) AS VOUCHER_STAT_NAME,
          F.SIGNFLG,
          (CASE
              WHEN F.SIGNFLG = '0'
                 THEN (CASE
                          WHEN F.VOUCHER_STAT = '0'
                             THEN '已签约'
                          WHEN F.VOUCHER_STAT = '1'
                             THEN '结果待查'
                          WHEN F.VOUCHER_STAT = '2'
                             THEN '银行处理失败'
                          WHEN F.VOUCHER_STAT = '3'
                             THEN '准备发送'
                          WHEN F.VOUCHER_STAT = '9'
                             THEN '接口处理失败'
                       END
                      )
              WHEN F.SIGNFLG = '1'
                 THEN '签约中'
              WHEN F.SIGNFLG = '2'
                 THEN '未签约'
              WHEN F.SIGNFLG = '3'
                 THEN '签约失败'
           END
          ) AS SIGNFLG_NAME,
          F.RETURN_MSG, F.SIGN_CORP AS CORP_ID, T.CORP_NAME AS SIGN_CORP_NAME,
          CONVERT(VARCHAR(24),F.SIGN_TIME, 120) AS SIGN_TIME,
          F.ACCTID, E.CONTRACT_ID, F.SIGN_USER_ID,
          CONVERT(VARCHAR(24),E.TRANS_TIME, 120) AS TRANS_TIME,
          ROUND (E.AMT, 2) AS AMT, E.BIS_TYPE,
          (CASE
              WHEN E.BIS_TYPE = '01'
                 THEN '认购'
              WHEN E.BIS_TYPE = '02'
                 THEN '申购'
           END
          ) AS BIS_TYPE_NAME
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND P.BIF_CODE=E.BIF_CODE AND P.TARGET = E.TARGET
          LEFT JOIN BIS_FIN_CONTRACT F
          ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE F.SIGNFLG = '0'
      AND CONVERT(VARCHAR(24),F.SIGN_TIME, 110) = CONVERT(VARCHAR(24),GETDATE(), 110);
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_QUEY')
DROP VIEW V_BIS_FIN_PRODUCT_QUEY;
GO
CREATE  VIEW V_BIS_FIN_PRODUCT_QUEY AS
SELECT E.VOUCHER_NO, P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME,
          P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '个人'
              WHEN P.TARGET = 2
                 THEN '公司'
              WHEN P.TARGET = 3
                 THEN '全部'
              WHEN P.TARGET = 4
                 THEN '同业'
           END
          ) AS TARGET_NAME,
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '收益率'
              WHEN P.RETURN_TYPE = '2'
                 THEN '净值'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          ROUND (P.REFVALUE, 2) AS REFVALUE,
          ROUND (P.MANAGEMENTFEE, 2) AS MANAGEMENTFEE,
          ROUND (P.SBSCRFEE, 2) AS SBSCRFEE,
          ROUND (P.PURCHFEE, 2) AS PURCHFEE,
          ROUND (P.REDMFEE, 2) AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '不可操作'
              WHEN P.SBSCRFLG = '1'
                 THEN '可操作'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '不可操作'
              WHEN P.PURCHFLG = '1'
                 THEN '可操作'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
           END
          ) AS REDMFLG_NAME,
          ROUND (P.SBSCRMINAMT, 2) AS SBSCRMINAMT,
          ROUND (P.SBSCRINCAMT, 2) AS SBSCRINCAMT,
          ROUND (P.PURCHMINAMT, 2) AS PURCHMINAMT,
          ROUND (P.PURCHINCAMT, 2) AS PURCHINCAMT,
          ROUND (P.HOLDMINAMT, 2) AS HOLDMINAMT,
          ROUND (P.HOLDMAXAMT, 2) AS HOLDMAXAMT,
          ROUND (P.REDMMINAMT, 2) AS REDMMINAMT,
          ROUND (P.REDMINCAMT, 2) AS REDMINCAMT,
          CONVERT(VARCHAR(24),P.RETURN_TIME, 120) AS RETURN_TIME,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN E.STATUS + ''
              WHEN S.VOUCHER_STAT IS NOT NULL
                 THEN LTRIM(RTRIM (S.VOUCHER_STAT))
           END
          ) AS VOUCHER_STAT,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN (CASE
                          WHEN E.STATUS = '550'
                             THEN '审批中'
                          WHEN E.STATUS = '500'
                             THEN '暂存'
                          WHEN E.STATUS = '450'
                             THEN '打回'
                          WHEN E.STATUS = '95'
                             THEN '审批通过'
                          WHEN E.STATUS = '250'
                             THEN '删除'
                          WHEN E.STATUS = '200'
                             THEN '无效'
                          WHEN E.STATUS = '150'
                             THEN '过期'
                          WHEN E.STATUS = '11'
                             THEN '待审批'
                          ELSE '审批中'
                       END
                      )
              ELSE (CASE
                       WHEN LTRIM(RTRIM (S.VOUCHER_STAT)) = '3'
                          THEN '准备发送'
                       WHEN LTRIM(RTRIM (S.VOUCHER_STAT)) = '1'
                          THEN '结果待查'
                       WHEN LTRIM(RTRIM (S.VOUCHER_STAT)) = '9'
                          THEN '接口处理失败'
                       WHEN LTRIM(RTRIM (S.VOUCHER_STAT)) = '2'
                          THEN '银行处理失败'
                       WHEN LTRIM(RTRIM (S.VOUCHER_STAT)) = '0'
                          THEN '交易成功'
                    END
                   )
           END
          ) AS VOUCHER_STAT_NAME,
          (CASE
              WHEN S.VOUCHER_STAT = '2'
                 THEN 1
              WHEN S.VOUCHER_STAT = '9'
                 THEN 1
              ELSE 0
           END
          ) AS IS_INVAIL,
          F.SIGNFLG,
          (CASE
              WHEN F.SIGNFLG = '0'
                 THEN '已签约'
              WHEN F.SIGNFLG = '1'
                 THEN '签约中'
              WHEN F.SIGNFLG = '2'
                 THEN '未签约'
              WHEN F.SIGNFLG = '3'
                 THEN '签约失败'
           END
          ) AS SIGNFLG_NAME,
          S.RETURN_MSG, T.CORP_NAME AS SIGN_CORP_NAME,
          CONVERT(VARCHAR(24),F.SIGN_TIME, 120) AS SIGN_TIME,
          F.ACCTID, F.SIGN_USER_ID, E.CORP_ID,
          CONVERT(VARCHAR(24),E.TRANS_TIME, 120) AS TRANS_TIME,
          ROUND (E.AMT, 2) AS AMT, E.BIS_TYPE,
          (CASE
              WHEN E.BIS_TYPE = '01'
                 THEN '认购'
              WHEN E.BIS_TYPE = '02'
                 THEN '申购'
           END
          ) AS BIS_TYPE_NAME
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID AND S.BIS_TYPE <= '02'
          LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND P.BIF_CODE=E.BIF_CODE AND P.TARGET=E.TARGET
          LEFT JOIN BIS_FIN_CONTRACT F
          ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE <= '02';
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_PRODUCT_QYHI')
DROP VIEW V_BIS_FIN_PRODUCT_QYHI;
GO
CREATE  VIEW V_BIS_FIN_PRODUCT_QYHI AS
SELECT SERIAL_ID, CONTRACT_ID, CORP_ID, CORP_NAME, PRODNO, SHORTNAME,
          BIF_CODE, BIF_NAME, ACCTID, TRNCODE, TRNSTATUS,
          ROUND (APPLYAMT, 2) AS APPLYAMT,
          ROUND (SHAREAPPLY, 2) AS SHAREAPPLY,
          CASHFLAG, CASHFLAG_NAME,
          ROUND (DEALAMT, 2) AS DEALAMT,
          ROUND (DEALSHARES, 2) AS DEALSHARES,
          TRANS_TIME, RETURN_MSG, BROKER
     FROM (SELECT DISTINCT D.SERIAL_ID, C.CONTRACT_ID, C.CORP_ID, T.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME, D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_DTL D JOIN BIS_FIN_BUY C
                           ON C.PRODNO = D.PRODNO
                           JOIN BIS_FIN_CONTRACT BFC ON C.CONTRACT_ID = BFC.CONTRACT_ID AND BFC.TARGET=C.TARGET AND C.BIF_CODE=BFC.BIF_CODE
                           JOIN BIS_FIN_EXC E
                           ON C.VOUCHER_NO = E.THIRD_ID
                         AND C.BIS_TYPE = E.BIS_TYPE
                         AND E.ACCTID = C.ACCTID
                           JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                           JOIN BT_CORP T ON C.CORP_ID = T.ID
                           JOIN BT_USER U
                           ON T.ID = U.CORP_ID
                              AND U.USER_CODE = C.OPER_USER_ID
                           JOIN BIS_ACC_GRANT BAG
                           ON BAG.USER_CODE = U.USER_CODE
                         AND BAG.BANK_ACC = E.ACCTID
                         AND E.ACCTID = D.ACCTID
                     WHERE E.VOUCHER_STAT ='0'  AND D.TRANS_TYPE = '0'
           UNION ALL
           SELECT DISTINCT D.SERIAL_ID, C.CONTRACT_ID, C.CORP_ID, T.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME, D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_HIS_DTL D JOIN BIS_FIN_BUY C
                           ON C.PRODNO = D.PRODNO
                           JOIN BIS_FIN_CONTRACT BFC
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID AND BFC.TARGET=C.TARGET AND C.BIF_CODE=BFC.BIF_CODE
                           JOIN BIS_FIN_EXC E
                           ON C.VOUCHER_NO = E.THIRD_ID
                         AND C.BIS_TYPE = E.BIS_TYPE
                         AND E.ACCTID = C.ACCTID
                           JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                           JOIN BT_CORP T ON C.CORP_ID = T.ID
                           JOIN BT_USER U
                           ON T.ID = U.CORP_ID
                              AND U.USER_CODE = C.OPER_USER_ID
                           JOIN BIS_ACC_GRANT BAG
                           ON BAG.USER_CODE = U.USER_CODE
                         AND BAG.BANK_ACC = E.ACCTID
                         AND E.ACCTID = D.ACCTID
                     WHERE E.VOUCHER_STAT  ='0' AND D.TRANS_TYPE = '0'
            UNION ALL
            SELECT DISTINCT D.SERIAL_ID, C.CONTRACT_ID, C.CORP_ID, T.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME, D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_DTL D JOIN BIS_FIN_BUY C
                           ON C.PRODNO = D.PRODNO AND D.BIF_CODE=C.BIF_CODE
                           JOIN BIS_FIN_CONTRACT BFC
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID AND BFC.TARGET=C.TARGET AND C.BIF_CODE=BFC.BIF_CODE AND CONVERT(VARCHAR(24),D.TRANS_TIME, 110) = CONVERT(VARCHAR(24),BFC.REQ_DATE, 110)
                           JOIN BIS_FIN_EXC E
                           ON C.VOUCHER_NO = E.THIRD_ID
                         AND C.BIS_TYPE = E.BIS_TYPE
                         AND E.ACCTID = C.ACCTID
                           JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                           JOIN BT_CORP T ON C.CORP_ID = T.ID
                           JOIN BT_USER U
                           ON T.ID = U.CORP_ID
                              AND U.USER_CODE = C.OPER_USER_ID
                           JOIN BIS_ACC_GRANT BAG
                           ON BAG.USER_CODE = U.USER_CODE
                         AND BAG.BANK_ACC = E.ACCTID
                         AND E.ACCTID = D.ACCTID
                     WHERE E.VOUCHER_STAT ='0' AND D.TRANS_TYPE = '0'
           UNION ALL
           SELECT DISTINCT D.SERIAL_ID, C.CONTRACT_ID, C.CORP_ID, T.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME, D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_HIS_DTL D JOIN BIS_FIN_BUY C
                           ON C.PRODNO = D.PRODNO AND D.BIF_CODE=C.BIF_CODE
                           JOIN BIS_FIN_CONTRACT BFC
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID AND BFC.TARGET=C.TARGET AND C.BIF_CODE=BFC.BIF_CODE AND CONVERT(VARCHAR(24),D.TRANS_TIME, 110) = CONVERT(VARCHAR(24),BFC.REQ_DATE, 110)
                           JOIN BIS_FIN_EXC E
                           ON C.VOUCHER_NO = E.THIRD_ID
                         AND C.BIS_TYPE = E.BIS_TYPE
                         AND E.ACCTID = C.ACCTID
                           JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                           JOIN BT_CORP T ON C.CORP_ID = T.ID
                           JOIN BT_USER U
                           ON T.ID = U.CORP_ID
                              AND U.USER_CODE = C.OPER_USER_ID
                           JOIN BIS_ACC_GRANT BAG
                           ON BAG.USER_CODE = U.USER_CODE
                         AND BAG.BANK_ACC = E.ACCTID
                         AND E.ACCTID = D.ACCTID
                     WHERE E.VOUCHER_STAT ='0' AND D.TRANS_TYPE = '0') AS T;
GO
-------
IF EXISTS (SELECT * FROM SYSOBJECTS  WHERE NAME = 'V_BIS_FIN_STATES_QUERY')
DROP VIEW V_BIS_FIN_STATES_QUERY;
GO
CREATE  VIEW V_BIS_FIN_STATES_QUERY AS
SELECT F.CONTRACT_ID, F.SIGN_CORP AS CORP_ID,
          T.CORP_NAME AS SIGN_CORP_NAME, P.PRODNO, F.BIF_CODE, P.PRODNAME,
          F.ACCTID, P.TARGET, F.SIGNFLG,
          CONVERT (VARCHAR(24),F.SIGN_TIME, 120) AS SIGN_TIME,
          (CASE
              WHEN F.SIGNFLG = 0
                 THEN '已签约'
              WHEN F.SIGNFLG = 1
                 THEN '签约中'
              WHEN F.SIGNFLG = 2
                 THEN '未签约'
              WHEN F.SIGNFLG = 3
                 THEN '签约失败'
           END
          ) AS SIGNFLG_NAME,
          (CASE
              WHEN F.SIGNFLG = 0
                 THEN 0
              WHEN F.SIGNFLG = 1
                 THEN 0
              WHEN F.SIGNFLG = 2
                 THEN 0
              WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 2
                 THEN 0
              WHEN F.SIGNFLG = 3
              AND F.VOUCHER_STAT = 9
              AND CONVERT (VARCHAR(24),F.SIGN_TIME, 110) =
                                               CONVERT (VARCHAR(24),GETDATE(), 110)
                 THEN 1
              ELSE 0
           END
          ) AS IS_RESET,
          F.VOUCHER_STAT,
          (CASE
              WHEN F.VOUCHER_STAT = 0
                 THEN '签约成功'
              WHEN F.VOUCHER_STAT = 1
                 THEN '结果待查'
              WHEN F.VOUCHER_STAT = 2
                 THEN '银行处理失败'
              WHEN F.VOUCHER_STAT = 3
                 THEN '准备发送'
              WHEN F.VOUCHER_STAT = 9
                 THEN '接口处理失败'
           END
          ) AS VOUCHER_STAT_NAME,
          F.RETURN_MSG
     FROM BIS_FIN_PRODUCT_INFO P JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO AND P.TARGET=F.TARGET AND P.BIF_CODE=F.BIF_CODE
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID;