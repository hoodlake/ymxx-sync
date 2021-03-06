CREATE OR REPLACE VIEW V_ACC_LIST AS
SELECT  BIS_ACC_LIST.BANK_ACC,
        BIS_ACC_LIST.BIF_CODE,
        BT_BANK_ACC.ACC_NAME,
        BT_BANK_ACC.BANK_NAME, BT_BANK_ACC.CUR, BIS_ACC_LIST.BANK_CODE,
        BIS_ACC_LIST.AREA_CODE, BIS_ACC_LIST.PRENT_ACC, BT_BANK_ACC.CORP_CODE,
        BIS_ACC_LIST.ACC_TYPE, BIS_ACC_LIST.BANK_GRANT_ID,
        BIS_ACC_LIST.ENT_LICENSE_ID, BIS_ACC_LIST.ENT_ID,
        BIS_ACC_LIST.PARENT_SIGN, BT_BANK_ACC.REGISTER_DATE,
        BT_BANK_ACC.VALID_SIGN,BIS_ACC_LIST.SCAN_FLAG,BIS_ACC_LIST.ORG_CODE,
        BT_BANK_ACC.RMK,
        BT_BANK_ACC.Purpose,
        BT_BANK_ACC.BIS_TYPE,
        BT_BANK_ACC.COUNTER_ACC,
        BT_BANK_ACC.PRIVATE_NO,
        BIS_ACC_LIST.CHARGE_MODE,
        BIS_ACC_LIST.DIR_SIGN,
        bt_bank.PROV,
        bt_bank.CITY,
        bt_bank.bank_type,
        BIS_ACC_LIST.ACC_MODE,BIS_ACC_LIST.ACC_TYPE1,BIS_ACC_LIST.PSBKNO,BIS_ACC_LIST.PSBKSQNO,
        bt_bank.paysysbankcode,BT_BANK_ACC.APPROP_COUNTER_ACC
FROM    BT_BANK_ACC,BIS_ACC_LIST,bt_bank
WHERE   BT_BANK_ACC.BANK_ACC = BIS_ACC_LIST.BANK_ACC AND
        ((BT_BANK_ACC.COUNTER_ACC = BIS_ACC_LIST.COUNTER_ACC)or(BT_BANK_ACC.COUNTER_ACC is null and BIS_ACC_LIST.COUNTER_ACC is null))
        AND BIS_ACC_LIST.Bank_Code = bt_bank.bank_code;
