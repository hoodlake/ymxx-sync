--修改人：费滔
--修改日期：2012-11-23
--修改内容: 易才代发工资系统参数增加
--修改原因: 易才代发工资系统参数增加

declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '代发工资付款查询' and sys_code = 'nis'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '代发工资付款查询', 'nis', (select res_code from bt_sys_res  where res_name = '代发工资' and sys_code = 'nis' ), '/netbank/allWageQueryList.jsp', '0', '1', '0', '0', (select RES_ORDER+1 from bt_sys_res  where res_name='代发工资结果查询' and  sys_code = 'nis'), '代发工资付款查询', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
commit;



--修改日期：20121121
--修改人：费涛
--修改内容：新增代发工资历史表
--修改原因：新增代发工资历史表
create table NIS_WAGE_HIS
(
  NIS_WAGE_HIS_ID  CHAR(12) not null,
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
  optime         date,
  op_name        VARCHAR2(30),
  checkers       VARCHAR2(150),
  super_checkers VARCHAR2(150),
  approves       VARCHAR2(150),
  nextchecker    VARCHAR2(150),
  SERIAL_NO_ERP varchar2(32),
  zflag_type char(2),
  zflag_reson varchar2(240),
  ISFROMERP varchar2(1)
);
alter table NIS_WAGE_HIS
  add constraint PK_NIS_WAGE_HIS primary key (NIS_WAGE_HIS_ID); 
comment on table NIS_WAGE_HIS
  is '代付工资历史表';
comment on column NIS_WAGE_HIS.wage_no
  is '代付工资历史表主键ID';
comment on column NIS_WAGE_HIS.wage_no
  is '工资编号';
comment on column NIS_WAGE_HIS.wage_title
  is '工资标题';
comment on column NIS_WAGE_HIS.corp_code
  is '付款单位';
comment on column NIS_WAGE_HIS.payer_acc
  is '付款账号';
comment on column NIS_WAGE_HIS.payer_bank
  is '付款开户行';
comment on column NIS_WAGE_HIS.bank_type
  is '银行类别';
comment on column NIS_WAGE_HIS.wages
  is '工资总额';
comment on column NIS_WAGE_HIS.wageday
  is '工资发放日期';
comment on column NIS_WAGE_HIS.wish_payday
  is '期望支付日期';
comment on column NIS_WAGE_HIS.status
  is '状态 0，暂存；11，待审批；-1，打回；95，审批通过';
comment on column NIS_WAGE_HIS.voucher_stat
  is '交易状态 （bis_voucher_stat）';
comment on column NIS_WAGE_HIS.billcode
  is '付款编号';
comment on column NIS_WAGE_HIS.op
  is '操作人员code';
comment on column NIS_WAGE_HIS.enter_date
  is '录入时间';
comment on column NIS_WAGE_HIS.op_name
  is '操作人名字';
  comment on column NIS_WAGE_HIS.optime
  is '退回时间';
comment on column NIS_WAGE_HIS.checkers
  is '审批人员';
comment on column NIS_WAGE_HIS.super_checkers
  is '上级审批者';
comment on column NIS_WAGE_HIS.approves
  is '已经审批者';
comment on column NIS_WAGE_HIS.nextchecker
  is '下一个审批者';
comment on column NIS_WAGE_HIS.SERIAL_NO_ERP
  is 'erp的单号';
comment on column NIS_WAGE_HIS.zflag_type
  is '退单类型';
comment on column NIS_WAGE_HIS.zflag_reson
  is '退单原因';
comment on column NIS_WAGE_HIS.ISFROMERP
  is '是否来着erp:0不是，1是';


--修改日期：20121121
--修改人：费涛
--修改内容：新增代发工资历史明细表
--修改原因：新增代发工资历史明细表
create table NIS_WAGE_DETAIL_HIS
(
  wage_dtl_no_id  CHAR(10) not null,
  wage_dtl_no  CHAR(10) not null,
  NIS_WAGE_HIS_ID char(12),
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
  return_msg   varchar2(150),
  optime       date,
  reverse1     VARCHAR2(100),
  reverse2     VARCHAR2(100),
  reverse3     VARCHAR2(100),
  reverse4     VARCHAR2(100),  
  reverse5     VARCHAR2(100),
  SERIAL_NO_ERP varchar2(32),
  zflag_type char(2),
  zflag_reson varchar2(240),
  ISFROMERP varchar2(1)
);
alter table NIS_WAGE_DETAIL_HIS
  add constraint PK_NIS_WAGE_DETAIL_HIS primary key (wage_dtl_no_id);
comment on table NIS_WAGE_DETAIL_HIS
  is '代发工资历史明细表';
  comment on column NIS_WAGE_DETAIL_HIS.wage_dtl_no_id
  is '代发工资历史明细表主键ID';
