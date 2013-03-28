CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BACK AS
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
           p.RETURN_MSG;
           
CREATE OR REPLACE VIEW V_BIS_FIN_STATES_QUERY AS
SELECT F.CONTRACT_ID,
       F.SIGN_CORP,
       T.CORP_NAME AS SIGN_CORP_NAME,
       P.PRODNO,
       F.BIF_CODE,
       P.PRODNAME,
       F.ACCTID,
       P.TARGET,
       F.SIGNFLG,
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS SIGN_TIME,
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
         WHEN F.SIGNFLG = 3  AND F.VOUCHER_STAT = 9 AND TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD') THEN
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
             '待发送'
             WHEN F.VOUCHER_STAT = 9 THEN
             '接口处理失败'
             END
       ) AS VOUCHER_STAT_NAME,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID;
 

CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_QUEY AS
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
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS RETURN_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS || ''
         WHEN S.VOUCHER_STAT IS NOT NULL THEN
          TRIM(S.VOUCHER_STAT)
       END) AS VOUCHER_STAT,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          (CASE WHEN E.STATUS = '550' THEN
                  '审批中'
                WHEN E.STATUS = '500' THEN
                  '暂存'
                WHEN E.STATUS = '450' THEN
                  '审批打回'
                WHEN E.STATUS = '95' THEN
                  '审批通过'
                WHEN E.STATUS = '250' THEN
                  '删除'
                WHEN E.STATUS = '200' THEN
                  '无效'
                WHEN E.STATUS = '150' THEN
                  '过期无效'
                WHEN E.STATUS = '11' THEN
                  '待审核'
            END)
         ELSE
          (CASE WHEN TRIM(S.VOUCHER_STAT) = '3' THEN
                 '待发送'
                WHEN TRIM(S.VOUCHER_STAT) = '9' THEN
                 '接口处理失败'
                WHEN TRIM(S.VOUCHER_STAT) = '2' THEN
                 '银行处理失败'
                WHEN TRIM(S.VOUCHER_STAT) = '0' THEN
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
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       E.CORP_ID,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MM:SS') AS TRANS_TIME,
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
 WHERE E.BIS_TYPE <= '02';
 
 
 
/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_SIGN                                 */
/*==============================================================*/
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_SIGN AS
SELECT F.CONTRACT_ID,
       P.PRODNO,
       P.PRODNAME,
       P.CURRENCY,
       C.CUR_NAME,
       P.TARGET,
       DECODE(P.TARGET, 1, '个人', 2, '公司', 3, '全部', 4, '同业') AS TARGET_NAME,
       P.BIF_CODE,
       B.NAME AS TYPE_NAME,
       P.RETURN_TYPE,
       DECODE(P.RETURN_TYPE, 1, '收益率', '净值') AS RETURN_TYPE_NAME,
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
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS RETURN_TIME,
       F.VOUCHER_STAT,
       F.SIGNFLG,
       (CASE WHEN F.SIGNFLG = '0' THEN
             (CASE WHEN F.VOUCHER_STAT = '0' THEN
                   '已签约'
                   WHEN F.VOUCHER_STAT = '2' THEN
                   '银行处理失败'
                   WHEN F.VOUCHER_STAT = '3' THEN
                   '待发送'
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
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS SIGN_TIME,
       F.ACCTID,
       F.SIGN_USER_ID,
       (CASE
         WHEN P.SBSCRFLG = 0 THEN
          0
         WHEN P.SBSCRFLG = 1 AND (TO_CHAR(SYSDATE, 'YYYY-MM-DD') BETWEEN
              TO_CHAR(P.DTSTART, 'YYYY-MM-DD') and
              TO_CHAR(P.DTEND, 'YYYY-MM-DD')) THEN
          1
         ELSE
          0
       END) AS IS_SBSCRFLG
  FROM BIS_FIN_CONTRACT F
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE;
  
  
/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_MONY                                 */
/*==============================================================*/
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_MONY AS
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
  LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID;
  
/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_BKED                                 */
/*==============================================================*/           
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BKED AS
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
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MM:SS') AS TRANS_TIME,
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
  WHERE E.BIS_TYPE = '05';
  
/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_INFO                                 */
/*==============================================================*/  
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_INFO AS
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
       DECODE(P.RETURN_TYPE, 1, '收益率', '净值') AS RETURN_TYPE_NAME,
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
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS RETURN_TIME,
       P.VOUCHER_STAT,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE NOT EXISTS (SELECT I.PRODNO
          FROM BIS_FIN_PRODUCT_INFO I
         WHERE I.PRODNO = P.PRODNO
           AND I.SBSCRFLG = '0'
           AND I.PURCHFLG = '0');


/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_QYHI                                 */
/*==============================================================*/
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_QYHI AS
SELECT SERIAL_ID,
       CORP_ID,
       CORP_NAME,
       PRODNO,
       SHORTNAME,
       BIF_CODE,
       BIF_NAME,
       ACCTID,
       BIS_TYPE,
       TRNCODE,
       TRNSTATUS,
       APPLYAMT,
       SHAREAPPLY,
       CASHFLAG,
       CASHFLAG_NAME,
       DEALAMT,
       DEALSHARES,
       TRANS_TIME,
       RETURN_MSG
  FROM (SELECT D.SERIAL_ID,
               C.CORP_ID,
               T.CORP_NAME,
               D.PRODNO,
               D.SHORTNAME,
               D.BIF_CODE,
               F.NAME AS BIF_NAME,
               D.ACCTID,
               C.BIS_TYPE,
               D.TRNCODE,
               D.TRNSTATUS,
               D.APPLYAMT,
               D.SHAREAPPLY,
               D.CASHFLAG,
               (CASE WHEN D.CASHFLAG = '0' THEN '钞' WHEN D.CASHFLAG = '1' THEN '汇' END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG
          FROM BIS_FIN_DTL D
          LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
          LEFT JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID
          LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
          LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID
         WHERE D.TRANS_TYPE = '0'
        UNION ALL
        SELECT D.SERIAL_ID,
               C.CORP_ID,
               T.CORP_NAME,
               D.PRODNO,
               D.SHORTNAME,
               D.BIF_CODE,
               F.NAME AS BIF_NAME,
               D.ACCTID,
               C.BIS_TYPE,
               D.TRNCODE,
               D.TRNSTATUS,
               D.APPLYAMT,
               D.SHAREAPPLY,
               D.CASHFLAG,
               (CASE WHEN D.CASHFLAG = '0' THEN '钞' WHEN D.CASHFLAG = '1' THEN '汇' END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG
          FROM BIS_FIN_HIS_DTL D
          LEFT JOIN BIS_FIN_BUY C ON C.PRODNO = D.PRODNO
          LEFT JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID
          LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
          LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID
         WHERE D.TRANS_TYPE = '0');
         

/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_MODY                                 */
/*==============================================================*/
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_MODY AS
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
       TO_CHAR(P.RETURN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS RETURN_TIME,
       E.STATUS AS VOUCHER_STAT,
       (CASE WHEN E.STATUS = '500' THEN '暂存' WHEN E.STATUS = '450' THEN '打回' END) AS VOUCHER_STAT_NAME,
       F.SIGNFLG,       
       (CASE WHEN F.SIGNFLG = '0' THEN
             (CASE WHEN F.VOUCHER_STAT = '0' THEN
                   '已签约'
                   WHEN F.VOUCHER_STAT = '2' THEN
                   '银行处理失败'
                   WHEN F.VOUCHER_STAT = '3' THEN
                   '待发送'
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
       TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD HH24:MM:SS') AS SIGN_TIME,
       F.ACCTID,
       E.CONTRACT_ID,
       F.SIGN_USER_ID,
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MM:SS') AS TRANS_TIME,
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
   AND TO_CHAR(F.SIGN_TIME, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD');
   
   
/*==============================================================*/
/* VIEW: V_BIS_FIN_PRODUCT_BKQY                                 */
/*==============================================================*/   
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BKQY AS
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
       TO_CHAR(E.TRANS_TIME, 'YYYY-MM-DD HH24:MM:SS') AS TRANS_TIME,
       (CASE
         WHEN S.VOUCHER_STAT IS NULL THEN
          E.STATUS || ''
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
                  '审批打回'
                WHEN E.STATUS = '95' THEN
                  '审批通过'
                WHEN E.STATUS = '250' THEN
                  '删除'
                WHEN E.STATUS = '200' THEN
                  '无效'
                WHEN E.STATUS = '150' THEN
                  '过期无效'
                WHEN E.STATUS = '11' THEN
                  '待审核'
            END)
         ELSE
          (CASE WHEN TRIM(S.VOUCHER_STAT) = '3' THEN
                 '待发送'
                WHEN TRIM(S.VOUCHER_STAT) = '9' THEN
                 '接口处理失败'
                WHEN TRIM(S.VOUCHER_STAT) = '2' THEN
                 '银行处理失败'
                WHEN TRIM(S.VOUCHER_STAT) = '0' THEN
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
       P.RETURN_MSG
  FROM BIS_FIN_BUY E
  LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
  LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
  LEFT JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
  LEFT JOIN BIS_BIF_INIT B ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
  LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
 WHERE E.BIS_TYPE = '05';