--�޸����ڣ�2013.01.10
--�޸��ˣ���֮��
--�޸����ݣ��Զ�ɨ��Ԥ����ͼ�Ż�v_bis_acc_last_bal_for_month
--�޸�ԭ��ԭ��ͼЧ�ʽϵ�

create or replace view v_bis_acc_last_bal_for_month as
Select Rownum Id,
       bal."BANK_ACC",
       bal."BAL_DATE",
       bal."BANK_BAL",
       bal."CORP_CODE",
       bal."BANK_TYPE",
       bal."ACC_TYPE",
       bal."PROPERTY",
       bal."CUR",
       To_Char(Bal.Bal_Date, 'yyyy-mm') Bal_Month
  From v_Bis_Acc_His_Bal Bal ,
  ( Select Bank_Acc, Max(Bal_Date) as mx_bal_date From v_Bis_Acc_His_Bal Group By Bank_Acc, To_Char(Bal_Date, 'yyyy-mm')) bal2
  where bal.Bal_Date = bal2.mx_bal_date and bal.Bank_Acc = bal2.Bank_Acc;


