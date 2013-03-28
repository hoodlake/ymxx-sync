--����ڲ�����Ĳ�ѯ��ͼ
ALTER view v_loadfincostview as
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
           fc.guid,
           lasend.BILL_CODE as lasendCode --���ű���
 from (select * from finanic_cost where status != -2) fc
inner join (select * from cms_loan_info where (STATUS !=110 and STATUS >= 96)) cl on fc.req_corp = cl.bill_code
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_corp bb on cl.net_code = bb.corp_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
left join loan_send_out_info lasend on cl.bill_code = lasend.father_code
go