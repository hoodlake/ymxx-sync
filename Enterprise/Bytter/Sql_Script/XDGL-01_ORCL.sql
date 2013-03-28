--�޸����ڣ�2012.11.15
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����(ZY-WD-03-01)
--�Ƿ����а���
alter table cms_precative_loan_info add is_bank char(1) default '0';
--ί�����뵥��
alter table cms_precative_loan_info add app_code varchar2(20);
--���д���
alter table cms_precative_loan_info add bank_code char(4);
--������ͬ����
alter table cms_precative_loan_info add gua_hypothec_code varchar2(50);
--���ʽ
alter table cms_precative_loan_info add repay_type varchar2(30);
--��Ϣ��ʽ
alter table cms_precative_loan_info add interest_way varchar2(15);
--����ŷ�ʽ
alter table cms_precative_loan_info add loan_send_out_type varchar2(1);
--��������Ź���
alter table cms_precative_loan_info add skip_loan_send_out varchar2(1);
--������ʽ
alter table cms_precative_loan_info add float_way varchar2(15);
--���ʵ�����Ч����
alter table cms_precative_loan_info add rate_entries_effect_date date;
--��������
alter table cms_precative_loan_info add reference_rate_type varchar2(50);
--��������
alter table cms_precative_loan_info add repay_cycle varchar2(50);
--����ѡ����������
alter table cms_precative_loan_info add points_proportion_select varchar2(50);
--�����ά�������ͬ�涨�ĵ��������
alter table cms_precative_loan_info add points_proportion_text varchar2(50);

commit;

--�޸ı�

--�ļ��ϴ���¼������ Ψһ�ļ����ֶΣ��� java.uuid ����
alter table cms_precative_upload_file 
add UNIONFILENAME varchar2(36);


--ί�д����������ֶ� ����ƻ�ID
alter table CMS_PRECATIVE_LOAN_REPAY
add REPAYMENT_SCHEDULE_ID number(10);

--ί�д���������ֶ� ������Ϣ
alter table CMS_PRECATIVE_LOAN_REPAY 
add REPAY_MONEY_RATE number(10,2);


