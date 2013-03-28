------------增加菜单    外部融资台账管理   ------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '外部融资台账管理'
  and sys_code='cms';  
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '外部融资台账管理',
         'cms',
         0,
         '',
         '0',
         '1',
         '0',
         '0',
         7,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         1
  from bt_sys_res
   where res_name = '贷款管理'
   and sys_code='cms' ;
  END IF;
END; 
/
-----------------融资申请  【菜单 】------------------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
   INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '融资申请'
  and sys_code='cms' and res_url='/cms/outFinApplyAction.do?method=treeView';  
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '融资申请',
         'cms',
         res_code,
         '/cms/outFinApplyAction.do?method=treeView',
         '0',
         '1',
         '0',
         '0',
         1,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '外部融资台账管理'
   and sys_code='cms' ;
  END IF;
END; 
/
-----------------领取确认函   【菜单 】------------------------------------

DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
   INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '领取确认函'
  and sys_code='cms' and res_url='/cms/outFinApplyAction.do?method=getConLetter';  
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '领取确认函',
         'cms',
         res_code,
         '/cms/outFinApplyAction.do?method=getConLetter',
         '0',
         '1',
         '0',
         '0',
         1,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '外部融资台账管理'
   and sys_code='cms'; 
  END IF;
END;
/
--修改日期：20121123
--修改人：冯辉
--信贷管理-外部融资台账管理-融资台账
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='融资台账' AND t1.father_code=t2.res_code AND t2.res_name='外部融资台账管理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'融资台账','cms',res_code,'/cms/financeAccount.do?method=tofinanceAccounPage'
   ,'0','1','0','0',3,'融资台账','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '外部融资台账管理' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/
--修改日期：20121123
--修改人：冯辉
--信贷管理-外部融资台账管理-融资台账审批

DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO VN_COUNT
  FROM BT_APPROVE_BUSINESS
  where BUSINESS_CODE = 'cms_R2'
  and sys_code='cms' and table_name='cms_out_financ' 
  and URL1='../cms/financinShowInclude.jsp'  and CLASS_PATH='com.byttersoft.cms.form.FinanceAccountForm'  ;  
  IF VN_COUNT < 1 THEN
  
  INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
  VALUES ('cms_R2', 'cms', '融资台账', 'A,B,C', 'cms_out_financ', '', 'project_Money', '', 'next_checker', 'bill_code', '../cms/financinShowInclude.jsp', 'com.byttersoft.cms.form.FinanceAccountForm');
  END IF;
