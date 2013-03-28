--修改日期：20120807
--修改人：祁继鸿
--修改内容：增加网上银行代发工资系统代码
--参数设置：
insert into bt_approve_business
(
    BUSINESS_CODE,
    SYS_CODE,
    BUSINESS_NAME,
    BUSINESS_LEVEL,
    TABLE_NAME,
    BILL_CODE_FIELD2,
    MONEY_FIELD,
    TABLE_FIELD,
    NEXT_CHECKER_FIELD,
    BILL_CODE_FIELD,
    URL1,
    CLASS_PATH   
)
values
(
  'nis_wage',
  'nis',
  '代发工资',
  'A,B,C',
  'nis_wage',
  '',
  'money',
  '',
  'nextchecker',
  'wage_no',
  '../netbank/wageCheck.jsp',
  'com.byttersoft.netbank.form.NisWageForm'   
)
GO
--修改日期：20120723
--修改人：祁继鸿
--修改内容：增加代发工资菜单
--参数设置：
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
select
   (select max(res_code) + 1 from bt_sys_res),
   '代发工资',
   'nis',
   0,
   '',
   '0',
   '0',
   '0',
   '0',
   14,
   '代发工资',
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
   ''
GO 
 
--修改日期：20120723
--修改人：祁继鸿
--修改内容：增加代发工资制单菜单
--参数设置：
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
select 
   (select max(res_code) + 1 from bt_sys_res),
   '代发工资制单',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '代发工资'),
   '/netbank/nisWageAction.do?method=toList',
   '0',
   '0',
   '0',
   '0',
   1,
   '代发工资制单',
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
   2,
   ''
GO

--修改日期：20120723
--修改人：祁继鸿
--修改内容：增加代发工资制单修改菜单
--参数设置：
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
SELECT 
   (select max(res_code) + 1 from bt_sys_res),
   '代发工资制单修改',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '代发工资'),
   '/netbank/nisWageAction.do?method=toModifyList',
   '0',
   '0',
   '0',
   '0',
   2,
   '代发工资制单修改',
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
   2,
   ''
GO

--修改日期：20120801
--修改人：祁继鸿
--修改内容：增加代发工资结果查询
--参数设置：
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
SELECT 
   (select max(res_code) + 1 from bt_sys_res),
   '代发工资结果查询',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '代发工资'),
   '/netbank/nisWageAction.do?method=toWageResultList',
   '0',
   '0',
   '0',
   '0',
   3,
   '代发工资结果查询',
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
   2,
   ''
GO


--修改日期：20120802
--修改人：祁继鸿
--修改内容：增加代发工资结果异常处理
--参数设置：
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
SELECT
   (select max(res_code) + 1 from bt_sys_res),
   '代发工资结果异常处理',
   'nis',
   (SELECT RES_CODE
      FROM BT_SYS_RES
     WHERE SYS_CODE = 'nis'
       AND RES_NAME = '代发工资'),
   '/netbank/nisWageAction.do?method=toWageExceptionList',
   '0',
   '0',
   '0',
   '0',
   4,
   '代发工资结果异常处理',
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
   2,
   ''
GO


--修改日期：20120807
--修改人：祁继鸿
--修改内容：新建工资单表
--参数设置：
create table NIS_WAGE
(
  wage_no        CHAR(12) not null,
  wage_title     VARCHAR(100),
  corp_code      VARCHAR(20),
  payer_acc      VARCHAR(30),
  payer_bank     VARCHAR(100),
  bank_type      CHAR(4),
  wages          NUMERIC(15,2),
  wageday        DATETIME,
  wish_payday    DATETIME,
  status         INTEGER,
  voucher_stat   CHAR(1),
  billcode       VARCHAR(16),
  op             VARCHAR(30),
  enter_date     DATETIME default getdate(),
  op_name        VARCHAR(30),
  checkers       VARCHAR(150),
  super_checkers VARCHAR(150),
  approves       VARCHAR(150),
  nextchecker    VARCHAR(150)
)
GO
alter table NIS_WAGE
  add constraint PK_NIS_WAGE primary key (WAGE_NO)
GO

--修改日期：20120807
--修改人：祁继鸿
--修改内容：新建工资单明细表
--参数设置：
create table NIS_WAGE_DETAIL
(
  wage_dtl_no  CHAR(10) not null,
  user_name    VARCHAR(50),
  empno        VARCHAR(50),
  bank_acc     VARCHAR(30),
  bank_type    CHAR(4),
  wages        NUMERIC(15,2),
  wage_no      CHAR(12),
  bill_no      CHAR(12),
  status       INTEGER,
  voucher_stat CHAR(1),
  purpose      VARCHAR(10),
  rmk          VARCHAR(100),
  verify       VARCHAR(32),
  voucher_no   VARCHAR(12),
  reverse1     VARCHAR(100),
  reverse2     VARCHAR(100),
  reverse3     VARCHAR(100),
  reverse4     VARCHAR(100),
  reverse5     VARCHAR(100)
)
GO
alter table NIS_WAGE_DETAIL
  add constraint PK_NIS_WAGE_DETAIL primary key (WAGE_DTL_NO)
GO

--修改日期：20120807
--修改人：祁继鸿
--修改内容：新建工资用途表
--参数设置：
create table NIS_WAGE_PURPOSE
(
  code    VARCHAR(10) not null,
  purpose VARCHAR(100)
)
GO
alter table NIS_WAGE_PURPOSE
  add constraint PK_NIS_WAGE_PURPOSE primary key (CODE)
GO
  
--修改日期：20120807
--修改人：祁继鸿
--修改内容：初始化工资用途表数据
--参数设置：
--006-工资，022-奖金，047-福利，008-水费，007-电费，813-高温费，080-报刊费，048-费用报销
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('006','工资')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('022','奖金')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('047','福利')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('008','水费')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('007','电费')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('813','高温费')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('080','报刊费')
GO
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('048','费用报销')
GO


--修改日期：20120807
--修改人：祁继鸿
--修改内容：增加代发工资是否加密显示实发工资金额系统参数
--参数设置：
--代发工资是否加密显示实发工资金额参数录入
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
   REVERSE10)
SELECT
   'wageIsEncryption',
   'nis',
   '代发工资是否加密显示实发工资金额',
   '0',
   null,
   null,
   '0',
   '0,否1,是',
   '0,否1,是',
   '',
   '',
   '',
   '',
   1.00,
   (select max(reverse7)+1 from bt_param where sys_code='nis'),
   null,
   null,
   null
GO








