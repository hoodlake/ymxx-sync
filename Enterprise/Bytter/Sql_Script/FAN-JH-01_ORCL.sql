--修改日期 20130130
--修改人 田进
--修改内容 增加二级菜单接口设置
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='接口设置' and t1.father_code=t2.sys_code and t2.res_name='基础数据';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '接口设置', 'exchange', res_code, '', '0', '1', '0', '0', 4, '接口设置', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '基础数据' and sys_code = 'exchange';
 end if;
 commit;
end;
/


--修改日期 20130130
--修改人 田进
--修改内容 增加三级菜单银行收款接口设置
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='银行收款接口设置' and t1.father_code=t2.sys_code and t2.res_name='接口设置';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '银行收款接口设置', 'exchange', res_code, '/dataExchange/btInterConfigAction.do?method=initData'||chr(38)||'interCode=0', '0', '1', '0', '0', 4, '银行收款接口设置', '', '', '', '', '', null, null, null, null, null, 3  
   from bt_sys_res  where res_name = '接口设置' and sys_code = 'exchange';
 end if;
 commit;
end;
/

--修改日期 20130130
--修改人 田进
--修改内容 增加三级菜单银行付款接口设置
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='银行付款接口设置' and t1.father_code=t2.sys_code and t2.res_name='接口设置';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '银行付款接口设置', 'exchange', res_code, '/dataExchange/btInterConfigAction.do?method=initData'||chr(38)||'interCode=1', '0', '1', '0', '0', 4, '银行付款接口设置', '', '', '', '', '', null, null, null, null, null, 3  
   from bt_sys_res  where res_name = '接口设置' and sys_code = 'exchange';
 end if;
 commit;
end;
/

--修改日期 20130130
--修改人 田进
--修改内容 增加三级菜单凭证接口设置
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='凭证接口设置' and t1.father_code=t2.sys_code and t2.res_name='接口设置';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '凭证接口设置', 'exchange', res_code, '/dataExchange/btInterConfigAction.do?method=initData'||chr(38)||'interCode=2', '0', '1', '0', '0', 4, '凭证接口设置', '', '', '', '', '', null, null, null, null, null, 3  
   from bt_sys_res  where res_name = '接口设置' and sys_code = 'exchange';
 end if;
 commit;
end;
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

--修改日期 20130131
--修改人 田进
--修改内容 初始化银行接口设置表数据
insert into ERP_INTER_CONFIG (INTER_CODE, OFFLINE_SIGN, ONLINE_SIGN, AUTOSEND_SIGN, SPLIT_SIGN, MERGER_SIGN, BUDGETMATCH_SIGN, MAKEUP_SIGN, NET_SIGN, CORP_SIGN, COMPARE_SIGN, PAY_IN_COMPARE_SIGN, DATA_SOURCE)
values ('0', '0', '1', '0', '0', '0', '0', '1', '', '', '', '','');

insert into ERP_INTER_CONFIG (INTER_CODE, OFFLINE_SIGN, ONLINE_SIGN, AUTOSEND_SIGN, SPLIT_SIGN, MERGER_SIGN, BUDGETMATCH_SIGN, MAKEUP_SIGN, NET_SIGN, CORP_SIGN, COMPARE_SIGN, PAY_IN_COMPARE_SIGN, DATA_SOURCE)
values ('1', '0', '1', '0', '0', '0', '0', '1', '', '', '0', '0','');

insert into ERP_INTER_CONFIG (INTER_CODE, OFFLINE_SIGN, ONLINE_SIGN, AUTOSEND_SIGN, SPLIT_SIGN, MERGER_SIGN, BUDGETMATCH_SIGN, MAKEUP_SIGN, NET_SIGN, CORP_SIGN, COMPARE_SIGN, PAY_IN_COMPARE_SIGN, DATA_SOURCE)
values ('2', '', '', '0', '', '', '', '1', '1', '1', '', '','');
commit;

