


--刘建武 修改视图 银企对账企业科目余额导入明细
create or replace view v_bt_sap_subject_bal as
select sap.ID,
       sap.CORP_CODE,
       sap.CORP_NAME,
       sap.SAP_SUBJECT,
       sap.CUR,
       sap.BAL,
       sap.END_DATE,
       sap.CHECKING_DATE,
       sap.STATUS,
       sap.CREATER,
       sap.CREATE_DATE,
       sap.dif_reasons,
       cu.cur_name,
       acc.bankacc,
       acc.acc_name,
       bank.bank_name,
       usr.user_code creater_code,
       usr.user_name creater_name,
       his.bank_bal,
       cu.cur_exrate
  from BT_SAP_SUBJECT_BAL sap
  inner join bt_bankacc_app     acc  on sap.sap_subject = acc.sap_subject and sap.corp_code=acc.corp_code
  inner join bt_currency        cu   on sap.cur = cu.cur_code
  inner join bt_bank            bank on bank.bank_code = acc.bank_code
  inner join bt_user            usr  on usr.user_code=sap.creater
  left  join bis_acc_his_bal    his  on sap.end_date=his.bal_date and his.bank_acc=acc.bankacc; 
/