--日期：2012-07-17 
--修改人：张培
--修改内容：创建表
--网上银行>>证卷汇划>>证券账户表
CREATE TABLE bt_securities
(
  securities_id           NUMBER NOT NULL,
  securities_name         VARCHAR2(100) NOT NULL,
  securities_account      VARCHAR2(40) NOT NULL,
  valid_sign              CHAR(1),
  remark                  VARCHAR2(1000)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table bt_securities
  add constraint securities_pk primary key (securities_id);
  
COMMENT ON TABLE bt_securities IS '证券账户表';  
COMMENT ON COLUMN bt_securities.securities_id IS '账户ID';
COMMENT ON COLUMN bt_securities.securities_name IS '单位名称';
COMMENT ON COLUMN bt_securities.securities_account IS '账号';
COMMENT ON COLUMN bt_securities.valid_sign IS '是否启用(1启用;0停用)';
COMMENT ON COLUMN bt_securities.remark IS '备注';


--网上银行>>证卷汇划>>证券账户关系维护表
CREATE TABLE bt_securities_relation
(
  relation_id             NUMBER NOT NULL,
  securities_id           NUMBER NOT NULL,
  pay_account             VARCHAR2(30),
  corp_id                 NUMBER,
  corp_code               VARCHAR2(4),
  bank_code               VARCHAR2(4),
  bank_type               VARCHAR2(4),
  valid_first             CHAR(1)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table bt_securities_relation
  add constraint securities_relation_pk primary key (relation_id);
  
COMMENT ON TABLE bt_securities_relation IS '证券账户关系维护表';  
COMMENT ON COLUMN bt_securities_relation.relation_id IS '账户关系ID';
COMMENT ON COLUMN bt_securities_relation.securities_id IS '账户ID';
COMMENT ON COLUMN bt_securities_relation.pay_account IS '关联付款账号';
COMMENT ON COLUMN bt_securities_relation.corp_id IS '单位ID';
COMMENT ON COLUMN bt_securities_relation.corp_code IS '单位code';
COMMENT ON COLUMN bt_securities_relation.bank_code IS '银行编码';
COMMENT ON COLUMN bt_securities_relation.bank_type IS '银行类别';
COMMENT ON COLUMN bt_securities_relation.valid_first IS '是否首选账号(1是;0否)';


--修改人：张培
--修改内容：创建证券账户Sequence
CREATE SEQUENCE bt_securities_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


--修改人：张培
--修改内容：创建证券账户关系维护Sequence
CREATE SEQUENCE bt_securities_relation_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


--修改人：张培
--修改内容：网上银行>>证卷汇划>> 菜单初始化
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '证券汇划', 'nis', 0, '', '0', '0', '0', '0', 14, '证券汇划', '', '', '', '', '', null, null, null, null, null, 1, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '证券关系维护', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), '/netbank/securities.do?method=securitiesRelation', '0', '0', '0', '0', 1, '证券关系维护', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '证卷汇划录入', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), ('/netbank/securities.do?method=securitiesSelectCorp' || chr(38) || 'menuParam=1'), '0', '0', '0', '0', 2, '证卷汇划录入', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '修改付款单据', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), ('/netbank/securities.do?method=securitiesSelectCorp' || chr(38) || 'menuParam=2'), '0', '0', '0', '0', 3, '修改付款单据', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '查询', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), ('/netbank/securities.do?method=securitiesSelectCorp' || chr(38) || 'menuParam=3'), '0', '0', '0', '0', 4, '查询', '', '', '', '', '', null, null, null, null, null, 2, '');


--日期：2012-07-18 
--修改人：张培
--修改内容：证券账户关系维护表初始化
INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT NVL(MAX(SECURITIES_ID),0) + 1 FROM BT_SECURITIES),
   '中国证券登记结算有限责任公司深圳分公司备付金',
   '337010172600002848',
   '1');

INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT MAX(SECURITIES_ID) + 1 FROM BT_SECURITIES),
   '中国证券登记结算有限责任公司深圳分公司网下发行专户',
   '337010100100219872',
   '1');

INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT MAX(SECURITIES_ID) + 1 FROM BT_SECURITIES),
   '中国证券登记结算有限责任公司上海分公司备付金',
   '216200143300010514',
   '1');

INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT MAX(SECURITIES_ID) + 1 FROM BT_SECURITIES),
   '中国证券登记结算有限责任公司上海分公司网下发行专户',
   '216200100100239302',
   '1');


--日期：2012-08-01
--修改人：张培
--修改内容：增加付款单表字段
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_CODE CHAR(40);
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_ACCOUNT varchar2(40);
ALTER TABLE NIS_BILLHEAD ADD REMARK varchar2(400);

COMMENT ON COLUMN NIS_BILLHEAD.SECURITIES_CODE IS '证券代号';
COMMENT ON COLUMN NIS_BILLHEAD.SECURITIES_ACCOUNT IS '证券账号';
COMMENT ON COLUMN NIS_BILLHEAD.REMARK IS '备注';


--修改人：张培
--修改内容：增加网上银行证券汇划系统代码
insert into BT_APPROVE_BUSINESS (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('nis_sec', 'nis', '证券汇划', 'A,B,C', 'nis_billhead', '', 'pay_money', '', 'nextchecker', 'bill_no', '../netbank/securities/securitiesPayCheck.jsp', '', '', '', '', 'com.byttersoft.netbank.form.SecuritiesForm', '', '', '', '', '', null, null, null, null, null, '');


--日期：2012-08-15
--修改人：张培
--修改内容：增加证券账户关系维护表字段
ALTER TABLE bt_securities_relation ADD op_code varchar2(10);
ALTER TABLE bt_securities_relation ADD op_name varchar2(40);
ALTER TABLE bt_securities_relation ADD op_time DATE;
ALTER TABLE bt_securities_relation ADD valid_sign CHAR(1);

COMMENT ON COLUMN bt_securities_relation.op_code IS '操作员代码';
COMMENT ON COLUMN bt_securities_relation.op_name IS '操作员名称';
COMMENT ON COLUMN bt_securities_relation.op_time IS '操作时间';
COMMENT ON COLUMN bt_securities_relation.valid_sign IS '是否有效(1有效;0无效)';


--修改人：张培
--修改内容：增加证券汇划结算方式
insert into fc_voucher_type (VOUCHER_TYPE, VOUCHER_NAME, SYS_VOUCHER_CODE, CASH_TRANSFER_SIGN, RMK, VALID_SIGN, IS_ELECTRON_PAY)
values ('38', '证券汇划', '38', 'T', '', '1', '1');

insert into bt_payment_param (ID, VOUCHER_TYPE, ISACCOUNT)
values ((SELECT MAX(ID)+1 FROM BT_PAYMENT_PARAM), '38', '0');


--日期：2012-08-28
--修改人：张培
--修改内容：修改证券账户表、证券账户关系维护表主键生成方式由原来Sequence为Table
INSERT INTO TB_GENERATOR
  (ID, GEN_NAME, GEN_VALUE)
VALUES
  ((SELECT MAX(ID) + 1 FROM TB_GENERATOR), 'NIS_SEC_SECURITIES_ID', 1);
  
INSERT INTO TB_GENERATOR
  (ID, GEN_NAME, GEN_VALUE)
VALUES
  ((SELECT MAX(ID) + 1 FROM TB_GENERATOR), 'NIS_SEC_RELATION_ID', 1);


COMMIT;





