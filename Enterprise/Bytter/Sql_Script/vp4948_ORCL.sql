--修改人 田进
--修改时间 2012-08-01
--修改内容 增加erp_total_jky表和总账凭证导出菜单,收付凭证视图v_bis_acc_his_dtl_common
--修改原因 客户需求

create table erp_total_jky
(
 voucher_no varchar(15) primary key,--凭证号  
 tally_date date,--记账日期  
 debit_corp_code varchar(20),--借方单位代码 
 debit_corp_name varchar(200),--借方单位名称
 debit_acc_name varchar(100),--借方户名  
 debit_account varchar(30),-- 借方内部账号  
 credit_corp_code varchar(20),--贷方单位代码 
 credit_corp_name varchar(100),--贷方单位名称
 credit_acc_name varchar(100),-- 贷方户名    
 credit_account varchar(30),--贷方内部账号  
 voucher_type varchar(20),-- 凭证种类（结算方式）   
 money numeric(15,2),-- 金额    
 summary_content varchar(200),-- 摘要   
 is_import char(1) --凭证标记  
);
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '总账凭证导出', 'exchange', RES_CODE, '/dataExchange/erpTotalJkyAction.do?method=initData', '0', '0', '0', '0', 1, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '数据管理';


create or replace view v_bis_acc_his_dtl_common as
Select V1.Corp_Code Corpcode, --本方单位
       B1.Corp_Name Corpname,
       V2.Corp_Code Oppcorpcode, --对方单位
       B2.Corp_Name Oppcorpname,
       V1.Bank_Type,
       Case
         When e.status is null Then
          0
         Else
          e.Status
       End As Colorflag, --1标识导出过 ;2手工标记；0 未导
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

delete from bt_sys_res where res_name='收付凭证';

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '收付凭证', 'exchange', RES_CODE, '/dataExchange/bisAccHisDtlInfo.do?method=showAccHisDtlInfo', '0', '0', '0', '0', 1, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '数据管理';
  
commit;
