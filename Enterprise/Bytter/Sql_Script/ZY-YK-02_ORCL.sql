--�½��� CMS_PRECATIVE_LOAN_CCAL ���ű�
--andy.huang
-- Create table
create table CMS_PROVIDE_LOAN_SEND
(
  bill_code                VARCHAR2(13) not null,
  father_code              VARCHAR2(13),
  contract_code            VARCHAR2(50),
  money                    NUMBER(15,2) not null,
  send_date                DATE not null,
  deadline_date            DATE not null,
  repay_type               CHAR(2) not null,
  surety_explain           VARCHAR2(200),
  repair_op                VARCHAR2(8),
  op                       VARCHAR2(8) not null,
  pl_rate                  NUMBER(8,6),
  deferred_rate            NUMBER(8,6),
  overdue_rate             NUMBER(8,6),
  nextchecker              VARCHAR2(150),
  approves                 VARCHAR2(200),
  status                   NUMBER,
  enter_date               DATE,
  acc_code                 VARCHAR2(50),
  voucher_no               CHAR(15),
  rmk                      VARCHAR2(400),
  order_no                 CHAR(18),
  tallier_code             VARCHAR2(8),
  float_way                VARCHAR2(15),
  rate_entries_effect_date DATE,
  interest_way             VARCHAR2(15),
  reference_rate_type      VARCHAR2(50),
  repay_cycle              VARCHAR2(50),
  points_proportion_select VARCHAR2(50),
  points_proportion_text   NUMBER(15,2),
  corp_id                  NUMBER(15),
  pl_term                  NUMBER default 0 not null,
  cur_code                 CHAR(2),
  loan_send_out_type       VARCHAR2(1),
  is_skip_process          VARCHAR2(1),
  send_times               NUMBER default 0
);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_SEND.bill_code
  is '���ű��(����)';
comment on column CMS_PROVIDE_LOAN_SEND.father_code
  is '���������';
comment on column CMS_PROVIDE_LOAN_SEND.contract_code
  is '���ű���';
comment on column CMS_PROVIDE_LOAN_SEND.money
  is '���Ž��';
comment on column CMS_PROVIDE_LOAN_SEND.send_date
  is '��������';
comment on column CMS_PROVIDE_LOAN_SEND.deadline_date
  is '��������';
comment on column CMS_PROVIDE_LOAN_SEND.repay_type
  is '���ʽ,01 һ���Գ��� ;02 ���ڳ��� ;03����';
comment on column CMS_PROVIDE_LOAN_SEND.op
  is '����Ա';
comment on column CMS_PROVIDE_LOAN_SEND.pl_rate
  is '����';
comment on column CMS_PROVIDE_LOAN_SEND.deferred_rate
  is 'չ������';
comment on column CMS_PROVIDE_LOAN_SEND.overdue_rate
  is '��������';
comment on column CMS_PROVIDE_LOAN_SEND.nextchecker
  is '�¸�������';
comment on column CMS_PROVIDE_LOAN_SEND.approves
  is '��������';
comment on column CMS_PROVIDE_LOAN_SEND.status
  is '״̬';
comment on column CMS_PROVIDE_LOAN_SEND.enter_date
  is '¼������';
comment on column CMS_PROVIDE_LOAN_SEND.acc_code
  is '�˺�';
comment on column CMS_PROVIDE_LOAN_SEND.voucher_no
  is '����ƾ֤��';
comment on column CMS_PROVIDE_LOAN_SEND.rmk
  is '��ע';
comment on column CMS_PROVIDE_LOAN_SEND.order_no
  is '������ˮ��';
comment on column CMS_PROVIDE_LOAN_SEND.tallier_code
  is '����Ա';
comment on column CMS_PROVIDE_LOAN_SEND.float_way
  is '������ʽ';
comment on column CMS_PROVIDE_LOAN_SEND.rate_entries_effect_date
  is '���ʵ�����Ч����';
comment on column CMS_PROVIDE_LOAN_SEND.interest_way
  is '��Ϣ��ʽ';
comment on column CMS_PROVIDE_LOAN_SEND.reference_rate_type
  is '��׼��������';
comment on column CMS_PROVIDE_LOAN_SEND.repay_cycle
  is '��������';
comment on column CMS_PROVIDE_LOAN_SEND.points_proportion_select
  is '������ѡ��������߱���';
comment on column CMS_PROVIDE_LOAN_SEND.points_proportion_text
  is '�����ά�������ͬ�涨�ĵ����򸡶�����';

-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_PROVIDE_LOAN_SEND
  add constraint PK_CMS_PROVIDE_LOAN_SEND primary key (BILL_CODE);
  
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add loan_send_out_type VARCHAR2(1);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_INFO.loan_send_out_type
  is '���ŷ�ʽ��1��һ���Է���  2���ִη���';
  
 -- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add is_skip_process VARCHAR2(1);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_INFO.is_skip_process
  is '�Ƿ������������̣�1����  0����';
  
  
  


DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_approve_business
    WHERE BUSINESS_CODE = 'proloansend';
    IF V_COUNT = 0 THEN
      insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('proloansend', 'cms', '����', 'A,B,C', 'CMS_PROVIDE_LOAN_SEND', '', 'money', '', 'nextchecker', 'bill_code', '../cms/provideloansendcheck.jsp', '', '', '', '', 'com.byttersoft.cms.form.ProvideLoanSendForm', '', '', '', '', '', null, null, null, null, null, '');
    END IF;
END;
/

DECLARE
  V_COUNT NUMBER;
  v_parent_code number;
BEGIN
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_sys_res
    WHERE RES_NAME = '����' and SYS_CODE='cms' and res_level=2;
     SELECT RES_CODE
    INTO v_parent_code
    FROM bt_sys_res
    WHERE RES_NAME = '������' and SYS_CODE='cms' and res_level=1;
    IF V_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE)+1 from bt_sys_res), '����', 'cms', v_parent_code, '/cms/provideLoanSend.do?method=toCorpList', '0', '0', null, '0', 4, null, null, null, null, null, null, null, null, null, null, null, 2, null);
    END IF;
END;
/
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_REPAY add send_code VARCHAR2(20);