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
);


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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');
 
 
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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');


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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');


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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');



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
values
  ((select max(res_code) + 1 from bt_sys_res),
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
   '');


--修改日期：20120807
--修改人：祁继鸿
--修改内容：新建工资单表
--参数设置：
create table NIS_WAGE
(
  wage_no        CHAR(12) not null,
  wage_title     VARCHAR2(100),
  corp_code      VARCHAR2(20),
  payer_acc      VARCHAR2(30),
  payer_bank     VARCHAR2(100),
  bank_type      CHAR(4),
  wages          NUMBER(15,2),
  wageday        DATE,
  wish_payday    DATE,
  status         INTEGER,
  voucher_stat   CHAR(1),
  billcode       VARCHAR2(16),
  op             VARCHAR2(30),
  enter_date     DATE default sysdate,
  op_name        VARCHAR2(30),
  checkers       VARCHAR2(150),
  super_checkers VARCHAR2(150),
  approves       VARCHAR2(150),
  nextchecker    VARCHAR2(150)
);
alter table NIS_WAGE
  add constraint PK_NIS_WAGE primary key (WAGE_NO);
-- Add comments to the table 
comment on table NIS_WAGE
  is '代付工资表';
-- Add comments to the columns 
comment on column NIS_WAGE.wage_no
  is '工资编号';
comment on column NIS_WAGE.wage_title
  is '工资标题';
comment on column NIS_WAGE.corp_code
  is '付款单位';
comment on column NIS_WAGE.payer_acc
  is '付款账号';
comment on column NIS_WAGE.payer_bank
  is '付款开户行';
comment on column NIS_WAGE.bank_type
  is '银行类别';
comment on column NIS_WAGE.wages
  is '工资总额';
comment on column NIS_WAGE.wageday
  is '工资发放日期';
comment on column NIS_WAGE.wish_payday
  is '期望支付日期';
comment on column NIS_WAGE.status
  is '状态 0，暂存；11，待审批；-1，打回；95，审批通过';
comment on column NIS_WAGE.voucher_stat
  is '交易状态 （bis_voucher_stat）';
comment on column NIS_WAGE.billcode
  is '付款编号';
comment on column NIS_WAGE.op
  is '操作人员code';
comment on column NIS_WAGE.enter_date
  is '录入时间';
comment on column NIS_WAGE.op_name
  is '操作人名字';
comment on column NIS_WAGE.checkers
  is '审批人员';
comment on column NIS_WAGE.super_checkers
  is '上级审批者';
comment on column NIS_WAGE.approves
  is '已经审批者';
comment on column NIS_WAGE.nextchecker
  is '下一个审批者';


--修改日期：20120807
--修改人：祁继鸿
--修改内容：新建工资单明细表
--参数设置：
create table NIS_WAGE_DETAIL
(
  wage_dtl_no  CHAR(10) not null,
  user_name    VARCHAR2(50),
  empno        VARCHAR2(50),
  bank_acc     VARCHAR2(30),
  bank_type    CHAR(4),
  wages        NUMBER(15,2),
  wage_no      CHAR(12),
  bill_no      CHAR(12),
  status       INTEGER,
  voucher_stat CHAR(1),
  purpose      VARCHAR2(10),
  rmk          VARCHAR2(100),
  verify       VARCHAR2(32),
  voucher_no   VARCHAR2(12),
  reverse1     VARCHAR2(100),
  reverse2     VARCHAR2(100),
  reverse3     VARCHAR2(100),
  reverse4     VARCHAR2(100),
  reverse5     VARCHAR2(100)
);
alter table NIS_WAGE_DETAIL
  add constraint PK_NIS_WAGE_DETAIL primary key (WAGE_DTL_NO);
-- Add comments to the table 
comment on table NIS_WAGE_DETAIL
  is '代发工资明细表';
-- Add comments to the columns 
comment on column NIS_WAGE_DETAIL.wage_dtl_no
  is '工资明细编号';
comment on column NIS_WAGE_DETAIL.user_name
  is '姓名';
comment on column NIS_WAGE_DETAIL.empno
  is '工号';
comment on column NIS_WAGE_DETAIL.bank_acc
  is '银行账号';
comment on column NIS_WAGE_DETAIL.bank_type
  is '银行类别';
comment on column NIS_WAGE_DETAIL.wages
  is '实发工资';
comment on column NIS_WAGE_DETAIL.wage_no
  is '代发工资编号（nis_wage）';
comment on column NIS_WAGE_DETAIL.bill_no
  is '付款单号（nis_billhead）';
comment on column NIS_WAGE_DETAIL.status
  is '状态 0，暂存；11，待审批；-1，打回；95，审批通过';
comment on column NIS_WAGE_DETAIL.voucher_stat
  is '交易状态 （bis_voucher_stat）';
comment on column NIS_WAGE_DETAIL.purpose
  is '用途（nis_wage_purpose）';
comment on column NIS_WAGE_DETAIL.rmk
  is '备注';
comment on column NIS_WAGE_DETAIL.verify
  is '银行账号+实发工资MD5加密';
comment on column NIS_WAGE_DETAIL.voucher_no
  is '付款指令表 (voucher_no)';
comment on column NIS_WAGE_DETAIL.reverse1
  is '备用字段';
comment on column NIS_WAGE_DETAIL.reverse2
  is '备用字段';
comment on column NIS_WAGE_DETAIL.reverse3
  is '备用字段';
comment on column NIS_WAGE_DETAIL.reverse4
  is '备用字段';
comment on column NIS_WAGE_DETAIL.reverse5
  is '备用字段';


--修改日期：20120807
--修改人：祁继鸿
--修改内容：新建工资用途表
--参数设置：
create table NIS_WAGE_PURPOSE
(
  code    VARCHAR2(10) not null,
  purpose VARCHAR2(100)
);
alter table NIS_WAGE_PURPOSE
  add constraint PK_NIS_WAGE_PURPOSE primary key (CODE);
-- Add comments to the table 
comment on table NIS_WAGE_PURPOSE
  is '工资用途表';
-- Add comments to the columns 
comment on column NIS_WAGE_PURPOSE.code
  is '用途编号';
comment on column NIS_WAGE_PURPOSE.purpose
  is '用途';
  
--修改日期：20120807
--修改人：祁继鸿
--修改内容：初始化工资用途表数据
--参数设置：
--006-工资，022-奖金，047-福利，008-水费，007-电费，813-高温费，080-报刊费，048-费用报销
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('006','工资');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('022','奖金');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('047','福利');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('008','水费');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('007','电费');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('813','高温费');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('080','报刊费');
insert into NIS_WAGE_PURPOSE (CODE,PURPOSE) values ('048','费用报销');



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
values
  ('wageIsEncryption',
   'nis',
   '代发工资是否加密显示实发工资金额',
   '0',
   null,
   null,
   '0',
   '0,否;1,是',
   '0,否;1,是',
   '',
   '',
   '',
   '',
   1.00,
   (select max(reverse7)+1 from bt_param where sys_code='nis'),
   null,
   null,
   null);
commit;









