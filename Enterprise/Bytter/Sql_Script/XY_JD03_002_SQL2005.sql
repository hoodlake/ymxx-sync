--日期：2012-07-17 
--修改人：张培
--修改内容：创建表
--网上银行>>证卷汇划>>证券账户表
CREATE TABLE bt_securities
(
  securities_id           int identity(1,1) primary key not null,
  securities_name         VARCHAR(100) NOT NULL,
  securities_account      VARCHAR(40) NOT NULL,
  valid_sign              CHAR(1),
  remark                  VARCHAR(1000)
)
GO

--网上银行>>证卷汇划>>证券账户关系维护表
CREATE TABLE bt_securities_relation
(
  relation_id             int identity(1,1) primary key not null,
  securities_id           int NOT NULL,
  pay_account             VARCHAR(30),
  corp_id                 int,
  corp_code               VARCHAR(4),
  bank_code               VARCHAR(4),
  bank_type               VARCHAR(4),
  valid_first             CHAR(1)
)
GO


--修改人：张培
--修改内容：网上银行>>证卷汇划>> 菜单初始化
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '证券汇划', 'nis', 0, '', '0', '0', '0', '0', 14, '证券汇划', '', '', '', '', '', null, null, null, null, null, 1, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '证券关系维护', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), '/netbank/securities.do?method=securitiesRelation', '0', '0', '0', '0', 1, '证券关系维护', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '证卷汇划录入', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), ('/netbank/securities.do?method=securitiesSelectCorp' +char(38) +'menuParam=1'), '0', '0', '0', '0', 2, '证卷汇划录入', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '修改付款单据', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), ('/netbank/securities.do?method=securitiesSelectCorp' +char(38) +'menuParam=2'), '0', '0', '0', '0', 3, '修改付款单据', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '查询', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '证券汇划'), ('/netbank/securities.do?method=securitiesSelectCorp' +char(38) +'menuParam=3'), '0', '0', '0', '0', 4, '查询', '', '', '', '', '', null, null, null, null, null, 2, ''
GO

--日期：2012-07-18 
--修改人：张培
--修改内容：证券账户关系维护表初始化
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ('中国证券登记结算有限责任公司深圳分公司备付金',
   '337010172600002848',
   '1')
GO
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  (
   '中国证券登记结算有限责任公司深圳分公司网下发行专户',
   '337010100100219872',
   '1')
GO
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  (
   '中国证券登记结算有限责任公司上海分公司备付金',
   '216200143300010514',
   '1')
GO
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  (
   '中国证券登记结算有限责任公司上海分公司网下发行专户',
   '216200100100239302',
   '1')
GO

--日期：2012-08-01
--修改人：张培
--修改内容：增加付款单表字段
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_CODE CHAR(40)
GO
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_ACCOUNT VARCHAR(40)
GO
ALTER TABLE NIS_BILLHEAD ADD REMARK VARCHAR(400)
GO


--修改人：张培
--修改内容：增加网上银行证券汇划系统代码
insert into BT_APPROVE_BUSINESS (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
select 'nis_sec', 'nis', '证券汇划', 'A,B,C', 'nis_billhead', '', 'pay_money', '', 'nextchecker', 'bill_no', '../netbank/securities/securitiesPayCheck.jsp', '', '', '', '', 'com.byttersoft.netbank.form.SecuritiesForm', '', '', '', '', '', null, null, null, null, null, ''
GO

--日期：2012-08-15
--修改人：张培
--修改内容：增加证券账户关系维护表字段
ALTER TABLE bt_securities_relation ADD op_code VARCHAR(10)
GO
ALTER TABLE bt_securities_relation ADD op_name VARCHAR(40)
GO
ALTER TABLE bt_securities_relation ADD op_time DATETIME
GO
ALTER TABLE bt_securities_relation ADD valid_sign CHAR(1)
GO


--修改人：张培
--修改内容：增加证券汇划结算方式
insert into fc_voucher_type (VOUCHER_TYPE, VOUCHER_NAME, SYS_VOUCHER_CODE, CASH_TRANSFER_SIGN, RMK, VALID_SIGN, IS_ELECTRON_PAY)
select '38', '证券汇划', '38', 'T', '', '1', '1'
GO
insert into bt_payment_param (ID, VOUCHER_TYPE, ISACCOUNT)
select (SELECT MAX(ID)+1 FROM BT_PAYMENT_PARAM), '38', '0'
GO

--日期：2012-08-28
--修改人：张培
--修改内容：修改证券账户表、证券账户关系维护表主键生成方式由原来Sequence为Table
INSERT INTO TB_GENERATOR (GEN_NAME, GEN_VALUE)
SELECT 'NIS_SEC_SECURITIES_ID', 1
GO  
INSERT INTO TB_GENERATOR (GEN_NAME, GEN_VALUE)
SELECT 'NIS_SEC_RELATION_ID', 1
GO  