--�½��� CMS_PRECATIVE_LOAN_CCAL ί�д���������Ϣ
--������
create table CMS_PRECATIVE_LOAN_SEND
(
  BILL_CODE                CHAR(13) not null,
  PRECATIVE_ID             NUMBER(10) not null,
  FATHER_CODE              VARCHAR2(13),
  CONTRACT_CODE            VARCHAR2(20),
  MONEY                    NUMBER(15,2) not null,
  RATE                     NUMBER(8,6),
  SEND_DATE                DATE not null,
  DEADLINE_DATE            DATE not null,
  REPAY_TYPE               CHAR(2) not null,
  OP                       VARCHAR2(8) not null,
  NEXT_CHECKER             VARCHAR2(150),
  APPROVES                 VARCHAR2(200),
  STATUS                   NUMBER not null,
  ENTER_DATE               DATE not null,
  RMK                      VARCHAR2(400),
  VOUCHER_NO               CHAR(15),
  ORDER_NO                 CHAR(36),
  TALLIER_CODE             CHAR(8),
  DEPOSIT_ACC              VARCHAR2(50),
  VOUCHER_NO2              CHAR(15),
  VOUCHER_NO1              CHAR(15),
  LOAN_ACC                 VARCHAR2(50),
  FLOAT_WAY                VARCHAR2(15),
  RATE_ENTRIES_EFFECT_DATE DATE,
  INTEREST_WAY             VARCHAR2(15),
  REFERENCE_RATE_TYPE      VARCHAR2(50),
  REPAY_CYCLE              VARCHAR2(50),
  POINTS_PROPORTION_SELECT VARCHAR2(50),
  POINTS_PROPORTION_TEXT   NUMBER(15,2),
  TERM                     NUMBER,
  CORP_ID                  NUMBER(10),
  SEND_TIME                NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column CMS_PRECATIVE_LOAN_SEND.BILL_CODE
  is '���ű��(����)';
comment on column CMS_PRECATIVE_LOAN_SEND.PRECATIVE_ID
  is 'ί����λ';
comment on column CMS_PRECATIVE_LOAN_SEND.FATHER_CODE
  is 'ί��������';
comment on column CMS_PRECATIVE_LOAN_SEND.CONTRACT_CODE
  is 'ί�����ű���';
comment on column CMS_PRECATIVE_LOAN_SEND.MONEY
  is '���Ž��';
comment on column CMS_PRECATIVE_LOAN_SEND.RATE
  is '����';
comment on column CMS_PRECATIVE_LOAN_SEND.SEND_DATE
  is '��������';
comment on column CMS_PRECATIVE_LOAN_SEND.DEADLINE_DATE
  is '��������';
comment on column CMS_PRECATIVE_LOAN_SEND.REPAY_TYPE
  is '���ʽ,01 һ���Գ��� ;02 ���ڳ��� ;03����';
comment on column CMS_PRECATIVE_LOAN_SEND.OP
  is '����Ա';
comment on column CMS_PRECATIVE_LOAN_SEND.NEXT_CHECKER
  is '�¸�������';
comment on column CMS_PRECATIVE_LOAN_SEND.APPROVES
  is '��������';
comment on column CMS_PRECATIVE_LOAN_SEND.STATUS
  is '״̬';
comment on column CMS_PRECATIVE_LOAN_SEND.ENTER_DATE
  is '¼������';
comment on column CMS_PRECATIVE_LOAN_SEND.RMK
  is '��ע';
comment on column CMS_PRECATIVE_LOAN_SEND.VOUCHER_NO
  is '����ƾ֤��';
comment on column CMS_PRECATIVE_LOAN_SEND.ORDER_NO
  is '������ˮ��';
comment on column CMS_PRECATIVE_LOAN_SEND.TALLIER_CODE
  is '����Ա';
comment on column CMS_PRECATIVE_LOAN_SEND.DEPOSIT_ACC
  is '�����˺�';
comment on column CMS_PRECATIVE_LOAN_SEND.FLOAT_WAY
  is '������ʽ';
comment on column CMS_PRECATIVE_LOAN_SEND.RATE_ENTRIES_EFFECT_DATE
  is '���ʵ�����Ч����';
comment on column CMS_PRECATIVE_LOAN_SEND.INTEREST_WAY
  is '��Ϣ��ʽ';
comment on column CMS_PRECATIVE_LOAN_SEND.REFERENCE_RATE_TYPE
  is '��׼��������';
comment on column CMS_PRECATIVE_LOAN_SEND.REPAY_CYCLE
  is '��������';
comment on column CMS_PRECATIVE_LOAN_SEND.POINTS_PROPORTION_SELECT
  is '������ѡ��������߱���';
comment on column CMS_PRECATIVE_LOAN_SEND.POINTS_PROPORTION_TEXT
  is '�����ά�������ͬ�涨�ĵ����򸡶�����';
comment on column CMS_PRECATIVE_LOAN_SEND.CORP_ID
  is 'ֵͬPRECATIVE_ID,���������ֶ�';
comment on column CMS_PRECATIVE_LOAN_SEND.SEND_TIME
  is '�ڼ��η���';
  
  
alter table CMS_PRECATIVE_LOAN_SEND
  add constraint PK_CMS_PRECATIVE_LOAN_SEND primary key (BILL_CODE);
  
create index INDEX_CMS_PRECATIVE_LOAN_SEND on CMS_PRECATIVE_LOAN_SEND (BILL_CODE, STATUS, NEXT_CHECKER, APPROVES);

--�½���ͼ
CREATE OR REPLACE VIEW V_CMS_PRECATIVE_LOAN_INFO AS
select info.BILL_CODE,
       info.PD_CODE,
       info.PRECATIVE_ID,
       info.CORP_ID,
       info.CONTRACT_CODE,
       info.POUNDAGE,
       info.LOAN_OPP,
       info.PURPOSE,
       info.CURRENCY,
       info.TERM,
       info.RATE,
       info.MONEY,
       info.HYPOTHEC_CODE,
       info.SURETY_EXPLAIN,
       info.REPAIR_OP,
       info.END_DATE,
       info.START_DATE,
       info.OP,
       info.NEXT_CHECKER,
       info.APPROVES,
       info.STATUS,
       info.ENTER_DATE,
       info.RMK,
       info.VOUCHER_NO,
       info.REVERSE1,
       info.REVERSE2,
       info.REVERSE3,
       info.REVERSE4,
       info.REVERSE5,
       info.REVERSE6,
       info.REVERSE7,
       info.REVERSE8,
       info.REVERSE9,
       info.REVERSE10,
       info.ORDER_NO,
       info.TALLIER_CODE,
       info.POUNDAGE_RATE,
       info.DEPOSIT_ACC,
       info.VOUCHER_NO2,
       info.VOUCHER_NO1,
       info.LOAN_ACC,
       info.IS_BANK,
       info.APP_CODE,
       info.BANK_CODE,
       info.GUA_HYPOTHEC_CODE,
       info.REPAY_TYPE,
       info.INTEREST_WAY,
       info.LOAN_SEND_OUT_TYPE,
       info.SKIP_LOAN_SEND_OUT,
       info.FLOAT_WAY,
       info.RATE_ENTRIES_EFFECT_DATE,
       info.REFERENCE_RATE_TYPE,
       info.REPAY_CYCLE,
       info.POINTS_PROPORTION_SELECT,
       info.POINTS_PROPORTION_TEXT,
       corp1.corp_code precative_id_corp_code,
       corp1.corp_name precative_id_corp_name,
       corp3.corp_code corp_id_corp_code,
       corp3.corp_name corp_id_corp_name,
       corp2.corp_code loan_opp_corp_code,
       corp2.corp_name loan_opp_corp_name,
       bank.bank_name,
       cur.cur_name,
       typ.type_name
  from cms_precative_loan_info info
 inner join bt_corp corp1 on corp1.id = info.precative_id --ί�з�
 inner join bt_corp corp2 on corp2.id = info.loan_opp --�����������
  left join bt_corp corp3 on corp3.id = info.corp_id --���з��������is_bank=1, ���з�������
  left join bt_bank bank on bank.bank_code = info.bank_code --�������з�
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join cms_provide_loan_type typ on typ.type_code = info.hypothec_code
                                     and typ.operation_type = 'C';
/



CREATE OR REPLACE VIEW V_CMS_PRECATIVE_LOAN_SEND AS
select send.BILL_CODE,
       send.PRECATIVE_ID,--ί�з�
       send.FATHER_CODE,
       send.CONTRACT_CODE,
       send.MONEY,
       send.RATE,
       send.SEND_DATE,
       send.DEADLINE_DATE,
       send.REPAY_TYPE,
       send.OP,
       send.NEXT_CHECKER,
       send.APPROVES,
       send.STATUS,
       send.ENTER_DATE,
       send.RMK,
       send.VOUCHER_NO,
       send.ORDER_NO,
       send.TALLIER_CODE,
       send.DEPOSIT_ACC,
       send.VOUCHER_NO2,
       send.VOUCHER_NO1,
       send.LOAN_ACC,
       send.FLOAT_WAY,
       send.RATE_ENTRIES_EFFECT_DATE,
       send.INTEREST_WAY,
       send.REFERENCE_RATE_TYPE,
       send.REPAY_CYCLE,
       send.POINTS_PROPORTION_SELECT,
       send.POINTS_PROPORTION_TEXT,
       send.TERM,
       cur.cur_code,
       cur.cur_name,
       corp1.corp_code,
       corp1.corp_name,
       corp2.corp_code  corp_id_corp_code,
       corp2.corp_name  corp_id_corp_name,
       corp3.corp_code  loan_opp_corp_code,
       corp3.corp_name  loan_opp_corp_name,
       usr.user_code,
       usr.user_name,
       typ.type_code,
       typ.type_name,
       info.hypothec_code,
       info.purpose,
       info.pd_code,
       info.loan_send_out_type,
       info.skip_loan_send_out,
       info.gua_hypothec_code,
       info.bank_code,
       info.app_code,
       info.is_bank,
       info.repair_op,
       info.surety_explain,
       info.poundage_rate,
       info.poundage,
       info.corp_id,--���з�
       info.loan_opp,--�����
       bank.bank_name --������
  from cms_precative_loan_send send
   inner join   cms_precative_loan_info info   on send.father_code = info.bill_code
   inner join    bt_corp                 corp1 on info.precative_id = corp1.id
   left join    bt_corp                 corp2 on info.corp_id=corp2.id
   inner join    bt_corp                 corp3 on info.loan_opp=corp3.id
   inner join    bt_currency             cur   on info.currency = cur.cur_code
   inner join    cms_provide_loan_type   typ   on info.hypothec_code = typ.type_code and typ.operation_type = 'C'
   inner join    bt_user                 usr   on send.op = usr.user_code
   left  join    bt_bank                  bank on bank.bank_code=info.bank_code;
/



create or replace view v_cms_precative_loan_send_info as
select info.BILL_CODE            info_bill_code,        --ί�д���¼�뵥��
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --ί���˵�λId
       info.CURRENCY             info_CURRENCY,         --�ұ����
       info.TERM                 info_TERM,             --��������
       info.MONEY                info_MONEY,            --������
       info.ENTER_DATE           info_ENTER_DATE,       --����¼������
       info.hypothec_code        info_hypothec_code,    --������ʽ����
       send.BILL_CODE            send_BILL_CODE,        --���ű�ţ�������
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --���ű�ţ����룩
       send.MONEY                send_MONEY,            --���Ž��
       send.SEND_DATE            send_SEND_DATE,        --��������
       send.STATUS               send_STATUS,           --����״̬
       temp.USEDMONEY,                                  --�ѷ��Ž��
       cur.cur_name,                                    --�ұ�����
       corp.corp_name precative_corp_name,              --ί��������
       typ.type_name                                    --������ʽ����
  from cms_precative_loan_info info
  --���ͬʱֻ����һ�����ż�¼��ҵ����
  left join cms_precative_loan_send send on  info.bill_code =
                                            send.father_code
                                        and send.status >= -1
                                        and send.status < 102 --102�������
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code =
                                            info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code
 where info.status = 97 --��¼���
   and (temp.usedmoney < info.money or temp.usedmoney is null) --���Ž��δ��;
;
/


--�˵�  �Ŵ�����>>ί�д���>>ί�д����

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='cms' AND t1.res_name='ί�д����' AND t1.res_url='/cms/cmsPrecativeLoanSendAction.do?method=goMainPage';
  IF VN_COUNT < 1 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  select  (select max(res_code)+1 from bt_sys_res) , 'ί�д����', 'cms', (select res_code from bt_sys_res where sys_code='cms' and res_name='ί�д���' and father_code=0), '/cms/cmsPrecativeLoanSendAction.do?method=goMainPage', '0', '0', '0', '0', 9, '��Զ', '', '', '', '', '', null, null, null, null, null, 1, ''
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms' and father_code=0;
  END IF;
  COMMIT; 
END;
/

--����ҵ��  cms_C3 ί�д����

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_approve_business where business_code='cms_C3';
  IF VN_COUNT < 1 THEN
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_C3','cms','ί�д����','A,B,C','cms_precative_loan_send','money','next_checker','bill_code','../cms/cmsPrecativeLoanSendShow.jsp','com.byttersoft.cms.form.CmsPrecativeLoanSendForm'
	from dual;
  END IF;
  COMMIT; 
END;
/

--����������
DECLARE
 VN_count number;
begin 
 select count(*) 
 into VN_count
 from bt_key_generator where keyalisename='CMS_PRECATIVE_LOAN_SEND' and genstrate='cu';
 if VN_count<1 then 
    insert into bt_key_generator(id,keyalisename,custgenclass,genstrate)
    values((select max(id)+1 from bt_key_generator),'CMS_PRECATIVE_LOAN_SEND','com.byttersoft.keyservice.usrdefgenerator.CmsPrecativeLoanSendKeyGenerator','cu');
  end if;
  commit;
end; 
/


--���������ݴ���װ����send ����
insert into cms_precative_loan_send
  (bill_code,
   precative_id,
   father_code,
   contract_code,
   money,
   rate,
   send_date,
   deadline_date,
   repay_type,
   op,
   next_checker,
   approves,
   status,
   enter_date,
   rmk,
   voucher_no,
   order_no,
   tallier_code,
   deposit_acc,
   voucher_no2,
   voucher_no1,
   loan_acc,
   float_way,
   rate_entries_effect_date,
   interest_way,
   reference_rate_type,
   repay_cycle,
   points_proportion_select,
   points_proportion_text,
   term,
   corp_id,
   send_time) 
  select info.bill_code,
         info.precative_id,
         info.bill_code,
         info.contract_code,
         info.money,
         info.rate,
         info.start_date,
         info.end_date,
         '02',
         info.op,
         info.next_checker,
         info.approves,
         info.status,
         info.enter_date,
         info.rmk,
         info.voucher_no,
         info.order_no,
         info.tallier_code,
         info.deposit_acc,
         info.voucher_no2,
         info.voucher_no1,
         info.loan_acc,
          '01', --������ʽ�̶�01 �̶�����
         info.rate_entries_effect_date,
          '03', --��Ϣ��ʽ�̶� 01 ������Ϣ
         info.reference_rate_type,
         info.repay_cycle,
         info.points_proportion_select,
         to_number(info.points_proportion_text),
         info.term,
         info.corp_id,
         1 --���Ŵ����̶�1
    from cms_precative_loan_info info 
    where info.status>=97  --��¼����Ժ������
    and info.loan_send_out_type is null --������֮ǰ�����ݴ��ֶ�һ��Ϊ��
    and info.bill_code not in(select father_code from cms_precative_loan_send) --�ڷ��ű����޷�����ϸ
;
commit;

update CMS_PRECATIVE_LOAN_INFO set LOAN_SEND_OUT_TYPE='1',SKIP_LOAN_SEND_OUT='1' where status>=102;

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




--����չ������
alter table cms_loan_deferred
add DEFERRED_RATE  NUMBER(8,6);

alter table cms_pl_deferred
add DEFERRED_RATE  NUMBER(8,6);

--��������
create table CMS_MAIN_TYPE
(
  TYPE_CODE VARCHAR2(10) not null,
  TYPE_NAME VARCHAR2(30) not null,
  RMK       VARCHAR2(100)
);
alter table CMS_MAIN_TYPE
  add constraint PK_CMS_MAIN_TYPE primary key (TYPE_CODE)
;
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='A';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('A','�ڲ�����','');
	END IF;
  COMMIT; 
END; 
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='B';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('B','���н��','');
	END IF;
  COMMIT; 
END; 
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='C';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('C','ί�д���','');
	END IF;
  COMMIT; 
END;
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM CMS_MAIN_TYPE where TYPE_CODE='D';
	IF N_COUNT < 1 THEN
		INSERT INTO CMS_MAIN_TYPE VALUES('D','ó������','');
	END IF;
  COMMIT; 
END;
/


CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL AS
select "CONTRACT_CODE","BILL_CODE","RATE_ID","CYCLE_ID","BILL_TYPE_CODE","BILL_TYPE","LOAN_ACC","CORP_ID","LOAN_SEND_OUT_MONEY","BALANCE","CUR_CODE","LOAN_SEND_OUT_DATE","REPAY_DATE","DELAY_DEADLINE_DATE","LOAN_RATE","DEFERRED_RATE","OVERDUE_RATE","NET_CODE","FLOAT_WAY","BORROW_CODE","BORROW_NAME","INTEREST_WAY","RATE_EFFECT_DATE","POINTS_PRO_SELECT","POINTS_PRO_TEXT" from (
--�ڲ�����
select b.CONTRACT_CODE,--��ͬ���
       a.bill_code, --ҵ����
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'A' bill_type_code,
       '�ڲ�����' bill_type,
       a.loan_acc,--�˺�
       a.corp_id,--��λ����
       a.loan_send_out_money,--(����)���Ž��
       (loan_send_out_money - (select nvl(sum(repay_money),0.00) from cms_loan_repay d where d.li_code=a.bill_code and d.status>=102)) balance,--���
       b.cur_code,--�ұ�
       a.loan_send_out_date,--��Ϣ����
       a.repay_date,--��������
       a.repay_date delay_deadline_date,--չ�ڵ�������
       a.loan_rate,--����
       a.deferred_rate,--չ������
       a.overdue_rate,--��������
       b.net_code, --����
       a.float_way, --������ʽ
       b.net_code borrow_code,--����� ������
       (select net_name from bt_net where net_code=b.net_code) borrow_name,--���������
       a.INTEREST_WAY, --��Ϣ��ʽ(Ԥ������) 1��ĩ��ϢԤ��,2��ĩ��Ϣ��Ԥ��,3ÿ�½�Ϣ,4��ĩ����ϢԤ��,5��ĩ����Ϣ��Ԥ��
       a.RATE_ENTRIES_EFFECT_DATE RATE_EFFECT_DATE,--���ʵ�����Ч����
       a.POINTS_PROPORTION_SELECT POINTS_PRO_SELECT ,--����/����  1.������2����
       to_number(a.POINTS_PROPORTION_TEXT) points_pro_text --����/����ֵ
  from loan_send_out_info a,cms_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and a.corp_id=c.id
 and a.status>=102 and a.status<>110
 and a.interest_way in ('1','2','3','4','01','02','03','04','5','05')
union
select b.CONTRACT_CODE,--��ͬ���
       a.bill_code, --ҵ����
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'C' test_type_code,
       'ί�д���' test_type,
       a.loan_acc,--�˺�
       b.loan_opp,--��λ����
       a.money,--(����)���Ž��
       (a.money - (select nvl(sum(d.money),0.00) from cms_precative_loan_repay d where d.pl_code=a.bill_code and d.status>=102)) balance,--���
       b.currency,--�ұ�
       a.SEND_DATE,--��Ϣ����
       a.DEADLINE_DATE,--��������
       a.DEADLINE_DATE delay_deadline_date,--չ�ڵ�������
       a.RATE,--����
       0.00 deferred_rate,--չ������
       0.00 overdue_rate,--��������
       c.net_code, --����
       a.float_way, --������ʽ
       (select corp_code from bt_corp where id=b.precative_id) borrow_code,--����� ��ί�е�λ
       (select corp_name from bt_corp where id=b.precative_id) borrow_name,--���������
       a.INTEREST_WAY, --��Ϣ��ʽ(Ԥ������)
       a.RATE_ENTRIES_EFFECT_DATE,--���ʵ�����Ч����
       a.POINTS_PROPORTION_SELECT,--����/����  1.������2����
       a.POINTS_PROPORTION_TEXT --����/����ֵ
  from cms_precative_loan_send a,cms_precative_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and a.precative_id=c.id
 and a.status>=102 and a.status<>110
 and a.interest_way in ('1','2','3','4','01','02','03','04','5','05')
union
--���н��
select b.CONTRACT_NO,--��ͬ���
       a.bill_code, --ҵ����
       to_number(a.reference_rate_type) rate_id,
       to_number(a.repay_cycle) cycle_id,
       'B' test_type_code,
       '���н��' test_type,
       a.acc_code,--�˺�
       b.corp_id,--��λ����
       a.money,--(����)���Ž��
       (a.money - (select nvl(sum(d.repay_money),0.00) from cms_provide_loan_repay d where d.send_code=a.bill_code and d.status>=102)) balance,--���
       b.cur_code,--�ұ�
       a.SEND_DATE,--��Ϣ����
       a.DEADLINE_DATE,--��������
       a.DEADLINE_DATE delay_deadline_date,--չ�ڵ�������
       a.pl_RATE,--����
       b.deferred_rate,--չ������
       b.overdue_rate,--��������
       b.net_code ,--����
       a.float_way, --������ʽ
       b.BANK_CODE, --����� �����д���
       (select bank_name from bt_bank where BANK_CODE=b.BANK_CODE) borrow_name,--���������
       a.INTEREST_WAY, --��Ϣ��ʽ(ÿ�½�Ϣ����ĩ��ϢԤ�ᣬ��ĩ��Ϣ��Ԥ�ᣬ��ĩ����ϢԤ��)
       a.RATE_ENTRIES_EFFECT_DATE,--���ʵ�����Ч����
       a.POINTS_PROPORTION_SELECT,--����/����  1.������2����
       a.POINTS_PROPORTION_TEXT --����/����ֵ
  from cms_provide_loan_send a,cms_provide_loan_info b,bt_corp c
 where a.father_code=b.bill_code
 and b.corp_id=c.id
 and a.status>=102 and a.status<>110
 and b.cpl_interest_payment<>'002'
 and a.interest_way in ('1','2','3','4','01','02','03','04','5','05')
);

-- Create table
--Ԥ��/��Ϣ��¼��
create table CMS_INTEREST_REC
(
  ID                  NUMBER(10) not null,
  BALANCE_DATE        DATE not null,
  BILL_CODE           VARCHAR2(50) not null, 
  BILL_TYPE           CHAR(1) not null,
  INTEREST_SIGN       CHAR(1) not null,
  INTEREST_TIME       DATE,
STATUS              CHAR(1) default '0'
)
;
comment on column CMS_INTEREST_REC.ID
  is '����';
comment on column CMS_INTEREST_REC.balance_date
  is 'Ԥ��/��Ϣ��ֹ����';
comment on column CMS_INTEREST_REC.bill_code
  is 'ҵ����';
comment on column CMS_INTEREST_REC.BILL_TYPE
  is 'ҵ������,A���н�B�ڲ����Cί�д��Dó������';
comment on column CMS_INTEREST_REC.INTEREST_SIGN
  is '��Ϣ��־,1Ԥ��,2��Ϣ';
comment on column CMS_INTEREST_REC.INTEREST_TIME
  is '��Ϣʱ��(Ԥ��/��Ϣ)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table CMS_INTEREST_REC
  add constraint PK_CMS_INTEREST_REC primary key (ID)
;
-- Create/Recreate indexes   CMS_INTEREST_REC
create index IDX_CMS_INTEREST_REC on CMS_INTEREST_REC (BALANCE_DATE,BILL_CODE);

--����
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM tb_generator where gen_name='cms_interest_rec_id';
	IF N_COUNT < 1 THEN
		insert into tb_generator values((select max(id)+1 from tb_generator),'cms_interest_rec_id',1 );
	END IF;
  COMMIT; 
END;
/
DECLARE
  N_COUNT    NUMBER;
BEGIN
	SELECT COUNT(*) into N_COUNT FROM tb_generator where gen_name='cms_interest_dtl_id';
	IF N_COUNT < 1 THEN
		insert into tb_generator values((select max(id)+1 from tb_generator),'cms_interest_dtl_id',1 );
	END IF;
  COMMIT; 
END;
/


--������ϢԤ��/��Ϣ��
-- Create table
create table CMS_INTEREST_DTL
(
  ID                  NUMBER(10) unique,
  INTEREST_TIME       DATE not null,
  BALANCE_DATE        DATE not null,
  CONTRACT_CODE       VARCHAR2(50) not null,
  BILL_CODE           VARCHAR2(50) not null,
  BILL_TYPE           CHAR(1) not null,
  NET_CODE            CHAR(4) NOT NULL,
  CORP_ID             NUMBER(10) not null,
  LOAN_MONEY          NUMBER(14,2) default 0,
  BALANCE             NUMBER(14,2) default 0,
  CUR_CODE            char(4)  null,
  INTEREST_TYPE       CHAR(1) not null,
  INTEREST_START_DATE DATE not null,
  BLN_INST_DATE       DATE not null,
  DAYS                NUMBER(10) not null,
  CUMULATION          NUMBER(14,2) not null,
  INTEREST_RATE       NUMBER(8,6) not null,
  INTEREST            NUMBER(14,2) not null,
  NATURAL_INTEREST    NUMBER(14,2) not null,--
  BORROW_CODE         VARCHAR2(50)  null,--
  BORROW_NAME         VARCHAR2(200)  null,--
  INTEREST_SIGN       CHAR(1) not null,
  STATUS              CHAR(1) default '0',
  RMK                 VARCHAR2(20),
  statusZone          VARCHAR2(10)
)
;
  
comment on column cms_interest_dtl.INTEREST_TIME
  is '��Ϣʱ��';
comment on column cms_interest_dtl.BALANCE_DATE
  is 'ʱ��(��������Ϣ���·�)';
comment on column cms_interest_dtl.CONTRACT_CODE
  is '��ͬ���';
comment on column cms_interest_dtl.bill_code
  is 'ҵ����';
comment on column cms_interest_dtl.bill_type
  is 'ҵ������';
comment on column cms_interest_dtl.NET_CODE
  is '����';
comment on column cms_interest_dtl.CORP_ID
  is '��λID';
comment on column cms_interest_dtl.loan_money
  is '����';
comment on column cms_interest_dtl.balance
  is '���';
comment on column cms_interest_dtl.cur_code
  is '�ұ�';
comment on column cms_interest_dtl.INTEREST_TYPE
  is '��Ϣ����';
comment on column cms_interest_dtl.INTEREST_START_DATE
  is '��Ϣ����';
comment on column cms_interest_dtl.BLN_INST_DATE
  is '��������';
comment on column cms_interest_dtl.DAYS
  is '����';
comment on column cms_interest_dtl.CUMULATION
  is '����';
comment on column cms_interest_dtl.INTEREST_RATE
  is '����';
comment on column cms_interest_dtl.INTEREST
  is '��Ϣ';
comment on column cms_interest_dtl.NATURAL_INTEREST
  is '��Ϣ����ɱ�λ��';
comment on column cms_interest_dtl.BORROW_CODE
  is '����˴���';
comment on column cms_interest_dtl.BORROW_NAME
  is '���������';
comment on column cms_interest_dtl.INTEREST_SIGN
  is 'Ԥ��/��Ϣ,1Ԥ��,2��Ϣ';
comment on column cms_interest_dtl.STATUS
  is '״̬(�����̱���,Ĭ��0)';
comment on column cms_interest_dtl.RMK
  is '��ע(�����̱���)';
comment on column cms_interest_dtl.statusZone
  is '����״̬��������չ�ڣ����ڣ�';
-- Create/Recreate primary, unique and foreign key constraints 
alter table cms_interest_dtl
  add constraint PK_cms_interest_dtl primary key (BILL_CODE,  INTEREST_TIME, INTEREST_TYPE, INTEREST_START_DATE);


--�˵�
--delete from BT_SYS_RES t where t.sys_code='cms' and t.res_name in ('������Ϣ����','��Ϣ����','��ϢԤ��','��Ϣ');
--һ���˵� �Ŵ�����->������Ϣ����
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='������Ϣ����';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			values( (select max(RES_CODE) + 1 from bt_sys_res),'������Ϣ����','cms',0,'','0','0','0','0',4,1,'');
  	END IF;
  	COMMIT;
END;
/

--�����˵� �Ŵ�����->��Ϣ����
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='��Ϣ����';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'��Ϣ����','cms',RES_CODE,'/cms/rateInRoughlyCalc.jsp','0','0','0','0',1,2,''
         		from bt_sys_res
         			where res_name = '������Ϣ����' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
/

--�����˵� �Ŵ�����->��ϢԤ��
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='��ϢԤ��';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'��ϢԤ��','cms',RES_CODE,'/cms/rateInProvision.jsp','0','0','0','0',2,2,''
         		from bt_sys_res
         			where res_name = '������Ϣ����' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
/
--�����˵� �Ŵ�����->��Ϣ
DECLARE
	N_COUNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='cms' and t.res_name='��Ϣ';
	IF N_COUNT < 1 THEN
	insert into BT_SYS_RES
  		(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL,RES_ROLE)
  			select (select max(RES_CODE) + 1 from bt_sys_res),'��Ϣ','cms',RES_CODE,'/cms/rateInEnd.jsp','0','0','0','0',3,2,''
         		from bt_sys_res
         			where res_name = '������Ϣ����' and sys_code='cms';
  	END IF;
  	COMMIT;
END;
/







	--�޸����ڣ�2012.11.27
	--�޸��ˣ�����
	--�޸����ݣ��й�Զ��
	--�޸�ԭ���й�Զ��ű�����(������Ϣ��ѯ)

	--������ͼ
	CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL_VIEW AS
	SELECT net.net_name, --����
	       dtl.CONTRACT_CODE, --��ͬ���
	       dtl.BILL_CODE, --ҵ����
	       type.type_name, --��������
	       corp.corp_name, --��λ���� ȡbt_corp
	       dtl.LOAN_MONEY, --����
	       dtl.BALANCE, --���
	       cur.cur_name, --�ұ� ����ȡbt_currency
	       dtl.INTEREST_START_DATE, --��Ϣ����
	       dtl.BLN_INST_DATE, --��������
	       dtl.DAYS, --����
	       dtl.CUMULATION, --����
	       dtl.INTEREST_RATE, --����
	       dtl.INTEREST, --��Ϣ���
	       dtl.NATURAL_INTEREST, -- ��Ϣ����ɱ�λ��
	       dtl.BORROW_NAME, --�����
	       interest.interest_name, --��Ϣ���� ����ȡfc_interest_type
	       dtl.INTEREST_SIGN, --ҵ������,1Ԥ��,2��Ϣ
	       dtl.net_code,--��ѯ����
	       dtl.corp_id,--��ѯ����
	       dtl.bill_type,--��ѯ����
	       to_char(dtl.balance_date,'yyyy-MM') as balance_date_str,--��ѯ����
	       dtl.cur_code, --��ѯ����
	       DTL.INTEREST_TIME,--��ѯ����
	       DTL.INTEREST_TYPE--��ѯ����
	  FROM CMS_INTEREST_DTL dtl
	  inner join bt_net net on net.net_code=dtl.net_code
	  inner join bt_corp corp on dtl.corp_id=corp.id
	  inner join bt_currency cur on dtl.cur_code=cur.cur_code
	  inner join cms_main_type type on type.type_code=dtl.bill_type
	  inner join fc_interest_type interest on dtl.interest_type=interest.interest_code
	 WHERE dtl.STATUS = '0'
	/

	--ZY-XD-06������Ϣ��ѯ�˵�
	DECLARE
	  VN_COUNT    NUMBER;
	BEGIN
	  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'cms' and res_name='��Ϣ��ϸ��ѯ';
	  IF VN_COUNT < 1 THEN
	   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
	values((select max(res_code)+1 from bt_sys_res),'��Ϣ��ϸ��ѯ','cms',(select res_code from 
	bt_sys_res where res_name='��ѯ' and sys_code='cms'),'/cms/cmsInterestDtlSearch.do?method=beforeOpr','1','0',15);
	  END IF;
	  COMMIT; 
	END;
	/



-- Add/modify columns 
alter table CMS_PL_DEFERRED add expiry_handle_type varchar2(5);

-- Add/modify columns 
alter table CMS_PL_DEFERRED add financ_plans varchar2(100);


DECLARE
  V_COUNT NUMBER;
BEGIN
  
  SELECT COUNT(*)
    INTO V_COUNT
    FROM bt_param
    WHERE CODE = 'is_financing';
    IF V_COUNT = 0 THEN
      insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('is_financing', 'cms', 'չ���Ƿ�����ʼƻ�', '0', null, null, '0', 'VALUE = 0����VALUE = 1����', '0,��;1,��', null, null, null, null, 1.00, null, null, null, null);
    END IF;
END;
/


--�޸�����:��ί�д���ű������ֶ�
--�޸���:�ž���
--�޸�ʱ��:2012-12-10
alter table CMS_PRECATIVE_LOAN_SEND add DEFERRED_REPAY_DATE DATE;
comment on column CMS_PRECATIVE_LOAN_SEND.DEFERRED_REPAY_DATE is 'չ�ں󻹿�����';

--�޸�����:����ί�д���չ�������CMS_PRE_DEFERRED
--�޸���:����
--�޸�ʱ��:2012-12-6
create table CMS_PRE_DEFERRED  (
   BILL_CODE            CHAR(13)                        not null,
   PLI_CODE             CHAR(13),
   CORP_ID              NUMBER(10),
   ENTER_DATE           DATE,
   MATURE_DATE          DATE,
   DEFERRED_LIMT        NUMBER,
   ACC_CODE             CHAR(16),
   DEFERRED_REPAY_DATE  DATE,
   EXPIRY_ACT_TYPE      VARCHAR2(10),
   DEFERRED_RATE        NUMBER(8,6),
   CONTRACT_CODE        VARCHAR2(50),
   FINANCING_PLAN_ID    VARCHAR2(100),
   RMK                  VARCHAR2(100),
   NEXT_CHECKER         VARCHAR2(150),
   APPROVES             VARCHAR2(200),
   STATUS               NUMBER,
   REPAIR_OP            VARCHAR2(8),
   OP                   VARCHAR2(8),
   REVERSE1             VARCHAR2(300),
   REVERSE2             VARCHAR2(300),
   REVERSE3             VARCHAR2(300),
   REVERSE4             VARCHAR2(300),
   REVERSE5             VARCHAR2(300),
   REVERSE6             NUMBER(15,2),
   REVERSE7             NUMBER(15,2),
   REVERSE8             NUMBER(15,2),
   REVERSE9             NUMBER(15,2),
   REVERSE10            NUMBER(15,2),
   constraint PK_CMS_PRE_DEFERRED primary key (BILL_CODE)
);
comment on table CMS_PRE_DEFERRED is 'ί�д���չ�������';
comment on column CMS_PRE_DEFERRED.BILL_CODE is 'ί�д���չ��������ˮ��';
comment on column CMS_PRE_DEFERRED.PLI_CODE is 'ԭʼί�д�����ˮ��';
comment on column CMS_PRE_DEFERRED.CORP_ID is '��λID';
comment on column CMS_PRE_DEFERRED.ENTER_DATE is '¼������';
comment on column CMS_PRE_DEFERRED.MATURE_DATE is 'ί�д������';
comment on column CMS_PRE_DEFERRED.DEFERRED_LIMT is 'չ������';
comment on column CMS_PRE_DEFERRED.ACC_CODE is '�������Ĵ����˺�';
comment on column CMS_PRE_DEFERRED.DEFERRED_REPAY_DATE is 'չ�ں󻹿�����';
comment on column CMS_PRE_DEFERRED.EXPIRY_ACT_TYPE is '���֣�����չ�ڡ����»���';
comment on column CMS_PRE_DEFERRED.DEFERRED_RATE is 'չ������';
comment on column CMS_PRE_DEFERRED.CONTRACT_CODE is 'չ�ں�ͬ��';
comment on column CMS_PRE_DEFERRED.FINANCING_PLAN_ID is '���ʼƻ����';
comment on column CMS_PRE_DEFERRED.RMK is '��ע';
comment on column CMS_PRE_DEFERRED.NEXT_CHECKER is '�¸�������';
comment on column CMS_PRE_DEFERRED.APPROVES is '��������';
comment on column CMS_PRE_DEFERRED.STATUS is '״̬';
comment on column CMS_PRE_DEFERRED.REPAIR_OP is '��¼Ա';
comment on column CMS_PRE_DEFERRED.OP is '����Ա';

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ������
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ������' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ������', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=apply', '0', '1', '0', '0', 10, 'ί�д���չ������', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ���޸�
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ���޸�' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ���޸�', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=edit', '0', '1', '0', '0', 11, 'ί�д���չ���޸�', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ�ڴ��
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ�ڴ��' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ�ڴ��', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=reEdit', '0', '1', '0', '0', 12, 'ί�д���չ�ڴ��', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/





--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ�ڲ�¼
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ�ڲ�¼' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ�ڲ�¼', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'||chr(38)||'pageType=correct', '0', '1', '0', '0', 13, 'ί�д���չ�ڲ�¼', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/

--�޸�����:����ҵ��  cms_C4 ί�д���չ��
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_approve_business where business_code='cms_D4';
  IF VN_COUNT < 1 THEN
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_D4','cms','ί�д���չ��','A,B,C','CMS_PRE_DEFERRED','money','next_checker','bill_code','../cms/cmsPreDeferred_audit.jsp','com.byttersoft.cms.form.CmsPreDeferredForm'
	from dual;
  END IF;
  COMMIT; 
END;
/




--�޸�����:ί�д������Ϣ�鿴��ͼ
--�޸���:����
--�޸�ʱ��:2012-12-7
create or replace view v_cms_pre_loan_send_info as
select send.BILL_CODE            send_BILL_CODE,        --���ű�ţ�������
       info.BILL_CODE            info_bill_code,        --ί�д���¼�뵥��
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --ί���˵�λId
       info.CURRENCY             info_CURRENCY,         --�ұ����
       info.TERM                 info_TERM,             --��������
       info.MONEY                info_MONEY,            --������
       info.ENTER_DATE           info_ENTER_DATE,       --����¼������
       info.hypothec_code        info_hypothec_code,    --������ʽ����
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --���ű�ţ����룩
       send.MONEY                send_MONEY,            --���Ž��
       send.SEND_DATE            send_SEND_DATE,        --��������
       send.STATUS               send_STATUS,           --����״̬
       cur.cur_name,                                    --�ұ�����
       temp.USEDMONEY,                                  --�ѷ��Ž��
       corp.corp_name precative_corp_name,              --ί��������
       typ.type_name                                    --������ʽ����
  from cms_precative_loan_send send
  left join cms_precative_loan_info info on  info.bill_code = send.father_code
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code = info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code;
/
 
--�޸�����:����ί�д���չ��������ͼ
--�޸���:�ž���
--�޸�ʱ��:2012-12-7
create or replace view V_PRECATIVE_LOAN_SEND_DEFERRED as
select * from (
      select app.BILL_CODE            app_bill_code,        --ί�д���¼�뵥��
             app.PRECATIVE_ID         app_PRECATIVE_ID,     --ί���˵�λId
             app.CORP_ID              app_CORP_ID,          --�����˵�λid
             app.Loan_Opp             app_loan_Opp,         --����˵�λid���������
             app.CURRENCY             app_CURRENCY,         --�ұ����
             app.TERM                 app_TERM,             --��������
             app.MONEY                app_MONEY,            --������
             app.ENTER_DATE           app_ENTER_DATE,       --����¼������
             app.hypothec_code        app_hypothec_code,    --������ʽ����
             typ.type_name            app_hypothec_Name,    --������ʽ����
             send.corp_id             corp_id,         --��λ
             send.BILL_CODE           BILL_CODE,       --���ű�ţ�������
             send.CONTRACT_CODE       CONTRACT_CODE,   --���ű�ţ����룩
             send.MONEY               MONEY,           --���Ž��
             send.SEND_DATE           SEND_DATE,       --��������
             send.STATUS              STATUS,          --����״̬
             send.DEADLINE_DATE       DEADLINE_DATE,    --��������
             send.ENTER_DATE,                            --¼������
             send.term,                                  --����
             nvl(repay.repay_money,0) repay_money        --�ѻ����
        from cms_precative_loan_send send
        --���ͬʱֻ����һ�����ż�¼��ҵ����
        join cms_precative_loan_info app on app.bill_code = send.father_code
        left join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=app.hypothec_code
        left join (select lr.pl_code, sum(lr.money) repay_money
                    from CMS_PRECATIVE_LOAN_REPAY lr where lr.status >= 102
                   group by lr.pl_code) repay on send.Bill_Code = repay.pl_code 
        where send.status >= 102 --�Ѽ���
              and not exists (select plr.bill_code from CMS_PRECATIVE_LOAN_REPAY plr where plr.pl_code=send.bill_code and plr.status>=0 and plr.status<102) --���ڻ�����
              --չ�ڻ���Ҫ��ʾ��������
              --and not exists (select pd.bill_code from CMS_PRE_DEFERRED pd where send.bill_code=pd.pli_code and (pd.status > -2 and pd.status < 102)) --����չ����
        ) sd
        --�ſû����
        where sd.money > sd.repay_money; 
/





update bt_param set name='�����Ŵ�̨�˹���' where code='is_charging';
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE  RES_NAME='����̨�˹���' and sys_code='cms' and RES_LEVEL=1;
   IF VN_COUNT = 0 THEN
       insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '����̨�˹���', 'cms', 0, '', '0', '1', '0', '0', 0, '', '', '', '', '', '', null, null, null, null, null, 1, '');
   END IF;