--修改日期 20130131
--修改人 田进
--修改内容 增加银行接口详细设置表
declare
  VC_STR VARCHAR(2000);
  VC_COUNT NUMBER;
BEGIN
  SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG_SET';
  IF VC_COUNT < 1 THEN
      VC_STR := 'CREATE TABLE ERP_INTER_CONFIG_SET(
                     ID VARCHAR(32) PRIMARY KEY,--32位主键
                     OBJECT_CODE VARCHAR(10),--网点/单位 （NET/CORP）
                     RANGE_CODE VARCHAR(10),--内部/外部  (INTERNAL/EXTERNAL)
                     MATCHTEMP_TYPE VARCHAR(10),--匹配模板类型 (模板类型维护代码)1
                     MATCH_FIELD VARCHAR(30),--匹配字段1
                     MATCHTEMPTYPE_ANOTHER VARCHAR(10),--匹配模板类型 (模板类型维护代码)2
                     MATCHFIELD_ANOTHER VARCHAR(30),--匹配字段2
                     MATCH_OTHER VARCHAR(300),--其他条件
                     IS_LINE_SIGN VARCHAR(1),--在线离线标志(0:在线；1离线)
                     INTER_CODE VARCHAR(1),--收付标志（0：收； 1：付；2:凭证）
                     VOUCHER_TYPE VARCHAR(2)--结算方式
                      )';
   EXECUTE IMMEDIATE VC_STR;
   END IF;
END;
/
comment on column ERP_INTER_CONFIG_SET.ID
  is '主键';
comment on column ERP_INTER_CONFIG_SET.OBJECT_CODE
  is '网点/单位 （NET/CORP）';
comment on column ERP_INTER_CONFIG_SET.RANGE_CODE
  is '内部/外部  (INTERNAL/EXTERNAL)';
comment on column ERP_INTER_CONFIG_SET.MATCHTEMP_TYPE
  is '匹配模板类型 (模板类型维护代码)1';
comment on column ERP_INTER_CONFIG_SET.MATCH_FIELD
  is '匹配字段1';
comment on column ERP_INTER_CONFIG_SET.MATCHTEMPTYPE_ANOTHER
  is '匹配模板类型 (模板类型维护代码)2';
comment on column ERP_INTER_CONFIG_SET.MATCHFIELD_ANOTHER
  is '匹配字段2';
comment on column ERP_INTER_CONFIG_SET.MATCH_OTHER
  is '其他条件';
comment on column ERP_INTER_CONFIG_SET.IS_LINE_SIGN
  is '在线离线标志(0:在线；1离线)';
comment on column ERP_INTER_CONFIG_SET.INTER_CODE
  is '收付标志（0：收； 1：付；2:凭证）';
comment on column ERP_INTER_CONFIG_SET.VOUCHER_TYPE
  is '结算方式';
commit;


--修改日期 20130131
--修改人 田进
--修改内容 增加接口补录设置表
DECLARE
  VC_STR VARCHAR(2000);
  VC_COUNT NUMBER;
BEGIN
  SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG_FILL';
  IF VC_COUNT < 1 THEN
  VC_STR := 'CREATE TABLE ERP_INTER_CONFIG_FILL(
            INTER_CODE  VARCHAR(1),--收付标志（0：收； 1：付;2:凭证）
            FIELD_CODE VARCHAR(30),--字段代码
            FIELD_NAME VARCHAR(100),--字段名称
            IS_SHOW VARCHAR(1),--是否显示 0,否 1,是
            IS_NOT_NULL VARCHAR(1),--是否必录 0,否 1,是
            FIELD_NAME_SHOW VARCHAR(100),--显示名称
      sort_sign number not null,--排序标识
            PRIMARY KEY(INTER_CODE,FIELD_CODE)
         )';
  EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_INTER_CONFIG_FILL.INTER_CODE
  is '收付标志（0：收； 1：付;2:凭证）';
