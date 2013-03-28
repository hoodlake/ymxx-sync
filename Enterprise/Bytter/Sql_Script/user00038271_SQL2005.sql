--�޸����ڣ�2013.01.23
--�޸��ˣ���֮��
--�޸����ݣ��Զ�ɨ��Ԥ��
--�޸�ԭ��֧�������������������Ϊ�� ���ڲ�Ԥ��������
  
  --����ת���ߺ������˺Ź���
IF EXISTS (SELECT * FROM sysobjects WHERE /*����Ƿ����*/  
                         name = 'v_all_bis_acc_his_dtl')  
     DROP VIEW v_all_bis_acc_his_dtl /*ɾ����ͼ*/  
GO  
create view v_all_bis_acc_his_dtl as
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       isnull(Dtl.Opp_Acc_Name,' ') Opp_Acc_Name,
       isnull(Dtl.Opp_Acc_Bank,' ') Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       isnull(Dtl.Abs,' ') Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       Acc.Corp_Code,
       Acc.Acc_Type,
       acc.bank_type ,
       bank_type.type_name ,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, v_Acc_List Acc , bt_bank_type bank_type 
 Where Dtl.Bank_Acc = Acc.Bank_Acc and acc.bank_type = bank_type.bank_type 
--������ϸ
Union All
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       isnull(Dtl.Opp_Acc_Name,' ') Opp_Acc_Name,
       isnull(Dtl.Opp_Acc_Bank,' ') Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       isnull(Dtl.Abs,' ') Abs,
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
   And App.Acc_Up <>'1'--����ת���߹���
   And Id Is Not Null;
GO   
 
