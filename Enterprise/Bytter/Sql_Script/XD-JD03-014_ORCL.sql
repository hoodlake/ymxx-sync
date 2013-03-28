--�޸����ڣ�20121228
--�޸��ˣ��߷�
--�޸����ݣ��Ƿ����ý������
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_PARAM
   WHERE CODE='brrowProvide_Like' AND SYS_CODE='cms';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6,REVERSE7) 
   VALUES ('brrowProvide_Like', 'cms', '���ý������', '0', '0', 'VALUE = 0����VALUE = 1����', '0,��;1,��', 1,
   (select max(b.reverse7)+1 from bt_param b where b.sys_code = 'cms'));
  COMMIT;
 END IF; 
END;
/

------- add Column ����ű��в�����ż�¼�в���ռ�û��ܽ���ֶ�
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_PROVIDE_LOAN_SEND' AND COLUMN_NAME = 'OCCUPYMONEY';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE cms_provide_loan_send ADD occupyMoney NUMBER(15,2) default 0.00';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--�������������
DECLARE
  tb NUMBER;
BEGIN
  SELECT COUNT(*) INTO tb FROM tabs WHERE table_name = 'CMS_PROVIDE_LINK';
  IF tb <> 0 THEN
    EXECUTE IMMEDIATE 'drop table CMS_PROVIDE_LINK';
    EXECUTE IMMEDIATE 'create table CMS_PROVIDE_LINK(
                          id                       VARCHAR2(50) PRIMARY KEY,
                          bill_code                VARCHAR2(13) not null,  --������
                          father_code              VARCHAR2(13),           --�����븸�˺�
                          acc_code                 VARCHAR2(50),           --����˺�
                          lastmoney2               NUMBER(15,2),           --ʣ����
                          send_date                DATE,                   --��ʼ��
                          deadline_date            DATE,                   --��������
                          float_way                VARCHAR2(15),           --������ʽ
                          REFERENCE_RATE_TYPE      VARCHAR2(50),           --��׼��������         
                          REPAY_CYCLE              VARCHAR2(50),           --��������
                          POINTS_PROPORTION_TEXT   NUMBER(15,2),            --��������
                          occupyMoney              NUMBER(15,2),           --ռ�ý��
                          releaseMoney             NUMBER(15,2),           --�ͷŽ��
                          RATE_ENTRIES_EFFECT_DATE DATE,                   --���ʵ�����Ч��
                          PL_RATE                  NUMBER(8,6),             --����
                          occupyStart_date         DATE,  --ռ�ÿ�ʼ����
                          occupyEnd_date           DATE,  --ռ�ý�������
                          status                   NUMBER,         --����״̬

                          lbill_code VARCHAR2(13) not null, --������
                          lfather_code VARCHAR2(13), --������븸�˺�
                          lacc_code  VARCHAR2(50), --�����˺�
                          sendMoney NUMBER(15,2),  --���η��Ž��
                          LOAN_SEND_OUT_DATE  DATE,--���ʼ����
                          repay_date DATE          --�����������
                       )';
  ELSE
    EXECUTE IMMEDIATE 'create table CMS_PROVIDE_LINK(
                          id                       VARCHAR2(50) PRIMARY KEY,
                          bill_code                VARCHAR2(13) not null,  --������
						  father_code              VARCHAR2(13),           --�����븸�˺�
                          acc_code                 VARCHAR2(50),           --����˺�
                          lastmoney2               NUMBER(15,2),           --ʣ����
                          send_date                DATE,                   --��ʼ��
                          deadline_date            DATE,                   --��������
                          float_way                VARCHAR2(15),           --������ʽ
                          REFERENCE_RATE_TYPE      VARCHAR2(50),           --��׼��������         
                          REPAY_CYCLE              VARCHAR2(50),           --��������
                          POINTS_PROPORTION_TEXT   NUMBER(15,2),            --��������
                          occupyMoney              NUMBER(15,2),           --ռ�ý��
                          releaseMoney             NUMBER(15,2),           --�ͷŽ��
                          RATE_ENTRIES_EFFECT_DATE DATE,                   --���ʵ�����Ч��
                          PL_RATE                  NUMBER(8,6),             --����
                          occupyStart_date         DATE,  --ռ�ÿ�ʼ����
                          occupyEnd_date           DATE,  --ռ�ý�������
                          status                   NUMBER,         --����״̬

                          lbill_code VARCHAR2(13) not null�� --������
                          lfather_code VARCHAR2(13), --������븸�˺�
                          lacc_code  VARCHAR2(50), --�����˺�
                          sendMoney NUMBER(15,2),  --���η��Ž��
                          LOAN_SEND_OUT_DATE  DATE,--���ʼ����
                          repay_date DATE          --�����������
                       )';
  END IF;
END;
/

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
                 where (ps.status >= 102 and ps.status < 110)) p2;

-------- add column �������в�������id
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_LOAN_INFO' AND COLUMN_NAME = 'PLOADCODE';
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE cms_loan_info ADD PloadCode varchar2(13)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

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

 ------- add Column ����������в��뵥λid
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'CMS_PROVIDE_LINK' AND COLUMN_NAME = 'CORP_ID';
  IF VN_COUNT < 1 THEN 
    VC_STR := ' ALTER TABLE CMS_PROVIDE_LINK ADD CORP_ID NUMBER(10)'; 
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--�޸��ˣ��߷�
--�޸����ݣ�ϵͳ����-���ݴ���ͬ���ɵ���ʷ������ݣ����������
--�޸����ݣ�ϵͳ�˵� ���ݴ���ͬ���ɵ���ʷ������ݣ����������
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='�������������ʷ����' AND t1.father_code=t2.res_code AND t2.res_name='�������';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, 
   REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   SELECT (SELECT MAX(T1.RES_CODE) + 1 FROM BT_SYS_RES T1), '�������������ʷ����', 'cms', RES_CODE, '/cms/LoanSendOutHisLinkList.jsp', '0', '1', '0', '0', 
   (SELECT MAX(T2.RES_ORDER)+1 FROM BT_SYS_RES T2 WHERE T2.FATHER_CODE = T3.RES_CODE AND T2.SYS_CODE = 'cms'), 
   NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '' FROM BT_SYS_RES T3 WHERE T3.RES_NAME = '�������' AND T3.SYS_CODE = 'cms';
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS  
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'CLB_AGREEMENT_RATE';
  IF VN_COUNT > 0 THEN
    VC_STR := 'update loan_send_out_info info set info.clb_agreement_rate = 0.000000 where info.clb_agreement_rate is null';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS  
   WHERE TABLE_NAME = 'LOAN_SEND_OUT_INFO' AND COLUMN_NAME = 'CLB_FIXED_RATE';
  IF VN_COUNT > 0 THEN
    VC_STR := 'update loan_send_out_info info set info.clb_fixed_rate = 0.000000 where info.clb_fixed_rate is null';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

commit;


