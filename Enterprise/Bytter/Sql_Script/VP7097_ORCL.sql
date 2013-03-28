--修改人：李又虎
--修改日期：2012-12-19
--修改内容: 新增经营性融资发生额统计表
--修改原因: 视图关联借款发放、银行承兑汇票、信用证进口押汇
CREATE OR REPLACE VIEW V_CMS_FINACIAL AS
SELECT ENT.EN_TYPE,
       ENT.ID,
       ENT.CORP_ID,
       ENT.MONEY,
       ENT.BANK_CODE,
       ENT.CUR_CODE,
       ENT.ENTERDATE,
       ENT.DEADLINEDATE,
       ENT.CLC_ID,
       ENT.RATE,
       ENT.PL_CLASS,
       ENT.RMK,
       BANK.BANK_NAME,
       BANK.BANK_TYPE
  FROM (SELECT 'A' AS EN_TYPE,
               'A' || SEND.BILL_CODE AS ID,
               SEND.CORP_ID,
               SEND.MONEY,
               INFO.BANK_CODE,
               SEND.CUR_CODE,
               SEND.SEND_DATE AS ENTERDATE,
               SEND.DEADLINE_DATE AS DEADLINEDATE,
               INFO.CLC_ID,
               INFO.PL_CLASS,
               SEND.PL_RATE AS RATE,
               SEND.RMK AS RMK
          FROM CMS_PROVIDE_LOAN_INFO INFO, CMS_PROVIDE_LOAN_SEND SEND
         WHERE INFO.BILL_CODE = SEND.FATHER_CODE
           AND SEND.STATUS > = 95 --借款发放审批通过
        UNION
        SELECT 'B' AS EN_TYPE,
               'B' || AB.ID AS ID,
               AB.CORP_ID,
               AB.MONEY,
               BK.BANK_CODE,
               NULL AS CUR_CODE,
               AB.ISSUE_DATE AS ENTERDATE,
               AB.MATURITY_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               AB.BAIL_PROPORTION AS RATE,
               AB.REMARK AS RMK
          FROM AB_EMIT AB,BT_BANK bk
         WHERE AB.SUBJECT <> '000' --非登记，已开户票据
           AND (AB.BAIL_PROPORTION <> 1 OR AB.BAIL_PROPORTION IS NULL) --保证金比例不为1
           AND AB.ACCEPTOR = BK.BANK_NAME
           AND AB.BILL_TYPE = '银票'
           AND AB.IS_APPEND = '1'
        UNION
        SELECT 'C' AS EN_TYPE,
               'C' || LC.CODE AS ID,
               LC.CORP_ID,
               DPS.DEPOSIT_MONEY AS MONEY,
               LC.ISSUING_BANK_CODE AS BANK_CODE,
               LC.CURRENCY AS CUR_CODE,
               LC.ISSUING_DATE AS ENTERDATE,
               ARR.PAYMENT_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               DPS.INTEREST_RATE AS RATE,
               LC.RMK AS RMK
          FROM LC_ENROL LC, LC_BILL_ARRIVAL ARR, LC_DEPOSIT DPS
         WHERE LC.CODE = ARR.LC_CODE
           AND DPS.CODE = ARR.CODE
           AND LC.STATUS >= 95
           AND LC.STATUS < 101
           AND LC.LC_TYPE = '0' --审批通过
        ) ENT
  LEFT JOIN BT_BANK BANK ON ENT.BANK_CODE = BANK.BANK_CODE;
/

