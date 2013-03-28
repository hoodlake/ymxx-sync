


--修改人:蒲勇军
--修改时间:2012-11-06 10:24:59
--更新历史数据,修改bis_acc_his_bal的单位id为原帐号单位id
update bis_acc_his_bal
set bis_acc_his_bal.corp_id = (select a.corp_id from bt_bankacc_app a  where a.bankacc = bis_acc_his_bal.bank_acc )
where bis_acc_his_bal.corp_id != (select a.corp_id from bt_bankacc_app a  where a.bankacc = bis_acc_his_bal.bank_acc )

GO