END;
/
------------------------创建外部融资申请表--------------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'CMS_OUT_FINANC';
  IF VN_COUNT < 1 THEN
    VC_STR := ' 
    create table cms_out_financ(
     BILL_CODE varchar2(20),----申请编号
     enter_date date,--录入日期
     financ_Type varchar2(10),--融资类型
     legal_Person varchar2(10),--法人
     company_Name varchar2(40),--企业名称
     apply_Date date,--申请日期
     bank_Type varchar2(10),--银行类别
     deal_Bank varchar2(10),--办理银行
     cur_Code varchar2(10),--币别
     credit_Type varchar2(10),--授信品种
     project_Money number(18,2),--工程总造价
     corp_id varchar2(10),----单位
     status int,---状态
     warrant_Money number(18,2),--申请担保金额
     warrant_Type varchar2(100),--担保类别
     warrant_Category varchar2(10),--担保方式
     contract varchar2(100),--合同编号
     upload_File_Name VARCHAR2(500),--上传文件名
     warrant_year varchar2(50),--年
     warrant_Quarter varchar2(50),--季度
     capital_Fund_Money number(18,2),--资产总额
     debts_Money number(18,2),--负债总额
     ownership_Money number(18,2),--所有者权益总额
     flow_Money number(18,2),--流动资产
     flow_Debts_Money number(18,2),--流动负债
     flow_Debts_Rate number(18,2),--资产负债率
     flow_Rate number(18,2),--流动比率
     fast_Move_Rate number(18,2),--速动比率
     company_Borrow_Money number(18,2),--企业借款总额
     bank_Loan_Money number(18,2),--其中：银行贷款
     gatherBall_Borrow_Money number(18,2),--集团结算中心借款
     gatherBall_Warrant number(18,2),--集团对该企业担保
     flow_Loan_Money number(18,2),--其中：流动资金贷款
     bank_Accept_Draft number(18,2),--银行承兑汇票
     item_Indemnity number(18,2),--工程综合保函
     other_Number number(18,2),--其他（技改）
     item_Name varchar2(100),--项目名称
     build_Unit varchar2(50),--建设单位
     shi_Gong_Unit varchar2(50),--施工单位
     item_Money number(18,2),--项目总造价
     operate_Type_Ying varchar2(10),--经营性质:自营，联营
     operate_Type_Bao varchar2(10),--经营性质总包、分包
     indemnity_Money number(18,2),--保函金额
     indemnity_Limit varchar2(50),--保函起止期限
     appoint_Pattern varchar2(10),--是否甲方指定格式
     item_Begin_Date date,--工程开工日期
     item_end_Date date,--工程竣工日期
     item_Delay_Pay_Money number(18,2),--工程误期赔偿
     item_Guarantee_Time varchar2(50),--工程保修期
     item_Prior_Money number(18,2),--工程预付款
     item_Schedule_Money number(18,2),--工程进度款
     item_Deplay_Punish_Money number(18,2),--延期支付处罚
     item_Persist_Money number(18,2),--工程保留金
     arbitration_Org varchar2(100), --仲裁机构
     NEXT_CHECKER varchar2(150),
     approves varchar2(200),
     op varchar2(20),
     apply_fa_type varchar2(2),
     fa_type_code varchar2(20),
     fa_type_money number(18,2),
     fa_type_datestart date,
     fa_type_dateend date,
     fa_type_attchment VARCHAR2(500),
     rmk varchar2(200),
     project_rmk varchar2(500),
     SQ_BILL_CODE varchar2(30),
	 PAYBACK_NO varchar2(100),
     pb_hx_attechment varchar2(500),
	 book_no   varchar2(100)
  )' ;
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END; 
/



--修改日期：20121225
--修改人：zourb 
--修改内容：增加是事由字段
--参数设置：
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='CMS_OUT_FINANC' AND COLUMN_NAME='REASON';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table cms_out_financ add reason varchar2(100)';
  COMMIT;
 END IF; 
END;
/


comment on column CMS_OUT_FINANC.BILL_CODE
  is '申请编号';
comment on column CMS_OUT_FINANC.ENTER_DATE
  is '录入日期';
comment on column CMS_OUT_FINANC.FINANC_TYPE
  is '融资类型';
comment on column CMS_OUT_FINANC.LEGAL_PERSON
  is '法人';
comment on column CMS_OUT_FINANC.COMPANY_NAME
  is '企业名称';
comment on column CMS_OUT_FINANC.APPLY_DATE
  is '申请日期';
comment on column CMS_OUT_FINANC.BANK_TYPE
  is '银行类别';
comment on column CMS_OUT_FINANC.DEAL_BANK
  is '办理银行';
comment on column CMS_OUT_FINANC.CUR_CODE
  is '币别';
comment on column CMS_OUT_FINANC.CREDIT_TYPE
  is '授信品种';
comment on column CMS_OUT_FINANC.PROJECT_MONEY
  is '工程总造价';
comment on column CMS_OUT_FINANC.CORP_ID
  is '单位';
comment on column CMS_OUT_FINANC.STATUS
  is '状态';
comment on column CMS_OUT_FINANC.WARRANT_MONEY
  is '申请担保金额';
comment on column CMS_OUT_FINANC.WARRANT_TYPE
  is '担保类别';
comment on column CMS_OUT_FINANC.WARRANT_YEAR
  is '年';
comment on column CMS_OUT_FINANC.WARRANT_QUARTER
  is '季度';
comment on column CMS_OUT_FINANC.CAPITAL_FUND_MONEY
  is '资产总额';
comment on column CMS_OUT_FINANC.DEBTS_MONEY
  is '负债总额';
comment on column CMS_OUT_FINANC.OWNERSHIP_MONEY
  is '所有者权益总额';
comment on column CMS_OUT_FINANC.FLOW_MONEY
  is '流动资产';
comment on column CMS_OUT_FINANC.FLOW_DEBTS_MONEY
  is '流动负债';