comment on column NIS_WAGE_DETAIL_HIS.wage_dtl_no
  is '工资明细编号';
comment on column nis_wage_detail_his.NIS_WAGE_HIS_ID
  is '工资历史主表ID';
comment on column NIS_WAGE_DETAIL_HIS.user_name
  is '姓名';
comment on column NIS_WAGE_DETAIL_HIS.empno
  is '工号';
comment on column NIS_WAGE_DETAIL_HIS.bank_acc
  is '银行账号';
comment on column NIS_WAGE_DETAIL_HIS.bank_type
  is '银行类别';
comment on column NIS_WAGE_DETAIL_HIS.wages
  is '实发工资';
comment on column NIS_WAGE_DETAIL_HIS.wage_no
  is '代发工资编号（nis_wage）';
comment on column NIS_WAGE_DETAIL_HIS.bill_no
  is '付款单号（nis_billhead）';
comment on column NIS_WAGE_DETAIL_HIS.status
  is '状态 0，暂存；11，待审批；-1，打回；95，审批通过';
comment on column NIS_WAGE_DETAIL_HIS.voucher_stat
  is '交易状态 （bis_voucher_stat）';
comment on column NIS_WAGE_DETAIL_HIS.purpose
  is '用途（nis_wage_purpose）';
comment on column NIS_WAGE_DETAIL_HIS.rmk
  is '备注';
comment on column NIS_WAGE_DETAIL_HIS.verify
  is '银行账号+实发工资MD5加密';
comment on column NIS_WAGE_DETAIL_HIS.voucher_no
  is '付款指令表 (voucher_no)';
comment on column NIS_WAGE_DETAIL_HIS.return_msg
  is '返回信息';  
comment on column NIS_WAGE_DETAIL_HIS.optime
  is '退回时间';  
comment on column NIS_WAGE_DETAIL_HIS.reverse1
  is '备用字段';
comment on column NIS_WAGE_DETAIL_HIS.reverse2
  is '备用字段';
comment on column NIS_WAGE_DETAIL_HIS.reverse3
  is '备用字段';
comment on column NIS_WAGE_DETAIL_HIS.reverse4
  is '备用字段';
comment on column NIS_WAGE_DETAIL_HIS.reverse5
  is '备用字段';
comment on column NIS_WAGE_DETAIL_HIS.SERIAL_NO_ERP
  is 'erp的单号';
comment on column NIS_WAGE_DETAIL_HIS.zflag_type
  is '退单类型';
comment on column NIS_WAGE_DETAIL_HIS.zflag_reson
  is '退单原因';
comment on column NIS_WAGE_DETAIL_HIS.ISFROMERP
  is '是否来着erp:0不是，1是';



--修改日期：20121121
--修改人：费涛
--修改内容：修改代发工资主表
--修改原因：修改代发工资主表
ALTER TABLE nis_wage ADD(ISFROMERP varchar2(1));    
ALTER TABLE nis_wage ADD(zflag_type char(2)); 
ALTER TABLE nis_wage ADD(zflag_reson varchar2(240)); 
ALTER TABLE nis_wage ADD(SERIAL_NO_ERP varchar2(32));
ALTER TABLE nis_wage ADD allow_edit_paymoney char(1) default '0'; 
ALTER TABLE nis_wage ADD allow_edit_payeracc char(1) default '1';
ALTER TABLE nis_wage ADD allow_edit_payeeacc char(1) default '0';
ALTER TABLE nis_wage ADD isforindividual char(1) default '1'; 
comment on column nis_wage.ISFROMERP
  is '是否来着erp:0不是，1是';
comment on column nis_wage.zflag_type
  is '退单类型';
comment on column nis_wage.zflag_reson
  is '退单原因';
comment on column nis_wage.SERIAL_NO_ERP
  is 'Erp单据号';
comment on column nis_wage.allow_edit_paymoney
  is '付款金额是否可以编辑0，不可编辑；1，可编辑；';
comment on column nis_wage.allow_edit_payeeacc
  is '收款方是否可以编辑0，不可编辑；1，可编辑';
comment on column nis_wage.isforindividual
  is '0、空为对公，1对私（基于外付网银';

--修改日期：20121121
--修改人：费涛
--修改内容：修改代发工资明细表
--修改原因：修改代发工资明细表

ALTER TABLE nis_wage_detail ADD(zflag_type char(2)); 
ALTER TABLE nis_wage_detail ADD(zflag_reson varchar2(240)); 
ALTER TABLE nis_wage_detail ADD(SERIAL_NO_ERP varchar2(32)); 
comment on column nis_wage_detail.zflag_type
  is '退单类型';
comment on column nis_wage_detail.zflag_reson
  is '退单原因';
comment on column nis_wage_detail.SERIAL_NO_ERP
  is 'Erp单据号';












