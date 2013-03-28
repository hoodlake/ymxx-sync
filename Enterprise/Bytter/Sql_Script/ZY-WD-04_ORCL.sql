--�½��� CMS_PRECATIVE_LOAN_CCAL ί�д���������Ϣ
--������
-- Create table
create table CMS_PRECATIVE_LOAN_CCAL
(
  BILL_CODE       VARCHAR2(20) not null,
  CALCUALTE_DATE  DATE not null,
  PRECATIVE_ID    NUMBER(10),
  APP_CODE        VARCHAR2(20),
  MONEY           NUMBER(15,2),
  FUNDING_GAP     NUMBER(15,2),
  CURRENCY        CHAR(2),
  TERM            NUMBER,
  CORP_ID         NUMBER(10),
  R_MONEY         NUMBER(15,2),
  REDUNDANCY_ID   NUMBER,
  REDUNDANCY_DATE DATE,
  PERIOD          NUMBER(10),
  CAPITAL_COST    NUMBER(8,2),
  ID              NUMBER not null,
  BATCH_CODE      VARCHAR2(30),
  constraint PK_CMS_PRECATIVE_LOAN_CCAL primary key (ID)
);
create index INDEX_CMS_PRECATIVE_LOAN_CCAL on CMS_PRECATIVE_LOAN_CCAL (BILL_CODE, APP_CODE);

comment on column CMS_PRECATIVE_LOAN_CCAL.BILL_CODE
  is '���㵥��';
comment on column CMS_PRECATIVE_LOAN_CCAL.CALCUALTE_DATE
  is '��������';
comment on column CMS_PRECATIVE_LOAN_CCAL.PRECATIVE_ID
  is '��λ';
comment on column CMS_PRECATIVE_LOAN_CCAL.APP_CODE
  is '���뵥��';
comment on column CMS_PRECATIVE_LOAN_CCAL.MONEY
  is '������';
comment on column CMS_PRECATIVE_LOAN_CCAL.FUNDING_GAP
  is '�ʽ�ȱ��';
comment on column CMS_PRECATIVE_LOAN_CCAL.CURRENCY
  is '����ұ�';
comment on column CMS_PRECATIVE_LOAN_CCAL.TERM
  is '��������';
comment on column CMS_PRECATIVE_LOAN_CCAL.CORP_ID
  is '��Ա��λ';
comment on column CMS_PRECATIVE_LOAN_CCAL.R_MONEY
  is '�����ʽ�������Ԫ��';
comment on column CMS_PRECATIVE_LOAN_CCAL.REDUNDANCY_ID
  is '����Ǽ�ID';
comment on column CMS_PRECATIVE_LOAN_CCAL.REDUNDANCY_DATE
  is '�ϱ�ʱ��';
comment on column CMS_PRECATIVE_LOAN_CCAL.PERIOD
  is '�����ʽ����ڣ��£�';
comment on column CMS_PRECATIVE_LOAN_CCAL.CAPITAL_COST
  is '�ʽ�ɱ�%';
comment on column CMS_PRECATIVE_LOAN_CCAL.ID
  is '����';
comment on column CMS_PRECATIVE_LOAN_CCAL.BATCH_CODE
  is '�������';


--�½���ͼ

create or replace view v_valid_bt_redundancy_money as
select money.ID,
       money.CORP_ID,
       money.R_MONEY,
       money.CUR_CODE,
       money.PERIOD,
       money.CAPITAL_COST,
       money.EFFECTIVI_DATE,
       money.OP_DATE,
       money.OP_NAME,
       money.OP_CODE,
       money.APPROVES,
       money.STATUS,
       money.NEXTCHECKER,
       money.UPDATE_TIME,
       money.UPDATE_NAME,
       money.UPDATE_CODE,
       money.RMK,
       money.ACC_NO,
       money.BILL_MONEY,
       corp.corp_code,
       corp.corp_name,
       cur.cur_name
--��Ч�����ʽ�
  from BT_REDUNDANCY_MONEY money, bt_corp corp, bt_currency cur
 where money.corp_id = corp.id
   and cur.cur_code = money.cur_code
   and money.id in (select max(id)
                      from BT_REDUNDANCY_MONEY
                     where status = 97
                     group by corp_id, cur_code);
/



create or replace view v_cms_precative_loan_ccal as
select cms.BILL_CODE,
       cms.CALCUALTE_DATE,
       cms.PRECATIVE_ID,
       cms.APP_CODE,
       cms.MONEY,
       cms.FUNDING_GAP,
       cms.CURRENCY,
       cms.TERM,
       cms.CORP_ID,
       cms.R_MONEY,
       cms.REDUNDANCY_ID,
       cms.REDUNDANCY_DATE,
       cms.PERIOD,
       cms.CAPITAL_COST,
       cms.ID,
       cms.BATCH_CODE,
       corp.corp_name precative_corp_name,
       cur.cur_name
  from cms_precative_loan_ccal cms, bt_corp corp, bt_currency cur
 where cms.precative_id = corp.id
   and cms.currency = cur.cur_code;
/


create or replace view v_distinct_precative_loan_ccal as
select distinct cms.bill_code,
                cms.app_code,
                cms.funding_gap finding_gap,
                corp.id corp_id,
                cur.cur_code,
                corp.corp_code,
                corp.corp_name,
                cur.cur_name
  from cms_precative_loan_ccal cms, bt_corp corp, bt_currency cur
 where cms.corp_id = corp.id
   and cms.currency = cur.cur_code;
/


--�˵�  �Ŵ�����>>ί�д���>>�ɱ���������

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='cms' AND t1.res_name='�ɱ���������' AND t1.res_url='/cms/cmsPrecativeLoanCcalAction.do?method=goPrecativeLoanCcal';
  IF VN_COUNT < 1 THEN
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  select  (select max(res_code)+1 from bt_sys_res) , '�ɱ���������', 'cms', (select res_code from bt_sys_res where sys_code='cms' and res_name='ί�д���' and father_code=0), '/cms/cmsPrecativeLoanCcalAction.do?method=goPrecativeLoanCcal', '0', '0', '0', '0', 9, '��Զ', '', '', '', '', '', null, null, null, null, null, 1, ''
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms' and father_code=0;
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
 from bt_key_generator where keyalisename='CMS_PRECATIVE_LOAN_CCAL' and genstrate='cu';
 if VN_count<1 then 
    insert into bt_key_generator(id,keyalisename,custgenclass,genstrate)
    values((select max(id)+1 from bt_key_generator),'CMS_PRECATIVE_LOAN_CCAL','com.byttersoft.keyservice.usrdefgenerator.CmsPrecativeLoanCcalKeyGenerator','cu');
  end if;
  commit;
end; 
/