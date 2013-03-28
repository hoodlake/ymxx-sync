


create or replace view v_cms_precative_loan_send_info as
select info.BILL_CODE            info_bill_code,        --委托贷款录入单号
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --委托人单位Id
       info.CURRENCY             info_CURRENCY,         --币别代码
       info.TERM                 info_TERM,             --贷款期限
       info.MONEY                info_MONEY,            --贷款金额
       info.ENTER_DATE           info_ENTER_DATE,       --贷款录入日期
       info.hypothec_code        info_hypothec_code,    --担保方式代码
       send.BILL_CODE            send_BILL_CODE,        --发放编号（主键）
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --发放编号（输入）
       send.MONEY                send_MONEY,            --发放金额
       send.SEND_DATE            send_SEND_DATE,        --发放日期
       send.STATUS               send_STATUS,           --发放状态
       temp.USEDMONEY,                                  --已发放金额
       cur.cur_name,                                    --币别名称
       corp.corp_name precative_corp_name,              --委托人名称
       typ.type_name                                    --担保方式名称
  from cms_precative_loan_info info
  --最多同时只能有一个发放记录在业务中
  left join cms_precative_loan_send send on  info.bill_code =
                                            send.father_code
                                        and send.status >= -1
                                        and send.status < 102 --102记账完成
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code =
                                            info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code
 where info.status >= 97 --补录完成  --发放金额未完;
   and (temp.usedmoney < info.money or temp.usedmoney is null) 
;
/

