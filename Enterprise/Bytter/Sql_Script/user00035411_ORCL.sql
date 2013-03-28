--修改人：雷艳雄
--修改时间：2012-11-29
--描述：第三方存管明细查询

declare
  v_cnt number;
begin
  select count(*) into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME ='BIS_FIN_HIS_DTL' and COLUMN_NAME='MONTHLY_FALG';
  if v_cnt = 0 then
     execute immediate 'alter table BIS_FIN_HIS_DTL  add MONTHLY_FALG  CHAR(1) ';
  end if;
end;

/


declare
  v_cnt number;
begin
  select count(*) into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME ='BIS_FIN_DTL' and COLUMN_NAME='MONTHLY_FALG';
  if v_cnt = 0 then
     execute immediate 'alter table BIS_FIN_DTL  add MONTHLY_FALG  CHAR(1) ';
  end if;
end;

/


CREATE OR REPLACE VIEW V_FC_THIRD_HISTORY AS
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
          WHERE  TRANS_TYPE = '1');
