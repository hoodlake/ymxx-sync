
--ƾ֤ģ�嶨������������ƾ֤���͡�
alter table erp_voucher_template add voucher_type varchar(120);
--ƾ֤ģ�嶨������������ҵ��Χ��
alter table erp_voucher_template add business_area varchar(60);

--��ʷ��ϸ��������ƾ֤���͡�
alter table bis_acc_his_dtl add voucher_type varchar(60);
--��ʷ��ϸ��������ҵ��Χ��
alter table bis_acc_his_dtl add business_area varchar(60);


--��ʷ��ϸ�ϲ���������ƾ֤���͡�
alter table bis_acc_his_dtl_mergen add voucher_type varchar(60);
--��ʷ��ϸ�ϲ���������ҵ��Χ��
alter table bis_acc_his_dtl_mergen add business_area varchar(60);



--��ʷ��ϸ��ֱ�������ƾ֤���͡�
alter table bis_acc_his_dtl_split add voucher_type varchar(60);
--��ʷ��ϸ��ֱ�������ҵ��Χ��
alter table bis_acc_his_dtl_split add business_area varchar(60);
GO

IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME=' view_bis_acc_his_dtl_buget ')
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
        dtl.unique_confirm unique_confirm,
        dtl.voucher_type,			--ƾ֤����
        dtl.business_area,			--ҵ��Χ
        dtl.Trans_Status,            --����״̬��0�ɹ���1ʧ��
       	dtl.Trans_Type,              --�������ͣ�SAP/OMS/NC
       	dtl.Return_Msg,              --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       	dtl.send_frequency           --���ʹ���
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
   left join bt_currency currency on dtl.cur = currency.cur_code,
  v_acc_list acc, bt_corp corp
  where dtl.bank_acc = acc.BANK_ACC
     AND
    acc.CORP_CODE = corp.corp_code
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
        dtl.unique_confirm unique_confirm,
        dtl.voucher_type,			--ƾ֤����
        dtl.business_area,			--ҵ��Χ
        dtl.Trans_Status,            --����״̬��0�ɹ���1ʧ��
       	dtl.Trans_Type,              --�������ͣ�SAP/OMS/NC
       	dtl.Return_Msg,              --������Ϣ������ɹ�ʱ��������Ϣ����Ϊ��
       	dtl.send_frequency           --���ʹ���
  from  bis_acc_his_dtl dtl
        left join fbs_item fi on fi.code =  dtl.budget_code
   left join bt_currency currency on dtl.cur = currency.cur_code,
  bt_bankacc_app app, bt_corp corp
  where dtl.bank_acc = app.BANKACC
     AND
    app.CORP_CODE = corp.corp_code;
GO

