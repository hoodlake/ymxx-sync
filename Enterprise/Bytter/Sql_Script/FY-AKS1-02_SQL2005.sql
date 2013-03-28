--�޸����ڣ�20121022
--�޸��ˣ��߷�
--�޸����ݣ�FY-AKS1-02 ϵͳ����-���ü���
--�޸����ݣ�ϵͳ�˵� ���� ���ü���
--�������ã�
INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '���ü���', 'cms', RES_CODE, '/cms/financiCount.do?method=initQuery', '0', '1', '0', '0', (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '���ù���' AND T3.SYS_CODE = 'cms'
go

/*==============================================================*/
/* Table: FINANIC_COST                                          */
/*==============================================================*/
--���ù�����ü����
create table FINANIC_COST  (
   GUID                 VARCHAR(40)                     not null,
   COST_NO              VARCHAR(40),
   FINANIC_TYPE         INT,
   REQ_CORP             NATIONAL CHAR VARYING(40),
   LOAD_CORP            VARCHAR(40),
   BILL_NO              VARCHAR(40),
   BUSS_TIME            DATETIME,
   COST_TYPE            VARCHAR(40),
   COST_AMOUNT          NUMERIC(18,2),
   COMMEN               VARCHAR(255),
   STATUS               INT,
   OP_CODE              VARCHAR(40),
   CREATE_TIME          DATETIME,
   UPDATE_TIME          DATETIME,
   UPDATER              VARCHAR(40),
   NEXT_CHECKER VARCHAR(150),     --��һ��������
   APPROVES VARCHAR(200),         --��ǰ������     
   PASS_DATE DATETIME,                 --����ͨ��ʵ��
   CORP_ID NUMERIC(10),             --����id
   constraint PK_FINANIC_COST primary key (GUID)
)

alter table FINANIC_COST
   add constraint FK_FINANIC__COST_TYPE_FINANIC_ foreign key (COST_TYPE)
      references FINANIC_COST_TYPE (TYPE_CODE)
go
      
 --����ڲ��������Ӳ�ѯ��ͼ
CREATE VIEW V_LOADFINCOSTADDVIEW AS
select
           fc.finanic_type, --��������
           cl.bill_code,     --���ݱ��/���ݱ���
           bl.id,           --���λid
           bl.corp_name,     --���λ/���뵥λ
           --fc.load_corp,    --�ſλid
           cl.net_code as load_corp,    --�ſλid
           bb.corp_name as brrowCorp_name,    --�ſλ/��λ
           cl.loan_date,       --�������
           cl.repay_date,       --��������
           lasend.BILL_CODE as lasendCode,
           cl.enter_date,     --¼������,
          (SELECT bc.cur_name FROM  bt_currency bc where bc.cur_code =  cl.cur_code) as  curName, --�ұ�
          cl.loan_money,
          fc.buss_time,
          fct.type_name,  --������������
          --���ý�� ��ע ״̬
          fc.cost_amount,
          fc.commen as fcComment,
          fc.status,
          fc.guid     --���ü���id
 from (select * from cms_loan_info where (STATUS !=-2 and STATUS != 0)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
left join loan_send_out_info lasend on cl.bill_code = lasend.father_code
go

--����ڲ�����Ĳ�ѯ��ͼ
create  view v_loadfincostview as
select
           fc.cost_no, --���ñ���
           fc.finanic_type, --��������
           bl.id,           --���λid
           bl.corp_name,     --���λ/���뵥λ
           fc.load_corp,    --�ſλid
           bb.corp_name as brrowCorp_name,    --�ſλ/��λ
           cl.bill_code,     --���ݱ��/���ݱ���
           fct.type_code,   --��������code
           fct.type_name,    --��������
           fc.buss_time,    --����ʱ��
           fc.cost_amount,   --���ý��
           fc.commen as fcCommen, --��������
           fc.status,
           fc.guid
 from (select * from finanic_cost where status != -2) fc
inner join (select * from cms_loan_info where (STATUS !=-2 and STATUS != 0)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
go

insert into bt_approve_business
  (BUSINESS_CODE,
   SYS_CODE,
   BUSINESS_NAME,
   BUSINESS_LEVEL,
   TABLE_NAME,
   BILL_CODE_FIELD2,
   MONEY_FIELD,
   TABLE_FIELD,
   NEXT_CHECKER_FIELD,
   BILL_CODE_FIELD,
   URL1,
   URL2,
   URL3,
   URL4,
   URL5,
   CLASS_PATH,
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
   TOTAL_SET)
values
  ('cms_finat',
   'cms',
   '���ü���',
   'A,B,C',
   'FINANIC_COST',
   '',
   'COST_AMOUNT',
   '',
   'next_checker',
   'COST_NO',
   '../cms/FinanciView.jsp',
   '',
   '',
   '',
   '',
   'com.byttersoft.cms.form.FinanciCountForm',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   '')
go

INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '����ͳ��', 'cms', RES_CODE, '/cms/financiCount.do?method=initQuery'+char(38)+'total=true', '0', '1', '0', '0', (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '���ù���' AND T3.SYS_CODE = 'cms';
go

CREATE  VIEW V_PLOADFINCOSTADDVIEW AS
select
           fc.finanic_type, --��������
           cl.bill_code,     --���ݱ��/���ݱ���
           bl.id,           --���λid
           bl.corp_name,     --���λ/���뵥λ
           cl.BANK_CODE as load_corp,    --�ſλid
           bb.bank_name as brrowCorp_name,    --�ſλ/��λ
           cl.BANK_TYPE,                       --�ſ���������
           cl.pl_date as loan_date,       --�������
           cl.repay_date,       --��������
           --lasend.BILL_CODE as lasendCode,
           cl.enter_date,     --¼������,
          (SELECT bc.cur_name FROM  bt_currency bc where bc.cur_code =  cl.cur_code) as  curName, --�ұ�
          cl.pl_money as loan_money,
          fc.buss_time,
          fct.type_name,  --������������
          --���ý�� ��ע ״̬
          fc.cost_amount,
          fc.commen as fcComment,
          fc.status,
          fc.guid     --���ü���id
 from (select * from CMS_PROVIDE_LOAN_INFO where (STATUS !=-2 and STATUS != 0)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_bank bb on cl.BANK_CODE = bb.BANK_CODE
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
go

create  view v_ploadfincostview as
select
           fc.cost_no, --���ñ���
           fc.finanic_type, --��������
           bl.id,           --���λid
           bl.corp_name,     --���λ/���뵥λ
           fc.load_corp,    --�ſλid
           bb.bank_name as brrowCorp_name,    --�ſλ/��λ
           cl.BANK_TYPE,                       --�ſ���������
           cl.bill_code,     --���ݱ��/���ݱ���
           fct.type_code,   --��������code
           fct.type_name,    --��������
           fc.buss_time,    --����ʱ��
           fc.cost_amount,   --���ý��
           fc.commen as fcCommen, --��������
           fc.status,
           fc.guid
 from finanic_cost fc
inner join cms_provide_loan_info cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_bank bb on cl.bank_code = bb.bank_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
where fc.status != -2