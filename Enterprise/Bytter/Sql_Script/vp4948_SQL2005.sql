--�޸��� ���
--�޸�ʱ�� 2012-08-01
--�޸����� ����erp_total_jky�������ƾ֤�����˵�,�ո�ƾ֤��ͼv_bis_acc_his_dtl_common
--�޸�ԭ�� �ͻ�����

create table erp_total_jky
(
 voucher_no varchar(15) primary key,--ƾ֤��  
 tally_date date,--��������  
 debit_corp_code varchar(20),--�跽��λ���� 
 debit_corp_name varchar(200),--�跽��λ����
 debit_acc_name varchar(100),--�跽����  
 debit_account varchar(30),-- �跽�ڲ��˺�  
 credit_corp_code varchar(20),--������λ���� 
 credit_corp_name varchar(100),--������λ����
 credit_acc_name varchar(100),-- ��������    
 credit_account varchar(30),--�����ڲ��˺�  
 voucher_type varchar(20),-- ƾ֤���ࣨ���㷽ʽ��   
 money numeric(15,2),-- ���    
 summary_content varchar(200),-- ժҪ   
 is_import char(1) --ƾ֤���  
);
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '����ƾ֤����', 'exchange', RES_CODE, '/dataExchange/erpTotalJkyAction.do?method=initData', '0', '0', '0', '0', 1, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '���ݹ���';


create view v_bis_acc_his_dtl_common as
Select V1.Corp_Code Corpcode, --������λ
       B1.Corp_Name Corpname,
       V2.Corp_Code Oppcorpcode, --�Է���λ
       B2.Corp_Name Oppcorpname,
       V1.Bank_Type,
       Case
         When e.status is null Then
          0
         Else
          e.Status
       End As Colorflag, --1��ʶ������ ;2�ֹ���ǣ�0 δ��
       a."SERIAL_ID",a."BANK_ACC",a."ACC_NAME",a."BANK_NAME",a."OPP_ACC_NO",a."OPP_ACC_NAME",a."OPP_ACC_BANK",a."CD_SIGN",a."RB_SIGN",a."AMT",a."FEE_1",a."FEE_2",a."BAL",a."BANK_SERIAL_ID",a."BIF_CODE",a."CUR",a."ABS",a."POSTSCRIPT",a."TRANS_TIME",a."VOUCHER_NO",a."VOUCHER_TYPE",a."ACC_SERIAL_NO",a."QUERY_TIME",a."REC_TIME",a."CHK",a."USES",a."INPT",a."ID",a."REVERSE1",a."REVERSE2",a."REVERSE3",a."REVERSE4",a."REVERSE5",a."REVERSE6",a."REVERSE7",a."REVERSE8",a."REVERSE9",a."REVERSE10",a."INTERFACE_ID",a."USEDREMARK",a."ERP_SEND_STATUS",a."ERP_RETURN_MESSAGE",a."ERP_SEND_TIME",a."STATUS",a."IS_IMPORT"
  From Bis_Acc_His_Dtl a
  inner join GSPZK g on trim(g.SERIAL_ID)=trim(a.SERIAL_ID)
  Left Join v_Acc_List V1
    On a.Bank_Acc = V1.Bank_Acc
  Left Join v_Acc_List V2
    On a.Opp_Acc_No = V2.Bank_Acc
  Left Join Bt_Corp B1
    On V1.Corp_Code = B1.Corp_Code
  Left Join Bt_Corp B2
    On V2.Corp_Code = B2.Corp_Code
  Left Join Erp_Interface_Flag e
    On trim(a.Serial_Id) = trim(e.Source_Id)
  where a.opp_acc_no not in(select bank_acc from bt_bank_acc);

delete from bt_sys_res where res_name='�ո�ƾ֤';

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '�ո�ƾ֤', 'exchange', RES_CODE, '/dataExchange/bisAccHisDtlInfo.do?method=showAccHisDtlInfo', '0', '0', '0', '0', 1, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '���ݹ���';
  
commit;
