--修改日期：2012.12.19
--修改人：刘之三
--修改内容：自动扫描预警
--修改原因：自动扫描预警
 
   --创建系统外付款视图
IF EXISTS (SELECT * FROM sysobjects WHERE /*检测是否存在*/  
                         name = 'V_OUT_PAY_HIS_DTL')  
     DROP VIEW V_OUT_PAY_HIS_DTL /*删除视图*/  
GO   
create view V_OUT_PAY_HIS_DTL  AS 
select  Dtl.Serial_Id,
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
       dtl.Corp_Code,
       dtl.Acc_Type,
       dtl.bank_type ,
       dtl.type_name ,
       dtl.bank_bal
   from (   --在线明细
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
        Where Dtl.Bank_Acc = Acc.Bank_Acc and acc.bank_type = bank_type.bank_type) dtl 
  where not exists
  (select e.voucher_no from bis_exc e 
   where dtl.Bank_Acc = e.payer_acc_no  
     and dtl.Opp_Acc_No = e.payee_acc_no  and dtl.Cd_Sign = '1'
     and dtl.Amt = e.amt and CONVERT(varchar(12),dtl.Trans_Time,105) = CONVERT(varchar(12),e.trans_time,105)
 ); 
GO