--修改人：刘根源
--修改日期：2012-12-21
--修改内容: 新增银行融资明细表
--修改原因: 视图关联借款发放，还款信息表、银行承兑汇票、信用证进口押汇
CREATE OR REPLACE VIEW V_CMS_FINACIAL_DETAIL AS
SELECT ENT.EN_TYPE,
       ENT.ID,
       ENT.CORP_ID,
       ENT.MONEY,
       ENT.BANK_CODE,
       ENT.CUR_CODE,
       ENT.ENTERDATE,
       ENT.DEADLINEDATE,
       ENT.CLC_ID,
       ENT.RATE,
       ENT.PL_CLASS,
       ENT.RMK,
       ENT.CONTRACT_NO,
       ENT.SEND_CODE,
       BANK.BANK_NAME,
       BANK.BANK_TYPE
  FROM (SELECT 'A' AS EN_TYPE,
               'A' || INFO.BILL_CODE AS ID,
               INFO.CORP_ID,
               (SEND.MONEY- nvl((select SUM(REPAY.REPAY_MONEY) from CMS_PROVIDE_LOAN_REPAY REPAY where REPAY.PLI_CODE = SEND.FATHER_CODE AND SEND.BILL_CODE = REPAY.SEND_CODE AND REPAY.STATUS =102 ),0)) AS MONEY,
               INFO.BANK_CODE,
               SEND.CUR_CODE,
               SEND.SEND_DATE AS ENTERDATE,
               SEND.DEADLINE_DATE AS DEADLINEDATE,
               INFO.CLC_ID,
               INFO.PL_CLASS,
               INFO.PL_RATE AS RATE,
               INFO.RMK AS RMK,
               INFO.CONTRACT_NO AS CONTRACT_NO,
               SEND.BILL_CODE AS SEND_CODE
          FROM CMS_PROVIDE_LOAN_INFO INFO, CMS_PROVIDE_LOAN_SEND SEND
         WHERE INFO.BILL_CODE = SEND.FATHER_CODE
            AND SEND.STATUS > = 95 --借款发放审批通过
        UNION
        SELECT 'B' AS EN_TYPE,
               'B' || AB.ID AS ID,
               AB.CORP_ID,
               AB.MONEY,
               BK.BANK_CODE,
               NULL AS CUR_CODE,
               AB.ISSUE_DATE AS ENTERDATE,
               AB.MATURITY_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               (AB.BAIL_PROPORTION*100) AS RATE,
               AB.REMARK AS RMK,
               AB.PACT_NO AS CONTRACT_NO,
               NULL AS SEND_CODE
          FROM AB_EMIT AB,BT_BANK BK
         WHERE AB.SUBJECT <> '000' --非登记，已开户票据
           AND (AB.BAIL_PROPORTION <> 1 OR AB.BAIL_PROPORTION IS NULL) --保证金比例不为1
           AND AB.ACCEPTOR = BK.BANK_NAME
           AND AB.BILL_TYPE = '银票'
           AND AB.IS_APPEND = '1'
        UNION
        SELECT 'C' AS EN_TYPE,
               'C' || LC.CODE AS ID,
               LC.CORP_ID,
               DPS.DEPOSIT_MONEY AS MONEY,
               BANK.BANK_CODE AS BANK_CODE,
               LC.CURRENCY AS CUR_CODE,
               LC.ISSUING_DATE AS ENTERDATE,
               ARR.PAYMENT_DATE AS DEADLINEDATE,
               NULL AS CLC_ID,
               NULL AS PL_CLASS,
               DPS.INTEREST_RATE AS RATE,
               LC.RMK AS RMK,
               LC.CONTRACT_NO AS CONTRACT_NO,
               NULL AS SEND_CODE
          FROM LC_ENROL LC, LC_BILL_ARRIVAL ARR, LC_DEPOSIT DPS,BT_BANK BANK
         WHERE LC.CODE = ARR.LC_CODE
           AND DPS.CODE = ARR.CODE
           AND LC.STATUS >= 95
           AND LC.STATUS < 101
           AND LC.LC_TYPE = '0' --审批通过
           AND LC.ISSUING_BANK = BANK.BANK_NAME
        ) ENT
  LEFT JOIN BT_BANK BANK ON ENT.BANK_CODE = BANK.BANK_CODE;
/

-- 修改日期：2012-12-19
-- 修改人：刘根源
-- 修改内容：综合查询-信贷报表-增加银行融资明细报表；经营性融资发生额统计表；融资结构分析报表
-- 修改日期：2012-12-19
-- 修改人：刘根源
-- 修改内容：系统参数维护增加特殊银行借款类别
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'fqs' and res_name='银行融资明细报表' and res_level = '2';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
	select (select max(RES_CODE) + 1 from bt_sys_res),'银行融资明细报表','fqs',res_code,'/cms/BankFinancingDetails.jsp','0','1','0','0',10,'银行融资明细报表','','','','','',null,null,null,null,null,2  
	from bt_sys_res  where res_name = '信贷报表' and sys_code = 'fqs' and res_level = '1';  
  END IF;
  
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'fqs' and res_name='经营性融资发生额统计表' and res_level = '2';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
	select (select max(RES_CODE) + 1 from bt_sys_res),'经营性融资发生额统计表','fqs',res_code,'/cms/BusinessFinancing.jsp','0','1','0','0',11,'经营性融资发生额统计表','','','','','',null,null,null,null,null,2  
	from bt_sys_res  where res_name = '信贷报表' and sys_code = 'fqs' and res_level = '1';  
  END IF;
  
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'fqs' and res_name='融资结构分析报表' and res_level = '2';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
	select (select max(RES_CODE) + 1 from bt_sys_res),'融资结构分析报表','fqs',res_code,'/cms/FinancingStructureB.jsp','0','1','0','0',12,'融资结构分析报表','','','','','',null,null,null,null,null,2  
	from bt_sys_res  where res_name = '信贷报表' and sys_code = 'fqs' and res_level = '1';  
  END IF;
  
  SELECT COUNT(*) INTO VN_COUNT FROM bt_param WHERE SYS_CODE = 'cms' and code='special_bank_loan_type';
  IF VN_COUNT < 1 THEN
	insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
	values ('special_bank_loan_type', 'cms', '特殊银行借款类别', '', null, null, '0', '特殊银行借款类别', '说明：维护个性化借款类别，中间用分号隔开', '', '', '', '', '0.00', '', null, null, null);
  END IF;
  
  COMMIT; 
END;
/
