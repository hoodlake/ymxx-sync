--修改日期：2012.12.19
--修改人：刘之三
--修改内容：自动扫描预警
--修改原因：自动扫描预警

  --历史明细视图添加银行类型字段
IF EXISTS (SELECT * FROM sysobjects WHERE /*检测是否存在*/  
                         name = 'v_all_bis_acc_his_dtl')  
     DROP VIEW v_all_bis_acc_his_dtl /*删除视图*/  
GO  
create view v_all_bis_acc_his_dtl as
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       Acc.Corp_Code,
       Acc.Acc_Type,
       acc.bank_type ,
       bank_type.type_name ,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, v_Acc_List Acc , bt_bank_type bank_type 
 Where Dtl.Bank_Acc = Acc.Bank_Acc and acc.bank_type = bank_type.bank_type 
--离线明细
Union All
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       App.Corp_Code,
       App.Acc_Attribute,
       app.bank_type ,
       bank_type.type_name,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, Bt_Bankacc_App App, bt_bank_type bank_type 
 Where Dtl.Bank_Acc = App.Bankacc and bank_type.bank_type = app.bank_type
   And App.Status = 95
   And Id Is Not Null;
GO   
 
