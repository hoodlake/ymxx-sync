-- 修改日期：20120925
-- 修改人：李又虎
-- 修改内容：根据表外账务插入表外账户联机余额表（开户时未插入的）
INSERT INTO fc_out_online_ledger 
(ACCOUNT, tally_cnt, check_cnt,online_balance,check_balance)
SELECT dtl.ACCOUNT,
SUM(CASE WHEN book.status > 11 AND book.status NOT IN (22,23,30,31) THEN 1 ELSE 0 END) tally_cnt,
SUM(CASE WHEN book.status IN (13,33,20,21,22) THEN 1 ELSE 0 END) check_cnt,
SUM( CASE WHEN  book.status > 11 AND book.status NOT IN (22,23,30,31) THEN (dtl.debit_money - dtl.credit_money) * fc_acc.balance_way ELSE 0 END ) online_balance,
SUM( CASE WHEN book.status IN (13,33,20,21,22) THEN (dtl.debit_money - dtl.credit_money) * fc_acc.balance_way ELSE 0 END ) check_balance
FROM fc_out_accbook_dtl dtl, fc_out_accbook book ,fc_acc 
WHERE dtl.out_accbook_id = book.out_accbook_id AND fc_acc.blnctr_acc = dtl.account 
AND fc_acc.blnctr_acc NOT IN (SELECT led.ACCOUNT FROM fc_out_online_ledger led) 
GROUP BY dtl.ACCOUNT ;

commit;

