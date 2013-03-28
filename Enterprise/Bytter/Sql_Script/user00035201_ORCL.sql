--�޸��ˣ�Ҷ����
--�޸�ʱ�䣺2012-11-21
--��������Ʋ�ƷǩԼ״̬ 

CREATE OR REPLACE VIEW V_BIS_FIN_STATES_QUERY AS
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
              WHEN F.SIGNFLG = 3
                 THEN 'ǩԼʧ��'
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
     FROM BIS_FIN_PRODUCT_INFO P JOIN BIS_FIN_CONTRACT F ON P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON F.SIGN_CORP = T.ID;