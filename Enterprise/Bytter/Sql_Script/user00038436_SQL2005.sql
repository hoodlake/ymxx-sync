--�޸����ڣ�20130121
--�޸��ˣ���ѧ��
--�޸����ݣ����ӽ�����ͼ
DROP VIEW v_cms_provide_loan;
create  view v_cms_provide_info_send as 
select s.bill_code as BILL_CODE,s.money as MONEY,s.cur_code as CUR_CODE,i.bank_code as BANK_CODE,i.bank_name as BANK_NAME,s.status as STATUS,s.corp_id as CORP_ID,s.send_date as SEND_DATE from cms_provide_loan_send s,cms_provide_loan_info i 
where i.bill_code=s.father_code;

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
           fc.guid,
           send.bill_code as lasendCode
 from finanic_cost fc
inner join (select * from cms_provide_loan_info where (STATUS !=110 and STATUS >= 97)) cl on fc.req_corp = cl.bill_code
left join cms_provide_loan_send send on send.FATHER_CODE=cl.bill_code and send.status>=95
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_bank bb on cl.bank_code = bb.bank_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code
where fc.status != -2;
