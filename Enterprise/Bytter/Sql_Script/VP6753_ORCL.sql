--修改日期：20121019
--修改人：李程
--网上银行-数据处理
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2,
   REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   values((select max(res_code) + 1 from bt_sys_res), '数据处理', 'exchange', 0, '','0', '0', '0', '0', 14, '数据处理','', '', '', '', '', null, null, null, null, null, 1, '');
  END IF;
  COMMIT; 
END;
/

--修改日期：20121019
--修改人：李程
--网上银行-数据处理-凭证模板定义
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='凭证模板定义' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'凭证模板定义','exchange',res_code,'/netbank/ErpVoucherTemplate.do?method=selectCorp'
   ,'0','1','0','0',2,'凭证模板定义','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/

--修改日期：20121019
--修改人：祁继鸿
--网上银行-数据处理-会计科目设置
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='会计科目设置' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'会计科目设置','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toAccountingItemsCorp'
   ,'0','1','0','0',3,'会计科目设置','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/
--修改日期：20121019
--修改人：冯辉
--网上银行-数据处理-收付款认领
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='收付款认领' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'收付款认领','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCorpPage'
   ,'0','1','0','0',4,'收付款认领','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/

--修改日期：20121019
--修改人：祁继鸿
--网上银行-数据处理-增加会计科目设置
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='收付款会计分录确认' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'收付款会计分录确认','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCheckCorpPage'
   ,'0','1','0','0',5,'收付款会计分录确认','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/

