--������¼ҳ��Ľ������
CREATE OR REPLACE VIEW v_cms_provide_link as
select p2.bill_code,             --�����
               p2.contract_code, --����ͬ���
               p2.acc_code,
               p2.father_code,   --���ż�¼��Ӧ�ĸ����
               psmoney,          --���ν��Ž��
               bankname,         --����
               (psmoney - lastMoney - occupymoney1) as lastmoney2, --ʣ����
               p2.send_date,                        --��������
               p2.deadline_date,                    --��������
               CASE p2.float_way                    --������ʽ
                    WHEN '01' THEN '�̶�����'
                    WHEN '02' THEN '��ʱ����'
                    WHEN '03' THEN '���¸���'
                    WHEN '04' THEN '��������'
                    WHEN '05' THEN '�����긡��' 
                    WHEN '06' THEN '���긡��'
                    end 
                    as float_way,
               --p2.float_way,
               (select t.basetypename from tb_base_rate t where t.base_rate_id = p2.reference_rate_type) as reference_rate_type, --��׼��������
               (select tt.periodname from tb_credit_period tt where tt.credit_period_id = p2.repay_cycle) as repay_cycle,        --��������
               p2.points_proportion_text,   --��������
               p2.rate_entries_effect_date, --���ʵ�����Ч��
               p2.pl_rate,                   --����
               p2.corp_id,
               p2.cur_code
          from (select ps.money as psmoney,
                       (select NVL(SUM(pr.repay_money), 0)
                          from cms_provide_loan_repay pr
                         where ps.bill_code = pr.send_code
                           and pr.status > = 11) as lastMoney,
                       NVL(ps.occupymoney,0) as occupymoney1,
                       ps.*,
                       (select bank_name from (select info.bill_code, b.bank_name
                        from cms_provide_loan_info info, bt_bank b
                         where info.bank_code = b.bank_code) where bill_code = ps.father_code) as bankname
                  from cms_provide_loan_send ps
                 where (ps.status >= 97 and ps.status < 110)) p2;

 ------- add Column ����������в���ұ�
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_PROVIDE_LINK' AND COLUMN_NAME = 'CUR_CODE';
  IF VN_COUNT < 1 THEN 
    VC_STR := ' ALTER TABLE CMS_PROVIDE_LINK ADD CUR_CODE CHAR(2)'; 
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

 --- add Column �����ű��в���ұ�
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS  
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'CUR_CODE';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE loan_send_out_info ADD CUR_CODE CHAR(2)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

 --- add Column �����ű��в�������Ľ��ż�¼code
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'PLOADCODE';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE loan_send_out_info ADD PLOADCODE varchar2(13)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

