--�޸��ˣ�Ҷ����
--�޸�ʱ�䣺2012-11-21 
--��������Ʋ�ƷǩԼ״̬ 
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
          '��ǩԼ'
         WHEN F.SIGNFLG = 1 THEN
          'ǩԼ��'
         WHEN F.SIGNFLG = 2 THEN
          'δǩԼ'
         WHEN F.SIGNFLG = 3
          'ǩԼʧ��'
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
             'ǩԼ�ɹ�'
             WHEN F.VOUCHER_STAT = 2 THEN
             '���д���ʧ��'
             WHEN F.VOUCHER_STAT = 3 THEN
             '׼������'
             WHEN F.VOUCHER_STAT = 9 THEN
             '�ӿڴ���ʧ��'
             END
       ) AS VOUCHER_STAT_NAME,
       P.RETURN_MSG
  FROM BIS_FIN_PRODUCT_INFO P
  JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO
  LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID
GO