--修改日期：20121203
--修改人：冯辉
--信贷管理-外部融资台账管理-融资还款
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='融资还款' AND t1.father_code=t2.res_code AND t2.res_name='外部融资台账管理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'融资还款','cms',res_code,'/cms/financePayBack.do?method=tofinancePayBackPage'
   ,'0','1','0','0',4,'融资还款','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '外部融资台账管理' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/




--融资台账还款表（CMS_FACCOUNT_PAYBACK）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'CMS_FACCOUNT_PAYBACK';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table CMS_FACCOUNT_PAYBACK  (
   ID NUMBER not null,  
   CMS_OUT_FINANC_BILL_CODE VARCHAR2(20),
   PAYBACK_MONEY        NUMBER(15,2),
   PAYBACK_DATE         DATE,
   ATTECHMENT           VARCHAR2(500),
   OPERACTIONER         VARCHAR2(20),
   OP_DATE              DATE,
   constraint PK_CMS_FACCOUNT_PAYBACK primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column CMS_FACCOUNT_PAYBACK.ID is
'编号';
comment on column CMS_FACCOUNT_PAYBACK.CMS_OUT_FINANC_BILL_CODE is
'台账code';
comment on column CMS_FACCOUNT_PAYBACK.PAYBACK_MONEY is
'还款金额';
comment on column CMS_FACCOUNT_PAYBACK.PAYBACK_DATE is
'还款日期';
comment on column CMS_FACCOUNT_PAYBACK.ATTECHMENT is
'附件';
comment on column CMS_FACCOUNT_PAYBACK.OPERACTIONER is
'操作人';
comment on column CMS_FACCOUNT_PAYBACK.OP_DATE is
'操作时间';


--添加CONVERT_MONEY_FLAG是否转换成本位币
--添加EXCHANGE_RATE是否转换成本位币

DECLARE
  V_CNT_0 INTEGER;
  V_CNT_1 INTEGER;
  
  BEGIN 
  SELECT COUNT(1) INTO V_CNT_0 FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'CMS_OUT_FINANC' AND COLUMN_NAME = 'CONVERT_MONEY_FLAG';
  SELECT COUNT(1) INTO V_CNT_1 FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'CMS_OUT_FINANC' AND COLUMN_NAME = 'EXCHANGE_RATE';
  
   IF V_CNT_0 = 0 THEN
    EXECUTE IMMEDIATE 'alter table CMS_OUT_FINANC add CONVERT_MONEY_FLAG VARCHAR2(1) default ''0''';
  END IF;
  
  IF V_CNT_1 = 0 THEN
    EXECUTE IMMEDIATE 'alter table CMS_OUT_FINANC add EXCHANGE_RATE NUMBER(12,2)';
  END IF;
  
  COMMIT;
END;
/
