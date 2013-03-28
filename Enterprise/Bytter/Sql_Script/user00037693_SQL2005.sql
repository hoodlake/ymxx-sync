--修改日期：2013.01.10
--修改人：刘之三
--修改内容：自动扫描预警视图优化v_bis_acc_last_bal_for_month
--修改原因：原视图效率较低

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'v_bis_acc_last_bal_for_month')  
     DROP VIEW v_bis_acc_last_bal_for_month  
GO
create  view v_bis_acc_last_bal_for_month as
Select row_number() OVER(PARTITION BY  bal.BANK_ACC ORDER BY  bal.BANK_ACC)  id  ,
       bal.BANK_ACC  BANK_ACC,
       bal.BAL_DATE  BAL_DATE,
       bal.BANK_BAL BANK_BAL,
       bal.CORP_CODE CORP_CODE,
       bal.BANK_TYPE BANK_TYPE,
       bal.ACC_TYPE ACC_TYPE,
       bal.PROPERTY PROPERTY,
       bal.CUR CUR,
       CONVERT(varchar(7), Bal.Bal_Date, 20) Bal_Month
  From v_Bis_Acc_His_Bal Bal ,
  ( Select Bank_Acc, Max(Bal_Date) as mx_bal_date From v_Bis_Acc_His_Bal Group By Bank_Acc, Bal_Date) bal2
  where bal.Bal_Date = bal2.mx_bal_date and bal.Bank_Acc = bal2.Bank_Acc;
GO




      