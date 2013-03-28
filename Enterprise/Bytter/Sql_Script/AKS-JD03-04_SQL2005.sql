--修改人：陈春燕
--修改日期：2012-09-08
--修改内容: 新增菜单
--修改原因:需求-AKS-JD03-04[票据上拨下划]
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
         '票据划拨',
         'ads',
         RES_CODE,
         '',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '库存票据业务'
go
----------------- 
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
         '票据上划',
         'ads',
         RES_CODE,
         '/AB/allocation.do?method=allocationList'||'&'||'opType=0',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '票据划拨' and father_code >0
   go
-------------新增票据归集菜单
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
         '票据归集',
         'ads',
         RES_CODE,
         '/AB/allocation.do?method=allocationList'||'&'||'opType=1',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '票据划拨' and father_code >0
   go
---------------------------
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_40', 'ads', '票据上划', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '')
go
-----票据归集审批
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_41', 'ads', '票据归集', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '')
go
----------------下拨申请审批
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_42', 'ads', '下拨申请', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '')
go
--------------票据下拨审批
insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('ads_43', 'ads', '票据下拨', 'A,B,C', 'ab_operation', '', 'bill_money', '', 'next_auditor', 'id', '../AB/include/rbCheck.jsp', '', '', '', '', 'com.bettersoft.ab.bill.Operation', '', '', '', '', '', null, null, null, null, null, '')
go
--业务代码42,43审批页面SQL
UPDATE BT_APPROVE_BUSINESS T
   SET T.URL1 = '../AB/bill/billAllocatedCheck.jsp'
 WHERE T.BUSINESS_CODE IN ('ads_42', 'ads_43')
 
--新建票据归集存量表
create table AB_BILL_ALLOCATION_STOCK  (
   ID                   numeric(28)    NOT NULL,
   OPERATION_ID         numeric(28)    NOT NULL,
   CORP_ID              numeric(10),
   CORP_NAME            VARCHAR(80),
   REG_DATE             datetime,
   ALLOCATION_TYPE      VARCHAR(20), 
   CENTER_CORP_ID       numeric(10),
   CENTER_CORP_NAME     VARCHAR(80),
   BILL_CODES           VARCHAR(200),
   ALLOCATED_CODE       VARCHAR(20),
   MONEY                numeric(18,2),
   IS_TALLY             varchar(2)
)

alter table AB_BILL_ALLOCATION_STOCK
  add constraint PK_AB_BILL_ALLOCATION_STOCK primary key (ID) 
go
------------------
INSERT INTO TB_GENERATOR
  (ID, GEN_NAME, GEN_VALUE)
VALUES
  ((SELECT MAX(ID) + 1 FROM TB_GENERATOR), 'AB_BILL_ALLOCATION_STOCK_ID', 1)
  go
---------------------业务表新增申请原因，附件,申请单位
alter table ab_operation add(app_reason VARCHAR2(200))

--修改人:蒲勇军
--修改时间:2012-10-9
--修改内容:如果字段不存在则添加字段

if not exists(select * from syscolumns where id=object_id('ab_operation') and name='attachment')  
alter table ab_operation add attachment VARCHAR(200); 
go

alter table ab_operation add(operater_corp_Id  NUMBER(10))
---------------新增下拨申请菜单
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
         '下拨申请',
         'ads',
         RES_CODE,
         '/AB/allocated.do?method=allocatedAppList',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '票据划拨' and father_code >0
   go
---------------新增票据下拨菜单
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
         '票据下拨',
         'ads',
         RES_CODE,
         '/AB/allocated.do?method=billAllocated',
         '0',
         '1',
         '0',
         '0',
         3,
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
         2,
         ''
    from bt_sys_res
   where res_name = '票据划拨' and father_code >0
   go
---------------需要承兑设置记账参数的业务种类
insert into BT_ACCOUNT_BUSINESS (ID, BUSINESS_NAME, SYS_CODE)
values (40, '上划', 'ads')
insert into BT_ACCOUNT_BUSINESS (ID, BUSINESS_NAME, SYS_CODE)
values (41, '归集', 'ads')
insert into BT_ACCOUNT_BUSINESS (ID, BUSINESS_NAME, SYS_CODE)
values (43, '下拨', 'ads')
go
--票据存量查询菜单
INSERT INTO BT_SYS_RES
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
VALUES
  ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),
   '票据存量查询',
   'ads',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'ads'
       AND RES_NAME = '查询统计'),
   '/AB/billAllocationStock.do?method=billAllocationStockInit',
   '0',
   '1',
   '0',
   '0',
   (SELECT MAX(RES_ORDER) + 1
      FROM BT_SYS_RES
     WHERE FATHER_CODE = (SELECT RES_CODE
                            FROM BT_SYS_RES
                           WHERE SYS_CODE = 'ads'
                             AND RES_NAME = '查询统计')),
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   2,
   '')
   go

-- 修改日期：20120922
-- 修改人：梁铭利
--修改内容：AKS票据上划下拨归集


declare 
 @max_id_cs20120922 int, @max_id_cs20120922_id int,@max_id_cs20120922_1 int;
 begin
    select @max_id_cs20120922=count(*) from bt_function where FUNCTION_IDEN='w_chalk_trac';
    if @max_id_cs20120922=0 
      begin
        select @max_id_cs20120922_id=FUNCTION_ID from bt_function where function_name='承兑汇票';
        --划拨
        select @max_id_cs20120922_1=max(function_id)+1  from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '划拨', '', '', '', 'Mod', @max_id_cs20120922_id, 6, '', '1', 'interacc', '划拨', '1');
        --划拨记账改账复核
        select @max_id_cs20120922_id= max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_id, 'w_chalk_trac', '划拨记账', '', '', '', 'Mnu', @max_id_cs20120922_1, 1, '', '1', 'interacc', '划拨记账', '1');
        
        select @max_id_cs20120922_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_id, 'w_chalk_trac_modify', '划拨改账', '', '', '', 'Mnu', @max_id_cs20120922_1, 2, '', '1', 'interacc', '划拨改账', '1');

        select @max_id_cs20120922_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_id, 'w_chalk_trac_check', '划拨复核', '', '', '', 'Mnu', @max_id_cs20120922_1, 3, '', '1', 'interacc', '划拨复核', '1');
        --划拨记账
        select @max_id_cs20120922=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_chalk_trac';
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '记账', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120922, 1, '', '1', 'interacc', '记账', '1');
        
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120922, 2, '', '1', 'interacc', '打回', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '刷新', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120922, 3, '', '1', 'interacc', '刷新显示', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120922, 4, '', '1', 'interacc', '打印预览', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120922, 5, '', '1', 'interacc', '打印', '1');
        --划拨改账
        select @max_id_cs20120922=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_chalk_trac_modify';
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '改账', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120922, 1, '', '1', 'interacc', '保存改账', '1');
        
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120922, 2, '', '1', 'interacc', '打回', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '刷新', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120922, 3, '', '1', 'interacc', '刷新显示', '1');
        
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120922, 4, '', '1', 'interacc', '打印预览', '1');
        
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120922, 5, '', '1', 'interacc', '打印', '1');


        --划拨复核
        select @max_id_cs20120922=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_chalk_trac_check';
        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '复核', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120922, 1, '', '1', 'interacc', '复核', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120922, 2, '', '1', 'interacc', '打回', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '刷新', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120922, 3, '', '1', 'interacc', '刷新显示', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120922, 4, '', '1', 'interacc', '打印预览', '1');

        select @max_id_cs20120922_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120922_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120922, 5, '', '1', 'interacc', '打印', '1');
    
      end;
end;
go
