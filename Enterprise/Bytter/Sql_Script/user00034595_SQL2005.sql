 --����ڲ��������Ӳ�ѯ��ͼ
ALTER VIEW V_LOADFINCOSTADDVIEW AS
select
           fc.finanic_type, --��������
           cl.bill_code,     --���ݱ��/���ݱ���
           bl.id,           --���λid
           bl.corp_name,     --���λ/���뵥λ
           cl.net_code as load_corp,    --�ſλid
           bb.corp_name as brrowCorp_name,    --�ſλ/��λ
           cl.loan_date,       --�������
           cl.repay_date,       --��������
           --lasend.BILL_CODE as lasendCode,
           cl.lasendbillcode as lasendCode,
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
 from (select case when lasend.bill_code is null then cl.bill_code  
            when lasend.bill_code is not null then lasend.bill_code
            end as bill_codetemp,lasend.bill_code as lasendbillcode,cl.*
from (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl left join loan_send_out_info lasend on cl.bill_code = lasend.father_code) cl
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join (select * from finanic_cost where status != -2) fc on fc.bill_no = cl.bill_codetemp
left join finanic_cost_type fct on fc.cost_type = fct.type_code
GO

ALTER  view v_loadfincostview as
select
           fc.cost_no, --���ñ���
           fc.finanic_type, --��������
           bl.id,           --���λid
           bl.corp_name,     --���λ/���뵥λ
           fc.load_corp,    --�ſλid
           bb.corp_name as brrowCorp_name,    --�ſλ/��λ
           fc.bill_no as bill_code,     --���ݱ��/���ݱ���
           fct.type_code,   --��������code
           fct.type_name,    --��������
           fc.buss_time,    --����ʱ��
           fc.cost_amount,   --���ý��
           fc.commen as fcCommen, --��������
           fc.status,
           fc.guid,
           --lasend.BILL_CODE as lasendCode --���ű���
           cl.lasendbillcode as lasendCode
 from (select * from finanic_cost where status != -2) fc
inner join (select case when lasend.bill_code is null then cl.bill_code  
            when lasend.bill_code is not null then lasend.bill_code
            end as bill_codetemp,lasend.bill_code as lasendbillcode,cl.*
from (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl left join loan_send_out_info lasend on cl.bill_code = lasend.father_code) cl
on fc.bill_no = cl.bill_codetemp
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
GO

