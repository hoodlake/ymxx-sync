--修改日期：2013.01.26
--修改人：黄学安
--修改内容：处理借款历史数据问题

insert into CMS_PROVIDE_LOAN_SEND(BILL_CODE,father_code,contract_code,money,SEND_DATE,DEADLINE_DATE,repay_type,
               corp_id,rmk,NEXTCHECKER,APPROVES,op,status,PL_RATE,DEFERRED_RATE,OVERDUE_RATE,ACC_CODE,
         voucher_no,order_no,tallier_code,float_way,rate_entries_effect_date,interest_way,
               REFERENCE_RATE_TYPE,REPAY_CYCLE,POINTS_PROPORTION_SELECT,POINTS_PROPORTION_TEXT,ENTER_DATE,LOAN_SEND_OUT_TYPE,IS_SKIP_PROCESS,CUR_CODE)
select replace(bill_code,'B1','C3'),
       loan.bill_code,
       loan.contract_no,
       loan.PL_MONEY,
        loan.PL_DATE,
  loan.REPAY_DATE,
       loan.repay_type,
       loan.corp_id,
       loan.RMK,
       loan.NEXT_CHECKER,
       loan.APPROVES,
       loan.op,
       loan.status,
       loan.PL_RATE,
       loan.DEFERRED_RATE,
       loan.OVERDUE_RATE,
       loan.ACC_CODE,
       loan.VOUCHER_NO,
       loan.ORDER_NO,
       loan.TALLIER_CODE,
       loan.FLOAT_WAY,
       loan.RATE_ENTRIES_EFFECT_DATE,
       loan.INTEREST_WAY,
       loan.REFERENCE_RATE_TYPE,
       loan.REPAY_CYCLE,
       loan.POINTS_PROPORTION_SELECT,
       loan.POINTS_PROPORTION_TEXT,
       loan.ENTER_DATE,
       '1',
       '1',
       loan.CUR_CODE
  from CMS_PROVIDE_LOAN_info loan
 where
    status >102
   and PL_MONEY >= (select nvl(sum(repay_money), 0)
                       from cms_provide_loan_repay
                      where loan.bill_code = cms_provide_loan_repay.pli_code
                        and cms_provide_loan_repay.status <> -2)
   and not exists(select 1 from CMS_PROVIDE_LOAN_SEND send where  send.father_code = loan.bill_code); 

      --修改还款表中的li_code
 update CMS_PROVIDE_LOAN_REPAY
    set send_code = (select replace(loan.bill_code, 'B1', 'C3')
                     from CMS_PROVIDE_LOAN_INFO loan
                    where status >=102
                      and pli_code = loan.bill_code
                      and loan.pl_money >=
                          (select nvl(sum(repay_money), 0)
                             from CMS_PROVIDE_LOAN_REPAY r
                            where loan.bill_code =
                                  r.pli_code
                              and r.status <> -2))
  where exists
  (select 1
           from CMS_PROVIDE_LOAN_INFO loan
          where status  >=102
            and pli_code = bill_code
            and loan.pl_money >=
                (select nvl(sum(repay_money), 0)
                   from CMS_PROVIDE_LOAN_REPAY
                  where loan.bill_code = CMS_PROVIDE_LOAN_REPAY.pli_code
                    and CMS_PROVIDE_LOAN_REPAY.status <> -2));
--修改展期表中的                                         
update cms_pl_deferred d
   set d.pli_code = (select replace(bill_code, 'B1', 'C3')
                    from cms_provide_loan_info loan
                   where status >=102
                     and pli_code = bill_code
                     and pl_money >=
                         (select nvl(sum(repay_money), 0)
                            from cms_provide_loan_repay
                           where loan.bill_code =
                                 cms_provide_loan_repay.pli_code
                             and cms_provide_loan_repay.status <> -2))
 where exists
 (select 1
          from cms_provide_loan_info loan
         where status >=102
           and pli_code = bill_code
           and loan.pl_money >=
               (select nvl(sum(repay_money), 0)
                  from cms_provide_loan_repay
                 where loan.bill_code = cms_provide_loan_repay.pli_code
                   and cms_provide_loan_repay.status <> -2));                    
                    
     
        
        
CREATE OR REPLACE VIEW V_CMS_PROVIDE_LOAN AS
select s."BILL_CODE",s."FATHER_CODE",s."CONTRACT_CODE",s."MONEY",s."SEND_DATE",s."DEADLINE_DATE",s."REPAY_TYPE",s."SURETY_EXPLAIN",s."REPAIR_OP",s."OP",s."PL_RATE",s."DEFERRED_RATE",s."OVERDUE_RATE",s."NEXTCHECKER",s."APPROVES",s."STATUS",s."ENTER_DATE",s."ACC_CODE",s."VOUCHER_NO",s."RMK",s."ORDER_NO",s."TALLIER_CODE",s."FLOAT_WAY",s."RATE_ENTRIES_EFFECT_DATE",s."INTEREST_WAY",s."REFERENCE_RATE_TYPE",s."REPAY_CYCLE",s."POINTS_PROPORTION_SELECT",s."POINTS_PROPORTION_TEXT",s."CORP_ID",s."PL_TERM",s."CUR_CODE",s."LOAN_SEND_OUT_TYPE",s."IS_SKIP_PROCESS",s."SEND_TIMES",s."INTERBUSEXPENSES",s."RATETIMEOFTAKEEFFECT",i.bank_code,i.bank_name,i.bank_type from cms_provide_loan_info i,cms_provide_loan_send s where s.father_code=i.bill_code;
commit; 
