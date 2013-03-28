--�޸����ڣ�2012.11.27
--�޸��ˣ�����
--�޸����ݣ��й�Զ��
--�޸�ԭ���й�Զ��ű�����(������Ϣ��ѯ)

--������ͼ
CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL_VIEW AS
SELECT net.net_name, --����
       dtl.CONTRACT_CODE, --��ͬ���
       dtl.BILL_CODE, --ҵ����
       type.type_name, --��������
       corp.corp_name, --��λ���� ȡbt_corp
       dtl.LOAN_MONEY, --����
       dtl.BALANCE, --���
       cur.cur_name, --�ұ� ����ȡbt_currency
       dtl.INTEREST_START_DATE, --��Ϣ����
       dtl.BLN_INST_DATE, --��������
       dtl.DAYS, --����
       dtl.CUMULATION, --����
       dtl.INTEREST_RATE, --����
       dtl.INTEREST, --��Ϣ���
       dtl.NATURAL_INTEREST, -- ��Ϣ����ɱ�λ��
       dtl.BORROW_NAME, --�����
       dtl.statuszone as INTEREST_NAME, --��Ϣ���� ����ȡfc_interest_type
       dtl.INTEREST_SIGN, --ҵ������,1Ԥ��,2��Ϣ
       dtl.net_code,--��ѯ����
       dtl.corp_id,--��ѯ����
       dtl.bill_type,--��ѯ����
       to_char(dtl.balance_date,'yyyy-MM') as balance_date_str,--��ѯ����
       dtl.cur_code, --��ѯ����
       DTL.INTEREST_TIME,--��ѯ����
       DTL.INTEREST_TYPE--��ѯ����
  FROM CMS_INTEREST_DTL dtl
  inner join bt_net net on net.net_code=dtl.net_code
  inner join bt_corp corp on dtl.corp_id=corp.id
  inner join bt_currency cur on dtl.cur_code=cur.cur_code
  inner join cms_main_type type on type.type_code=dtl.bill_type
  inner join fc_interest_type interest on dtl.interest_type=interest.interest_code
 WHERE dtl.STATUS = '0'
/

--ZY-XD-06������Ϣ��ѯ�˵�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'cms' and res_name='��Ϣ��ϸ��ѯ';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'��Ϣ��ϸ��ѯ','cms',(select res_code from 
bt_sys_res where res_name='��ѯ' and sys_code='cms'),'/cms/cmsInterestDtlSearch.do?method=beforeOpr','1','0',15);
  END IF;
  COMMIT; 
END;
/