
--�޸����ڣ�2012.11.09
--�޸��ˣ����¾�
--�޸����ݣ���Զ,���ʼƻ�
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'FBS_FINANC_PLAN';
   IF VN_COUNT < 1 THEN   
  VC_STR := VC_STR || 'create table FBS_FINANC_PLAN ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   ID                   NUMBER(10) PRIMARY KEY , ';
  VC_STR := VC_STR || '   PLAN_CODE            VARCHAR2(50), ';
  VC_STR := VC_STR || '   PLAN_NAME            VARCHAR2(200), ';
  VC_STR := VC_STR || '   PLAN_YEAR            VARCHAR2(4), ';
  VC_STR := VC_STR || '   PLAN_TYPE            VARCHAR2(4), ';
  VC_STR := VC_STR || '   PLAN_STATUS          NUMBER(2), ';
  VC_STR := VC_STR || '   GATHER_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   IS_GATHER            NUMBER(2), ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(4), ';
  VC_STR := VC_STR || '   UNIT                 VARCHAR2(4) ';
  VC_STR := VC_STR || ') ';
  EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column FBS_FINANC_PLAN.PLAN_CODE is '�������';
comment on column FBS_FINANC_PLAN.PLAN_NAME is '��������';
comment on column FBS_FINANC_PLAN.PLAN_YEAR is '�������';
comment on column FBS_FINANC_PLAN.PLAN_TYPE is '�������';
comment on column FBS_FINANC_PLAN.PLAN_STATUS is '����״̬';
comment on column FBS_FINANC_PLAN.GATHER_ID is '����ID';
comment on column FBS_FINANC_PLAN.IS_GATHER is '����ID:1��ʾ����,0���߿ձ�ʾ���ǻ���';
comment on column FBS_FINANC_PLAN.UNIT is '��λ 1ǧԪ 0 Ԫ';


DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'FBS_FINANC_PLAN_DETAIL';
   IF VN_COUNT < 1 THEN   
  VC_STR := VC_STR || 'create table FBS_FINANC_PLAN_DETAIL  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   ID                   NUMBER  PRIMARY KEY , ';
  VC_STR := VC_STR || '   PROJECT_NAME         VARCHAR2(200), ';
  VC_STR := VC_STR || '   PROJECT_CODE         VARCHAR2(500), ';
  VC_STR := VC_STR || '   CUR_CODE             VARCHAR2(4), ';
  VC_STR := VC_STR || '   BORROWER             VARCHAR2(200), ';
  VC_STR := VC_STR || '   CONSIGNER            VARCHAR2(200), ';
  VC_STR := VC_STR || '   USURER               VARCHAR2(200), ';
  VC_STR := VC_STR || '   CONTRACT_NO          VARCHAR2(50), ';
  VC_STR := VC_STR || '   RATE                 NUMBER(10,6), ';
  VC_STR := VC_STR || '   START_DATE           DATE, ';
  VC_STR := VC_STR || '   END_DATE             DATE, ';
  VC_STR := VC_STR || '   LOAN_NATURE          VARCHAR2(50), ';
  VC_STR := VC_STR || '   CONTRACT_AMT         NUMBER(15,2), ';
  VC_STR := VC_STR || '   START_AMT            NUMBER(15,2), ';
  VC_STR := VC_STR || '   DRAWING_AMT          NUMBER(15,2), ';
  VC_STR := VC_STR || '   REVERT_AMT           NUMBER(15,2), ';
  VC_STR := VC_STR || '   END_AMT              NUMBER(15,2), ';
  VC_STR := VC_STR || '   RMK                  VARCHAR2(200), ';
  VC_STR := VC_STR || '   ORDER_NO             NUMBER(3), ';
  VC_STR := VC_STR || '   FFP_ID               NUMBER(10), ';
  VC_STR := VC_STR || '   USURER_INOUT         VARCHAR2(50), ';
  VC_STR := VC_STR || '   HEAD_BANK            VARCHAR2(200), ';
  VC_STR := VC_STR || '   SUB_BANK             VARCHAR2(200), ';
  VC_STR := VC_STR || '   GUARANTOR            VARCHAR2(200), ';
  VC_STR := VC_STR || '   GUARANT_CONTRACT     VARCHAR2(50), ';
  VC_STR := VC_STR || '   BELONG_SUB_COP       VARCHAR2(200), ';
  VC_STR := VC_STR || '   TF_TYPE              VARCHAR2(50), ';
  VC_STR := VC_STR || '   TF_DETAIL            VARCHAR2(50) ';
  VC_STR := VC_STR || ') ';
  EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column FBS_FINANC_PLAN_DETAIL.ID is 'ID';
