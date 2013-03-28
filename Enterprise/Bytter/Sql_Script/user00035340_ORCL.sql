--修改人：雷艳雄
--修改时间：2012-11-28
--描述：赎回份额显示

declare
  v_cnt number;
begin
  select count(*) into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME ='BIS_FIN_BUY' and COLUMN_NAME='AVAILBAL';
  if v_cnt = 0 then
     execute immediate 'alter table bis_fin_buy  add AVAILBAL  NUMBER(15,2)';
  end if;
end;

/

CREATE OR REPLACE VIEW V_BIS_FIN_PRODUCT_BKQY AS
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
          TO_CHAR (ROUND (F.PRODBAL, 2), '9999999999990.00') AS PRODBAL,
          TO_CHAR (ROUND (E.AVAILBAL, 2), '9999999999990.00') AS AVAILBAL,
          P.REDMFLG,
          (CASE
              WHEN P.REDMFLG = '0'
                 THEN '不可操作'
              WHEN P.REDMFLG = '1'
                 THEN '可操作'
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
                       WHEN TRIM (S.VOUCHER_STAT) = '3'
                          THEN '准备发送'
                        WHEN TRIM (S.VOUCHER_STAT) = '1'
                          THEN '数据报文报错'
                       WHEN TRIM (S.VOUCHER_STAT) = '9'
                          THEN '接口处理失败'
                       WHEN TRIM (S.VOUCHER_STAT) = '2'
                          THEN '银行处理失败'
                       WHEN TRIM (S.VOUCHER_STAT) = '0'
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
          S.RETURN_MSG
     FROM BIS_FIN_BUY E LEFT JOIN BIS_FIN_EXC S ON E.VOUCHER_NO = S.THIRD_ID AND S.BIS_TYPE = '05'
          LEFT JOIN BIS_FIN_PRODUCT_INFO P
          ON P.PRODNO = E.PRODNO AND E.BIF_CODE = P.BIF_CODE
          JOIN BIS_FIN_BAL F ON F.PRODNO = E.PRODNO AND P.PRODNO = F.PRODNO
          LEFT JOIN BT_CORP T ON E.CORP_ID = T.ID
          LEFT JOIN BIS_BIF_INIT B
          ON E.BIF_CODE = B.BIF_CODE AND P.BIF_CODE = B.BIF_CODE
          LEFT JOIN BT_CURRENCY C ON P.CURRENCY = C.CUR_CODE
    WHERE E.BIS_TYPE = '05';