comment on column ERP_INTER_CONFIG_FILL.FIELD_CODE
  is '字段代码';
comment on column ERP_INTER_CONFIG_FILL.FIELD_NAME
  is '字段名称';
comment on column ERP_INTER_CONFIG_FILL.IS_SHOW
  is '是否显示 0,否 1,是';
comment on column ERP_INTER_CONFIG_FILL.IS_NOT_NULL
  is '是否必录 0,否 1,是';
comment on column ERP_INTER_CONFIG_FILL.FIELD_NAME_SHOW
  is '显示名称';
  comment on column ERP_INTER_CONFIG_FILL.sort_sign
  is '排序标识';


create table ERP_TEMPLATE_TYPE
(
  ID             NUMBER(10) not null primary key,
  TYPE_CODE      VARCHAR2(32),
  TYPE_NAME      VARCHAR2(4),
  GENERAL_RANGE  NUMBER(10),
  MATCHING_FIELD VARCHAR2(100),
  RMK            VARCHAR2(200),
  MODIFY_DATE    DATE default SYSDATE
)

-- Add comments to the table 
comment on table ERP_TEMPLATE_TYPE
  is '模版类型表';
-- Add comments to the columns 
comment on column ERP_TEMPLATE_TYPE.TYPE_CODE
  is '模版类型编码';
comment on column ERP_TEMPLATE_TYPE.TYPE_NAME
  is '模版类型名称';
comment on column ERP_TEMPLATE_TYPE.GENERAL_RANGE
  is '通用范围
1:所有公司通用
2:每个公司不同
3:网点与单位不同';
comment on column ERP_TEMPLATE_TYPE.MATCHING_FIELD
  is '匹配字段';
comment on column ERP_TEMPLATE_TYPE.RMK
  is '备注';
comment on column ERP_TEMPLATE_TYPE.MODIFY_DATE
  is '更新日期';




--修改日期 20130131
--修改人 田进
--修改内容 初始化接口补录设置表数据
insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'USES', '用途', '0', '0', '用途',1);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'ABS', '摘要', '0', '0', '摘要',2);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE1', '自定义一', '0', '0', '',3);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE2', '自定义二', '0', '0', '',4);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE3', '自定义三', '0', '0', '',5);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE4', '自定义四', '0', '0', '',6);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE5', '自定义五', '0', '0', '',7);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'VENDOR_NUM', '客户编码', '0', '0', '客户编码',1);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'ITEM_CODE', '预算科目', '0', '0', '预算科目',2);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'USES', '用途', '0', '0', '用途',3);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'ABS', '摘要', '0', '0', '摘要',4);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE1', '自定义一', '0', '0', '',5);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE2', '自定义二', '0', '0', '',6);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE3', '自定义三', '0', '0', '',7);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE4', '自定义四', '0', '0', '',8);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE5', '自定义五', '0', '0', '',9);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'USES', '用途', '0', '0', '用途',1);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'ABS', '摘要', '0', '0', '摘要',2);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE1', '自定义一', '0', '0', '',3);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE2', '自定义二', '0', '0', '',4);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE3', '自定义三', '0', '0', '',5);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE4', '自定义四', '0', '0', '',6);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE5', '自定义五', '0', '0', '',7);

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d15055f013d150eb1ef0005', 'NET', 'INTERNAL', '', '', '', '', '', '0', '0', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d0f4393013d0f44fb9d0000', 'NET', 'INTERNAL', '', '', '', '', '', '1', '0', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d0f4393013d0f44fb9d0002', 'NET', 'INTERNAL', '', '', '', '', '', '0', '1', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d14833e013d14929f4b002e', 'NET', 'INTERNAL', '', '', '', '', '', '1', '1', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d0f4393013d0f44fb9d0003', 'NET', '', '', '', '', '', '', '', '2', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d14833e013d14929f4b002f', 'CORP', '', '', '', '', '', '', '', '2', '');



commit;


