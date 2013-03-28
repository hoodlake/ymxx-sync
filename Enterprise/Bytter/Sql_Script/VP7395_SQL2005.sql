IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='view_bis_acc_his_dtl_buget')
DROP VIEW view_bis_acc_his_dtl_buget  
GO
create view view_bis_acc_his_dtl_buget as 
select dtl.serial_id serial_id,
        dtl.trans_time trans_time,      --��������
       corp.id corp_id,                --��λId
       corp.corp_name corp_name,       --��λ����
       dtl.acc_name acc_name,        --�տ���
       dtl.bank_acc bank_acc,          --�տ��˺�
       dtl.bank_name bank_name,        --�տ����
       currency.cur_name cur,          --�ұ�
       currency.cur_code cur_code,
       dtl.amt amt,                    --���
       dtl.opp_acc_no opp_acc_no,      --�����˺�
       dtl.opp_acc_name opp_acc_name,  --�����˻�����
       dtl.opp_acc_bank opp_acc_bank,  --�������
       dtl.abs abs,                    --��;
       dtl.cd_sign cd_sign,            --��֧����
        dtl.nz_stauts nz_stauts,  --��ת״̬
        dtl.bill_status,                  --����״̬
        dtl.subject_code,                 --ƥ����ҵ��Ŀ
        dtl.subject_name,                 --ƥ����ҵ��Ŀ
        dtl.business_type,                 --ҵ������
        dtl.cost_center_code,                 --�ɱ�����
        dtl.postscript,                       --��;
        dtl.data_sources_code,                --������Դ
        dtl.SUPER_SUBJECT_CODE,
        fi.name budget_code_name, --ƥ��Ԥ������
        dtl.budget_code budget_code_dtl,
        fi.name budget_name, --ƥ��Ԥ������
        dtl.budget_code budget_code,
        dtl.vendor_num vendor_num,--��Ӧ�̱���
        dtl.is_blend is_blend,
        dtl.unique_confirm unique_confirm
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
        ,v_acc_list acc, bt_corp corp,bt_currency currency
  where dtl.bank_acc = acc.BANK_ACC
     AND
    acc.CORP_CODE = corp.corp_code
    AND 
    acc.CUR = currency.cur_code
  UNION
    select dtl.serial_id serial_id,
        dtl.trans_time trans_time,      --��������
       corp.id corp_id,                --��λId
       corp.corp_name corp_name,       --��λ����
       dtl.acc_name acc_name,        --�տ���
       dtl.bank_acc bank_acc,          --�տ��˺�
       dtl.bank_name bank_name,        --�տ����
       currency.cur_name cur,          --�ұ�
       currency.cur_code cur_code,
       dtl.amt amt,                    --���
       dtl.opp_acc_no opp_acc_no,      --�����˺�
       dtl.opp_acc_name opp_acc_name,  --�����˻�����
       dtl.opp_acc_bank opp_acc_bank,  --�������
       dtl.abs abs,                    --��;
       dtl.cd_sign cd_sign,            --��֧����
        dtl.nz_stauts nz_stauts,  --��ת״̬
        dtl.bill_status,                  --����״̬
        dtl.subject_code,                 --ƥ����ҵ��Ŀ
        dtl.subject_name,                 --ƥ����ҵ��Ŀ
        dtl.business_type,                 --ҵ������
        dtl.cost_center_code,                 --�ɱ�����
        dtl.postscript,                       --��;
        dtl.data_sources_code,                --������Դ
        dtl.SUPER_SUBJECT_CODE,
        fi.name budget_code_name, --ƥ��Ԥ������
        dtl.budget_code budget_code_dtl,
        fi.name budget_name, --ƥ��Ԥ������
        dtl.budget_code budget_code,
        dtl.vendor_num vendor_num,--��Ӧ�̱���
        dtl.is_blend is_blend,
        dtl.unique_confirm unique_confirm
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
   ,bt_bankacc_app app, bt_corp corp,bt_currency currency 
  where dtl.bank_acc = app.BANKACC
     AND
    app.CORP_CODE = corp.corp_code
    AND
    app.cur = currency.cur_code
    ;
GO
  














