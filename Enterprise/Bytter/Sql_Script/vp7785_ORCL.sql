--张少举 
--新增
--付款模版匹配
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'TEMPLATE_ID_1';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add TEMPLATE_ID_1 NUMBER(10)';
     END IF;
  END;
/
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'TEMPLATE_ID_2';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add TEMPLATE_ID_2 NUMBER(10)';
     END IF;
  END;
/
DECLARE 
  column_exist NUMBER;
  BEGIN
     SELECT COUNT(*) INTO column_exist FROM USER_TAB_COLUMNS  WHERE TABLE_NAME = 'NIS_BILLHEAD' AND COLUMN_NAME = 'COST_CENTER_CODE';
     IF column_exist = 0 THEN
         EXECUTE IMMEDIATE 'alter table NIS_BILLHEAD add COST_CENTER_CODE VARCHAR2(20)';
     END IF;
  END;
/
--修改日期 20130130
--修改人 田进
--修改内容 增加银行接口设置表
DECLARE
 VC_STR VARCHAR(2000);
 VC_COUNT NUMBER;
BEGIN
 SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG';
 IF VC_COUNT < 1 THEN
  VC_STR := 'CREATE TABLE ERP_INTER_CONFIG
            (
                    INTER_CODE VARCHAR(1) PRIMARY KEY,--收付标志（0：收； 1：付；2：凭证）
                    OFFLINE_SIGN VARCHAR(1),--离线标志（0：否：1是）
                    ONLINE_SIGN VARCHAR(1),--在线标志（0：否：1是）
                    AUTOSEND_SIGN VARCHAR(1),--自动发送标志（0：否：1是）
                    SPLIT_SIGN VARCHAR(1),--拆分标志（0：否：1是）
                    MERGER_SIGN VARCHAR(1),--合并标志（0：否：1是）
                    BUDGETMATCH_SIGN VARCHAR(1),--预算匹配标志（0：否：1是）
                    MAKEUP_SIGN VARCHAR(1),--补录标志（0：否：1是）
                    NET_SIGN VARCHAR(1),--生成网点凭证（0：否：1是）
                    CORP_SIGN VARCHAR(1),--生成单位凭证（0：否：1是）
                    COMPARE_SIGN VARCHAR(1),--勾兑付款指令(0：否：1是)
                    PAY_IN_COMPARE_SIGN VARCHAR(1),--付款录入匹配模版(0：否，1是)
                    DATA_SOURCE VARCHAR(20) --发送的数据来源（bytter:B,erp:E,other:O）
            )';
  EXECUTE IMMEDIATE VC_STR;
 END IF;
END;
/
comment on column ERP_INTER_CONFIG.INTER_CODE
  is '收付标志（0：收； 1：付；2：凭证）';
comment on column ERP_INTER_CONFIG.OFFLINE_SIGN
  is '离线标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.ONLINE_SIGN
  is '在线标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.AUTOSEND_SIGN
  is '自动发送标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.SPLIT_SIGN
  is '拆分标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.MERGER_SIGN
  is '合并标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.BUDGETMATCH_SIGN
  is '预算匹配标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.MAKEUP_SIGN
  is '补录标志（0：否：1是）';
comment on column ERP_INTER_CONFIG.NET_SIGN
  is '生成网点凭证（0：否：1是）';
comment on column ERP_INTER_CONFIG.CORP_SIGN
  is '生成单位凭证（0：否：1是）';
comment on column ERP_INTER_CONFIG.COMPARE_SIGN
  is '勾兑付款指令(0：否：1是)';
comment on column ERP_INTER_CONFIG.PAY_IN_COMPARE_SIGN
  is '付款录入匹配模版(0：否，1是)';
comment on column ERP_INTER_CONFIG.DATA_SOURCE
  is '发送的数据来源（bytter:B,erp:E,other:O）';
commit;