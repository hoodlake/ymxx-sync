--修改人:陈春燕
--修改时间:2012-10-24
--修改内容:VP6307财务公司会计分录表，新增菜单
--------------财务公司会计分录
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'AB_TALLY_FC_PARAM';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table AB_TALLY_FC_PARAM
(
  OPERATION_ID    NUMBER not null,
  VOUCHER_ORDER   NUMBER not null,
  OPERATION_TYPE  NUMBER not null,
  DEBIT_SUBJECTS  VARCHAR2(200),
  CREDIT_SUBJECTS VARCHAR2(200),
  constraint PK_FC_PRARM primary key (OPERATION_ID, VOUCHER_ORDER, OPERATION_TYPE)
)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
---------------新增财务公司会计科目管理菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE SYS_CODE= 'adm'
   and RES_NAME = '财务公司会计科目设置'
   and RES_URL = '/admin/fcTallyAction.do?method=listTallyParam';
  IF VN_COUNT < 1 THEN
     insert into BT_SYS_RES
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
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
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '财务公司会计科目设置',
         'adm',
         RES_CODE,
         '/admin/fcTallyAction.do?method=listTallyParam',
         '0',
         '1',
         '0',
         '0',
         2,
         '财务公司会计科目设置',
         '',
         '',
         '',
         '',
         '',
         null,
         null,
         null,
         null,
         null,
         3,
         ''
    from bt_sys_res
   where res_name = '业务会计分录设置' and sys_code='adm';
  END IF;
  COMMIT; 
END;
/
--------------修改原承兑分录管理名称
   update BT_SYS_RES res
      set res_name = '结算中心会计科目设置'
    where res.sys_code = 'adm'
      and res.res_name = '承兑汇票'
      and res.res_url = '/admin/tallyAction.do?method=listTallyParam';
 commit; 
 
---修改人：吴结冰
 --修改内容:ZY-CD-01_ORCL.sql 更改ab_operation，测试缺此字段
 --
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_OPERATION' AND COLUMN_NAME = 'RATMODEL';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_OPERATION add RATMODEL char(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--修改人：李程
--承兑汇票
--库存票据业务表新增“视同现汇”字段
--[VP6753]奥克斯ERP上划下拨接口开发
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_RECEIVE' AND COLUMN_NAME = 'AS_SPOT_EXCHANGE';
  --如果小于1则说明不存在，则新增此字段
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/