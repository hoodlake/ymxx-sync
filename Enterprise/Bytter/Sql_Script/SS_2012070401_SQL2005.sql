begin transaction
--修改日期：2012.7.2
--修改人：黄茜
--修改内容：天津物资授信新需求
--修改原因：天津物资授信新需求

--新增“财务费用”菜单
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '财务费用',
         'rat',
         res_code,
         '/rat/ration/occupytz_index.jsp',
         '0',
         '1',
         '0',
         '0',
         3,
         '财务费用  ',
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
         2
    from bt_sys_res
   where res_name = '银行授信额度'
     and sys_code = 'rat';
go

--新增财务费用表
create table RAT_FINANCIAL_EXPENSE  (
   ID                   int,              --编号
   ENTERDATE            datetime,             --录入时间
   MONEY                numeric(15, 2),     --占用金额
   CANTONS              VARCHAR(50),     --合同号
   CORP_CODE            VARCHAR(20),     --授信单位
   BANK_CODE            VARCHAR(20),     --授信银行
   CUR                  VARCHAR(20),     --币别
   BEGINDATE             datetime,            --发生日期
   LOAN                 numeric(15, 2),     --贷款利息
   DISCOUNT             numeric(15, 2),     --贴现息
   INLAND_CREDIT_TRADE  numeric(15, 2),      --国内信用证押汇利息
   INTERNATION_CREDIT_TRADE numeric(15, 2), --国外信用证押汇利息
   BANK_BUSINESS_EXPENSES numeric(15, 2),   --银行中间业务费用
   CHARGE               numeric(15, 2),     --手续费
   OTHER                numeric(15, 2)      --其他
);
go

--新增系统参数“是否启用敞口额度”
insert into bt_param
       (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
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
       REVERSE10) values (
       'isStartOpenRat','rat','是否启用敞口额度','0',null,null,0,'0,不启用;1,启用','0,不启用;1,启用',null,null,null,null,1,3,null,null,null);
go
       
--修改日期：2012.7.2
--修改人：祁继鸿 增加字段银行授信合同号与敞口金额
--修改内容：天津物资授信新需求
--修改原因：天津物资授信新需求    
alter table rat_bkration add contract_number varchar(100);
--银行授信合同号
alter table rat_bkration add open_money numeric(15,2) Default 0;
--敞口金额

alter table rat_bkration_detail add open_money numeric(15,2) Default 0;
--敞口金额
alter table rat_bkration_detail add super_add_open_money numeric(15,2) Default 0;
--审批通过的追加敞口金额
alter table rat_bkration_detail add super_distribute_open_money numeric(15,2) Default 0;
--审批通过的分配敞口金额

alter table rat_bkration_add add open_money numeric(15,2) Default 0;
--敞口金额
alter table rat_bkration_add_detail add open_money numeric(15,2) Default 0;
--敞口金额

alter table rat_bkration_dis add open_money numeric(15,2) Default 0;
--敞口金额
alter table rat_bkration_dis_detail add open_money numeric(15,2) Default 0;
--敞口金额
alter table rat_bkration_dis_detail add SUPER_PROCESS_Open_MONEY numeric(15,2) Default 0;
--敞口已正式占用金额
alter table rat_bkration_dis_detail add SUPER_RELIEF_Open_MONEY numeric(15,2) Default 0;
--敞口调剂金额
alter table rat_bkration_dis_detail add SUPER_BY_RELIEF_Open_MONEY numeric(15,2) Default 0;
--敞口被调剂金额
alter table rat_bkration_dis_detail add FREEZE_Open_MONEY numeric(15,2) Default 0;
--敞口冻结金额,没有被正式占用


alter table rat_bkration_relief add relief_Open_Money numeric(15,2) Default 0;
--调剂表--敞口金额

alter table rat_uration_apply add open_money numeric(15,2) Default 0;
--台账占用申请敞口金额
alter table rat_uration_apply add assurePercent numeric(15,2) Default 0;
--台账占用保证金比例
go


--修改日期：2012.7.2
--修改人：费滔
--修改内容：天津物资授信新需求
--修改原因：天津物资授信新需求

--新增“银行授信情况统计表”菜单
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '银行授信情况统计表',
         'rat',
         res_code,
         '/rat/bankRatResultAction.do?method=goForQuery',
         '0',
         '1',
         '0',
         '0',
         6,
         '银行授信情况统计表  ',
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
         2
    from bt_sys_res
   where res_name = '银行授信额度'
     and sys_code = 'rat';
go

commit;