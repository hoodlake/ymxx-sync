--修改日期：20120823
--修改人：黄茜
--修改内容：新增系统参数“是否跨行调拨”
--修改原因：6203中国黄金预算下拨需求新增
insert into bt_param
       (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
       RMK,
       REVERSE1,
       REVERSE2,
       REVERSE3,
       REVERSE4,
       REVERSE5,
       REVERSE6,
       REVERSE7,
       REVERSE8,
       REVERSE9,
       REVERSE10) values (
       'isInterBankAllot','nis','是否跨行调拨','0',null,null,0,'是否跨行调拨 0,否1,是','0,否1,是',null,null,null,null,1,null,null,null,null)
go
--新增字段“保底金额”
alter table bt_bank_acc add MIN_BALANCE  numeric(14,2)

go

alter VIEW V_NEW_BANK_ACC_INFO AS
SELECT BT_BANK_ACC.BANK_ACC,
       BT_BANK_ACC.COUNTER_ACC,
       BT_BANK_ACC.BANK_NAME,
       bt_bank.bank_type as bank_type_code,
       BT_BANK_ACC.ACC_NAME,
       BT_BANK_ACC.REGISTER_DATE,
       BT_BANK_ACC.CUR,
       BT_BANK_ACC.CORP_CODE,
       BT_BANK_ACC.VALID_SIGN,
       BT_BANK_ACC.RMK,
       BT_BANK_ACC.BASE_ACC_SIGN,
       BT_BANK_ACC.BIS_TYPE,
       BT_BANK_ACC.REVERSE1,
       BIS_ACC_LIST.Acc_Type1 as REVERSE2,
       BT_BANK_ACC.REVERSE3,
       BT_BANK_ACC.REVERSE4,
       BT_BANK_ACC.REVERSE5,
       BT_BANK_ACC.REVERSE6,
       BT_BANK_ACC.REVERSE7,
       BT_BANK_ACC.REVERSE8,
       BT_BANK_ACC.REVERSE9,
       BT_BANK_ACC.REVERSE10,
       BT_BANK_ACC.NC_SUBJECT,
       BT_BANK_ACC.NC_SUBJECTNAME,
       BT_BANK_ACC.NC_RMK,
       BT_BANK_ACC.NC_SUBJECT_CODE,
       BT_BANK_ACC.AUXILIARY_ACCOUNTING,
       BIS_ACC_LIST.BIF_CODE,
       BIS_ACC_LIST.BANK_CODE,
       BT_BANK_ACC.AREA_CODE,
       BIS_ACC_LIST.PRENT_ACC,
       BIS_ACC_LIST.acc_type,
       BT_BANK_ACC.BANK_GRANT_ID,
       BT_BANK_ACC.ENT_LICENSE_ID,
       BT_BANK_ACC.ENT_ID,
       BT_BANK_ACC.ORG_CODE,
       BIS_ACC_LIST.PARENT_SIGN,
       BT_BANK_ACC.SCAN_FLAG,
       BT_BANK_ACC.CHARGE_MODE,
       BT_BANK_ACC.DIR_SIGN,
       bt_corp.ID as corp_id,
       BT_BANK_ACC.CHECKERS,
       BT_BANK_ACC.SUPER_CHECKERS,
       BT_BANK_ACC.NEXTCHECKER,
       BT_BANK_ACC.APPROVES,
       BT_BANK_ACC.OP,
       BT_BANK_ACC.OP_NAME,
       BT_BANK_ACC.ENTER_DATE,
       BT_BANK_ACC.AGREE_DATE_START as CONTRACT_BEGIN_DATE,
       BT_BANK_ACC.AGREE_DATE_END as CONTRACT_END_DATE,
       BT_BANK_ACC.AGREE_MONEY as CONTRACT_MONEY ,
       BT_BANK_ACC.AGREE_RATES as CONTRACT_RATE,
       BT_BANK_ACC.CONTRACT_NO as CONTRACT_BILL_NO,
       BT_BANK_ACC.REGULARS_START_DATE,
       BT_BANK_ACC.REGULARS_END_DATE,
       BT_BANK_ACC.BANKBOOK_NUM,
       BT_BANK_ACC.VOLUME_NUM,
       BT_BANK_ACC.RATES_FLOAT_PER,
       BT_BANK_ACC.RATES_FLOAT,
       BT_BANK_ACC.BALANCE_ACCOUNT,
       BT_BANK_ACC.INTEREST_CYCLE,
       BT_BANK_ACC.INTEREST_DATE,
       BT_BANK_ACC.ACC_CATEGORY,
       BT_BANK_ACC.RATES,
       BT_BANK_ACC.notify_type as NOTICE_TYPE,
       BT_BANK_ACC.End_Unit,
       (case when BT_BANK_ACC.ACC_STATE is null then 'N' else BT_BANK_ACC.ACC_STATE end) as ACC_STATE,
       BT_BANK_ACC.ACC_MODE,
       bt_currency.cur_name,
       bt_corp.corp_name,
       bt_bank.PROV,
       bt_bank.CITY,
       bis_Acc_Type.property as ACC_ATTRIBUTE,
       bis_Acc_Type.type_des,
       fc_acc.acc_type_code,
       bis_bif_init.name as bif_name,
       bt_bank.PAYSYSBANKCODE,
       BIS_ACC_BAL.AVAIL_BAL AS BALANCE,
       BT_ACC_NATURE.Nature_Name,
       BT_BANK_ACC.MIN_BALANCE  --保底金额
  FROM BT_BANK_ACC
   LEFT JOIN BIS_ACC_LIST ON BT_BANK_ACC.BANK_ACC=BIS_ACC_LIST.BANK_ACC
   LEFT join bt_bank
    on BIS_ACC_LIST.bank_code =bt_bank.bank_code
  LEFT  JOIN fc_acc
    ON BT_BANK_ACC.counter_acc = fc_acc.blnctr_acc
  LEFT JOIN bis_Acc_Type
    ON BIS_ACC_LIST.acc_type = bis_Acc_Type.acc_type
  left join bis_bif_init
  on bis_bif_init.bif_code=BIS_ACC_LIST.bif_code
  JOIN bt_currency
    ON BT_BANK_ACC.cur = bt_currency.cur_code
  JOIN bt_corp
    ON BT_BANK_ACC.corp_code = bt_corp.corp_code
  LEFT JOIN BIS_ACC_BAL ON BT_BANK_ACC.BANK_ACC=BIS_ACC_BAL.BANK_ACC
  LEFT JOIN BT_ACC_NATURE ON BT_BANK_ACC.ACC_CATEGORY= BT_ACC_NATURE.NATURE_CODE
go