 --����ڲ��������Ӳ�ѯ��ͼ
alter VIEW V_LOADFINCOSTADDVIEW AS
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
 from (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
left join loan_send_out_info lasend on cl.bill_code = lasend.father_code
go

--����ڲ�����Ĳ�ѯ��ͼ
alter view v_loadfincostview as
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
inner join (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
go

--���н����ͼ��
alter VIEW V_PLOADFINCOSTADDVIEW AS
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
 from (select * from CMS_PROVIDE_LOAN_INFO where (STATUS !=110 and STATUS >= 97)) cl
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_bank bb on cl.BANK_CODE = bb.BANK_CODE
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
go

alter view v_ploadfincostview as
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
inner join (select * from cms_provide_loan_info where (STATUS !=110 and STATUS >= 97)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_bank bb on cl.bank_code = bb.bank_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
where fc.status != -2
go