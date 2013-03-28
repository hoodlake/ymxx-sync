--修改人 田进
--修改时间 2012-11-27
--修改内容 增加资金矫正数据同步及查询茶单和矫正表

--修改人 田进
--修改时间 2012-11-27
--修改内容 增加资金矫正数据同步及查询茶单和矫正表

create table ERP_FUND_RECTIFY
(
  ID            int not null,
  CUSTOMER_CODE VARCHAR2(100),
  CUSTOMER_NAME VARCHAR2(100),
  CORP_CODE     VARCHAR2(100),
  AMT           NUMBER(15,2),
  COM_CODE      VARCHAR2(100),
  BANK_CODE     VARCHAR2(100),
  BANK_ACC      VARCHAR2(100),
  BUDAT         DATE,
  BYTTER_CORP_CODE VARCHAR2(100)
);

comment on column ERP_FUND_RECTIFY.CUSTOMER_CODE
  is '客户编号';
comment on column ERP_FUND_RECTIFY.CUSTOMER_NAME
  is '客户名称';
comment on column ERP_FUND_RECTIFY.CORP_CODE
  is '单位代码';
comment on column ERP_FUND_RECTIFY.AMT
  is '金额';
comment on column ERP_FUND_RECTIFY.COM_CODE
  is '公司代码';
comment on column ERP_FUND_RECTIFY.BANK_CODE
  is '银行代码';
comment on column ERP_FUND_RECTIFY.BANK_ACC
  is '银行账号';
comment on column ERP_FUND_RECTIFY.BUDAT
  is '记账日期';
  comment on column ERP_FUND_RECTIFY.BUDAT
  is '对应拜特公司代码';

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '资金矫正数据同步及查询', 'nis', RES_CODE, '/dataExchange/capitalRectifyDataSynAction.do?method=initData', '0', '0', '0', '0', 7, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '收款' and father_code=0;

commit;