--2.2	凭证模版定义
--2.2.1凭证类别表（ERP_VOUCHER_TYPE）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_VOUCHER_TYPE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_VOUCHER_TYPE(ID NUMBER not null,
                                VOUCHER_TYPE_CODE VARCHAR2(2),
                                VOUCHER_TYPE_NAME CHAR(10),
                                constraint PK_ERP_VOUCHER_TYPE primary
                                key(ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column ERP_VOUCHER_TYPE.VOUCHER_TYPE_CODE is '凭证类别编码';
comment on column ERP_VOUCHER_TYPE.VOUCHER_TYPE_NAME is '凭证类别名称';

--初始化凭证类别
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(1,'01','收');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(2,'02','付');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(3,'03','转');

--2.2.2传输类别表（ERP_ TRANSFER_TYPE）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_TRANSFER_TYPE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_TRANSFER_TYPE  (
   ID  NUMBER  not null,
   TRANSFER_TYPE_CODE   VARCHAR2(2),
   TRANSFER_TYPE_NAME   VARCHAR2(100),
   constraint PK_ERP_TRANSFER_TYPE primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_TRANSFER_TYPE.TRANSFER_TYPE_CODE is
'传输类别编码';
comment on column ERP_TRANSFER_TYPE.TRANSFER_TYPE_NAME is
'传输类别名称';
--初始化传输类别
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(1,'01','传OMS');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(2,'02','传SAP');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(3,'03','不传');
--select * from bt_corp
--2.2.3凭证模板定义主表（ERP_VOUCHER_TEMPLATE）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_VOUCHER_TEMPLATE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_VOUCHER_TEMPLATE (
   ID NUMBER not null,
   BUSINESS_CODE        VARCHAR2(32),
   CORP_CODE            VARCHAR2(4),
   TRANSFER_TYPE_CODE   VARCHAR(2),
   VOUCHER_TYPE_CODE    CHAR(2),
   BUSINESS_TYPE        VARCHAR2(100),
   ITEM_CODE            VARCHAR2(40),
   MODIFY_DATE          DATE,
   RMK                  VARCHAR2(200),
   STATUS NUMBER  default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_VOUCHER_TEMPLATE.BUSINESS_CODE is
'业务编码';
comment on column ERP_VOUCHER_TEMPLATE.CORP_CODE is
'单位编码';
comment on column ERP_VOUCHER_TEMPLATE.VOUCHER_TYPE_CODE is
'凭证类别（关联ERP_VOUCHER_TYPE）';
comment on column ERP_VOUCHER_TEMPLATE.TRANSFER_TYPE_CODE is
'传输类别（关联ERP_TRANSFER_TYPE）';
comment on column ERP_VOUCHER_TEMPLATE.BUSINESS_TYPE is
'业务类型';
comment on column ERP_VOUCHER_TEMPLATE.MODIFY_DATE is
'更新日期';
comment on column ERP_VOUCHER_TEMPLATE.RMK is
'备注';
comment on column ERP_VOUCHER_TEMPLATE.STATUS is
'状态
0，默认
-2，删除';

--2.2.4凭证模板定义分录表（ERP_VOUCHER_TEMPLATE_DTL）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_VOUCHER_TEMPLATE_DTL';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_VOUCHER_TEMPLATE_DTL (
   ID  NUMBER  not null,
   ENTRY_CODE           VARCHAR2(32),
   BUSINESS_CODE        VARCHAR2(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR2(60),
   SUBJECT_NAME         VARCHAR2(100),
   SPECIAL_ACCOUNT_CODE VARCHAR2(100),
   CASH_FLOW_CODE       VARCHAR2(100),
   SUBJECT_CLASS        VARCHAR2(100),
   ACCOUNT_TYPE         VARCHAR2(100),
   DES                  VARCHAR2(200),
   STATUS NUMBER default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE_DTL primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_VOUCHER_TEMPLATE_DTL.ENTRY_CODE is
'分录编码';
comment on column ERP_VOUCHER_TEMPLATE_DTL.BUSINESS_CODE is
'业务编码（关联ERP_VOUCHER_TEMPLATE）';
comment on column ERP_VOUCHER_TEMPLATE_DTL.LOAN_DIRECTION is
'借贷方向 0,借 1,贷';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SUBJECT_CODE is
'科目编号';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SUBJECT_NAME is
'科目名称';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SPECIAL_ACCOUNT_CODE is
'特别记账码';
comment on column ERP_VOUCHER_TEMPLATE_DTL.CASH_FLOW_CODE is
'现金流量代码';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SUBJECT_CLASS is
'科目大类';
comment on column ERP_VOUCHER_TEMPLATE_DTL.ACCOUNT_TYPE is
'账户类型';
comment on column ERP_VOUCHER_TEMPLATE_DTL.DES is
'摘要';
comment on column ERP_VOUCHER_TEMPLATE_DTL.STATUS is
'状态
0，默认
-2，删除';

--2.3	预算科目与业务类型对应
--在原预算科目维护界面上增加业务类型
alter table fbs_item add BUSINESS_TYPE VARCHAR2(100);
comment on column fbs_item.BUSINESS_TYPE is
'业务类型';


--2.4	数据来源及勾兑规则定义
--数据来源及勾兑规则定义表（ERP_DATA_SOURCES）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_DATA_SOURCES';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_DATA_SOURCES  (
   ID NUMBER not null,
   DATA_SOURCES_CODE    CHAR(1),
   DATA_SOURCES_NAME    VARCHAR2(100),
   CD_SIGN              CHAR(1),
   IS_RECONCILIATION CHAR(1),
   IS_MANUAL_CONFIRMATION CHAR(1),
   MATCHING_RULE        VARCHAR2(100),
   MATCHING_TABLE_NAME  VARCHAR2(100),
   RMK                  VARCHAR2(200),
   constraint PK_ERP_DATA_SOURCES primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column ERP_DATA_SOURCES.DATA_SOURCES_CODE is
'数据来源编码';
comment on column ERP_DATA_SOURCES.DATA_SOURCES_NAME is
'数据来源名称';
comment on column ERP_DATA_SOURCES.CD_SIGN is
'类型 0,收 1,付 2,全部';
comment on column ERP_DATA_SOURCES.IS_RECONCILIATION is
'是否对账 0,否 1,是';
comment on column ERP_DATA_SOURCES.IS_MANUAL_CONFIRMATION is
'勾兑后需要手工确认 0,否 1,是';
comment on column ERP_DATA_SOURCES.MATCHING_RULE is
'勾兑规则（多个字段用逗号隔开）';
comment on column ERP_DATA_SOURCES.MATCHING_TABLE_NAME is
'勾兑表名';
comment on column ERP_DATA_SOURCES.RMK is
'备注';
--初始化数据来源以及勾兑规则数据（注：只实现付款勾兑，另外只有系统输入和ERP导入来源的才需要勾兑）
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(1,'0','其他','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','其他');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(2,'1','系统输入','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','系统输入');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(3,'2','ERP导入','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','ERP导入');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(4,'3','离线输入','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','离线输入');

--2.5	数据补录定义
--数据补录定义表（erp_additional_define）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_ADDITIONAL_DEFINE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_ADDITIONAL_DEFINE  (
   ID NUMBER not null,
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_ADDITIONAL        CHAR(1),
   IS_SHOW              CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_ADDITIONAL_DEFINE.ID is
'编号';
comment on column ERP_ADDITIONAL_DEFINE.FIELD_CODE is
'补录字段';
comment on column ERP_ADDITIONAL_DEFINE.FIELD_NAME is
'补录字段中文名';
comment on column ERP_ADDITIONAL_DEFINE.IS_ADDITIONAL is
'是否需要补录 0,否 1,是';
comment on column ERP_ADDITIONAL_DEFINE.IS_SHOW is
'是否显示 0,否 1,是';
--初始化数据补录定义数据
--对于九三项目
/*
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(1,'TRANS_TIME','交易日期','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(2,'CORP_CODE','单位名称','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(3,'BANK_ACC','收款账号','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(4,'BANK_NAME','收款开户行','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(5,'CUR','币别','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(6,'AMT','金额','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(7,'POSTSCRIPT','用途','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(8,'OPP_ACC_NO','付款账号','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(9,'OPP_ACC_NAME','付款账户名称','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(10,'OPP_ACC_BANK','付款开户行','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(11,'BUDGET_CODE','预算科目','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(12,'BUSINESS_CODE','业务类型','0','0');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(13,'DATA_SOURCES_CODE','数据来源','0','0');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(14,'COST_CENTER','成本中心','0','0');
*/
--对于奥克斯项目
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(1,'TRANS_TIME','交易日期','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(2,'CORP_CODE','单位名称','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(3,'BANK_ACC','收款账号','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(4,'BANK_NAME','收款开户行','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(5,'CUR','币别','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(6,'AMT','金额','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(7,'POSTSCRIPT','用途','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(8,'OPP_ACC_NO','付款账号','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(9,'OPP_ACC_NAME','付款账户名称','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(10,'OPP_ACC_BANK','付款开户行','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(11,'BUDGET_CODE','预算科目','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(12,'BUSINESS_CODE','业务类型','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(13,'DATA_SOURCES_CODE','数据来源','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(14,'COST_CENTER','成本中心','1','1');

--2.6	付款数据勾兑
--2.7	收付款补录认领_新增需求
--修改人：胡双
--修改日期：2012-10-29
--修改内容：在网上银行参数列表中，增加参数“是否启用一对多待确认”，缺省为不启用，选中此参数时，显示一对多标签及相应功能；
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('oneToMany','nis','是否启动一对多待确认',0,0,'0 不启用;1 启用','0,不启用;1,启用',1);

--历史明细表新增字段“唯一确认”，默认0
alter table bis_acc_his_dtl add unique_confirm CHAR(1) default '0';
--在历史明细表中新增字段
alter table bis_acc_his_dtl add data_sources_code CHAR(1) default '0';
alter table bis_acc_his_dtl add bill_status CHAR(1) default '0';
alter table bis_acc_his_dtl add mergern_id number;
alter table bis_acc_his_dtl add budget_code VARCHAR2(40);
alter table bis_acc_his_dtl add subject_code VARCHAR2(20);
alter table bis_acc_his_dtl add subject_name VARCHAR2(40);
alter table bis_acc_his_dtl add BUSINESS_TYPE VARCHAR2(100);
alter table bis_acc_his_dtl add cost_center_code VARCHAR2(20);
alter table bis_acc_his_dtl add nz_stauts CHAR(1) default '0';
alter table bis_acc_his_dtl add erp_voucher_no VARCHAR2(30);
alter table bis_acc_his_dtl add is_blend CHAR(1) default '0';
alter table bis_acc_his_dtl add SUPER_SUBJECT_CODE VARCHAR2(40);
alter table BIS_ACC_HIS_DTL add vendor_num varchar2(31);
comment on column bis_acc_his_dtl.data_sources_code is
'数据来源(0，其他  1，系统输入  2,ERP导入  3，离线)';
comment on column bis_acc_his_dtl.bill_status is
'状态（默认0，原单  1,已勾兑 2，已拆分  3，已合并 4，唯一）';
comment on column bis_acc_his_dtl.mergern_id is
'合并Id';
comment on column bis_acc_his_dtl.budget_code is
'预算科目';
comment on column bis_acc_his_dtl.subject_code is
'会计科目';
comment on column bis_acc_his_dtl.subject_name is
'会计科目名称';
comment on column bis_acc_his_dtl.BUSINESS_TYPE is
'业务类型';
comment on column bis_acc_his_dtl.cost_center_code is
'成本中心';
comment on column bis_acc_his_dtl.nz_stauts is
'扭转状态';
comment on column bis_acc_his_dtl.erp_voucher_no is
'erp凭证号';
comment on column bis_acc_his_dtl.is_blend is
'是否勾兑 默认0，未勾兑 1，已勾兑';
comment on column bis_acc_his_dtl.SUPER_SUBJECT_CODE is
'上级会计科目';
comment on column bis_acc_his_dtl.vendor_num is
'供应商编码';

--更新历史数据
UPDATE bis_acc_his_dtl SET nz_stauts='0' WHERE nz_stauts IS NULL;
UPDATE bis_acc_his_dtl SET data_sources_code='0' WHERE data_sources_code IS NULL;

--在指令表中新增字段
alter table bis_exc add data_sources_code CHAR(1);
alter table bis_exc add serial_id CHAR(32);
comment on column bis_exc.data_sources_code is
'数据来源(0，其他  1，系统输入  2,ERP导入  3，离线)';
comment on column bis_exc.serial_id is
'明细编号';

--新增拆分表（bis_acc_his_dtl_split）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BIS_ACC_HIS_DTL_SPLIT';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BIS_ACC_HIS_DTL_SPLIT  (
   ID NUMBER not null,
   SERIAL_ID CHAR(32)  not null,
   TRANS_TIME           DATE,
   CORP_ID              VARCHAR2(20),
   CORP_NAME            VARCHAR2(80),
   BANK_ACC             VARCHAR2(50),
   BANK_NAME            VARCHAR2(140),
   ACC_NAME             VARCHAR2(140),
   CUR                  VARCHAR2(10),
   AMT                  NUMBER(15,2),
   OPP_ACC_NO           VARCHAR2(50),
   OPP_ACC_NAME         VARCHAR2(140),
   OPP_ACC_BANK         VARCHAR2(140),
   ABS                  VARCHAR2(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          VARCHAR2(40),
   BUDGET_NAME          VARCHAR2(100),
   SUBJECT_CODE         VARCHAR2(30),
   SUBJECT_NAME         VARCHAR2(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     VARCHAR2(20),
   BUSINESS_TYPE        VARCHAR2(100),
   DATA_SOURCES_CODE    VARCHAR2(12),
   NZ_STATUS            CHAR(1)   DEFAULT ''0'',
   POSTSCRIPT           VARCHAR2(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       VARCHAR2(30),
   SUPER_SUBJECT_CODE   VARCHAR2(40),
   CUR_CODE		VARCHAR2(10),
   constraint PK_BIS_ACC_HIS_DTL_SPLIT primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on table BIS_ACC_HIS_DTL_SPLIT is
'历史明细拆分表';
comment on column BIS_ACC_HIS_DTL_SPLIT.SERIAL_ID is
'明细编号';
comment on column BIS_ACC_HIS_DTL_SPLIT.TRANS_TIME is
'交易时间';
comment on column BIS_ACC_HIS_DTL_SPLIT.CORP_ID is
'单位Id';
comment on column BIS_ACC_HIS_DTL_SPLIT.CORP_NAME is
'单位名称';
comment on column BIS_ACC_HIS_DTL_SPLIT.BANK_ACC is
'银行账号';
comment on column BIS_ACC_HIS_DTL_SPLIT.BANK_NAME is
'银行名称';
comment on column BIS_ACC_HIS_DTL_SPLIT.ACC_NAME is
'账户名';
comment on column BIS_ACC_HIS_DTL_SPLIT.CUR is
'币别';
comment on column BIS_ACC_HIS_DTL_SPLIT.AMT is
'金额';
comment on column BIS_ACC_HIS_DTL_SPLIT.OPP_ACC_NO is
'对付账号';
comment on column BIS_ACC_HIS_DTL_SPLIT.OPP_ACC_NAME is
'对付账号开户名';
comment on column BIS_ACC_HIS_DTL_SPLIT.OPP_ACC_BANK is
'对付账号开户行';
comment on column BIS_ACC_HIS_DTL_SPLIT.ABS is
'摘要';
comment on column BIS_ACC_HIS_DTL_SPLIT.CD_SIGN is
'收支标志 0，收 1，付';
comment on column BIS_ACC_HIS_DTL_SPLIT.BUDGET_CODE is
'预算科目';
comment on column BIS_ACC_HIS_DTL_SPLIT.BUDGET_NAME is
'预算科目名称';
comment on column BIS_ACC_HIS_DTL_SPLIT.SUBJECT_CODE is
'科目编号';
comment on column BIS_ACC_HIS_DTL_SPLIT.SUBJECT_NAME is
'科目名称';
comment on column BIS_ACC_HIS_DTL_SPLIT.IS_BL is
'是否补录 0，否  1，是';
comment on column BIS_ACC_HIS_DTL_SPLIT.COST_CENTER_CODE is
'成本中心编码';
comment on column BIS_ACC_HIS_DTL_SPLIT.BUSINESS_TYPE is
'业务类型';
comment on column BIS_ACC_HIS_DTL_SPLIT.DATA_SOURCES_CODE is
'数据来源';
comment on column BIS_ACC_HIS_DTL_SPLIT.NZ_STATUS is
'扭转状态
0，原始状态（默认）
1，已匹配
2，已确认';
comment on column BIS_ACC_HIS_DTL_SPLIT.POSTSCRIPT is
'附言';
comment on column BIS_ACC_HIS_DTL_SPLIT.HIS_STATUS is
'明细历史状态';
comment on column BIS_ACC_HIS_DTL_SPLIT.ERP_VOUCHER_NO is
'erp凭证号';
comment on column BIS_ACC_HIS_DTL_SPLIT.SUPER_SUBJECT_CODE is
'上级会计科目';

--添加供应商编码 
alter table BIS_ACC_HIS_DTL_SPLIT add vendor_num varchar2(31);

--新增合并表（bis_acc_his_dtl_mergen）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BIS_ACC_HIS_DTL_MERGEN';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BIS_ACC_HIS_DTL_MERGEN  (
   ID  NUMBER not null,
   TRANS_TIME           DATE,
   CORP_ID              VARCHAR2(20),
   CORP_NAME            VARCHAR2(80),
   BANK_ACC             VARCHAR2(50),
   BANK_NAME            VARCHAR2(140),
   ACC_NAME             VARCHAR2(140),
   CUR                  VARCHAR2(10),
   AMT                  NUMBER(15,2),
   OPP_ACC_NO           VARCHAR2(50),
   OPP_ACC_NAME         VARCHAR2(140),
   OPP_ACC_BANK         VARCHAR2(140),
   ABS                  VARCHAR2(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          VARCHAR2(40),
   BUDGET_NAME          VARCHAR2(100),
   SUBJECT_CODE         VARCHAR2(30),
   SUBJECT_NAME         VARCHAR2(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     VARCHAR2(20),
   BUSINESS_TYPE        VARCHAR2(100),
   DATA_SOURCES_CODE    VARCHAR2(12),
   NZ_STATUS            CHAR(1) DEFAULT ''0'',
   POSTSCRIPT           VARCHAR2(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       VARCHAR2(30),
   SUPER_SUBJECT_CODE   VARCHAR2(40),
   CUR_CODE		VARCHAR2(10),
   constraint PK_BIS_ACC_HIS_DTL_MERGEN primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on table BIS_ACC_HIS_DTL_MERGEN is
'历史明细合并表';
comment on column BIS_ACC_HIS_DTL_MERGEN.TRANS_TIME is
'交易时间';
comment on column BIS_ACC_HIS_DTL_MERGEN.CORP_ID is
'单位Id';
comment on column BIS_ACC_HIS_DTL_MERGEN.CORP_NAME is
'单位名称';
comment on column BIS_ACC_HIS_DTL_MERGEN.BANK_ACC is
'银行账号';
comment on column BIS_ACC_HIS_DTL_MERGEN.BANK_NAME is
'银行名称';
comment on column BIS_ACC_HIS_DTL_MERGEN.ACC_NAME is
'账户名';
comment on column BIS_ACC_HIS_DTL_MERGEN.CUR is
'币别';
comment on column BIS_ACC_HIS_DTL_MERGEN.AMT is
'金额';
comment on column BIS_ACC_HIS_DTL_MERGEN.OPP_ACC_NO is
'对方账号';
comment on column BIS_ACC_HIS_DTL_MERGEN.OPP_ACC_NAME is
'对方开户名';
comment on column BIS_ACC_HIS_DTL_MERGEN.OPP_ACC_BANK is
'对方开户行';
comment on column BIS_ACC_HIS_DTL_MERGEN.ABS is
'摘要';
comment on column BIS_ACC_HIS_DTL_MERGEN.CD_SIGN is
'收支属性';
comment on column BIS_ACC_HIS_DTL_MERGEN.BUDGET_CODE is
'预算科目';
comment on column BIS_ACC_HIS_DTL_MERGEN.BUDGET_NAME is
'预算名称';
comment on column BIS_ACC_HIS_DTL_MERGEN.SUBJECT_CODE is
'科目编码';
comment on column BIS_ACC_HIS_DTL_MERGEN.SUBJECT_NAME is
'科目名称';
comment on column BIS_ACC_HIS_DTL_MERGEN.IS_BL is
'是否补录';
comment on column BIS_ACC_HIS_DTL_MERGEN.COST_CENTER_CODE is
'成本中心';
comment on column BIS_ACC_HIS_DTL_MERGEN.BUSINESS_TYPE is
'业务编码';
comment on column BIS_ACC_HIS_DTL_MERGEN.DATA_SOURCES_CODE is
'数据来源';
comment on column BIS_ACC_HIS_DTL_MERGEN.NZ_STATUS is
'扭转状态
0，原始状态（默认）
1，已匹配
2，已确认';
comment on column BIS_ACC_HIS_DTL_MERGEN.POSTSCRIPT is
'附言';
comment on column BIS_ACC_HIS_DTL_MERGEN.HIS_STATUS is
'明细历史状态';
comment on column BIS_ACC_HIS_DTL_MERGEN.ERP_VOUCHER_NO is
'erp凭证号';
comment on column BIS_ACC_HIS_DTL_MERGEN.SUPER_SUBJECT_CODE is
'上级会计科目';

--增加供应商编码
alter table BIS_ACC_HIS_DTL_MERGEN add vendor_num varchar2(31);


--成本中心表（ERP_COST_CENTER）
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_COST_CENTER';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_COST_CENTER  (
   ID NUMBER not null,
   COST_CENTER_CODE     VARCHAR2(20),
   COST_CENTER_NAME     VARCHAR2(100),
   COST_CONTROL_RANGE   NUMERIC(15, 2),
   CORP_CODE            CHAR(4),
   COST_CONTER_TYPE     CHAR(1),
   VALID_DATE           DATE,
   END_DATE             DATE,
   constraint PK_ERP_COST_CENTER primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on table ERP_COST_CENTER is
'成本中心维护表';
comment on column ERP_COST_CENTER.ID is
'编号';
comment on column ERP_COST_CENTER.COST_CENTER_CODE is
'成本中心编码';
comment on column ERP_COST_CENTER.COST_CENTER_NAME is
'成本中心名称';
comment on column ERP_COST_CENTER.COST_CONTROL_RANGE is
'成本控制范围';
comment on column ERP_COST_CENTER.CORP_CODE is
'公司代码';
comment on column ERP_COST_CENTER.COST_CONTER_TYPE is
'成本中心类型';
comment on column ERP_COST_CENTER.VALID_DATE is
'有效起始日期';
comment on column ERP_COST_CENTER.END_DATE is
'截止日期';

 create or replace view view_bis_acc_his_dtl_buget as 
 select dtl.serial_id serial_id,
        dtl.trans_time trans_time,      --交易日期
       corp.id corp_id,                --单位Id
       corp.corp_name corp_name,       --单位名称
       dtl.acc_name acc_name,        --收款人
       dtl.bank_acc bank_acc,          --收款账号
       dtl.bank_name bank_name,        --收款开户行
       currency.cur_name cur,          --币别
       currency.cur_code cur_code,
       dtl.amt amt,                    --金额
       dtl.opp_acc_no opp_acc_no,      --付款账号
       dtl.opp_acc_name opp_acc_name,  --付款账户名称
       dtl.opp_acc_bank opp_acc_bank,  --付款开户行
       dtl.abs abs,                    --用途
       dtl.cd_sign cd_sign,            --收支属性         
        dtl.nz_stauts nz_stauts,  --流转状态       
        dtl.bill_status,                  --单据状态
        dtl.subject_code,                 --匹配企业科目
        dtl.subject_name,                 --匹配企业科目
        dtl.business_type,                 --业务类型       
        dtl.cost_center_code,                 --成本中心
        dtl.postscript,                       --用途 
        dtl.data_sources_code,                --数据来源     
        dtl.SUPER_SUBJECT_CODE,   
        fi.name budget_code_name, --匹配预算名称
        dtl.budget_code budget_code_dtl,
        fi.name budget_name, --匹配预算名称
        dtl.budget_code budget_code,
        dtl.vendor_num vendor_num,--供应商编码
        dtl.is_blend is_blend,
        dtl.unique_confirm unique_confirm       
  from  bis_acc_his_dtl dtl 
        left join fbs_item fi on fi.code =  dtl.budget_code
   left join bt_currency currency on dtl.cur = currency.cur_code,
  v_acc_list acc, bt_corp corp
  where dtl.bank_acc = acc.BANK_ACC
   and acc.CORP_CODE = corp.corp_code;
/
      
--  view_bis_acc_his_dtl_s_m_o  拆分合并原始勾兑视图
  --  view_bis_acc_his_dtl_s_m_o  拆分合并原始勾兑视图
create or replace view view_bis_acc_his_dtl_s_m_o as
select to_char(split.id) id,
       split.serial_id serial_id,
       split.nz_status nz_stauts,  --流转状态
       split.trans_time trans_time,      --交易日期
       split.corp_id  corp_id,                --单位Id
       split.corp_name corp_name,       --单位名称
       split.acc_name acc_name,          --收款人
       split.bank_acc bank_acc,          --收款账号
       split.bank_name bank_name,        --收款开户行
       split.cur_code cur_code,          --币别编码
       split.cur cur,          --币别名称
       split.amt amt,                    --金额
       split.opp_acc_no opp_acc_no,      --付款账号
       split.opp_acc_name opp_acc_name,  --付款账户名称
       split.opp_acc_bank opp_acc_bank,  --付款开户行
       split.abs abs,                    --用途
       split.cd_sign cd_sign,            --收支属性
       split.budget_code budget_code,--匹配预算科目
       split.budget_name budget_name, --匹配预算名称
       split.subject_code subject_code,--匹配企业科目
       split.subject_name subject_name, --匹配企业科目
       split.business_type,              --业务类型
       split.cost_center_code,              --成本中心
       split.postscript,              --用途
       split.data_sources_code,                       --数据来源
       split.SUPER_SUBJECT_CODE,       --上级会计科目
       split.is_bl is_bl,             --是否勾兑  0 不是   1 是
       split.vendor_num vendor_num,
       '2' as IS_SPLIT_MERGN_ONE                
  from bis_acc_his_dtl_split split
union all
select to_char(mergen.id) id,
       '' as serial_id,
       mergen.nz_status nz_stauts,  --流转状态
       mergen.trans_time trans_time,      --交易日期
       mergen.corp_id  corp_id,                --单位Id
       mergen.corp_name corp_name,       --单位名称
       mergen.acc_name acc_name,          --收款人
       mergen.bank_acc bank_acc,          --收款账号
       mergen.bank_name bank_name,        --收款开户行
       mergen.cur_code cur_code,          --币别编码
       mergen.cur cur,          --币别
       mergen.amt amt,                    --金额
       mergen.opp_acc_no opp_acc_no,      --付款账号
       mergen.opp_acc_name opp_acc_name,  --付款账户名称
       mergen.opp_acc_bank opp_acc_bank,  --付款开户行
       mergen.abs abs,                    --用途
       mergen.cd_sign cd_sign,            --收支属性
       mergen.budget_code budget_code,--匹配预算科目
       mergen.budget_name budget_name, --匹配预算名称
       mergen.subject_code subject_code,--匹配企业科目
       mergen.subject_name subject_name, --匹配企业科目
       mergen.business_type,              --业务类型
       mergen.cost_center_code,              --成本中心
       mergen.postscript,              --用途
       mergen.data_sources_code,                       --数据来源
       mergen.SUPER_SUBJECT_CODE,
       '' as is_bl,
       mergen.vendor_num vendor_num,
       '3' as IS_SPLIT_MERGN_ONE                
  from bis_acc_his_dtl_mergen mergen
  union all
select one.serial_id id,
       one.serial_id serial_id,
       one.nz_stauts nz_stauts,  --流转状态
       one.trans_time trans_time,      --交易日期
       to_char(one.corp_id)  corp_id,                --单位Id
       one.corp_name corp_name,       --单位名称
       one.acc_name acc_name,          --收款人
       one.bank_acc bank_acc,          --收款账号
       one.bank_name bank_name,        --收款开户行
       one.cur_code cur_code,          --币别编码
       one.cur cur,          --币别
       one.amt amt,                    --金额
       one.opp_acc_no opp_acc_no,      --付款账号
       one.opp_acc_name opp_acc_name,  --付款账户名称
       one.opp_acc_bank opp_acc_bank,  --付款开户行
       one.abs abs,                    --用途
       one.cd_sign cd_sign,            --收支属性
       one.budget_code budget_code,--匹配预算科目
       one.budget_name budget_name, --匹配预算名称
       one.subject_code subject_code,--匹配企业科目
       one.subject_name subject_name, --匹配企业科目
       one.business_type,              --业务类型
       one.cost_center_code,              --成本中心
       one.postscript,              --用途
       one.data_sources_code,                       --数据来源
       one.SUPER_SUBJECT_CODE,
       one.is_blend is_bl,
       one.vendor_num vendor_num,
       '4' as IS_SPLIT_MERGN_ONE              
  from view_bis_acc_his_dtl_buget one
  where one.bill_status = '0'
  and ('0' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis'))
      or ('1' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis') and unique_confirm='1');
 /

--承兑汇票
--库存票据业务表新增“视同现汇”字段
 
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
    VC_STR := ' ALTER TABLE AB_RECEIVE ADD AS_SPOT_EXCHANGE CHAR(1) DEFAULT ''0'' ';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--收付款匹配规则设定
update bt_sys_res set res_url='/admin/budgetRuleCorp.jsp' where  sys_code='adm' and RES_NAME = '收付款匹配规则设定';

insert into bt_sys_res
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
values
  ((select max(res_code) + 1 from bt_sys_res),
   'ERP基础配置',
   'exchange',
   0,
   '',
   '0',
   '0',
   '0',
   '0',
   14,
   'ERP基础配置',
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
   1,
   '');
   
   
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'ERP数据库维护', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP基础配置'), '/dataexchange/erpMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'ERP数据库维护', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'SAP数据库维护', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP基础配置'), '/dataexchange/sapMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'SAP数据库维护', '', '', '', '', '', null, null, null, null, null, 2, '');
  

-- Create table
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_MIDDLE_SYSTEM_DATABASE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_MIDDLE_SYSTEM_DATABASE(
  id             VARCHAR2(32) not null,
  ip             VARCHAR2(30),
  port           VARCHAR2(20),
  user_name      VARCHAR2(30),
  data_base_name VARCHAR2(50),
  pass_word      VARCHAR2(20),
  db_type        VARCHAR2(50),
  op_code        VARCHAR2(50),
  op_name        VARCHAR2(50),
  reverse1       VARCHAR2(200),
  reverse2       VARCHAR2(100),
  op_time        VARCHAR2(50))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

-- Add comments to the columns 
comment on column ERP_MIDDLE_SYSTEM_DATABASE.id
  is '主键';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.ip
  is 'ip地址';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.port
  is '端口号';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.user_name
  is '用户名';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.data_base_name
  is '数据库名称';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.pass_word
  is '密码';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.db_type
  is '数据类型';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.op_code
  is '操作代码';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.op_name
  is '操作人';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.reverse1
  is '备注';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.reverse2
  is '当前：公司代码使用';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.op_time
  is '操作日期';

  
-- Create table
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'SAP_MIDDLE_SYSTEM_DATABASE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table SAP_MIDDLE_SYSTEM_DATABASE(
  id        VARCHAR2(32) not null,
  corpcode  VARCHAR2(30),
  client    VARCHAR2(20),
  user_name VARCHAR2(20),
  pass_word VARCHAR2(20),
  ashost    VARCHAR2(20),
  sysnr     VARCHAR2(10),
  lang      VARCHAR2(10),
  reverse1  VARCHAR2(200),
  reverse2  VARCHAR2(200),
  reverse3  VARCHAR2(300),
  reverse4  VARCHAR2(300),
  reverse5  VARCHAR2(300),
  op_time   TIMESTAMP(6))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

-- Add comments to the columns 
comment on column SAP_MIDDLE_SYSTEM_DATABASE.id
  is '主键';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.corpcode
  is '公司代码';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.client
  is '客户端';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.user_name
  is '用户名';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.pass_word
  is '密码';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.ashost
  is '地址';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.sysnr
  is '同步00';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.lang
  is '语言ZH';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.op_time
  is '操作时间';

--start 来自核心业务组 刘根源 添加
alter table bis_exc rename column REVERSE8 to nextchecker ;
alter table bis_exc rename column REVERSE9 to approves ;
alter table bis_exc rename column REVERSE10 to status ;

alter table bis_exc modify nextchecker varchar2(20) ;
alter table bis_exc modify approves varchar2(150) ;
alter table bis_exc modify status number(4) ;

update bt_approve_business set next_checker_field='nextchecker' where business_code = 'salepayt_app';
--end

--时间：2012-11-13
--内容：增加唯一参数
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isUniqueConfirm';
  IF VN_COUNT < 1 THEN
   INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
   VALUES('isUniqueConfirm','nis','唯一的需要手工确认',0,0,'0 不需要;1 需要','0,不需要;1,需要',1);
  END IF;
  COMMIT; 
END;
/


--时间：2012-11-14
--内容：增加已勾兑的需不需要补录数据参数
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isGdBl';
  IF VN_COUNT < 1 THEN
    INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
	VALUES('isGdBl',   'nis',   '已勾兑的不需要补录数据',   0,   0,   '0 不需要;1 需要',   '0,不需要;1,需要',   1);
  END IF;
  COMMIT; 
END;
/

--修改日期：2012-11-15
--修改人：胡双
--网上银行-SAP接口-成本中心导入
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='成本中心导入' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'成本中心导入','exchange',res_code,'/netbank/costCenterImport.do?method=toSelectCorp'
   ,'0','1','0','0',3,'成本中心导入','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/
--时间：2012-11-14
--内容：认领补录时手工修改客商资料
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isBlCanModify';
  IF VN_COUNT < 1 THEN
    INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
   VALUES('isBlCanModify','nis','认领补录时手工修改客商资料',0,0,'0 不可改;1 可改','0,不可改;1,可改',1);
  END IF;
  COMMIT; 
END;
/

--修改日期：2012-11-21
--修改人：刘勇
--奥克斯承兑接口
--在bt_external_corp表中新增字段
ALTER TABLE bt_external_corp ADD (sourceSystem VARCHAR2(10));
COMMENT ON COLUMN bt_external_corp.sourceSystem IS '来源系统';

ALTER TABLE bt_external_corp ADD (customeStatus number);
COMMENT ON COLUMN bt_external_corp.customeStatus IS '客户状态';

--在ERP_MIDDLE_SYSTEM_DATABASE表中新增字段
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD (relevanceERP VARCHAR2(10));
COMMENT ON COLUMN ERP_MIDDLE_SYSTEM_DATABASE.relevanceERP IS '关联ERP系统';


commit;

