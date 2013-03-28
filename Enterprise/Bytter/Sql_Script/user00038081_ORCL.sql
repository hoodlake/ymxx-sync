--�޸��ˣ���˫
--�޸����ڣ�2012-1-18
--�޸����ݣ����ڽű�����˳�������ط�������ͼ�ű�
create or replace view view_bis_acc_his_dtl_buget as
select dtl.serial_id serial_id,
       dtl.trans_time trans_time, --��������
       corp.id corp_id, --��λId
       corp.corp_name corp_name, --��λ����
       dtl.acc_name acc_name, --�տ���
       dtl.bank_acc bank_acc, --�տ��˺�
       dtl.bank_name bank_name, --�տ����
       currency.cur_name cur, --�ұ�
       currency.cur_code cur_code,
       dtl.amt amt, --���
       dtl.opp_acc_no opp_acc_no, --�����˺�
       dtl.opp_acc_name opp_acc_name, --�����˻�����
       dtl.opp_acc_bank opp_acc_bank, --�������
       dtl.abs abs, --��;
       dtl.cd_sign cd_sign, --��֧����
       dtl.nz_stauts nz_stauts, --��ת״̬
       dtl.bill_status, --����״̬
       dtl.subject_code, --ƥ����ҵ��Ŀ
       dtl.subject_name, --ƥ����ҵ��Ŀ
       dtl.business_type, --ҵ������
       dtl.cost_center_code, --�ɱ�����
       dtl.postscript, --��;
       dtl.data_sources_code, --������Դ
       dtl.SUPER_SUBJECT_CODE,
       fi.name budget_code_name, --ƥ��Ԥ������
       dtl.budget_code budget_code_dtl,
       fi.name budget_name, --ƥ��Ԥ������
       dtl.budget_code budget_code,
       dtl.vendor_num vendor_num, --��Ӧ�̱���
       dtl.is_blend is_blend,
       dtl.unique_confirm unique_confirm,
       dtl.voucher_type, --ƾ֤����
       dtl.business_area, --ҵ��Χ
       dtl.Trans_Status, --����״̬��0�ɹ���1ʧ��
       dtl.Trans_Type, --�������ͣ�SAP/OMS/NC
       dtl.Return_Msg, --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       dtl.send_frequency --���ʹ���
  from bis_acc_his_dtl dtl
       left join fbs_item fi on fi.code =  dtl.budget_code
        ,v_acc_list acc, bt_corp corp,bt_currency currency
  where dtl.bank_acc = acc.BANK_ACC
     AND
    acc.CORP_CODE = corp.corp_code
    AND 
    acc.CUR = currency.cur_code
UNION
select dtl.serial_id serial_id,
       dtl.trans_time trans_time, --��������
       corp.id corp_id, --��λId
       corp.corp_name corp_name, --��λ����
       dtl.acc_name acc_name, --�տ���
       dtl.bank_acc bank_acc, --�տ��˺�
       dtl.bank_name bank_name, --�տ����
       currency.cur_name cur, --�ұ�
       currency.cur_code cur_code,
       dtl.amt amt, --���
       dtl.opp_acc_no opp_acc_no, --�����˺�
       dtl.opp_acc_name opp_acc_name, --�����˻�����
       dtl.opp_acc_bank opp_acc_bank, --�������
       dtl.abs abs, --��;
       dtl.cd_sign cd_sign, --��֧����
       dtl.nz_stauts nz_stauts, --��ת״̬
       dtl.bill_status, --����״̬
       dtl.subject_code, --ƥ����ҵ��Ŀ
       dtl.subject_name, --ƥ����ҵ��Ŀ
       dtl.business_type, --ҵ������
       dtl.cost_center_code, --�ɱ�����
       dtl.postscript, --��;
       dtl.data_sources_code, --������Դ
       dtl.SUPER_SUBJECT_CODE,
       fi.name budget_code_name, --ƥ��Ԥ������
       dtl.budget_code budget_code_dtl,
       fi.name budget_name, --ƥ��Ԥ������
       dtl.budget_code budget_code,
       dtl.vendor_num vendor_num, --��Ӧ�̱���
       dtl.is_blend is_blend,
       dtl.unique_confirm unique_confirm,
       dtl.voucher_type, --ƾ֤����
       dtl.business_area, --ҵ��Χ
       dtl.Trans_Status, --����״̬��0�ɹ���1ʧ��
       dtl.Trans_Type, --�������ͣ�SAP/OMS/NC
       dtl.Return_Msg, --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       dtl.send_frequency --���ʹ���
    from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code = dtl.budget_code
   ,bt_bankacc_app app, bt_corp corp,bt_currency currency 
  where dtl.bank_acc = app.BANKACC
     AND app.CORP_CODE = corp.corp_code
     AND app.cur = currency.cur_code;
/