end;
/
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='��������¼��' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
       values ((select max(res_code) + 1 from bt_sys_res), '��������¼��', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=1', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/
 
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '�����', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0'||chr(38)||'opflag=1', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

 delete from bt_sys_res where RES_NAME='����̨��' and sys_code='cms' and RES_LEVEL=2;
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '����̨��', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/cmsLoanBill.do?method=toList', '0', '1', '0', '0', 4, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 delete from bt_sys_res where RES_NAME='�������' and sys_code='cms' and RES_LEVEL=2;
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�������', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/cmsLoanAnnul.do?method=initQuery', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 
 delete from bt_sys_res where RES_NAME='�����̨��' and sys_code='cms' and RES_LEVEL=2;
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�����̨��', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '/cms/cmsLoanRepay.do?method=initQuery', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 
 delete from bt_sys_res where RES_NAME='�ʽ�ռ�÷�' and sys_code='cms' and RES_LEVEL=2;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�ʽ�ռ�÷�', 'cms', (select res_code from bt_sys_res where res_name='����̨�˹���' and sys_code='cms'), '', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, '');
 
 delete from bt_sys_res where RES_NAME='�Ʒ�' and sys_code='cms' and RES_LEVEL=3;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�Ʒ�', 'cms', (select res_code from bt_sys_res where res_name='�ʽ�ռ�÷�' and sys_code='cms'), '/cms/billing.do?method=toList', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 delete from bt_sys_res where RES_NAME='����ռ�÷�' and sys_code='cms' and RES_LEVEL=3;
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '����ռ�÷�', 'cms', (select res_code from bt_sys_res where res_name='�ʽ�ռ�÷�' and sys_code='cms'), '/cms/accountingFee.do?method=toList', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 delete from bt_sys_res where RES_NAME='�ɷѼ�¼' and sys_code='cms' and RES_LEVEL=3;
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '�ɷѼ�¼', 'cms', (select res_code from bt_sys_res where res_name='�ʽ�ռ�÷�' and sys_code='cms'), '/cms/cmsPaymentRecord.do?method=toList', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 3, '');
 
 
 DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='��������¼��' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 values ((select max(res_code) + 1 from bt_sys_res), '��������¼��', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/loan_add.jsp', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/
   DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
    values ((select max(res_code) + 1 from bt_sys_res), '�����', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

     DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/

DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE RES_NAME='�����ͬ����' and sys_code='cms' and RES_LEVEL=2 and father_code=(select res_code from bt_sys_res where res_name='�������' and sys_code='cms');
   IF VN_COUNT = 0 THEN
     insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
     values ((select max(res_code) + 1 from bt_sys_res), '�����ͬ����', 'cms', (select res_code from bt_sys_res where res_name='�������' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0'||chr(38)||'opflag=1', '0', '1', '0', '0', 13, '', '', '', '', '', '', null, null, null, null, null, 2, ''); 
   END IF;
end;
/
commit;


--�޸����ڣ�20121228
--�޸��ˣ�huangxuean
--�޸����ݣ����������ǰ������
--������¼���뷢�ű�
insert into CMS_PROVIDE_LOAN_SEND(BILL_CODE,father_code,contract_code,money,SEND_DATE,DEADLINE_DATE,repay_type,
               corp_id,rmk,NEXTCHECKER,APPROVES,op,status,PL_RATE,DEFERRED_RATE,OVERDUE_RATE,ACC_CODE,
         voucher_no,order_no,tallier_code,float_way,rate_entries_effect_date,interest_way,
               REFERENCE_RATE_TYPE,REPAY_CYCLE,POINTS_PROPORTION_SELECT,POINTS_PROPORTION_TEXT,ENTER_DATE,LOAN_SEND_OUT_TYPE,IS_SKIP_PROCESS,CUR_CODE)
select replace(bill_code,'B1','C3'),
       loan.bill_code,
       loan.contract_no,
       loan.PL_MONEY,
        loan.PL_DATE,
  loan.REPAY_DATE,
       loan.repay_type,
       loan.corp_id,
       loan.RMK,
       loan.NEXT_CHECKER,
       loan.APPROVES,
       loan.op,
       loan.status,
       loan.PL_RATE,
       loan.DEFERRED_RATE,
       loan.OVERDUE_RATE,
       loan.ACC_CODE,
       loan.VOUCHER_NO,
       loan.ORDER_NO,
       loan.TALLIER_CODE,
       loan.FLOAT_WAY,
       loan.RATE_ENTRIES_EFFECT_DATE,
       loan.INTEREST_WAY,
       loan.REFERENCE_RATE_TYPE,
       loan.REPAY_CYCLE,
       loan.POINTS_PROPORTION_SELECT,
       loan.POINTS_PROPORTION_TEXT,
       loan.ENTER_DATE,
       '1',
       '1',
       loan.CUR_CODE
  from CMS_PROVIDE_LOAN_info loan
 where
    status in (102, 103, 104)
   and PL_MONEY >= (select nvl(sum(repay_money), 0)
                       from cms_provide_loan_repay
                      where loan.bill_code = cms_provide_loan_repay.pli_code
                        and cms_provide_loan_repay.status <> -2)
   and not exists(select 1 from CMS_PROVIDE_LOAN_SEND send where  send.father_code = loan.bill_code); 
 update CMS_PROVIDE_LOAN_INFO set LOAN_SEND_OUT_TYPE='1',IS_SKIP_PROCESS='1' where status>=102;

   --�޸Ļ�����е�li_code
 update CMS_PROVIDE_LOAN_REPAY
    set send_code = (select replace(loan.bill_code, 'B1', 'C3')
                     from CMS_PROVIDE_LOAN_INFO loan
                    where status in (102, 103, 104)
                      and pli_code = loan.bill_code
                      and loan.pl_money >=
                          (select nvl(sum(repay_money), 0)
                             from CMS_PROVIDE_LOAN_REPAY r
                            where loan.bill_code =
                                  r.pli_code
                              and r.status <> -2))
  where exists
  (select 1
           from CMS_PROVIDE_LOAN_INFO loan
          where status in (102, 103, 104)
            and pli_code = bill_code
            and loan.pl_money >=
                (select nvl(sum(repay_money), 0)
                   from CMS_PROVIDE_LOAN_REPAY
                  where loan.bill_code = CMS_PROVIDE_LOAN_REPAY.pli_code
                    and CMS_PROVIDE_LOAN_REPAY.status <> -2));
                        
                    
        commit; 

  

--�޸�չ�ڱ��е�                                         
update cms_pl_deferred d
   set d.pli_code = (select replace(bill_code, 'B1', 'C3')
                    from cms_provide_loan_info loan
                   where status in (102, 103, 104)
                     and pli_code = bill_code
                     and pl_money >=
                         (select nvl(sum(repay_money), 0)
                            from cms_provide_loan_repay
                           where loan.bill_code =
                                 cms_provide_loan_repay.pli_code
                             and cms_provide_loan_repay.status <> -2))
 where exists
 (select 1
          from cms_provide_loan_info loan
         where status in (102, 103, 104)
           and pli_code = bill_code
           and loan.pl_money >=
               (select nvl(sum(repay_money), 0)
                  from cms_provide_loan_repay
                 where loan.bill_code = cms_provide_loan_repay.pli_code
                   and cms_provide_loan_repay.status <> -2));

-- �м�ҵ��� 
alter table CMS_PROVIDE_LOAN_SEND add interbusexpenses NUMBER(15,2)  default 0.00;

UPDATE CMS_PROVIDE_LOAN_SEND t SET t.interbusexpenses=0.00 WHERE t.interbusexpenses is null;
UPDATE CMS_PROVIDE_LOAN_SEND t SET t.POINTS_PROPORTION_TEXT=0.00 WHERE t.POINTS_PROPORTION_TEXT is null;
alter table cms_loan_deferred add expiry_handle_type varchar2(5);

--�޸����ڣ�20121226
--�޸��ˣ�������
--�޸����ݣ�����ֶ�

DECLARE
  V_CNT_0 INTEGER;

BEGIN
  SELECT COUNT(1) INTO V_CNT_0 FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'CMS_PROVIDE_LOAN_SEND' AND COLUMN_NAME = 'RATETIMEOFTAKEEFFECT';
  IF V_CNT_0 = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE CMS_PROVIDE_LOAN_SEND ADD RATETIMEOFTAKEEFFECT Date';
  END IF;
END;
/

--�޸����ڣ�2012.12.31
--�޸��ˣ�andy.huang
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����
--չ�ڵ��ڴ�������
alter table cms_loan_deferred add expiry_handle_type varchar2(5);
