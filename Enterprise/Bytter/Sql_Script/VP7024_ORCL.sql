


--�޸���:���¾�
--�޸�ʱ��:2012-11-06 10:24:59
--������ʷ����,�޸�bis_acc_his_bal�ĵ�λidΪԭ�ʺŵ�λid
update bis_acc_his_bal b 
set b.corp_id = (select a.corp_id from bt_bankacc_app a where a.bankacc = b.bank_acc )
where b.corp_id <> (select a.corp_id from bt_bankacc_app a where a.bankacc = b.bank_acc );

commit;