create or replace view view_bis_acc_his_dtl_s_m_o as
select to_char(split.id) id,
       split.serial_id serial_id,
       split.nz_status nz_stauts,  --��ת״̬
       split.trans_time trans_time,      --��������
       split.corp_id  corp_id,                --��λId
       split.corp_name corp_name,       --��λ����
       split.acc_name acc_name,          --�տ���
       split.bank_acc bank_acc,          --�տ��˺�
       split.bank_name bank_name,        --�տ����
       split.cur_code cur_code,          --�ұ����
       split.cur cur,          --�ұ�����
       split.amt amt,                    --���
       split.opp_acc_no opp_acc_no,      --�����˺�
       split.opp_acc_name opp_acc_name,  --�����˻�����
       split.opp_acc_bank opp_acc_bank,  --�������
       split.abs abs,                    --��;
       split.cd_sign cd_sign,            --��֧����
       split.budget_code budget_code,--ƥ��Ԥ���Ŀ
       split.budget_name budget_name, --ƥ��Ԥ������
       split.subject_code subject_code,--ƥ����ҵ��Ŀ
       split.subject_name subject_name, --ƥ����ҵ��Ŀ
       split.business_type,              --ҵ������
       split.cost_center_code,              --�ɱ�����
       split.postscript,              --��;
       split.data_sources_code,                       --������Դ
       split.SUPER_SUBJECT_CODE,       --�ϼ���ƿ�Ŀ
       split.is_bl is_bl,             --�Ƿ񹴶�  0 ����   1 ��
       split.vendor_num vendor_num,
       '2' as IS_SPLIT_MERGN_ONE,
       split.Trans_Status,            --����״̬��0�ɹ���1ʧ��
       split.Trans_Type,              --�������ͣ�SAP/OMS/NC
       split.Return_Msg,              --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       split.send_frequency           --���ʹ���
  from bis_acc_his_dtl_split split
union all
select to_char(mergen.id) id,
       '' as serial_id,
       mergen.nz_status nz_stauts,  --��ת״̬
       mergen.trans_time trans_time,      --��������
       mergen.corp_id  corp_id,                --��λId
       mergen.corp_name corp_name,       --��λ����
       mergen.acc_name acc_name,          --�տ���
       mergen.bank_acc bank_acc,          --�տ��˺�
       mergen.bank_name bank_name,        --�տ����
       mergen.cur_code cur_code,          --�ұ����
       mergen.cur cur,          --�ұ�
       mergen.amt amt,                    --���
       mergen.opp_acc_no opp_acc_no,      --�����˺�
       mergen.opp_acc_name opp_acc_name,  --�����˻�����
       mergen.opp_acc_bank opp_acc_bank,  --�������
       mergen.abs abs,                    --��;
       mergen.cd_sign cd_sign,            --��֧����
       mergen.budget_code budget_code,--ƥ��Ԥ���Ŀ
       mergen.budget_name budget_name, --ƥ��Ԥ������
       mergen.subject_code subject_code,--ƥ����ҵ��Ŀ
       mergen.subject_name subject_name, --ƥ����ҵ��Ŀ
       mergen.business_type,              --ҵ������
       mergen.cost_center_code,              --�ɱ�����
       mergen.postscript,              --��;
       mergen.data_sources_code,                       --������Դ
       mergen.SUPER_SUBJECT_CODE,
       '' as is_bl,
       mergen.vendor_num vendor_num,
       '3' as IS_SPLIT_MERGN_ONE,
       mergen.Trans_Status,            --����״̬��0�ɹ���1ʧ��
       mergen.Trans_Type,              --�������ͣ�SAP/OMS/NC
       mergen.Return_Msg,              --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       mergen.send_frequency           --���ʹ���
  from bis_acc_his_dtl_mergen mergen
  union all
select one.serial_id id,
       one.serial_id serial_id,
       one.nz_stauts nz_stauts,  --��ת״̬
       one.trans_time trans_time,      --��������
       to_char(one.corp_id)  corp_id,                --��λId
       one.corp_name corp_name,       --��λ����
       one.acc_name acc_name,          --�տ���
       one.bank_acc bank_acc,          --�տ��˺�
       one.bank_name bank_name,        --�տ����
       one.cur_code cur_code,          --�ұ����
       one.cur cur,          --�ұ�
       one.amt amt,                    --���
       one.opp_acc_no opp_acc_no,      --�����˺�
       one.opp_acc_name opp_acc_name,  --�����˻�����
       one.opp_acc_bank opp_acc_bank,  --�������
       one.abs abs,                    --��;
       one.cd_sign cd_sign,            --��֧����
       one.budget_code budget_code,--ƥ��Ԥ���Ŀ
       one.budget_name budget_name, --ƥ��Ԥ������
       one.subject_code subject_code,--ƥ����ҵ��Ŀ
       one.subject_name subject_name, --ƥ����ҵ��Ŀ
       one.business_type,              --ҵ������
       one.cost_center_code,              --�ɱ�����
       one.postscript,              --��;
       one.data_sources_code,                       --������Դ
       one.SUPER_SUBJECT_CODE,
       one.is_blend is_bl,
       one.vendor_num vendor_num,
       '4' as IS_SPLIT_MERGN_ONE,
       one.Trans_Status,            --����״̬��0�ɹ���1ʧ��
       one.Trans_Type,              --�������ͣ�SAP/OMS/NC
       one.Return_Msg,              --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       one.send_frequency           --���ʹ���
  from view_bis_acc_his_dtl_buget one
  where one.bill_status = '0'
  and ('0' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis'))
      or ('1' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis') and unique_confirm='1');
/