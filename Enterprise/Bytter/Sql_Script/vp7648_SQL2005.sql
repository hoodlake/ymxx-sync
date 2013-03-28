/*2013-01-25
--�޸���ͼ��ȡ���Ĺ�ʽ
*/
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_FC_ACC_BALANCE_MONTH')
DROP VIEW V_FC_ACC_BALANCE_MONTH
GO
Create VIEW V_FC_ACC_BALANCE_MONTH as
select fc_acc.corp_code, fc_acc.net_code, fc_acc.cur_code,
CONVERT(CHAR(6), dbo.FC_ACC_BALANCE.BALANCE_DATE, 112)  as month_code,
sum(fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money ) as debit_money,
sum((fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money ) * bt_currency.cur_exrate) as natural_debit_money,
sum(fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money ) as credit_money,
sum((fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money ) * bt_currency.cur_exrate) as natural_credit_money,
sum(fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money - fc_acc_balance.tr_debit_money) as tr_debit_money,
sum((fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money - fc_acc_balance.tr_debit_money) * bt_currency.cur_exrate) as natural_tr_debit_money,
sum(fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money - fc_acc_balance.tr_credit_money) as tr_credit_money,
sum((fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money - fc_acc_balance.tr_credit_money)* bt_currency.cur_exrate) as natural_tr_credit_money,
abs(sum(fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money)) + abs(sum(fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money)) as balance,
abs(sum(fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money - fc_acc_balance.tr_debit_money)) + abs(sum(fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money - fc_acc_balance.tr_credit_money)) as tr_balance,
(abs(sum(fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money)) + abs(sum(fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money)))*bt_currency.cur_exrate as natural_balance,
(abs(sum(fc_acc_balance.debit_money - fc_acc_balance.rush_debit_money - fc_acc_balance.tr_debit_money)) + abs(sum(fc_acc_balance.credit_money - fc_acc_balance.rush_credit_money - fc_acc_balance.tr_credit_money)))*bt_currency.cur_exrate as natural_tr_balance,
count(*) as days, sum(fc_acc_balance.balance) / count (*) as aver_balance,
sum(bt_currency.cur_exrate * fc_acc_balance.balance) as natural_balance_aver,
sum(bt_currency.cur_exrate * fc_acc_balance.balance) / count (*) as natural_aver_balance
from bt_currency,fc_acc_balance,fc_acc
where fc_acc_balance.account = fc_acc.blnctr_acc  and fc_acc.cur_code = bt_currency.cur_code
group by fc_acc.net_code, fc_acc.corp_code, fc_acc.cur_code,bt_currency.cur_exrate,  CONVERT(CHAR(6), dbo.FC_ACC_BALANCE.BALANCE_DATE, 112)