comment on column FBS_FINANC_PLAN_DETAIL.PROJECT_NAME is '��Ŀ����';
comment on column FBS_FINANC_PLAN_DETAIL.PROJECT_CODE is '��Ŀ����';
comment on column FBS_FINANC_PLAN_DETAIL.CUR_CODE is '�ұ�';
comment on column FBS_FINANC_PLAN_DETAIL.BORROWER is '�����';
comment on column FBS_FINANC_PLAN_DETAIL.CONSIGNER is 'ί����';
comment on column FBS_FINANC_PLAN_DETAIL.USURER is '������(����)';
comment on column FBS_FINANC_PLAN_DETAIL.CONTRACT_NO is '����ͬ��';
comment on column FBS_FINANC_PLAN_DETAIL.RATE is '������';
comment on column FBS_FINANC_PLAN_DETAIL.START_DATE is '��ʼ��';
comment on column FBS_FINANC_PLAN_DETAIL.END_DATE is '������';
comment on column FBS_FINANC_PLAN_DETAIL.LOAN_NATURE is '�������';
comment on column FBS_FINANC_PLAN_DETAIL.CONTRACT_AMT is '��ͬ���';
comment on column FBS_FINANC_PLAN_DETAIL.START_AMT is '�ڳ����';
comment on column FBS_FINANC_PLAN_DETAIL.DRAWING_AMT is '���ý��';
comment on column FBS_FINANC_PLAN_DETAIL.REVERT_AMT is '�黹���';
comment on column FBS_FINANC_PLAN_DETAIL.END_AMT is '��ĩ���';
comment on column FBS_FINANC_PLAN_DETAIL.RMK is '��ע';
comment on column FBS_FINANC_PLAN_DETAIL.ORDER_NO is '˳���';
comment on column FBS_FINANC_PLAN_DETAIL.USURER_INOUT is '�������������';
comment on column FBS_FINANC_PLAN_DETAIL.HEAD_BANK is '����';
comment on column FBS_FINANC_PLAN_DETAIL.SUB_BANK is '֧��';
comment on column FBS_FINANC_PLAN_DETAIL.GUARANTOR is '��Ѻ������';
comment on column FBS_FINANC_PLAN_DETAIL.GUARANT_CONTRACT is '������ͬ';
comment on column FBS_FINANC_PLAN_DETAIL.BELONG_SUB_COP is '����������˾';
comment on column FBS_FINANC_PLAN_DETAIL.TF_TYPE is 'ó������Ʒ��';
comment on column FBS_FINANC_PLAN_DETAIL.TF_DETAIL is 'ó��������ϸ';



---�˵��б� 
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '���ʼƻ�����' and sys_code = 'fbs'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '���ʼƻ�����', 'fbs', (select res_code from bt_sys_res  where res_name = 'Ԥ���ϱ�' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toFillInList', '0', '1', '0', '0', 10, '���ʼƻ�����', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '���ʼƻ��ϱ�' and sys_code = 'fbs'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '���ʼƻ��ϱ�', 'fbs', (select res_code from bt_sys_res  where res_name = 'Ԥ���ϱ�' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toReportToLeaderList', '0', '1', '0', '0', 11, '���ʼƻ��ϱ�', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '���ʼƻ�����' and sys_code = 'fbs'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '���ʼƻ�����', 'fbs', (select res_code from bt_sys_res  where res_name = 'Ԥ���ϱ�' and sys_code = 'fbs' ), '/budget/financPlan/selectCorp.jsp?method=toGatherList', '0', '1', '0', '0', 12, '���ʼƻ�����', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/


commit;


alter table FBS_FINANC_PLAN_DETAIL modify RMK VARCHAR2(400);





