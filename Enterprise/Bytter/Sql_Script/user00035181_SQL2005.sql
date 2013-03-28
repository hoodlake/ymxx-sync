--�޸��ˣ�Ҷ����
--�޸�ʱ�䣺2012-11-21 
--����������ʲ���ʷ������ϸ��ʾ�������� 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER VIEW [dbo].[V_BIS_FIN_PRODUCT_QYHI] AS
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
                  '��'
                 WHEN D.CASHFLAG = '1' THEN
                  '��'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_DTL D
          JOIN BIS_FIN_BUY C  ON C.PRODNO = D.PRODNO
		  JOIN BIS_FIN_CONTRACT BFC ON C.CONTRACT_ID = BFC.CONTRACT_ID
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE AND E.ACCTID = C.ACCTID
          JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
		  JOIN BT_CORP T ON C.CORP_ID = T.ID
		  JOIN BT_USER U ON T.ID = U.CORP_ID AND U.USER_CODE = C.OPER_USER_ID
		  JOIN BIS_ACC_GRANT BAG ON BAG.USER_CODE = U.USER_CODE AND BAG.BANK_ACC = E.ACCTID AND E.ACCTID = D.ACCTID
         WHERE D.TRANS_TYPE = '0' AND E.VOUCHER_STAT >= 1
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
                  '��'
                 WHEN D.CASHFLAG = '1' THEN
                  '��'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_HIS_DTL D
          JOIN BIS_FIN_BUY C  ON C.PRODNO = D.PRODNO
		  JOIN BIS_FIN_CONTRACT BFC ON C.CONTRACT_ID = BFC.CONTRACT_ID
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE AND E.ACCTID = C.ACCTID
          JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
		  JOIN BT_CORP T ON C.CORP_ID = T.ID
		  JOIN BT_USER U ON T.ID = U.CORP_ID AND U.USER_CODE = C.OPER_USER_ID
		  JOIN BIS_ACC_GRANT BAG ON BAG.USER_CODE = U.USER_CODE AND BAG.BANK_ACC = E.ACCTID AND E.ACCTID = D.ACCTID
         WHERE D.TRANS_TYPE = '0' AND E.VOUCHER_STAT >= 1
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
                  '��'
                 WHEN D.CASHFLAG = '1' THEN
                  '��'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_DTL D
          JOIN BIS_FIN_BUY C  ON C.PRODNO = D.PRODNO
		  JOIN BIS_FIN_CONTRACT BFC ON C.CONTRACT_ID = BFC.CONTRACT_ID AND CONVERT(varchar(10), D.TRANS_TIME, 121) = CONVERT(varchar(10), BFC.REQ_DATE, 121) 
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE AND E.ACCTID = C.ACCTID
          JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
		  JOIN BT_CORP T ON C.CORP_ID = T.ID
		  JOIN BT_USER U ON T.ID = U.CORP_ID AND U.USER_CODE = C.OPER_USER_ID
		  JOIN BIS_ACC_GRANT BAG ON BAG.USER_CODE = U.USER_CODE AND BAG.BANK_ACC = E.ACCTID AND E.ACCTID = D.ACCTID
         WHERE D.TRANS_TYPE = '0' AND E.VOUCHER_STAT >= 1
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
                  '��'
                 WHEN D.CASHFLAG = '1' THEN
                  '��'
               END) AS CASHFLAG_NAME,
               D.DEALAMT,
               D.DEALSHARES,
               D.TRANS_TIME,
               D.RETURN_MSG,
               D.BROKER
          FROM BIS_FIN_HIS_DTL D
          JOIN BIS_FIN_BUY C  ON C.PRODNO = D.PRODNO
		  JOIN BIS_FIN_CONTRACT BFC ON C.CONTRACT_ID = BFC.CONTRACT_ID AND CONVERT(varchar(10), D.TRANS_TIME, 121) = CONVERT(varchar(10), BFC.REQ_DATE, 121) 
          JOIN BIS_FIN_EXC E ON C.VOUCHER_NO = E.THIRD_ID AND C.BIS_TYPE = E.BIS_TYPE AND E.ACCTID = C.ACCTID
          JOIN BIS_BIF_INIT F ON D.BIF_CODE = F.BIF_CODE
		  JOIN BT_CORP T ON C.CORP_ID = T.ID
		  JOIN BT_USER U ON T.ID = U.CORP_ID AND U.USER_CODE = C.OPER_USER_ID
		  JOIN BIS_ACC_GRANT BAG ON BAG.USER_CODE = U.USER_CODE AND BAG.BANK_ACC = E.ACCTID AND E.ACCTID = D.ACCTID
         WHERE D.TRANS_TYPE = '0' AND E.VOUCHER_STAT >= 1) AS B
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

