--�޸����ڣ�2012.11.29
--�޸��ˣ������
--�޸����ݣ�����ó�����ʻ�����ع���


--------ó�����ʷſ����Ϣ�� ----------
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANC_LOAN_REPAY��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANC_LOAN_REPAY';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table FINANC_LOAN_REPAY 
				(
				   GUID                 varchar2(36)                   not null,
				   BILL_CODE            varchar2(14)                   not null,    --�����
				   ISSUE_ID             varchar2(36)                   not null,    --���ŵ�id
				   LOAN_BILL_CODE       varchar2(20)                   not null,    --���ŵ����
				   FIN_BILL_CODE        varchar2(14)                   not null,    --���ʵ����
				   CORP_ID              number(10)                     not null,    --��λid
				   REPAY_MONEY          number(18,2),    --������
				   REPAY_DATE           date,    --��������
				   REPAY_ACCRUAL        number(6,4),                  --������Ϣ
				   ENTER_DATE           date                           not null,    --¼��ʱ��
				   ACT_COLLECT_MONEY    number(18,2),                  --ʵ���տ���
				   BALANCE              number(18,2),                  --���
				   NEXT_CHECKER         varchar2(150),                  --�¸�������
				   OP                   varchar2(8)                    not null,    --¼����
				   VOUCHER_NO           varchar2(15),                  --����ƾ֤��
				   APPROVES             varchar2(200),									--�����
				   RMK                  varchar2(400),									--��ע
				   REJECT_REASON        varchar2(400),									--���ԭ��
				   STATUS               number                         not null,		--״̬
				   REPAYMENT_SCHEDULE_ID	number(10),								--����ƻ�ID
				   FLAG					number(1),									--���ʹ��ڵ��ݱ��,1Ϊ����,2Ϊ����
				   constraint PK_FINANC_LOAN_REPAY primary key (GUID)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
--��Ӳ˵�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ�������' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ�������', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repayadd', '0', '0', '0', '0', 17, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ����޸�' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ����޸�', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repaysave', '0', '0', '0', '0', 18, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ�����' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ�����', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repaycallback', '0', '0', '0', '0', 19, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ��¼' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values ((select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ��¼', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs' and res_url is null), '/interfinance/interCorp.jsp?operate=repayrecord', '0', '0', '0', '0', 20, '', '', '', '', '', '', null, null, null, null, null, 2, '');
  END IF;
  COMMIT; 
END;
/
--���������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interfin2';
  IF VN_COUNT < 1 THEN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin2', 'lcs', '����ó�����ʻ���', 'A,B,C', 'financ_loan_repay', 'repay_money',  'next_checker', 'bill_code', '../interfinance/InterFinancRepayShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancRepayForm');
  END IF;
  COMMIT; 
END;
/
--��ӱ������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_KEY_GENERATOR
   WHERE TABLENAME='FINANC_LOAN_REPAY' and KEYALISENAME='InterFinancRepayCode';
  IF VN_COUNT < 1 THEN
	INSERT INTO BT_KEY_GENERATOR (ID, TABLENAME, KEYALISENAME, CUSTGENCLASS, GENSTRATE)
	VALUES (NVL((SELECT MAX(ID) FROM BT_KEY_GENERATOR), 0) + 1, 'FINANC_LOAN_REPAY', 'InterFinancRepayCode', 'com.byttersoft.intersettle.service.InterFinancRepayKeyGenerator', 'cu');
  END IF;
  COMMIT; 
END;
/