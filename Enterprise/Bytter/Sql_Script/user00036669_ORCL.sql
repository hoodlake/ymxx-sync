--�޸����ڣ�2012.12.19
--�޸��ˣ���֮��
--�޸����ݣ��Զ�ɨ��Ԥ��
--�޸�ԭ���Զ�ɨ��Ԥ��

  create or replace view v_out_pay_his_dtl as
   --����ϵͳ�⸶����ͼ 
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
   from (
   --������ϸ
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
 --����ָ��������������ϸ 
 where not exists
      (select e.voucher_no 
       from bis_exc e 
       where dtl.Bank_Acc = e.payer_acc_no  
         and dtl.Opp_Acc_No = e.payee_acc_no  and dtl.Cd_Sign = '1'
         and dtl.Amt = e.amt and to_char(dtl.Trans_Time,'yyyy-MM-dd') = to_char(e.trans_time,'yyyy-MM-dd')
     ); 