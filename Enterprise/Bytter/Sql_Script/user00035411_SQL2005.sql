--修改人：雷艳雄
--修改时间：2012-11-29
--描述：第三方存管明细查询


 alter table bis_fin_his_dtl add MONTHLY_FALG  CHAR(1);
go

 alter table bis_fin_dtl  add MONTHLY_FALG  CHAR(1);
go



ALTER VIEW V_FC_THIRD_HISTORY
AS
  SELECT SERIAL_ID,
         APPLYAMT,
         DEALAMT,
         BANK_SERIAL_ID,
         BIF_CODE,
         TRNSTATUS,
         TRNCODE,
         TRANS_TIME,
         REC_TIME,
         ACCTID,
         CUR,
         BUSN_NAME,
         BROKER,
         TRANS_TYPE,
         MONTHLY_FALG
  FROM   (SELECT SERIAL_ID,
                 APPLYAMT,
                 DEALAMT,
                 BANK_SERIAL_ID,
                 BIF_CODE,
                 TRNSTATUS,
                 TRNCODE,
                 TRANS_TIME,
                 REC_TIME,
                 ACCTID,
                 CUR,
                 BUSN_NAME,
                 BROKER,
                 TRANS_TYPE,
                 MONTHLY_FALG
          FROM   BIS_FIN_DTL
          WHERE  TRANS_TYPE = '1'
          UNION
          SELECT SERIAL_ID,
                 APPLYAMT,
                 DEALAMT,
                 BANK_SERIAL_ID,
                 BIF_CODE,
                 TRNSTATUS,
                 TRNCODE,
                 TRANS_TIME,
                 REC_TIME,
                 ACCTID,
                 CUR,
                 BUSN_NAME,
                 BROKER,
                 TRANS_TYPE,
                 MONTHLY_FALG
          FROM   BIS_FIN_HIS_DTL
          WHERE  TRANS_TYPE = '1') as b
go