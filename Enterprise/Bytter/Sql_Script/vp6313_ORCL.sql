--�޸�ʱ��2012-08-23
--�޸��� ���
--�޸����� ������ͼv_erp_external_cash_yph
--�޸�ԭ�� �ͻ�����
create or replace view v_erp_external_cash_yph as
select
b.serial_id,--����
b.bank_acc,--�տ��˺�
 case when ( select  corp_code from v_acc_list v where v.bank_acc=b.bank_acc) is null
      then (select corp_code from bt_bankacc_app bt where bt.bankacc=b.bank_acc)
      else (select  corp_code from v_acc_list v where v.bank_acc=b.bank_acc)
      end  as corp_code,--�տ��˺����ڵ�λ
(select prov from v_acc_list v where v.bank_acc=b.bank_acc) as prov,--�տ��˺�����ʡ
b.acc_name,--�տ��
b.bank_name,--�տ�����
b.cur,--�ұ�
b.AMT,--�տ���
b.uses,
b.TRANS_TIME,
e.TRAFFIC_TYPE,--ҵ�����ͣ��ͻ���C���ǿͻ���F
e.status,
b.opp_acc_name,
b.opp_acc_no,
b.opp_acc_bank,
e.IS_IMPORT,
e.receipt_date,
e.customer_name,
e.customer_bank_account,
e.customer_bank_name,
e.outer_num,
(select max(vendor_num) from bt_external_corp where external_corp = b.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = b.bank_acc))--ͨ���ʺŲ�ѯ��corp_code ��ͨ��copr_code��bt_corp��ѯ��id
as vendor_num1,
(select case when count(vendor_num)=1 then max(vendor_num) when count(vendor_num)>1 then 'D' else '' end from bt_external_corp where external_corp = b.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = b.bank_acc))--ͨ���ʺŲ�ѯ��corp_code ��ͨ��copr_code��bt_corp��ѯ��id
as vendor_num,
e.rmk
from bis_acc_his_dtl b
left join erp_external_cash e on trim(b.serial_id) = e.receipt_number where b.cd_sign = '0'
union
select
n.serial_id,--����
n.bank_acc,--�տ��˺�
 case when ( select  corp_code from v_acc_list v where v.bank_acc=n.bank_acc) is null
      then (select corp_code from bt_bankacc_app bt where bt.bankacc=n.bank_acc)
      else (select  corp_code from v_acc_list v where v.bank_acc=n.bank_acc)
      end  as corp_code,--�տ��˺����ڵ�λ
(select prov from v_acc_list v where v.bank_acc=n.bank_acc) as prov,--�տ��˺�����ʡ
n.acc_name,--�տ��
n.bank_name,--�տ�����
n.cur,--�ұ�
n.AMT,--�տ���
n.uses,
n.TRANS_TIME,
e.TRAFFIC_TYPE,--ҵ�����ͣ��ͻ���C���ǿͻ���F
e.status,
n.opp_acc_name,
n.opp_acc_no,
n.opp_acc_bank,
e.IS_IMPORT,
e.receipt_date,
e.customer_name,
e.customer_bank_account,
e.customer_bank_name,
e.outer_num,
(select max(vendor_num) from bt_external_corp where external_corp = n.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = n.bank_acc))--ͨ���ʺŲ�ѯ��corp_code ��ͨ��copr_code��bt_corp��ѯ��id
as vendor_num1,
(select case when count(vendor_num)=1 then max(vendor_num) when count(vendor_num)>1 then 'D' else '' end from bt_external_corp where external_corp = n.opp_acc_name and corp_id in
(select id from bt_corp btc,v_acc_list v  where btc.corp_code =v.CORP_CODE and v.BANK_ACC = n.bank_acc))--ͨ���ʺŲ�ѯ��corp_code ��ͨ��copr_code��bt_corp��ѯ��id
as vendor_num,
e.rmk
from bis_acc_dtl n
left join erp_external_cash e on trim(n.serial_id) = e.receipt_number where n.cd_sign = '0';