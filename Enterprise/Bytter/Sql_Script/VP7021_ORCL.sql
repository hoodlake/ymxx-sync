--修改日期：2012.12.07
--修改人：周兵
--修改内容：自动生成余额
--修改原因：需求需要
--增加表字段

update bt_param  set reverse1='0,否;1,是(不覆盖手工生成的余额);2,是(覆盖手工生成的余额)'   where code ='autoBuildHisBal' and sys_code = 'adm' and name = '自动更新离线账户历史余额';

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BIS_ACC_HIS_BAL' AND COLUMN_NAME = 'ISAUTOMATICBAL';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BIS_ACC_HIS_BAL ADD ISAUTOMATICBAL CHAR(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column BIS_ACC_HIS_BAL.ISAUTOMATICBAL is '为1的时候是自动生成余额，为空的时候是手动生成';

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'Bis_Acc_His_Dtl' AND COLUMN_NAME = 'ISAUTOMATICDTL';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE Bis_Acc_His_Dtl ADD ISAUTOMATICDTL CHAR(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column Bis_Acc_His_Dtl.ISAUTOMATICDTL is '为1的时候是此明细记录为自动生成余额，为空的时候是手动生成余额';

DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '计算离线账户历史余额' and sys_code = 'bankacc' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values (( select max(res_code)+1 from bt_sys_res ) , '计算离线账户历史余额', 'bankacc', ( select min(res_code) from bt_sys_res r where r.res_name = '录入余额' and r.sys_code = 'bankacc'  ), '/bankacc/automaticBal.jsp', '0', '1', '0', '0', 10, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/
commit;

update Bis_Acc_His_Dtl set ISAUTOMATICDTL='1';
comment on column Bis_Acc_His_Dtl.ISAUTOMATICDTL is '默认把所有的明细设置为自动生成';

commit;

--更新余额表里面错误的bif_code
update bis_acc_his_bal a
   set bif_code = (select b.bif_code from bt_bank b where b.bank_code = a.bif_code )
 where a.bif_code  in
 (select aa.bif_code from bis_acc_his_bal aa , bt_bank ab where aa.bif_code = ab.bank_code );
  
 commit;
