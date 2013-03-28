--�޸��ˣ�����
--�޸�ʱ�䣺2012-12-05
--���������������÷ݶ���ʾ����,user00035121_ORCL.sql
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BACK AS
SELECT   E.CORP_ID, T.CORP_NAME, E.BIF_CODE, B.NAME AS BIF_NAME, E.ACCTID,
            E.PRODNO, P.PRODNAME, P.TARGET,
            (CASE
                WHEN P.TARGET = 1
                   THEN '����'
                WHEN P.TARGET = 2
                   THEN '��˾'
                WHEN P.TARGET = 3
                   THEN 'ȫ��'
                WHEN P.TARGET = 4
                   THEN 'ͬҵ'
             END
            ) AS TARGET_NAME,
            F.CASHFLAG,
            (CASE
                WHEN F.CASHFLAG = '0'
                   THEN '��'
                WHEN F.CASHFLAG = '1'
                   THEN '��'
             END
            ) AS CASH_NAME,
            P.DTSTART, P.DTEND, P.CURRENCY, C.CUR_NAME,
            TO_CHAR (ROUND (F.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
            TO_CHAR (ROUND (F.AVAILBAL, 2),'9999999999990.00') AS AVAILBAL,
            P.REDMFLG,
            (CASE
                WHEN P.REDMFLG = '0'
                   THEN '���ɲ���'
                WHEN P.REDMFLG = '1'
                   THEN '�ɲ���'
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
            TO_CHAR (ROUND (P.REDMMINAMT, 2),
                     '9999999999990.00'
                    ) AS REDMMINAMT,
            P.RETURN_MSG
       FROM BIS_FIN_BUY E JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
            JOIN BIS_FIN_PRODUCT_INFO P
            ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
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
CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BKED AS
SELECT E.VOUCHER_NO, E.CORP_ID, T.CORP_NAME, E.BIF_CODE,
          B.NAME AS BIF_NAME, E.ACCTID, E.PRODNO, P.PRODNAME, P.TARGET,
          (CASE
              WHEN P.TARGET = 1
                 THEN '����'
              WHEN P.TARGET = 2
                 THEN '��˾'
              WHEN P.TARGET = 3
                 THEN 'ȫ��'
              WHEN P.TARGET = 4
                 THEN 'ͬҵ'
           END
          ) AS TARGET_NAME,
          F.CASHFLAG,
          (CASE
              WHEN F.CASHFLAG = '0'
                 THEN '��'
              WHEN F.CASHFLAG = '1'
                 THEN '��'
           END
          ) AS CASH_NAME,
          P.DTSTART, P.DTEND, P.CURRENCY, C.CUR_NAME,
          TO_CHAR (ROUND (F.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
          TO_CHAR (ROUND (  F.AVAILBAL,2),'9999999999990.00') AS AVAILBAL,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '���ɲ���'
              WHEN P.REDMFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS REDMFLG_NAME,
          E.REDM_AMT,
          TO_CHAR (E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
          E.STATUS AS VOUCHER_STAT,
          (CASE
              WHEN E.STATUS = '500'
                 THEN '�ݴ�'
              WHEN E.STATUS = '450'
                 THEN '���'
           END
          ) AS VOUCHER_STAT_NAME,
          TO_CHAR (ROUND (P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
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
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_PRODUCT_INFO P
          ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
          JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
          LEFT JOIN BIS_BIF_INIT B
          ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE = '05';
