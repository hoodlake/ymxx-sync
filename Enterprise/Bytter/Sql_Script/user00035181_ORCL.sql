--修改人：叶爱军
--修改时间：2012-11-21
--描述：理财资产历史交易明细显示条数问题 

CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_QYHI AS
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
                                  THEN '钞'
                               WHEN D.CASHFLAG = '1'
                                  THEN '汇'
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
                     WHERE E.VOUCHER_STAT >= 1 AND D.TRANS_TYPE = '0'
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
                     WHERE E.VOUCHER_STAT >= 1 AND D.TRANS_TYPE = '0'
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
                           ON C.PRODNO = D.PRODNO
                           JOIN BIS_FIN_CONTRACT BFC
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID AND TO_CHAR(D.TRANS_TIME, 'yyyy-MM-dd') = TO_CHAR(BFC.REQ_DATE, 'yyyy-MM-dd')
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
                     WHERE E.VOUCHER_STAT >= 1 AND D.TRANS_TYPE = '0'
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
                           ON C.CONTRACT_ID = BFC.CONTRACT_ID AND TO_CHAR(D.TRANS_TIME, 'yyyy-MM-dd') = TO_CHAR(BFC.REQ_DATE, 'yyyy-MM-dd')
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
                     WHERE E.VOUCHER_STAT >= 1 AND D.TRANS_TYPE = '0');