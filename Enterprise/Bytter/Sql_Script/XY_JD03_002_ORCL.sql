--���ڣ�2012-07-17 
--�޸��ˣ�����
--�޸����ݣ�������
--��������>>֤��㻮>>֤ȯ�˻���
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
  
COMMENT ON TABLE bt_securities IS '֤ȯ�˻���';  
COMMENT ON COLUMN bt_securities.securities_id IS '�˻�ID';
COMMENT ON COLUMN bt_securities.securities_name IS '��λ����';
COMMENT ON COLUMN bt_securities.securities_account IS '�˺�';
COMMENT ON COLUMN bt_securities.valid_sign IS '�Ƿ�����(1����;0ͣ��)';
COMMENT ON COLUMN bt_securities.remark IS '��ע';


--��������>>֤��㻮>>֤ȯ�˻���ϵά����
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
  
COMMENT ON TABLE bt_securities_relation IS '֤ȯ�˻���ϵά����';  
COMMENT ON COLUMN bt_securities_relation.relation_id IS '�˻���ϵID';
COMMENT ON COLUMN bt_securities_relation.securities_id IS '�˻�ID';
COMMENT ON COLUMN bt_securities_relation.pay_account IS '���������˺�';
COMMENT ON COLUMN bt_securities_relation.corp_id IS '��λID';
COMMENT ON COLUMN bt_securities_relation.corp_code IS '��λcode';
COMMENT ON COLUMN bt_securities_relation.bank_code IS '���б���';
COMMENT ON COLUMN bt_securities_relation.bank_type IS '�������';
COMMENT ON COLUMN bt_securities_relation.valid_first IS '�Ƿ���ѡ�˺�(1��;0��)';


--�޸��ˣ�����
--�޸����ݣ�����֤ȯ�˻�Sequence
CREATE SEQUENCE bt_securities_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


--�޸��ˣ�����
--�޸����ݣ�����֤ȯ�˻���ϵά��Sequence
CREATE SEQUENCE bt_securities_relation_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
nocache;


--�޸��ˣ�����
--�޸����ݣ���������>>֤��㻮>> �˵���ʼ��
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '֤ȯ�㻮', 'nis', 0, '', '0', '0', '0', '0', 14, '֤ȯ�㻮', '', '', '', '', '', null, null, null, null, null, 1, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '֤ȯ��ϵά��', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), '/netbank/securities.do?method=securitiesRelation', '0', '0', '0', '0', 1, '֤ȯ��ϵά��', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '֤��㻮¼��', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), ('/netbank/securities.do?method=securitiesSelectCorp' || chr(38) || 'menuParam=1'), '0', '0', '0', '0', 2, '֤��㻮¼��', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '�޸ĸ����', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), ('/netbank/securities.do?method=securitiesSelectCorp' || chr(38) || 'menuParam=2'), '0', '0', '0', '0', 3, '�޸ĸ����', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), '��ѯ', 'nis', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'nis' AND RES_NAME = '֤ȯ�㻮'), ('/netbank/securities.do?method=securitiesSelectCorp' || chr(38) || 'menuParam=3'), '0', '0', '0', '0', 4, '��ѯ', '', '', '', '', '', null, null, null, null, null, 2, '');


--���ڣ�2012-07-18 
--�޸��ˣ�����
--�޸����ݣ�֤ȯ�˻���ϵά�����ʼ��
INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT NVL(MAX(SECURITIES_ID),0) + 1 FROM BT_SECURITIES),
   '�й�֤ȯ�Ǽǽ����������ι�˾���ڷֹ�˾������',
   '337010172600002848',
   '1');

INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT MAX(SECURITIES_ID) + 1 FROM BT_SECURITIES),
   '�й�֤ȯ�Ǽǽ����������ι�˾���ڷֹ�˾���·���ר��',
   '337010100100219872',
   '1');

INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT MAX(SECURITIES_ID) + 1 FROM BT_SECURITIES),
   '�й�֤ȯ�Ǽǽ����������ι�˾�Ϻ��ֹ�˾������',
   '216200143300010514',
   '1');

