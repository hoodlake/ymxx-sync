--修改日期：2012.12.28
--修改人：刘之三
--修改内容：余额超标预警增加账户性质
--修改原因：余额超标预警增加账户性质


--添加账户性质列
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_STRATEGY_DETAIL' AND COLUMN_NAME = 'ACC_CATEGORY';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD ACC_CATEGORY VARCHAR2(20)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--创建最后截止的余额视图
create or replace view v_bis_acc_last_bal_iscomplete as   
Select lastBal.BANK_ACC,
       lastBal.BAL_DATE,
       lastBal.BANK_BAL,
       lastBal.CORP_CODE,
       lastBal.BANK_TYPE,
       lastBal.ACC_TYPE,
       lastBal.PROPERTY,
       lastBal.CUR,
       lastBal.ISCOMPLETE,
       accAll.Acc_Category
  from (Select bal.BANK_ACC,
               bal.BAL_DATE,
               bal.BANK_BAL,
               bal.CORP_CODE,
               bal.BANK_TYPE,
               bal.ACC_TYPE,
               bal.PROPERTY, 
               bal.CUR,
               bal.ISCOMPLETE
          From v_Bis_Acc_His_Bal bal,
         (Select Bank_Acc, Max(Bal_Date) Bal_Date
            From v_Bis_Acc_His_Bal
           where iscomplete = '1'
           Group By Bank_Acc) temp --所有账号的最后余额
 Where bal.Bank_Acc = temp.Bank_Acc
   and bal.Bal_Date = temp.Bal_Date) lastBal
left join V_BANK_ACC_ALL accAll on lastBal.Bank_Acc = accAll.BANK_ACC;


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
   where a.bank_code = b.bank_code and b.bank_type = bt_bank_type.bank_type;


CREATE OR REPLACE VIEW V_CORP_BANKTYPE_NATURE_PROP AS 
select c.corp_code , c.corp_name , 
 b.bank_type, b.type_name as bank_name , 
 a.acc_type as nature_code , 
 a.property as nature_name , 
 na.nature_code as acc_category, 
 na.nature_name as acc_category_name
from bt_corp c ,bt_bank_type b , bis_acc_type a,bt_acc_nature na 
where exists (
      select acc_all.BANK_ACC  from v_bank_acc_all acc_all
      where acc_all.ACC_TYPE = a.acc_type 
      and acc_all.CORP_CODE = c.corp_code 
      and acc_all.bank_type = b.bank_type 
      and acc_all.Acc_Category = na.nature_code
)
