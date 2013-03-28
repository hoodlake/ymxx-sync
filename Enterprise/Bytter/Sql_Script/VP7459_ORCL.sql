--修改日期：2012.12.27
--修改人：刘之三
--修改内容：自动扫描预警视图优化
--修改原因：自动扫描预警视图优化

--创建最后截止的余额视图
create or replace view v_bis_acc_last_bal_iscomplete as
Select bal.BANK_ACC,
       bal.BAL_DATE,
       bal.BANK_BAL,
       bal.CORP_CODE,
       bal.BANK_TYPE,
       bal.ACC_TYPE,
       bal.PROPERTY,
       bal.CUR,
       bal.ISCOMPLETE
  From v_Bis_Acc_His_Bal bal,(Select Bank_Acc, Max(Bal_Date) Bal_Date
                                  From v_Bis_Acc_His_Bal where iscomplete ='1'
                                 Group By Bank_Acc ) temp  --所有账号的最后余额
  Where bal.Bank_Acc = temp.Bank_Acc and bal.Bal_Date = temp.Bal_Date;                              