INSERT INTO BT_SECURITIES
  (SECURITIES_ID, SECURITIES_NAME, SECURITIES_ACCOUNT, VALID_SIGN)
VALUES
  ((SELECT MAX(SECURITIES_ID) + 1 FROM BT_SECURITIES),
   '�й�֤ȯ�Ǽǽ����������ι�˾�Ϻ��ֹ�˾���·���ר��',
   '216200100100239302',
   '1');


--���ڣ�2012-08-01
--�޸��ˣ�����
--�޸����ݣ����Ӹ�����ֶ�
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_CODE CHAR(40);
ALTER TABLE NIS_BILLHEAD ADD SECURITIES_ACCOUNT varchar2(40);
ALTER TABLE NIS_BILLHEAD ADD REMARK varchar2(400);

COMMENT ON COLUMN NIS_BILLHEAD.SECURITIES_CODE IS '֤ȯ����';
COMMENT ON COLUMN NIS_BILLHEAD.SECURITIES_ACCOUNT IS '֤ȯ�˺�';
COMMENT ON COLUMN NIS_BILLHEAD.REMARK IS '��ע';


--�޸��ˣ�����
--�޸����ݣ�������������֤ȯ�㻮ϵͳ����
insert into BT_APPROVE_BUSINESS (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('nis_sec', 'nis', '֤ȯ�㻮', 'A,B,C', 'nis_billhead', '', 'pay_money', '', 'nextchecker', 'bill_no', '../netbank/securities/securitiesPayCheck.jsp', '', '', '', '', 'com.byttersoft.netbank.form.SecuritiesForm', '', '', '', '', '', null, null, null, null, null, '');


--���ڣ�2012-08-15
--�޸��ˣ�����
--�޸����ݣ�����֤ȯ�˻���ϵά�����ֶ�
ALTER TABLE bt_securities_relation ADD op_code varchar2(10);
ALTER TABLE bt_securities_relation ADD op_name varchar2(40);
ALTER TABLE bt_securities_relation ADD op_time DATE;
ALTER TABLE bt_securities_relation ADD valid_sign CHAR(1);

COMMENT ON COLUMN bt_securities_relation.op_code IS '����Ա����';
COMMENT ON COLUMN bt_securities_relation.op_name IS '����Ա����';
COMMENT ON COLUMN bt_securities_relation.op_time IS '����ʱ��';
COMMENT ON COLUMN bt_securities_relation.valid_sign IS '�Ƿ���Ч(1��Ч;0��Ч)';


--�޸��ˣ�����
--�޸����ݣ�����֤ȯ�㻮���㷽ʽ
insert into fc_voucher_type (VOUCHER_TYPE, VOUCHER_NAME, SYS_VOUCHER_CODE, CASH_TRANSFER_SIGN, RMK, VALID_SIGN, IS_ELECTRON_PAY)
values ('38', '֤ȯ�㻮', '38', 'T', '', '1', '1');

insert into bt_payment_param (ID, VOUCHER_TYPE, ISACCOUNT)
values ((SELECT MAX(ID)+1 FROM BT_PAYMENT_PARAM), '38', '0');


--���ڣ�2012-08-28
--�޸��ˣ�����
--�޸����ݣ��޸�֤ȯ�˻���֤ȯ�˻���ϵά�����������ɷ�ʽ��ԭ��SequenceΪTable
INSERT INTO TB_GENERATOR
  (ID, GEN_NAME, GEN_VALUE)
VALUES
  ((SELECT MAX(ID) + 1 FROM TB_GENERATOR), 'NIS_SEC_SECURITIES_ID', 1);
  
INSERT INTO TB_GENERATOR
  (ID, GEN_NAME, GEN_VALUE)
VALUES
  ((SELECT MAX(ID) + 1 FROM TB_GENERATOR), 'NIS_SEC_RELATION_ID', 1);


COMMIT;





