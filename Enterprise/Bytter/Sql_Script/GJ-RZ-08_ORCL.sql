--�޸�ʱ��2012-12-14
--�޸��� ��ï��
--�޸�����  �ⲿ����̨�˲�ѯ

-- Create table
CREATE OR REPLACE view VW_CMS_OUT_FINANC
AS
   SELECT b.corp_code,                                               -- //��˾����
          b.corp_name,                                                --//��˾����
          b.net_code,                                               --//�����������
          a.financ_type,                                             -- //��������
          a.bank_type,                                                --����������
          c.type_name,                                               -- �����������
          a.deal_bank,                                                --�������д���
          d.bank_name,                                               --������������,
          a.bill_code,                                                  --�������
          a.warrant_type,                                               --�������
          a.warrant_category,                                           --������ʽ
          a.warrant_money,                                            --���뵣�����
          a.status,                                                       --״̬
          DECODE (a.status, 110, 1, -1) clean,                             --����
          a.fa_type_datestart,                                        --//��ʼ����
          a.fa_type_dateend,                                            --��������
          a.project_rmk,                                                --��Ŀ����
          a.fa_type_code,                                               --���ݱ���
          a.fa_type_money,                                                --���
          a.cur_code,                                                     --�ұ�
          a.corp_id,                                                    -- ��˾ID
          F.CORP_NAME as warrant_name, --������λ
          h.cur_name -- �ұ���
     FROM cms_out_financ a,
          bt_corp b,
          bt_bank_type c,
          bt_bank d,
          bt_corp f,
          bt_currency h
    WHERE     a.corp_id = b.id
          AND a.bank_Type = c.bank_type
          AND a.deal_Bank = d.BANK_CODE
          and b.net_code = F.CORP_CODE
          and a.cur_code = h.cur_code 
          AND a.APPLY_FA_TYPE = 1;