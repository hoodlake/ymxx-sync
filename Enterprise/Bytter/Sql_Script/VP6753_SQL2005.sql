--修改日期：20121019
--修改人：李程
--网上银行-数据处理
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = '数据处理' and sys_code = 'exchange';
  IF @VN_COUNT < 1
    BEGIN
      insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2,
       REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select(select max(res_code) + 1 from bt_sys_res), '数据处理', 'exchange', 0, '','0', '0', '0', '0', 14, '数据处理','', '', '', '', '', null, null, null, null, null, 1, '';
    END;
END;
GO
--修改日期：20121019
--修改人：李程
--网上银行-数据处理-凭证模板定义
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='凭证模板定义' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
     REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
     select(select max(RES_CODE) + 1 from bt_sys_res),'凭证模板定义','exchange',res_code,'/netbank/ErpVoucherTemplate.do?method=selectCorp'
     ,'0','1','0','0',2,'凭证模板定义','','','','','',null,null,null,null,null,2  
     from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange'
    END;
END;
GO

--修改日期：20121019
--修改人：祁继鸿
--网上银行-数据处理-会计科目设置
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='会计科目设置' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF @VN_COUNT < 1
    BEGIN
    insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
    REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
    select (select max(RES_CODE) + 1 from bt_sys_res),'会计科目设置','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toAccountingItemsCorp'
    ,'0','1','0','0',3,'会计科目设置','','','','','',null,null,null,null,null,2  
    from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
    END;
END;
GO

--修改日期：20121019
--修改人：冯辉
--网上银行-数据处理-收付款认领
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='收付款认领' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
     REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
     select (select max(RES_CODE) + 1 from bt_sys_res),'收付款认领','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCorpPage'
     ,'0','1','0','0',4,'收付款认领','','','','','',null,null,null,null,null,2  
     from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
    END;
END;
GO

--修改日期：20121019
--修改人：祁继鸿
--网上银行-数据处理-增加会计科目设置
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='收付款会计分录确认' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
     REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
     select (select max(RES_CODE) + 1 from bt_sys_res),'收付款会计分录确认','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCheckCorpPage'
     ,'0','1','0','0',5,'收付款会计分录确认','','','','','',null,null,null,null,null,2  
     from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
    END;
END;
GO

