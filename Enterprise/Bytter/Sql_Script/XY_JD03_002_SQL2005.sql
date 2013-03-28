--���ڣ�2012-07-17 
--�޸��ˣ�����
--�޸����ݣ�������
--��������>>֤��㻮>>֤ȯ�˻���
CREATE TABLE bt_securities
(
  securities_id           int identity(1,1) primary key not null,
  securities_name         VARCHAR(100) NOT NULL,
  securities_account      VARCHAR(40) NOT NULL,
  valid_sign              CHAR(1),
  remark                  VARCHAR(1000)
)
GO

--��������>>֤��㻮>>֤ȯ�˻���ϵά����
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


--�޸��ˣ�����
--�޸����ݣ���������>>֤��㻮>> �˵���ʼ��
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '֤ȯ�㻮', 'nis', 0, '', '0', '0', '0', '0', 14, '֤ȯ�㻮', '', '', '', '', '', null, null, null, null, null, 1, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '֤ȯ��ϵά��', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), '/netbank/securities.do?method=securitiesRelation', '0', '0', '0', '0', 1, '֤ȯ��ϵά��', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '֤��㻮¼��', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), ('/netbank/securities.do?method=securitiesSelectCorp' +char(38) +'menuParam=1'), '0', '0', '0', '0', 2, '֤��㻮¼��', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '�޸ĸ����', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), ('/netbank/securities.do?method=securitiesSelectCorp' +char(38) +'menuParam=2'), '0', '0', '0', '0', 3, '�޸ĸ����', '', '', '', '', '', null, null, null, null, null, 2, ''
GO
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��ѯ', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), ('/netbank/securities.do?method=securitiesSelectCorp' +char(38) +'menuParam=3'), '0', '0', '0', '0', 4, '��ѯ', '', '', '', '', '', null, null, null, null, null, 2, ''
GO

--���ڣ�2012-07-18 
--�޸��ˣ�����
--�޸����ݣ�֤ȯ�˻���ϵά�����ʼ��
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ('�й�֤ȯ�Ǽǽ����������ι�˾���ڷֹ�˾������',
   '337010172600002848',
   '1')
GO
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  (
   '�й�֤ȯ�Ǽǽ����������ι�˾���ڷֹ�˾���·���ר��',
   '337010100100219872',
   '1')
GO
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  (
   '�й�֤ȯ�Ǽǽ����������ι�˾�Ϻ��ֹ�˾������',
   '216200143300010514',
   '1')
GO
INSERT INTO BT_SECURITIES
  (SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  (
   '�й�֤ȯ�Ǽǽ����������ι�˾�Ϻ��ֹ�˾���·���ר��',
   '216200100100239302',
   '1')
GO

--���ڣ�2012-08-01
--�޸��ˣ�����
--�޸����ݣ����Ӹ�����ֶ�
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_CODE CHAR(40)
GO
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_ACCOUNT VARCHAR(40)
GO
ALTER TABLE NIS_BILLHEAD ADD REMARK VARCHAR(400)
GO


--�޸��ˣ�����
--�޸����ݣ�������������֤ȯ�㻮ϵͳ����
insert into BT_APPROVE_BUSINESS (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
select 'nis_sec', 'nis', '֤ȯ�㻮', 'A,B,C', 'nis_billhead', '', 'pay_money', '', 'nextchecker', 'bill_no', '../netbank/securities/securitiesPayCheck.jsp', '', '', '', '', 'com.byttersoft.netbank.form.SecuritiesForm', '', '', '', '', '', null, null, null, null, null, ''
GO

--���ڣ�2012-08-15
--�޸��ˣ�����
--�޸����ݣ�����֤ȯ�˻���ϵά�����ֶ�
ALTER TABLE bt_securities_relation ADD op_code VARCHAR(10)
GO
ALTER TABLE bt_securities_relation ADD op_name VARCHAR(40)
GO
ALTER TABLE bt_securities_relation ADD op_time DATETIME
GO
ALTER TABLE bt_securities_relation ADD valid_sign CHAR(1)
GO


--�޸��ˣ�����
--�޸����ݣ�����֤ȯ�㻮���㷽ʽ
insert into fc_voucher_type (VOUCHER_TYPE, VOUCHER_NAME, SYS_VOUCHER_CODE, CASH_TRANSFER_SIGN, RMK, VALID_SIGN, IS_ELECTRON_PAY)
select '38', '֤ȯ�㻮', '38', 'T', '', '1', '1'
GO
insert into bt_payment_param (ID, VOUCHER_TYPE, ISACCOUNT)
select (SELECT MAX(ID)+1 FROM BT_PAYMENT_PARAM), '38', '0'
GO

--���ڣ�2012-08-28
--�޸��ˣ�����
--�޸����ݣ��޸�֤ȯ�˻���֤ȯ�˻���ϵά�����������ɷ�ʽ��ԭ��SequenceΪTable
INSERT INTO TB_GENERATOR (GEN_NAME, GEN_VALUE)
SELECT 'NIS_SEC_SECURITIES_ID', 1
GO  
INSERT INTO TB_GENERATOR (GEN_NAME, GEN_VALUE)
SELECT 'NIS_SEC_RELATION_ID', 1
GO  