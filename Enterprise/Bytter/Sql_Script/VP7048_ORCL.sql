--���ڣ�2012-11-07
--�޸��ˣ�Ҷ����
--�޸����ݣ��޸�ǩԼ��SIGN_CORP������CHAR(4)��ΪVARCHAR2(10)
ALTER TABLE BIS_FIN_CONTRACT MODIFY SIGN_CORP VARCHAR2(10);
COMMIT;

/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_BACK (CORP_ID,
                                                         CORP_NAME,
                                                         BIF_CODE,
                                                         BIF_NAME,
                                                         ACCTID,
                                                         PRODNO,
                                                         PRODNAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         CASHFLAG,
                                                         CASH_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         PRODBAL,
                                                         AVAILBAL,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         PURCHASE_COUNT,
                                                         BACK_COUNT,
                                                         REDMMINAMT,
                                                         RETURN_MSG
                                                        )
AS
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
            TO_CHAR (ROUND (  F.AVAILBAL
                            - (SELECT NVL (SUM (BFB.REDM_AMT), 0)
                                 FROM BIS_FIN_BUY BFB
                                WHERE BFB.STATUS <= 95
                                  AND BFB.STATUS >= 11
                                  AND BFB.CORP_ID = E.CORP_ID
                                  AND BFB.PRODNO = E.PRODNO
                                  AND BFB.BIS_TYPE = '05'),
                            2
                           ),
                     '9999999999990.00'
                    ) AS AVAILBAL,
            P.REDMFLG,
            (CASE
                WHEN P.REDMFLG = '0'
                   THEN '���ɲ���'
                WHEN P.REDMFLG = '1'
                   THEN '�ɲ���'
             END
            ) AS REDMFLG_NAME,
            SUM (CASE
                    WHEN E.BIS_TYPE = '01' AND S.VOUCHER_STAT = '0'
                       THEN 1
                    WHEN E.BIS_TYPE = '02' AND S.VOUCHER_STAT = '0'
                       THEN 1
                    ELSE 0
                 END
                ) AS PURCHASE_COUNT,
            SUM (CASE
                    WHEN E.BIS_TYPE = '05' AND S.VOUCHER_STAT = '0'
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


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_BKED (VOUCHER_NO,
                                                         CORP_ID,
                                                         CORP_NAME,
                                                         BIF_CODE,
                                                         BIF_NAME,
                                                         ACCTID,
                                                         PRODNO,
                                                         PRODNAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         CASHFLAG,
                                                         CASH_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         PRODBAL,
                                                         AVAILBAL,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         REDM_AMT,
                                                         TRANS_TIME,
                                                         VOUCHER_STAT,
                                                         VOUCHER_STAT_NAME,
                                                         REDMMINAMT,
                                                         PURCHASE_COUNT,
                                                         BACK_COUNT,
                                                         RETURN_MSG
                                                        )
AS
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
          TO_CHAR (ROUND (  F.AVAILBAL
                          - (SELECT NVL (SUM (BFB.REDM_AMT), 0)
                               FROM BIS_FIN_BUY BFB
                              WHERE BFB.STATUS <= 95
                                AND BFB.STATUS >= 11
                                AND BFB.CORP_ID = E.CORP_ID
                                AND BFB.PRODNO = E.PRODNO
                                AND BFB.BIS_TYPE = '05'),
                          2
                         ),
                   '9999999999990.00'
                  ) AS AVAILBAL,
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
                          WHEN BFB.BIS_TYPE = '01' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          WHEN BFB.BIS_TYPE = '02' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          ELSE 0
                       END
                      )
             FROM BIS_FIN_BUY BFB JOIN BIS_FIN_EXC BFE
                  ON BFB.VOUCHER_NO = BFE.THIRD_ID
            WHERE BFB.CORP_ID = E.CORP_ID AND BFB.PRODNO = E.PRODNO)
                                                            AS PURCHASE_COUNT,
          (SELECT SUM (CASE
                          WHEN BFB.BIS_TYPE = '05' AND BFE.VOUCHER_STAT = '0'
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


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_BKQY (VOUCHER_NO,
                                                         CORP_ID,
                                                         CORP_NAME,
                                                         BIF_CODE,
                                                         BIF_NAME,
                                                         ACCTID,
                                                         PRODNO,
                                                         PRODNAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         CASHFLAG,
                                                         CASH_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         PRODBAL,
                                                         AVAILBAL,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         REDM_AMT,
                                                         TRANS_TIME,
                                                         VOUCHER_STAT,
                                                         VOUCHER_STAT_NAME,
                                                         IS_INVAIL,
                                                         REDMMINAMT,
                                                         PURCHASE_COUNT,
                                                         BACK_COUNT,
                                                         RETURN_MSG
                                                        )
AS
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
          TO_CHAR (ROUND (F.AVAILBAL, 2), '9999999999990.00') AS AVAILBAL,
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
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN E.STATUS || ''
              ELSE TRIM (S.VOUCHER_STAT)
           END
          ) AS VOUCHER_STAT,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN (CASE
                          WHEN E.STATUS = '550'
                             THEN '������'
                          WHEN E.STATUS = '500'
                             THEN '�ݴ�'
                          WHEN E.STATUS = '450'
                             THEN '���'
                          WHEN E.STATUS = '95'
                             THEN '����ͨ��'
                          WHEN E.STATUS = '250'
                             THEN 'ɾ��'
                          WHEN E.STATUS = '200'
                             THEN '��Ч'
                          WHEN E.STATUS = '150'
                             THEN '����'
                          WHEN E.STATUS = '11'
                             THEN '������'
                          ELSE '������'
                       END
                      )
              ELSE (CASE
                       WHEN TRIM (S.VOUCHER_STAT) = '3'
                          THEN '׼������'
                       WHEN TRIM (S.VOUCHER_STAT) = '9'
                          THEN '�ӿڴ���ʧ��'
                       WHEN TRIM (S.VOUCHER_STAT) = '2'
                          THEN '���д���ʧ��'
                       WHEN TRIM (S.VOUCHER_STAT) = '0'
                          THEN '���׳ɹ�'
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
          TO_CHAR (ROUND (P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
          (SELECT SUM (CASE
                          WHEN BFB.BIS_TYPE = '01' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          WHEN BFB.BIS_TYPE = '02' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          ELSE 0
                       END
                      )
             FROM BIS_FIN_BUY BFB JOIN BIS_FIN_EXC BFE
                  ON BFB.VOUCHER_NO = BFE.THIRD_ID
            WHERE BFB.CORP_ID = E.CORP_ID AND BFB.PRODNO = E.PRODNO)
                                                            AS PURCHASE_COUNT,
          (SELECT SUM (CASE
                          WHEN BFB.BIS_TYPE = '05' AND BFE.VOUCHER_STAT = '0'
                             THEN 1
                          ELSE 0
                       END
                      )
             FROM BIS_FIN_BUY BFB JOIN BIS_FIN_EXC BFE
                  ON BFB.VOUCHER_NO = BFE.THIRD_ID
            WHERE BFB.CORP_ID = E.CORP_ID AND BFB.PRODNO = E.PRODNO)
                                                                AS BACK_COUNT,
          S.RETURN_MSG
     FROM BIS_FIN_BUY E JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID
          LEFT JOIN BIS_FIN_PRODUCT_INFO P
          ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
          JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
          LEFT JOIN BIS_BIF_INIT B
          ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE = '05';


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_INFO (PRODNO,
                                                         PRODNAME,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         BIF_CODE,
                                                         TYPE_NAME,
                                                         RETURN_TYPE,
                                                         RETURN_TYPE_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         INTRSTEDTSTART,
                                                         EXPIREDATE,
                                                         DTEXCHANGE,
                                                         REFVALUE,
                                                         MANAGEMENTFEE,
                                                         SBSCRFEE,
                                                         PURCHFEE,
                                                         REDMFEE,
                                                         SBSCRFLG,
                                                         SBSCRFLG_NAME,
                                                         PURCHFLG,
                                                         PURCHFLG_NAME,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         SBSCRMINAMT,
                                                         SBSCRINCAMT,
                                                         PURCHMINAMT,
                                                         PURCHINCAMT,
                                                         HOLDMINAMT,
                                                         HOLDMAXAMT,
                                                         REDMMINAMT,
                                                         REDMINCAMT,
                                                         AGREEMCONTENT,
                                                         RETURN_TIME,
                                                         VOUCHER_STAT,
                                                         RETURN_MSG
                                                        )
AS
   SELECT P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME, P.TARGET,
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
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '������'
              WHEN P.RETURN_TYPE = '2'
                 THEN '��ֵ'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          TO_CHAR (ROUND (P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
          TO_CHAR (ROUND (P.MANAGEMENTFEE, 2),
                   '9999999999990.00'
                  ) AS MANAGEMENTFEE,
          TO_CHAR (ROUND (P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
          TO_CHAR (ROUND (P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
          TO_CHAR (ROUND (P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '���ɲ���'
              WHEN P.SBSCRFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '���ɲ���'
              WHEN P.PURCHFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '���ɲ���'
              WHEN P.REDMFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS REDMFLG_NAME,
          TO_CHAR (ROUND (P.SBSCRMINAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRMINAMT,
          TO_CHAR (ROUND (P.SBSCRINCAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRINCAMT,
          TO_CHAR (ROUND (P.PURCHMINAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHMINAMT,
          TO_CHAR (ROUND (P.PURCHINCAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHINCAMT,
          TO_CHAR (ROUND (P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
          TO_CHAR (ROUND (P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
          TO_CHAR (ROUND (P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
          TO_CHAR (ROUND (P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
          P.AGREEMCONTENT,
          TO_CHAR (P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
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


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_MODY (VOUCHER_NO,
                                                         PRODNO,
                                                         PRODNAME,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         BIF_CODE,
                                                         TYPE_NAME,
                                                         RETURN_TYPE,
                                                         RETURN_TYPE_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         INTRSTEDTSTART,
                                                         EXPIREDATE,
                                                         DTEXCHANGE,
                                                         REFVALUE,
                                                         MANAGEMENTFEE,
                                                         SBSCRFEE,
                                                         PURCHFEE,
                                                         REDMFEE,
                                                         SBSCRFLG,
                                                         SBSCRFLG_NAME,
                                                         PURCHFLG,
                                                         PURCHFLG_NAME,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         SBSCRMINAMT,
                                                         SBSCRINCAMT,
                                                         PURCHMINAMT,
                                                         PURCHINCAMT,
                                                         HOLDMINAMT,
                                                         HOLDMAXAMT,
                                                         REDMMINAMT,
                                                         REDMINCAMT,
                                                         RETURN_TIME,
                                                         VOUCHER_STAT,
                                                         VOUCHER_STAT_NAME,
                                                         SIGNFLG,
                                                         SIGNFLG_NAME,
                                                         RETURN_MSG,
                                                         CORP_ID,
                                                         SIGN_CORP_NAME,
                                                         SIGN_TIME,
                                                         ACCTID,
                                                         CONTRACT_ID,
                                                         SIGN_USER_ID,
                                                         TRANS_TIME,
                                                         AMT,
                                                         BIS_TYPE,
                                                         BIS_TYPE_NAME
                                                        )
AS
   SELECT E.VOUCHER_NO, P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME,
          P.TARGET,
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
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '������'
              WHEN P.RETURN_TYPE = '2'
                 THEN '��ֵ'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          TO_CHAR (ROUND (P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
          TO_CHAR (ROUND (P.MANAGEMENTFEE, 2),
                   '9999999999990.00'
                  ) AS MANAGEMENTFEE,
          TO_CHAR (ROUND (P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
          TO_CHAR (ROUND (P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
          TO_CHAR (ROUND (P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '���ɲ���'
              WHEN P.SBSCRFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '���ɲ���'
              WHEN P.PURCHFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '���ɲ���'
              WHEN P.REDMFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS REDMFLG_NAME,
          TO_CHAR (ROUND (P.SBSCRMINAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRMINAMT,
          TO_CHAR (ROUND (P.SBSCRINCAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRINCAMT,
          TO_CHAR (ROUND (P.PURCHMINAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHMINAMT,
          TO_CHAR (ROUND (P.PURCHINCAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHINCAMT,
          TO_CHAR (ROUND (P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
          TO_CHAR (ROUND (P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
          TO_CHAR (ROUND (P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
          TO_CHAR (ROUND (P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
          TO_CHAR (P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
          E.STATUS AS VOUCHER_STAT,
          (CASE
              WHEN E.STATUS = '500'
                 THEN '�ݴ�'
              WHEN E.STATUS = '450'
                 THEN '���'
           END
          ) AS VOUCHER_STAT_NAME,
          F.SIGNFLG,
          (CASE
              WHEN F.SIGNFLG = '0'
                 THEN (CASE
                          WHEN F.VOUCHER_STAT = '0'
                             THEN '��ǩԼ'
                          WHEN F.VOUCHER_STAT = '1'
                             THEN '�������'
                          WHEN F.VOUCHER_STAT = '2'
                             THEN '���д���ʧ��'
                          WHEN F.VOUCHER_STAT = '3'
                             THEN '׼������'
                          WHEN F.VOUCHER_STAT = '9'
                             THEN '�ӿڴ���ʧ��'
                       END
                      )
              WHEN F.SIGNFLG = '1'
                 THEN 'ǩԼ��'
              WHEN F.SIGNFLG = '2'
                 THEN 'δǩԼ'
              WHEN F.SIGNFLG = '3'
                 THEN 'ǩԼʧ��'
           END
          ) AS SIGNFLG_NAME,
          F.RETURN_MSG, F.SIGN_CORP AS CORP_ID, T.CORP_NAME AS SIGN_CORP_NAME,
          TO_CHAR (F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
          F.ACCTID, E.CONTRACT_ID, F.SIGN_USER_ID,
          TO_CHAR (E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
          TO_CHAR (ROUND (E.AMT, 2), '9999999999990.00') AS AMT, E.BIS_TYPE,
          (CASE
              WHEN E.BIS_TYPE = '01'
                 THEN '�Ϲ�'
              WHEN E.BIS_TYPE = '02'
                 THEN '�깺'
           END
          ) AS BIS_TYPE_NAME
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO =
                                                                      E.PRODNO
          LEFT JOIN BIS_FIN_CONTRACT F
          ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE F.SIGNFLG = '0'
      AND TO_CHAR (F.SIGN_TIME, 'YYYY-MM-DD') =
                                               TO_CHAR (SYSDATE, 'YYYY-MM-DD');


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_MONY (CORP_ID,
                                                         CORP_NAME,
                                                         PRODNO,
                                                         SHORT_NAME,
                                                         BIF_CODE,
                                                         BIF_NAME,
                                                         ACCTID,
                                                         PRODBAL,
                                                         DEALSHARES,
                                                         CASHFLAG,
                                                         CASH_NAME,
                                                         AVAILBAL,
                                                         RETURN_MSG
                                                        )
AS
   SELECT DISTINCT C.CORP_ID, T.CORP_NAME, D.PRODNO, D.SHORT_NAME, D.BIF_CODE,
                   F.NAME AS BIF_NAME, C.ACCTID,
                   TO_CHAR (ROUND (D.PRODBAL, 2),
                            '9999999999990.00'
                           ) AS PRODBAL,
                   TO_CHAR (ROUND (D.DEALSHARES, 2),
                            '9999999999990.00'
                           ) AS DEALSHARES,
                   D.CASHFLAG,
                   (CASE
                       WHEN D.CASHFLAG = '0'
                          THEN '��'
                       WHEN D.CASHFLAG = '1'
                          THEN '��'
                    END
                   ) AS CASH_NAME,
                   TO_CHAR (ROUND (D.AVAILBAL, 2),
                            '9999999999990.00'
                           ) AS AVAILBAL,
                   D.RETURN_MSG
              FROM BIS_FIN_BAL D LEFT JOIN BIS_FIN_BUY C ON C.PRODNO =
                                                                      D.PRODNO
                   LEFT JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
                   LEFT JOIN BT_CORP T ON C.CORP_ID = T.ID
                   ;


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_QUEY (VOUCHER_NO,
                                                         PRODNO,
                                                         PRODNAME,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         BIF_CODE,
                                                         TYPE_NAME,
                                                         RETURN_TYPE,
                                                         RETURN_TYPE_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         INTRSTEDTSTART,
                                                         EXPIREDATE,
                                                         DTEXCHANGE,
                                                         REFVALUE,
                                                         MANAGEMENTFEE,
                                                         SBSCRFEE,
                                                         PURCHFEE,
                                                         REDMFEE,
                                                         SBSCRFLG,
                                                         SBSCRFLG_NAME,
                                                         PURCHFLG,
                                                         PURCHFLG_NAME,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         SBSCRMINAMT,
                                                         SBSCRINCAMT,
                                                         PURCHMINAMT,
                                                         PURCHINCAMT,
                                                         HOLDMINAMT,
                                                         HOLDMAXAMT,
                                                         REDMMINAMT,
                                                         REDMINCAMT,
                                                         RETURN_TIME,
                                                         VOUCHER_STAT,
                                                         VOUCHER_STAT_NAME,
                                                         IS_INVAIL,
                                                         SIGNFLG,
                                                         SIGNFLG_NAME,
                                                         RETURN_MSG,
                                                         SIGN_CORP_NAME,
                                                         SIGN_TIME,
                                                         ACCTID,
                                                         SIGN_USER_ID,
                                                         CORP_ID,
                                                         TRANS_TIME,
                                                         AMT,
                                                         BIS_TYPE,
                                                         BIS_TYPE_NAME
                                                        )
AS
   SELECT E.VOUCHER_NO, P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME,
          P.TARGET,
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
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '������'
              WHEN P.RETURN_TYPE = '2'
                 THEN '��ֵ'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          TO_CHAR (ROUND (P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
          TO_CHAR (ROUND (P.MANAGEMENTFEE, 2),
                   '9999999999990.00'
                  ) AS MANAGEMENTFEE,
          TO_CHAR (ROUND (P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
          TO_CHAR (ROUND (P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
          TO_CHAR (ROUND (P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '���ɲ���'
              WHEN P.SBSCRFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '���ɲ���'
              WHEN P.PURCHFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '���ɲ���'
              WHEN P.REDMFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS REDMFLG_NAME,
          TO_CHAR (ROUND (P.SBSCRMINAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRMINAMT,
          TO_CHAR (ROUND (P.SBSCRINCAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRINCAMT,
          TO_CHAR (ROUND (P.PURCHMINAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHMINAMT,
          TO_CHAR (ROUND (P.PURCHINCAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHINCAMT,
          TO_CHAR (ROUND (P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
          TO_CHAR (ROUND (P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
          TO_CHAR (ROUND (P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
          TO_CHAR (ROUND (P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
          TO_CHAR (P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN E.STATUS || ''
              WHEN S.VOUCHER_STAT IS NOT NULL
                 THEN TRIM (S.VOUCHER_STAT)
           END
          ) AS VOUCHER_STAT,
          (CASE
              WHEN S.VOUCHER_STAT IS NULL
                 THEN (CASE
                          WHEN E.STATUS = '550'
                             THEN '������'
                          WHEN E.STATUS = '500'
                             THEN '�ݴ�'
                          WHEN E.STATUS = '450'
                             THEN '���'
                          WHEN E.STATUS = '95'
                             THEN '����ͨ��'
                          WHEN E.STATUS = '250'
                             THEN 'ɾ��'
                          WHEN E.STATUS = '200'
                             THEN '��Ч'
                          WHEN E.STATUS = '150'
                             THEN '����'
                          WHEN E.STATUS = '11'
                             THEN '������'
                          ELSE '������'
                       END
                      )
              ELSE (CASE
                       WHEN TRIM (S.VOUCHER_STAT) = '3'
                          THEN '׼������'
                       WHEN TRIM (S.VOUCHER_STAT) = '1'
                          THEN '�������'
                       WHEN TRIM (S.VOUCHER_STAT) = '9'
                          THEN '�ӿڴ���ʧ��'
                       WHEN TRIM (S.VOUCHER_STAT) = '2'
                          THEN '���д���ʧ��'
                       WHEN TRIM (S.VOUCHER_STAT) = '0'
                          THEN '���׳ɹ�'
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
                 THEN '��ǩԼ'
              WHEN F.SIGNFLG = '1'
                 THEN 'ǩԼ��'
              WHEN F.SIGNFLG = '2'
                 THEN 'δǩԼ'
              WHEN F.SIGNFLG = '3'
                 THEN 'ǩԼʧ��'
           END
          ) AS SIGNFLG_NAME,
          S.RETURN_MSG, T.CORP_NAME AS SIGN_CORP_NAME,
          TO_CHAR (F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
          F.ACCTID, F.SIGN_USER_ID, E.CORP_ID,
          TO_CHAR (E.TRANS_TIME, 'YYYY-MM-DD HH24:MI:SS') AS TRANS_TIME,
          TO_CHAR (ROUND (E.AMT, 2), '9999999999990.00') AS AMT, E.BIS_TYPE,
          (CASE
              WHEN E.BIS_TYPE = '01'
                 THEN '�Ϲ�'
              WHEN E.BIS_TYPE = '02'
                 THEN '�깺'
           END
          ) AS BIS_TYPE_NAME
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID AND S.BIS_TYPE <= '02'
          LEFT JOIN BIS_FIN_PRODUCT_INFO P ON P.PRODNO = E.PRODNO
          LEFT JOIN BIS_FIN_CONTRACT F
          ON P.PRODNO = F.PRODNO AND E.CONTRACT_ID = F.CONTRACT_ID
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE <= '02';


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_QYHI (SERIAL_ID,
                                                         CONTRACT_ID,
                                                         CORP_ID,
                                                         CORP_NAME,
                                                         PRODNO,
                                                         SHORTNAME,
                                                         BIF_CODE,
                                                         BIF_NAME,
                                                         ACCTID,
                                                         TRNCODE,
                                                         TRNSTATUS,
                                                         APPLYAMT,
                                                         SHAREAPPLY,
                                                         CASHFLAG,
                                                         CASHFLAG_NAME,
                                                         DEALAMT,
                                                         DEALSHARES,
                                                         TRANS_TIME,
                                                         RETURN_MSG,
                                                         BROKER
                                                        )
AS
   SELECT SERIAL_ID, CONTRACT_ID, CORP_ID, CORP_NAME, PRODNO, SHORTNAME,
          BIF_CODE, BIF_NAME, ACCTID, TRNCODE, TRNSTATUS,
          TO_CHAR (ROUND (APPLYAMT, 2), '9999999999990.00') AS APPLYAMT,
          TO_CHAR (ROUND (SHAREAPPLY, 2), '9999999999990.00') AS SHAREAPPLY,
          CASHFLAG, CASHFLAG_NAME,
          TO_CHAR (ROUND (DEALAMT, 2), '9999999999990.00') AS DEALAMT,
          TO_CHAR (ROUND (DEALSHARES, 2), '9999999999990.00') AS DEALSHARES,
          TRANS_TIME, RETURN_MSG, BROKER
     FROM (SELECT DISTINCT D.SERIAL_ID, C.CONTRACT_ID, C.CORP_ID, T.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME, D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '��'
                               WHEN D.CASHFLAG = '1'
                                  THEN '��'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_DTL D JOIN BIS_FIN_BUY C
                           ON C.PRODNO = D.PRODNO
                           JOIN BIS_FIN_CONTRACT BFC
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID
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
                     WHERE D.TRANS_TYPE = '0'
           UNION ALL
           SELECT DISTINCT D.SERIAL_ID, C.CONTRACT_ID, C.CORP_ID, T.CORP_NAME,
                           D.PRODNO, D.SHORTNAME, D.BIF_CODE,
                           F.NAME AS BIF_NAME, D.ACCTID, D.TRNCODE,
                           D.TRNSTATUS, D.APPLYAMT, D.SHAREAPPLY, D.CASHFLAG,
                           (CASE
                               WHEN D.CASHFLAG = '0'
                                  THEN '��'
                               WHEN D.CASHFLAG = '1'
                                  THEN '��'
                            END
                           ) AS CASHFLAG_NAME,
                           D.DEALAMT, D.DEALSHARES, D.TRANS_TIME,
                           D.RETURN_MSG, D.BROKER
                      FROM BIS_FIN_HIS_DTL D JOIN BIS_FIN_BUY C
                           ON C.PRODNO = D.PRODNO
                           JOIN BIS_FIN_CONTRACT BFC
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID
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
                     WHERE D.TRANS_TYPE = '0');


/* FORMATTED ON 2012/11/10 13:46 (FORMATTER PLUS V4.8.8) */
CREATE OR REPLACE FORCE VIEW V_BIS_FIN_PRODUCT_SIGN (CONTRACT_ID,
                                                         PRODNO,
                                                         PRODNAME,
                                                         CURRENCY,
                                                         CUR_NAME,
                                                         TARGET,
                                                         TARGET_NAME,
                                                         BIF_CODE,
                                                         TYPE_NAME,
                                                         RETURN_TYPE,
                                                         RETURN_TYPE_NAME,
                                                         DTSTART,
                                                         DTEND,
                                                         INTRSTEDTSTART,
                                                         EXPIREDATE,
                                                         DTEXCHANGE,
                                                         REFVALUE,
                                                         MANAGEMENTFEE,
                                                         SBSCRFEE,
                                                         PURCHFEE,
                                                         REDMFEE,
                                                         SBSCRFLG,
                                                         SBSCRFLG_NAME,
                                                         PURCHFLG,
                                                         PURCHFLG_NAME,
                                                         REDMFLG,
                                                         REDMFLG_NAME,
                                                         SBSCRMINAMT,
                                                         SBSCRINCAMT,
                                                         PURCHMINAMT,
                                                         PURCHINCAMT,
                                                         HOLDMINAMT,
                                                         HOLDMAXAMT,
                                                         REDMMINAMT,
                                                         REDMINCAMT,
                                                         RETURN_TIME,
                                                         VOUCHER_STAT,
                                                         SIGNFLG,
                                                         SIGNFLG_NAME,
                                                         RETURN_MSG,
                                                         CORP_ID,
                                                         SIGN_CORP_NAME,
                                                         SIGN_TIME,
                                                         ACCTID,
                                                         SIGN_USER_ID,
                                                         IS_SBSCRFLG
                                                        )
AS
   SELECT F.CONTRACT_ID, P.PRODNO, P.PRODNAME, P.CURRENCY, C.CUR_NAME,
          P.TARGET,
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
          P.BIF_CODE, B.NAME AS TYPE_NAME, P.RETURN_TYPE,
          (CASE
              WHEN P.RETURN_TYPE = '1'
                 THEN '������'
              WHEN P.RETURN_TYPE = '2'
                 THEN '��ֵ'
           END
          ) AS RETURN_TYPE_NAME,
          P.DTSTART, P.DTEND, P.INTRSTEDTSTART, P.EXPIREDATE, P.DTEXCHANGE,
          TO_CHAR (ROUND (P.REFVALUE, 2), '9999999999990.00') AS REFVALUE,
          TO_CHAR (ROUND (P.MANAGEMENTFEE, 2),
                   '9999999999990.00'
                  ) AS MANAGEMENTFEE,
          TO_CHAR (ROUND (P.SBSCRFEE, 2), '9999999999990.00') AS SBSCRFEE,
          TO_CHAR (ROUND (P.PURCHFEE, 2), '9999999999990.00') AS PURCHFEE,
          TO_CHAR (ROUND (P.REDMFEE, 2), '9999999999990.00') AS REDMFEE,
          P.SBSCRFLG,
          (CASE
              WHEN P.SBSCRFLG = '0'
                 THEN '���ɲ���'
              WHEN P.SBSCRFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS SBSCRFLG_NAME,
          P.PURCHFLG,
          (CASE
              WHEN P.PURCHFLG = '0'
                 THEN '���ɲ���'
              WHEN P.PURCHFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS PURCHFLG_NAME,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '���ɲ���'
              WHEN P.REDMFLG = '1'
                 THEN '�ɲ���'
           END
          ) AS REDMFLG_NAME,
          TO_CHAR (ROUND (P.SBSCRMINAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRMINAMT,
          TO_CHAR (ROUND (P.SBSCRINCAMT, 2),
                   '9999999999990.00'
                  ) AS SBSCRINCAMT,
          TO_CHAR (ROUND (P.PURCHMINAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHMINAMT,
          TO_CHAR (ROUND (P.PURCHINCAMT, 2),
                   '9999999999990.00'
                  ) AS PURCHINCAMT,
          TO_CHAR (ROUND (P.HOLDMINAMT, 2), '9999999999990.00') AS HOLDMINAMT,
          TO_CHAR (ROUND (P.HOLDMAXAMT, 2), '9999999999990.00') AS HOLDMAXAMT,
          TO_CHAR (ROUND (P.REDMMINAMT, 2), '9999999999990.00') AS REDMMINAMT,
          TO_CHAR (ROUND (P.REDMINCAMT, 2), '9999999999990.00') AS REDMINCAMT,
          TO_CHAR (P.RETURN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS RETURN_TIME,
          F.VOUCHER_STAT, F.SIGNFLG,
          (CASE
              WHEN F.SIGNFLG = '0'
                 THEN (CASE
                          WHEN F.VOUCHER_STAT = '0'
                             THEN '��ǩԼ'
                          WHEN F.VOUCHER_STAT = '1'
                             THEN '�������'
                          WHEN F.VOUCHER_STAT = '2'
                             THEN '���д���ʧ��'
                          WHEN F.VOUCHER_STAT = '3'
                             THEN '׼������'
                          WHEN F.VOUCHER_STAT = '9'
                             THEN '�ӿڴ���ʧ��'
                       END
                      )
              WHEN F.SIGNFLG = '1'
                 THEN 'ǩԼ��'
              WHEN F.SIGNFLG = '2'
                 THEN 'δǩԼ'
              WHEN F.SIGNFLG = '3'
                 THEN 'ǩԼʧ��'
           END
          ) AS SIGNFLG_NAME,
          F.RETURN_MSG, F.SIGN_CORP AS CORP_ID, T.CORP_NAME AS SIGN_CORP_NAME,
          TO_CHAR (F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
          F.ACCTID, F.SIGN_USER_ID,
          (CASE
              WHEN P.SBSCRFLG = 0
                 THEN 0
              WHEN P.SBSCRFLG = 1
              AND (TO_CHAR (SYSDATE, 'YYYY-MM-DD') BETWEEN TO_CHAR
                                                                 (P.DTSTART,
                                                                  'YYYY-MM-DD'
                                                                 )
                                                       AND TO_CHAR
                                                                 (P.DTEND,
                                                                  'YYYY-MM-DD'
                                                                 )
                  )
                 THEN 1
              ELSE 0
           END
          ) AS IS_SBSCRFLG
     FROM BIS_FIN_CONTRACT F LEFT JOIN BIS_FIN_PRODUCT_INFO P
          ON P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          LEFT JOIN BIS_BIF_INIT B ON P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
          ;


CREATE OR REPLACE FORCE VIEW V_BIS_FIN_STATES_QUERY (CONTRACT_ID,
                                                         CORP_ID,
                                                         SIGN_CORP_NAME,
                                                         PRODNO,
                                                         BIF_CODE,
                                                         PRODNAME,
                                                         ACCTID,
                                                         TARGET,
                                                         SIGNFLG,
                                                         SIGN_TIME,
                                                         SIGNFLG_NAME,
                                                         IS_RESET,
                                                         VOUCHER_STAT,
                                                         VOUCHER_STAT_NAME,
                                                         RETURN_MSG
                                                        )
AS
   SELECT F.CONTRACT_ID, F.SIGN_CORP AS CORP_ID,
          T.CORP_NAME AS SIGN_CORP_NAME, P.PRODNO, F.BIF_CODE, P.PRODNAME,
          F.ACCTID, P.TARGET, F.SIGNFLG,
          TO_CHAR (F.SIGN_TIME, 'YYYY-MM-DD HH24:MI:SS') AS SIGN_TIME,
          (CASE
              WHEN F.SIGNFLG = 0
                 THEN '��ǩԼ'
              WHEN F.SIGNFLG = 1
                 THEN 'ǩԼ��'
              WHEN F.SIGNFLG = 2
                 THEN 'δǩԼ'
              WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 2
                 THEN '���д���ʧ��'
              WHEN F.SIGNFLG = 3 AND F.VOUCHER_STAT = 9
                 THEN '�ӿڴ���ʧ��'
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
              AND TO_CHAR (F.SIGN_TIME, 'YYYY-MM-DD') =
                                               TO_CHAR (SYSDATE, 'YYYY-MM-DD')
                 THEN 1
              ELSE 0
           END
          ) AS IS_RESET,
          F.VOUCHER_STAT,
          (CASE
              WHEN F.VOUCHER_STAT = 0
                 THEN 'ǩԼ�ɹ�'
              WHEN F.VOUCHER_STAT = 1
                 THEN '�������'
              WHEN F.VOUCHER_STAT = 2
                 THEN '���д���ʧ��'
              WHEN F.VOUCHER_STAT = 3
                 THEN '׼������'
              WHEN F.VOUCHER_STAT = 9
                 THEN '�ӿڴ���ʧ��'
           END
          ) AS VOUCHER_STAT_NAME,
          F.RETURN_MSG
     FROM BIS_FIN_PRODUCT_INFO P JOIN BIS_FIN_CONTRACT F ON P.PRODNO =
                                                                      F.PRODNO
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
          ;