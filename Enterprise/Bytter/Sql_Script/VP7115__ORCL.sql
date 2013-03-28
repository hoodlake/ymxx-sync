CREATE OR REPLACE Procedure Proc_Out_Restore_Day_Over(a_Net_Code      Char,
                                                      a_Over_Day      Date) As
  v_Carry_Id   Number(10);
  v_Start_Date Date;
Begin

  --������һ��δ�����ս�ID
  Begin
    Select Max(Carry_Id)
      Into v_Carry_Id
      From Fc_Carry
     Where Carry_Type = 'D'
       And Net_Code = a_Net_Code
       And (Restore_Carry_Optor Is Null);

    --��õ����ս����ʼ����
    Select Voucher_Start_Date
      Into v_Start_Date
      From Fc_Carry
     Where Carry_Id = v_Carry_Id;

  Exception
    When No_Data_Found Then
      Raise_Application_Error(-20001, '�ս���Ϣ��ʧ!');
  End;

  Begin
    Update Fc_Out_Accbook
       Set Over_Sign = '0' --�����ս��ʶΪ�ѽ��ʶ'0'
     Where Out_Accbook_Id In
           (Select Distinct Fc_Out_Accbook_Dtl.Out_Accbook_Id
              From Fc_Out_Accbook_Dtl, Fc_Out_Acc_Balance,Fc_Out_Accbook
             Where Fc_Out_Accbook_Dtl.Account = Fc_Out_Acc_Balance.Account
               And Fc_Out_Accbook.Out_Accbook_Id = Fc_Out_Accbook_Dtl.Out_Accbook_Id
               And Fc_Out_Accbook.Tally_Date >= a_Over_Day
               And Fc_Out_Acc_Balance.Account Like (a_Net_Code || '%')
               And Fc_Out_Acc_Balance.Opt_Date = v_Start_Date);
  Exception
    When Others Then
      Raise_Application_Error(-20001, '�ָ����±�����ˮ�˱��ս��ʶ����!');
  End;
  --ɾ�������Ŀ�սᵥ��������
  Begin
    Delete Fc_Out_Subject_Day
     Where Net_Code = a_Net_Code
       And (Opt_Date >= v_Start_Date And Opt_Date <= a_Over_Day);
  Exception
    When Others Then
      Raise_Application_Error(-20001, 'ɾ����������Ŀ�սᵥ���ݳ���!');

  End;
  Begin
    Delete Fc_Out_Acc_Balance a
     Where a.Account Like (a_Net_Code || '%')
       And (a.Opt_Date >= v_Start_Date And a.Opt_Date <= a_Over_Day)
       And a.Account In (Select Blnctr_Acc
                           From Fc_Acc
                          Where Net_Code = a_Net_Code
                            And Acc_Start_Date <= a.Opt_Date);

  Exception
    When Others Then
      Raise_Application_Error(-20001, 'ɾ����������˻�����������!');
  End;

End Proc_Out_Restore_Day_Over;
