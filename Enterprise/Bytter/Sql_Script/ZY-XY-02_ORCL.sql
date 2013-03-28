--修改时间2012-12-12
--修改人 王诣博

--修改内容  增加 承兑汇票，信用证视图，系统查询菜单

create or replace view v_bill_credit as
select ID,SYSTYPE,CORP_NAME,CORP_ID,PRACTICE_TYPE,CODE,pact_no,BANK_CODE,BANK_TYPE,BANK_NAME,MONEY,CUR_CODE,CUR_NAME,ISSUE_DATE,MATURITY_DATE,REMIT,REPAYMENT,INCREASE_PROFIT,SERVICE_CHARGE,RECEIVER,PAYMENT_CORP from (
select 'A'||ab.id as id,'承兑汇票' as systype, corp_name,ab.corp_id,PRACTICE_TYPE as practice_type,code,pact_no,ab.bank_code,b.bank_type,ab.bank_name,money,cu.cur_code,cu.cur_name,ISSUE_DATE as issue_date,MATURITY_DATE as maturity_date,REMIT as remit,repayment as repayment,INCREASE_PROFIT as increase_profit,SERVICE_CHARGE as service_charge,receiver,PAYMENT_CORP as payment_corp from ab_emit ab
left join bt_bank_acc acc on acc.bank_acc=ab.bank_acc
left join bt_currency cu on cu.cur_code=acc.cur
left join bt_bank b on ab.bank_code = b.bank_code
union all
select 'B'||lc.code as id, '信用证' as systype, applicant as corp_name,corp_id,PRACTICE_TYPE ,CREDIT_NO as code,CONTRACT_NO as pact_no,ISSUING_BANK_CODE as bank_code,bn.bank_type,ISSUING_BANK as bank_name,CREDIT_MONEY as money,cur.cur_code,cur.cur_name,ISSUING_DATE,EXPIRY_DATE as MATURITY_DATE,remit,repayment,INCREASE_PROFIT,SERVICE_CHARGE,BENEFICIARY as receiver,PAYMENT_CORP from lc_enrol lc
left join bt_currency cur on lc.currency=cur.cur_code
left join bt_bank bn on lc.issuing_bank_code = bn.bank_code ) res;



DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2    WHERE t1.sys_code='ads' AND t1.res_name='银票/信用证查询'   AND t1.father_code=t2.res_code AND t2.res_name='查询统计' ;
  IF VN_COUNT < 1 THEN
      INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, 
   REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '银票/信用证查询', 'ads', RES_CODE, '/AB/query/billCreditQuery.jsp', '0', '1', '0', '0', 
   (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'ads'), 
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '查询统计' AND T3.SYS_CODE = 'ads';
  END IF;
  COMMIT; 
END;
/