comment on column CMS_OUT_FINANC.FLOW_DEBTS_RATE
  is '资产负债率';
comment on column CMS_OUT_FINANC.FLOW_RATE
  is '流动比率';
comment on column CMS_OUT_FINANC.FAST_MOVE_RATE
  is '速动比率';
comment on column CMS_OUT_FINANC.COMPANY_BORROW_MONEY
  is '企业借款总额';
comment on column CMS_OUT_FINANC.BANK_LOAN_MONEY
  is '其中：银行贷款';
comment on column CMS_OUT_FINANC.GATHERBALL_BORROW_MONEY
  is '集团结算中心借款';
comment on column CMS_OUT_FINANC.GATHERBALL_WARRANT
  is '集团对该企业担保';
comment on column CMS_OUT_FINANC.FLOW_LOAN_MONEY
  is '其中：流动资金贷款';
comment on column CMS_OUT_FINANC.BANK_ACCEPT_DRAFT
  is '银行承兑汇票';
comment on column CMS_OUT_FINANC.ITEM_INDEMNITY
  is '工程综合保函';
comment on column CMS_OUT_FINANC.OTHER_NUMBER
  is '其他（技改）';
comment on column CMS_OUT_FINANC.ITEM_NAME
  is '项目名称';
comment on column CMS_OUT_FINANC.BUILD_UNIT
  is '建设单位';
comment on column CMS_OUT_FINANC.SHI_GONG_UNIT
  is '施工单位';
comment on column CMS_OUT_FINANC.ITEM_MONEY
  is '项目总造价';
comment on column CMS_OUT_FINANC.OPERATE_TYPE_YING
  is '经营性质:自营，联营';
comment on column CMS_OUT_FINANC.OPERATE_TYPE_BAO
  is '经营性质总包、分包 ';
comment on column CMS_OUT_FINANC.INDEMNITY_MONEY
  is '保函金额';
comment on column CMS_OUT_FINANC.INDEMNITY_LIMIT
  is '保函起止期限';
comment on column CMS_OUT_FINANC.APPOINT_PATTERN
  is '是否甲方指定格式';
comment on column CMS_OUT_FINANC.ITEM_BEGIN_DATE
  is '工程开工日期';
comment on column CMS_OUT_FINANC.ITEM_END_DATE
  is '工程竣工日期';
comment on column CMS_OUT_FINANC.ITEM_DELAY_PAY_MONEY
  is '工程误期赔偿';
comment on column CMS_OUT_FINANC.ITEM_GUARANTEE_TIME
  is '工程保修期';
comment on column CMS_OUT_FINANC.ITEM_PRIOR_MONEY
  is '工程预付款';
comment on column CMS_OUT_FINANC.ITEM_SCHEDULE_MONEY
  is '工程进度款';
comment on column CMS_OUT_FINANC.ITEM_DEPLAY_PUNISH_MONEY
  is '延期支付处罚';
comment on column CMS_OUT_FINANC.ITEM_PERSIST_MONEY
  is '工程保留金';
comment on column CMS_OUT_FINANC.ARBITRATION_ORG
  is '仲裁机构';
  

 ----------------------------------增加特殊融资类型---------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO VN_COUNT
  FROM bt_param
  where  sys_code='cms' and code='special_financ_Type' and name='特殊融资类型' ;
  IF VN_COUNT < 1 THEN
    insert into bt_param (code,sys_code,name,reverse6)values('special_financ_Type','cms','特殊融资类型',0); 
  END IF;
END; 
/
 ------------------------------ 增加申请审批--------------------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO VN_COUNT
    FROM BT_APPROVE_BUSINESS
  where BUSINESS_CODE = 'cms_R1'
  and sys_code='cms' and table_name='cms_out_financ' 
  and URL1='../cms/outFinancShowInclude.jsp'  and CLASS_PATH='com.byttersoft.cms.form.OutFinancingApplyForm'  ;  
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
   VALUES ('cms_R1', 'cms', '融资申请', 'A,B,C', 'cms_out_financ', '', 'project_Money', '', 'next_checker', 'bill_code', '../cms/outFinancShowInclude.jsp', 'com.byttersoft.cms.form.OutFinancingApplyForm');
  END IF;
END;
/
 
commit ;  

  