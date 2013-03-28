--�޸����ڣ�20130125
--�޸��ˣ��ž���
--�޸�ԭ�����Ӳ�ѯ���ű���Ϣ
--ϵͳ����-���ü������н����ͼ��
IF EXISTS (SELECT * FROM sysobjects WHERE NAME = 'V_PLOADFINCOSTADDVIEW')  
DROP VIEW V_PLOADFINCOSTADDVIEW  
GO
CREATE VIEW V_PLOADFINCOSTADDVIEW AS
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
           send.bill_code as lasendCode,
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
 left join cms_provide_loan_send send on send.FATHER_CODE=cl.bill_code and send.status>=95
inner join bt_corp bl on cl.corp_id = bl.id  --���λid
inner join bt_bank bb on cl.BANK_CODE = bb.BANK_CODE
left join (select * from finanic_cost where status != -2) fc on fc.req_corp = cl.bill_code
left join finanic_cost_type fct on fc.cost_type = fct.type_code;
GO
