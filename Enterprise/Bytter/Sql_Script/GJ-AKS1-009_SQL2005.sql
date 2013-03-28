--�޸����ڣ�2012.11.29
--�޸��ˣ������
--�޸����ݣ�����ó�����ʻ�����ع���


--------ó�����ʷſ����Ϣ�� ----------
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANC_LOAN_REPAY')
                  AND   TYPE = 'U')
create table FINANC_LOAN_REPAY 
(
   GUID                 varchar(36)                   not null,
   BILL_CODE            varchar(14)                   not null,    --�����
   ISSUE_ID             varchar(36)                   not null,    --���ŵ�id
   LOAN_BILL_CODE       varchar(20)                   not null,    --���ŵ����
   FIN_BILL_CODE        varchar(14)                   not null,    --���ʵ����
   CORP_ID              NUMERIC(10),    --��λid
   REPAY_MONEY          NUMERIC(18,2),    --������
   REPAY_DATE           DATETIME                           not null,    --��������
   REPAY_ACCRUAL        NUMERIC(6,4),                  --������Ϣ
   ENTER_DATE           DATETIME                           not null,    --¼��ʱ��
   ACT_COLLECT_MONEY    NUMERIC(18,2),                  --ʵ���տ���
   BALANCE              NUMERIC(18,2),                  --���
   NEXT_CHECKER         varchar(150),                  --�¸�������
   OP                   varchar(8)                    not null,    --¼����
   VOUCHER_NO           varchar(15),                  --����ƾ֤��
   APPROVES             varchar(200),									--�����
   RMK                  varchar(400),									--��ע
   REJECT_REASON        varchar(400),									--���ԭ��
   STATUS               NUMERIC                         not null,		--״̬
   REPAYMENT_SCHEDULE_ID	NUMERIC(10),								--����ƻ�ID
   FLAG					NUMERIC(1),
   constraint PK_FINANC_LOAN_REPAY primary key (GUID)
)
GO

--��Ӳ˵�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ�������' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ�������', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=repayadd', '0', '0', '0', '0', 17, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ����޸�' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ����޸�', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=repayadd', '0', '0', '0', '0', 18, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ�����' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ�����', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=repayadd', '0', '0', '0', '0', 19, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name='����ó�����ʻ��¼' and sys_code='lcs';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	select (select max(RES_CODE) + 1 from bt_sys_res), '����ó�����ʻ��¼', 'lcs', (select  max(res_code)  from bt_sys_res  where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=repayadd', '0', '0', '0', '0', 20, '', '', '', '', '', '', null, null, null, null, null, 2, '';
    END;
END;
GO

--���������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_approve_business
   WHERE BUSINESS_CODE='lcs_interfin2';
  IF @VN_COUNT < 1
    BEGIN
	insert into bt_approve_business (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, MONEY_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
	values ('lcs_interfin2', 'lcs', '����ó�����ʻ���', 'A,B,C', 'financ_loan_repay', 'repay_money',  'next_checker', 'bill_code', '../interfinance/InterFinancRepayShowInclude.jsp', 'com.byttersoft.intersettle.form.InterFinancRepayForm');
    END;
END;
GO

--��ӱ������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_KEY_GENERATOR
   WHERE TABLENAME='FINANC_LOAN_REPAY' and KEYALISENAME='InterFinancRepayCode';
  IF @VN_COUNT < 1
    BEGIN
	INSERT INTO BT_KEY_GENERATOR (ID, TABLENAME, KEYALISENAME, CUSTGENCLASS, GENSTRATE)
	SELECT ISNULL((SELECT MAX(ID) FROM BT_KEY_GENERATOR), 0) + 1, 'FINANC_LOAN_REPAY', 'InterFinancRepayCode', 'com.byttersoft.intersettle.service.InterFinancRepayKeyGenerator', 'cu';
    END;
END;
GO