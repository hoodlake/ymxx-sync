ALTER PROCEDURE Proc_Out_Restore_Day_Over
@a_Net_Code      Char(4),
@a_Over_Day      Datetime
 As
declare  @v_Carry_Id   NUMERIC(10)
declare  @v_Start_Date Datetime
Begin

  --获得最后一次未返的日结ID
  Begin
    Select @v_Carry_Id=Max(Carry_Id)
      From Fc_Carry
     Where Carry_Type = 'D'
       And Net_Code = @a_Net_Code
       And (Restore_Carry_Optor Is Null)

    --获得当次日结的起始日期
    Select @v_Start_Date=Voucher_Start_Date
      From Fc_Carry
     Where Carry_Id = @v_Carry_Id

    if @@ERROR<>0
       Raiserror('日结信息丢失!',16,-1)
  End
    
  Begin
    Update Fc_Out_Accbook
       Set Over_Sign = '0' --更新日结标识为已结标识'0'
     Where Out_Accbook_Id In
           (Select Distinct Fc_Out_Accbook_Dtl.Out_Accbook_Id
              From Fc_Out_Accbook_Dtl, Fc_Out_Acc_Balance,Fc_Out_Accbook
             Where Fc_Out_Accbook_Dtl.Account = Fc_Out_Acc_Balance.Account
	       And Fc_Out_Accbook.Out_Accbook_Id = Fc_Out_Accbook_Dtl.Out_Accbook_Id
               And Fc_Out_Accbook.Tally_Date >= @a_Over_Day
               And Fc_Out_Acc_Balance.Account Like (@a_Net_Code + '%')
               And Fc_Out_Acc_Balance.Opt_Date = @v_Start_Date)
    if @@ERROR<>0
      Raiserror('恢复更新表外流水账表日结标识出错!',16,-1)
  End
  --删除表外科目日结单当天数据
  Begin
    Delete Fc_Out_Subject_Day
     Where Net_Code = @a_Net_Code
       And (Opt_Date >= @v_Start_Date And Opt_Date <= @a_Over_Day)
    if @@ERROR<>0
      Raiserror('删除当天表外科目日结单数据出错!',16,-1)

  End
  Begin
    Delete Fc_Out_Acc_Balance 
     Where Fc_Out_Acc_Balance.Account Like (@a_Net_Code + '%')
       And (Fc_Out_Acc_Balance.Opt_Date >= @v_Start_Date And Fc_Out_Acc_Balance.Opt_Date <= @a_Over_Day)
       And Fc_Out_Acc_Balance.Account In (Select Blnctr_Acc
                           From Fc_Acc
                          Where Net_Code = @a_Net_Code
                            And Acc_Start_Date <= Fc_Out_Acc_Balance.Opt_Date)

    IF @@ERROR<>0
      Raiserror('删除当天表外账户批量余额出错!',16,-1)
  End
End
go