--2.2	凭证模版定义
--2.2.1凭证类别表（ERP_VOUCHER_TYPE）
create table ERP_VOUCHER_TYPE  (
   ID                   NUMERIC(20)                          not null,
   VOUCHER_TYPE_CODE    varchar(2),
   VOUCHER_TYPE_NAME    CHAR(10),
   constraint PK_ERP_VOUCHER_TYPE primary key (ID)
);
GO
--初始化凭证类别
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(1,'01','收');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(2,'02','付');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(3,'03','转');
GO
--2.2.2传输类别表（ERP_ TRANSFER_TYPE）
create table ERP_TRANSFER_TYPE  (
   ID                   NUMERIC(20)                          not null,
   TRANSFER_TYPE_CODE   varchar(2),
   TRANSFER_TYPE_NAME   varchar(100),
   constraint PK_ERP_TRANSFER_TYPE primary key (ID)
);
GO
--初始化传输类别
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(1,'01','传OMS');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(2,'02','传SAP');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(3,'03','不传');
GO
--2.2.3凭证模板定义主表（ERP_VOUCHER_TEMPLATE）
create table ERP_VOUCHER_TEMPLATE  (
   ID                   NUMERIC(20)                          not null,
   BUSINESS_CODE        varchar(32),
   CORP_CODE            varchar(4),
   TRANSFER_TYPE_CODE   VARCHAR(2),
   VOUCHER_TYPE_CODE    CHAR(2),
   BUSINESS_TYPE        varchar(100),
   ITEM_CODE            VARCHAR(40),
   MODIFY_DATE          DATETIME,
   RMK                  varchar(200),
   STATUS               NUMERIC(20)                         default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE primary key (ID)
);
GO
--2.2.4凭证模板定义分录表（ERP_VOUCHER_TEMPLATE_DTL）
create table ERP_VOUCHER_TEMPLATE_DTL  (
   ID                   NUMERIC(20)                          not null,
   ENTRY_CODE           varchar(32),
   BUSINESS_CODE        varchar(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         varchar(60),
   SUBJECT_NAME         varchar(100),
   SPECIAL_ACCOUNT_CODE varchar(100),
   CASH_FLOW_CODE       varchar(100),
   SUBJECT_CLASS        varchar(100),
   ACCOUNT_TYPE         varchar(100),
   DES                  varchar(200),
   STATUS               NUMERIC(20)                         default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE_DTL primary key (ID)
);
GO
--2.3	预算科目与业务类型对应
--在原预算科目维护界面上增加业务类型
alter table fbs_item add BUSINESS_TYPE varchar(100);
GO

--2.4	数据来源及勾兑规则定义
--数据来源及勾兑规则定义表（ERP_DATA_SOURCES）
create table ERP_DATA_SOURCES  (
   ID                   NUMERIC(20)                          not null,
   DATA_SOURCES_CODE    CHAR(1),
   DATA_SOURCES_NAME    varchar(100),
   CD_SIGN              CHAR(1),
   IS_RECONCILIATION CHAR(1),
   IS_MANUAL_CONFIRMATION CHAR(1),
   MATCHING_RULE        varchar(100),
   MATCHING_TABLE_NAME  varchar(100),
   RMK                  varchar(200),
   constraint PK_ERP_DATA_SOURCES primary key (ID)
);
GO
--初始化数据来源以及勾兑规则数据（注：只实现付款勾兑，另外只有系统输入和ERP导入来源的才需要勾兑）
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(1,'0','其他','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','其他');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(2,'1','系统输入','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','系统输入');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(3,'2','ERP导入','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','ERP导入');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(4,'3','离线输入','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','离线输入');
GO
--2.5	数据补录定义
--数据补录定义表（erp_additional_define）

create table ERP_ADDITIONAL_DEFINE  (
   ID                   NUMERIC(20)                          not null,
   FIELD_CODE           varchar(60),
   FIELD_NAME           varchar(100),
   IS_ADDITIONAL        CHAR(1),
   IS_SHOW              CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID)
);
GO
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
go
--2.6	付款数据勾兑
--2.7	收付款补录认领_新增需求
--修改人：胡双
--修改日期：2012-10-29
--修改内容：在网上银行参数列表中，增加参数“是否启用一对多待确认”，缺省为不启用，选中此参数时，显示一对多标签及相应功能；
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('oneToMany','nis','是否启动一对多待确认',0,0,'0 不启用;1 启用','0,不启用;1,启用',1);
GO
--历史明细表新增字段“唯一确认”，默认0
alter table bis_acc_his_dtl add unique_confirm CHAR(1) default '0';
go
--在历史明细表中新增字段
alter table bis_acc_his_dtl add data_sources_code CHAR(1) default '0';
alter table bis_acc_his_dtl add bill_status CHAR(1) default '0';
alter table bis_acc_his_dtl add mergern_id NUMERIC(20);
alter table bis_acc_his_dtl add budget_code varchar(40);
alter table bis_acc_his_dtl add subject_code varchar(20);
alter table bis_acc_his_dtl add subject_name varchar(40);
alter table bis_acc_his_dtl add BUSINESS_TYPE varchar(100);
alter table bis_acc_his_dtl add cost_center_code varchar(20);
alter table bis_acc_his_dtl add nz_stauts CHAR(1) default '0';
alter table bis_acc_his_dtl add erp_voucher_no varchar(30);
alter table bis_acc_his_dtl add is_blend CHAR(1) default '0';
alter table bis_acc_his_dtl add SUPER_SUBJECT_CODE varchar(40);
alter table bis_acc_his_dtl add vendor_num varchar(31);
go
--更新历史数据
UPDATE bis_acc_his_dtl SET nz_stauts='0' WHERE nz_stauts IS NULL;
UPDATE bis_acc_his_dtl SET data_sources_code='0' WHERE data_sources_code IS NULL;
GO
--在指令表中新增字段
alter table bis_exc add data_sources_code CHAR(1);
alter table bis_exc add serial_id CHAR(32);
GO
--新增拆分表（bis_acc_his_dtl_split）
create table BIS_ACC_HIS_DTL_SPLIT  (
   ID                   NUMERIC(20)                          not null,
   SERIAL_ID            CHAR(32)                        not null,
   TRANS_TIME           DATETIME,
   CORP_ID              varchar(20),
   CORP_NAME            varchar(80),
   BANK_ACC             varchar(50),
   BANK_NAME            varchar(140),
   ACC_NAME             varchar(140),
   CUR                  varchar(10),
   AMT                  NUMERIC(15,2),
   OPP_ACC_NO           varchar(50),
   OPP_ACC_NAME         varchar(140),
   OPP_ACC_BANK         varchar(140),
   ABS                  varchar(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          varchar(40),
   BUDGET_NAME          varchar(100),
   SUBJECT_CODE         varchar(30),
   SUBJECT_NAME         varchar(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     varchar(20),
   BUSINESS_TYPE        varchar(100),
   DATA_SOURCES_CODE    varchar(12),
   NZ_STATUS            CHAR(1)                         DEFAULT '0',
   POSTSCRIPT           varchar(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       varchar(30),
   SUPER_SUBJECT_CODE   varchar(40),
   CUR_CODE		varchar(10),
   constraint PK_BIS_ACC_HIS_DTL_SPLIT primary key (ID)
);
GO
--添加供应商编码 
alter table BIS_ACC_HIS_DTL_SPLIT add vendor_num varchar(31);
GO
--新增合并表（bis_acc_his_dtl_mergen）
create table BIS_ACC_HIS_DTL_MERGEN  (
   ID                   NUMERIC(20)                          not null,
   TRANS_TIME           DATETIME,
   CORP_ID              varchar(20),
   CORP_NAME            varchar(80),
   BANK_ACC             varchar(50),
   BANK_NAME            varchar(140),
   ACC_NAME             varchar(140),
   CUR                  varchar(10),
   AMT                  NUMERIC(15,2),
   OPP_ACC_NO           varchar(50),
   OPP_ACC_NAME         varchar(140),
   OPP_ACC_BANK         varchar(140),
   ABS                  varchar(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          varchar(40),
   BUDGET_NAME          varchar(100),
   SUBJECT_CODE         varchar(30),
   SUBJECT_NAME         varchar(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     varchar(20),
   BUSINESS_TYPE        varchar(100),
   DATA_SOURCES_CODE    varchar(12),
   NZ_STATUS            CHAR(1)                         DEFAULT '0',
   POSTSCRIPT           varchar(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       varchar(30),
   SUPER_SUBJECT_CODE   varchar(40),
   CUR_CODE		varchar(10),
   constraint PK_BIS_ACC_HIS_DTL_MERGEN primary key (ID)
);
GO
--增加供应商编码
alter table BIS_ACC_HIS_DTL_MERGEN add vendor_num varchar(31);
GO
--成本中心表（ERP_COST_CENTER）
create table ERP_COST_CENTER  (
   ID                   NUMERIC(20)                          not null,
   COST_CENTER_CODE     varchar(20),
   COST_CENTER_NAME     varchar(100),
   COST_CONTROL_RANGE   NUMERIC(15, 2),
   CORP_CODE            CHAR(4),
   COST_CONTER_TYPE     CHAR(1),
   VALID_DATE           DATETIME,
   END_DATE             DATETIME,
   constraint PK_ERP_COST_CENTER primary key (ID)
);
GO
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME=' view_bis_acc_his_dtl_buget ')
DROP VIEW view_bis_acc_his_dtl_buget
GO
create view view_bis_acc_his_dtl_buget as 
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
        dtl.is_blend is_blend,
        dtl.vendor_num vendor_num,--供应商编码
        dtl.unique_confirm unique_confirm       
  from  bis_acc_his_dtl dtl 
        left join fbs_item fi on fi.code =  dtl.budget_code
   left join bt_currency currency on dtl.cur = currency.cur_code,
  v_acc_list acc, bt_corp corp
  where dtl.bank_acc = acc.BANK_ACC
   and acc.CORP_CODE = corp.corp_code
GO
  
--  view_bis_acc_his_dtl_s_m_o  拆分合并原始勾兑视图
  --  view_bis_acc_his_dtl_s_m_o  拆分合并原始勾兑视图
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME=' view_bis_acc_his_dtl_s_m_o ')
DROP VIEW view_bis_acc_his_dtl_s_m_o
GO 
create view view_bis_acc_his_dtl_s_m_o as
select convert(split.id,20) id,
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
select convert(mergen.id,20) id,
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
       convert(one.corp_id,20)  corp_id,                --单位Id
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
      or ('1' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis') and unique_confirm='1')
go

--承兑汇票
--库存票据业务表新增“视同现汇”字段
 
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='AS_SPOT_EXCHANGE')  
ALTER TABLE AB_RECEIVE ADD AS_SPOT_EXCHANGE CHAR(1) DEFAULT '0'
GO


--收付款匹配规则设定
update bt_sys_res set res_url='/admin/budgetRuleCorp.jsp' where  sys_code='adm' and RES_NAME = '收付款匹配规则设定';
GO
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
select (select max(res_code) + 1 from bt_sys_res),
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
   '';
GO   
   
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select(SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'ERP数据库维护', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP基础配置'), '/dataexchange/erpMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'ERP数据库维护', '', '', '', '', '', null, null, null, null, null, 2, '';

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select(SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'SAP数据库维护', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP基础配置'), '/dataexchange/sapMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'SAP数据库维护', '', '', '', '', '', null, null, null, null, null, 2, '';
  
GO
-- Create table
create table ERP_MIDDLE_SYSTEM_DATABASE
(
  id             VARCHAR(32) not null,
  ip             VARCHAR(30),
  port           VARCHAR(20),
  user_name      VARCHAR(30),
  data_base_name VARCHAR(50),
  pass_word      VARCHAR(20),
  db_type        VARCHAR(50),
  op_code        VARCHAR(50),
  op_name        VARCHAR(50),
  reverse1       VARCHAR(200),
  reverse2       VARCHAR(100),
  op_time        VARCHAR(50)
);
GO  
-- Create table
create table SAP_MIDDLE_SYSTEM_DATABASE
(
  id        VARCHAR(32) not null,
  corpcode  VARCHAR(30),
  client    VARCHAR(20),
  user_name VARCHAR(20),
  pass_word VARCHAR(20),
  ashost    VARCHAR(20),
  sysnr     VARCHAR(10),
  lang      VARCHAR(10),
  reverse1  VARCHAR(200),
  reverse2  VARCHAR(200),
  reverse3  VARCHAR(300),
  reverse4  VARCHAR(300),
  reverse5  VARCHAR(300),
  op_time   TIMESTAMP(6)
);

go

--start 来自核心业务组 刘根源 添加
Alter table bis_exc add NEXTCHECKER varchar(20);
Alter table bis_exc add APPROVES varchar(150);
Alter table bis_exc add STATUS int;

update bt_approve_business set next_checker_field='nextchecker' where business_code = 'salepayt_app';
--end
go

--时间：2012-11-13
--内容：增加唯一参数
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param WHERE code='isUniqueConfirm';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
	  VALUES('isUniqueConfirm','nis','唯一的需要手工确认',0,0,'0 不需要;1 需要','0,不需要;1,需要',1);
    END;
END;
GO

--时间：2012-11-14
--内容：增加已勾兑的需不需要补录数据参数
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param WHERE code='isGdBl';
  IF @VN_COUNT < 1
    BEGIN
        INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
		VALUES('isGdBl',   'nis',   '已勾兑的不需要补录数据',   0,   0,   '0 不需要;1 需要',   '0,不需要;1,需要',   1);
    END;
END;
GO

--时间：2012-11-14
--内容：认领补录时手工修改客商资料
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param WHERE code='isBlCanModify';
  IF @VN_COUNT < 1
    BEGIN
   INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
   VALUES('isBlCanModify','nis','认领补录时手工修改客商资料',0,0,'0 不可改;1 可改','0,不可改;1,可改',1);
    END;
END;
GO

--修改日期：2012-11-15
--修改人：胡双
--网上银行-SAP接口-成本中心导入
DECLARE
  @VN_COUNT    INT;
BEGIN
   SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='成本中心导入' AND t1.father_code=t2.res_code AND t2.res_name='数据处理';
  IF @VN_COUNT < 1
    BEGIN
       insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
	   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL)	
	   select (select max(RES_CODE) + 1 from bt_sys_res),'成本中心导入','exchange',res_code,'/netbank/costCenterImport.do?method=toSelectCorp'
	   ,'0','1','0','0',3,'成本中心导入','','','','','',null,null,null,null,null,2  
	   from bt_sys_res  where res_name = '数据处理' and sys_code = 'exchange';
    END;
END;
GO

--修改日期：2012-11-21
--修改人：刘勇
--奥克斯承兑接口
--在bt_external_corp表中新增字段
ALTER TABLE bt_external_corp ADD sourceSystem VARCHAR(10);

ALTER TABLE bt_external_corp ADD customeStatus int;

--在ERP_MIDDLE_SYSTEM_DATABASE表中新增字段
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD relevanceERP VARCHAR(10);

GO
