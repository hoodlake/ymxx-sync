--修改日期：20121024
--修改人：李德成
--修改内容：调整贷款以前的数据
--将贷款记录插入发放表
insert into loan_send_out_info(bill_code,repay_type,loan_send_out_date,repay_date,loan_send_out_money,father_code,
               corp_id,rmk,next_checker,approves,op,status,contract_code,loan_rate,deferred_rate,overdue_rate,loan_date,
               pay_type,loan_acc,repay_acc,voucher_no,order_no,tallier_code,float_way,rate_entries_effect_date,interest_way,
               reference_rate_type,repay_cycle,points_proportion_select,points_proportion_text,loan_entering_date,
               deferred_replay_date,clb_agreement_rate)
select replace(bill_code,'A1','A4'),
       loan.repay_type,
       loan.loan_date,
       loan.repay_date,
       loan.loan_money,
       loan.bill_code,
       loan.corp_id,
       '',
       '',
       loan.approves,
       loan.op,
       102,
       loan.contract_code,
       loan.loan_rate,
       loan.deferred_rate,
       loan.overdue_rate,
       loan.loan_date,
       1,
       loan.loan_acc,
       loan.repay_acc,
       loan.voucher_no,
       loan.order_no,
       loan.tallier_code,
       '',
       '',
       '',
       '',
       '',
       '',
       '',
       loan.loan_date,
       '',
       ''
  from cms_loan_info loan
 where
    status in (102, 103, 104)
   and loan_money >= (select IsNull(sum(repay_money), 0)
                       from cms_loan_repay
                      where loan.bill_code = cms_loan_repay.li_code
                        and cms_loan_repay.status <> -2)
   and not exists(select 1 from loan_send_out_info send where  send.father_code = loan.bill_code);                 
 go
 --修改还款表中的li_code
 update cms_loan_repay
    set li_code = (select replace(bill_code, 'A1', 'A4')
                     from cms_loan_info loan
                    where status in (102, 103, 104)
                      and li_code = bill_code
                      and loan_money >=
                          (select IsNull(sum(repay_money), 0)
                             from cms_loan_repay
                            where loan.bill_code =
                                  cms_loan_repay.li_code
                              and cms_loan_repay.status <> -2))
  where exists
  (select 1
           from cms_loan_info loan
          where status in (102, 103, 104)
            and li_code = bill_code
            and loan_money >=
                (select IsNull(sum(repay_money), 0)
                   from cms_loan_repay
                  where loan.bill_code = cms_loan_repay.li_code
                    and cms_loan_repay.status <> -2));
                        
                    
        go            
--修改展期表中的                                         
update cms_loan_deferred
   set li_code = (select replace(bill_code, 'A1', 'A4')
                    from cms_loan_info loan
                   where status in (102, 103, 104)
                     and li_code = bill_code
                     and loan_money >=
                         (select IsNull(sum(repay_money), 0)
                            from cms_loan_repay
                           where loan.bill_code =
                                 cms_loan_repay.li_code
                             and cms_loan_repay.status <> -2))
 where exists
 (select 1
          from cms_loan_info loan
         where status in (102, 103, 104)
           and li_code = bill_code
           and loan_money >=
               (select IsNull(sum(repay_money), 0)
                  from cms_loan_repay
                 where loan.bill_code = cms_loan_repay.li_code
                   and cms_loan_repay.status <> -2));


go
