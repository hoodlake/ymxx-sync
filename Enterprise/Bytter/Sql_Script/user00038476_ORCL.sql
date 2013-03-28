--修改日期：2013.01.29
--修改人：刘之三
--修改内容：过滤离线转在线
--修改原因：过滤离线转在线

CREATE OR REPLACE VIEW V_BANK_ACC_ALL AS
SELECT BIS_ACC_LIST.BANK_ACC,
         BIS_ACC_LIST.BIF_CODE,
         BT_BANK_ACC.ACC_NAME,
         BT_BANK_ACC.BANK_NAME,
         BT_BANK_ACC.CUR,
         BIS_ACC_LIST.BANK_CODE,
         BIS_ACC_LIST.AREA_CODE,
         BIS_ACC_LIST.PRENT_ACC,
         BT_BANK_ACC.CORP_CODE,
         BIS_ACC_LIST.ACC_TYPE,
         BIS_ACC_LIST.PARENT_SIGN,
         BT_BANK_ACC.REGISTER_DATE,
         BT_BANK_ACC.VALID_SIGN,
         BIS_ACC_LIST.SCAN_FLAG  ,
         BT_BANK_ACC.bis_type,
         bt_bank_type.bank_type,
         bt_bank_type.type_name bank_type_name,
         BT_BANK_ACC.Acc_Category ,
         (select a.nature_name from bt_acc_nature a where a.nature_code = BT_BANK_ACC.Acc_Category) category_name
    FROM BT_BANK_ACC, BIS_ACC_LIST, BT_BANK,bt_bank_type
   WHERE BT_BANK_ACC.BANK_ACC = BIS_ACC_LIST.BANK_ACC AND
         BT_BANK_ACC.COUNTER_ACC = BIS_ACC_LIST.COUNTER_ACC AND
         BIS_ACC_LIST.bank_code = bt_bank.bank_code and
         bt_bank.bank_type = bt_bank_type.bank_type
 union all
  select  a.bankacc, a.bank_type, a.acc_name, b.bank_name,a.cur,a.bank_code,
   bank_area,'',a.corp_code, a.acc_attribute, '', op_date, (case acc_status when 2 then '0' else '1' end ),'0','0'
    ,bt_bank_type.bank_type,
   bt_bank_type.type_name bank_type_name,a.acc_category ,
   (select an.nature_name from bt_acc_nature an where an.nature_code = a.acc_category ) category_name
   from bt_bankacc_app a,bt_bank b,bt_bank_type
   where a.bank_code = b.bank_code and b.bank_type = bt_bank_type.bank_type and a.acc_up<>'1';