--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  ����ű�

-- Create table
create table LOAN_SEND_OUT_INFO
(
  BILL_CODE           VARCHAR2(20) not null primary key,
  REPAY_TYPE          VARCHAR2(1),
  LOAN_SEND_OUT_DATE  DATE,
  REPAY_DATE          DATE,
  LOAN_SEND_OUT_MONEY NUMBER(15,2),
  FATHER_CODE         VARCHAR2(13),
  CORP_ID             NUMBER(10),
  RMK                 VARCHAR2(100),
  NEXT_CHECKER        VARCHAR2(150),
  APPROVES            VARCHAR2(200),
  OP                  VARCHAR2(8),
  STATUS              NUMBER,
  CONTRACT_CODE       VARCHAR2(50),
  LOAN_RATE           NUMBER(8,6),
  DEFERRED_RATE       NUMBER(8,6),
  OVERDUE_RATE        NUMBER(8,6),
  LOAN_DATE           DATE,
  PAY_TYPE            VARCHAR2(4),
  LOAN_ACC            VARCHAR2(16),
  REPAY_ACC           VARCHAR2(16)
);

-- Add comments to the columns 
comment on column LOAN_SEND_OUT_INFO.BILL_CODE
  is '����';
comment on column LOAN_SEND_OUT_INFO.REPAY_TYPE
  is '���ʽ';
comment on column LOAN_SEND_OUT_INFO.LOAN_SEND_OUT_DATE
  is '��������';
comment on column LOAN_SEND_OUT_INFO.REPAY_DATE
  is '��������';
comment on column LOAN_SEND_OUT_INFO.LOAN_SEND_OUT_MONEY
  is '���Ž��';
comment on column LOAN_SEND_OUT_INFO.FATHER_CODE
  is 'cms_loan_info��bill_code';
comment on column LOAN_SEND_OUT_INFO.RMK
  is '��ע';
comment on column LOAN_SEND_OUT_INFO.STATUS
  is '״̬';
comment on column LOAN_SEND_OUT_INFO.CONTRACT_CODE
  is '��ͬ';
comment on column LOAN_SEND_OUT_INFO.LOAN_RATE
  is '¼������';
comment on column LOAN_SEND_OUT_INFO.DEFERRED_RATE
  is 'չ����';
comment on column LOAN_SEND_OUT_INFO.OVERDUE_RATE
  is '������';
comment on column LOAN_SEND_OUT_INFO.LOAN_DATE
  is '������';
comment on column LOAN_SEND_OUT_INFO.PAY_TYPE
  is '֧����ʽ';
comment on column LOAN_SEND_OUT_INFO.LOAN_ACC
  is '�����˺�';
comment on column LOAN_SEND_OUT_INFO.REPAY_ACC
  is '�����˺�';
    
--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸����� �������ݱ�
ALTER TABLE CMS_LOAN_INFO ADD(LOAN_SEND_OUT_TYPE  VARCHAR2(1)); 
comment on column CMS_LOAN_INFO.LOAN_SEND_OUT_TYPE
  is '����ŷ�ʽ��1��һ���Է���  2���ִη���';
  
--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  ����Ʊ�ݱ��������ֶ�
ALTER TABLE AB_RECEIVE ADD(LOAN_SEND_BILL_CODE  varchar2(20)); 
comment on column AB_RECEIVE.LOAN_SEND_BILL_CODE
  is '����ű��е�����';
  
  
--��cms_loan_info�����ֶ�
--�����ά�������ͬ�涨�ĵ����򸡶�����
alter table cms_loan_info add points_proportion_text VARCHAR2(50);

--������ѡ��������߱���
alter table cms_loan_info add points_proportion_select VARCHAR2(50);

--��¼ҳ��


--������ʽ
alter table cms_loan_info add float_way VARCHAR2(15);

--���ʵ�����Ч����
alter table cms_loan_info add rate_entries_effect_date DATE;

--��Ϣ��ʽ
alter table cms_loan_info add interest_way VARCHAR2(15);


--��׼��������
alter table cms_loan_info add reference_rate_type VARCHAR2(50);

--��������
alter table cms_loan_info add repay_cycle VARCHAR2(50);

  -- ���Ӵ����
-- �޸����ڣ�20120821
-- �޸�ԭ��vp5975
-- �޸��ˣ���³�
--�ȵ���˳�򣬲˵�˳���Ϊ5��changed by zhangjf
update bt_sys_res set res_order = res_order + 1 where father_code in (select res_code from bt_sys_res where res_name='�������' and sys_code='cms') and res_order >= 5;

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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '�����',
         'cms',
         res_code,
         '/cms/LoanSendOutPreview.jsp',
         '0',
         '1',
         '0',
         '0',
         5,
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
         2
  from bt_sys_res
   where res_name = '�������'
   and sys_code='cms';
  
    --�޸����ݣ����Ӵ��������
INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
VALUES ('cms_A4', 'cms', '�����', 'A,B,C', 'loan_send_out_info', '', 'loan_send_out_money', '', 'next_checker', 'bill_code', '../cms/LoanSendOutBillShowInclude.jsp', 'com.byttersoft.cms.form.LoanSendOutForm');

commit;