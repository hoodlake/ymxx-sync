-- �ｭ��--
-- 2013-1-4--

-- ����ó������չ�ڱ� 
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANCE_TYPE��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANCE_EXTEND';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE FINANCE_EXTEND
           ( GUID VARCHAR2(36) not null, 
             BILL_CODE    VARCHAR2(14) not null,
             FINANCE_CODE VARCHAR2(14) not null,
             ISSUE_CODE   VARCHAR2(36) not null,
             EXPIRY_DATE  DATE not null,
             RATE         NUMBER(6,4) not null,
             CONTRACT_NO  VARCHAR2(30),
             RMK          VARCHAR2(256),
             APPROVES     VARCHAR2(400),
             NEXT_CHECKER VARCHAR2(400),
             STATUS       NUMBER not null,
             OP           VARCHAR2(10) not null,
             ENTER_DATE   DATE not null,
             CORP_ID      NUMBER not null,
             LOAN_MONEY   NUMBER not null,
             BACK_REASON  VARCHAR2(256),
             FLAG         NUMBER)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column FINANCE_EXTEND.BILL_CODE is 'չ��Code';
comment on column FINANCE_EXTEND.FINANCE_CODE is 'ó������Code';
comment on column FINANCE_EXTEND.ISSUE_CODE is '���ż�¼Code';
comment on column FINANCE_EXTEND.EXPIRY_DATE is 'չ�ڵ�������';
comment on column FINANCE_EXTEND.RATE is 'չ������';
comment on column FINANCE_EXTEND.CONTRACT_NO is 'չ�ں�ͬ��';
comment on column FINANCE_EXTEND.RMK is '��ע';
comment on column FINANCE_EXTEND.APPROVES is '�Ѿ�������';
comment on column FINANCE_EXTEND.NEXT_CHECKER is '��һ������';
comment on column FINANCE_EXTEND.STATUS is '��¼״̬';
comment on column FINANCE_EXTEND.OP is '����Ա';
comment on column FINANCE_EXTEND.ENTER_DATE is '¼��ʱ��';
comment on column FINANCE_EXTEND.CORP_ID is 'չ�ڵ�λ';
comment on column FINANCE_EXTEND.LOAN_MONEY is '���Ž��';
comment on column FINANCE_EXTEND.BACK_REASON is '��¼���ԭ��';
comment on column FINANCE_EXTEND.FLAG is '1:����ó�����ʣ� 2������ó������';

alter table FINANCE_EXTEND add constraint FINANCE_EXT_PK primary key (GUID);
alter table FINANCE_EXTEND add constraint FINANCE_EXT_BILLCODE unique (BILL_CODE);

-- �������ͱ�
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --�鿴����ϵͳ�Ƿ���FINANCE_TYPE��
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'FINANCE_TYPE';
  --���û��������������оͲ�����
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE FINANCE_TYPE(CODE VARCHAR2(10) not null, NAME VARCHAR2(40) not null, FLAG NUMBER not null)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column FINANCE_TYPE.CODE is '��������id';
comment on column FINANCE_TYPE.NAME is '��������';
comment on column FINANCE_TYPE.FLAG is '1������ó�����ʣ�2:����ó������';

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '10';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('10', '�������', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '20';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('20', '����Ѻ��', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '30';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('30', '����Ѻ��', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '40';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('40', '����͢', 2);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '1';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('1', 'Ӧ���˿��', 1);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '2';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('2', '��������', 1);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '3';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('3', 'Ӧ���˿�', 1);
  END IF;
  COMMIT; 
END;
/
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM FINANCE_TYPE
   WHERE CODE = '4';
  IF VN_COUNT < 1 THEN
    INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    VALUES ('4', '��������֤����', 1);
  END IF;
  COMMIT; 
END;
/

-- ���ӹ���ó������չ�ڲ˵�---
-- ����ó������չ������--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó������չ������' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '����ó������չ������', 'lcs',
  (select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAdd', '0', '1', '0', '0', 23, '����ó������չ������', 2);
  END IF;
  COMMIT; 
END;
/
--����ó������չ���޸�--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó������չ���޸�' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '����ó������չ���޸�', 'lcs',
  (select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendEdit', '0', '1', '0', '0', 24, '����ó������չ���޸�', 2);
  END IF;
  COMMIT; 
END;
/
--����ó������չ�ڴ��--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó������չ�ڴ��' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '����ó������չ�ڴ��', 'lcs',
  (select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendBack', '0', '1', '0', '0', 25, '����ó������չ�ڴ��', 2);

  END IF;
  COMMIT; 
END;
/
--����ó������չ�ڲ�¼--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó������չ�ڲ�¼' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '����ó������չ�ڲ�¼', 'lcs',
  (select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAddition', '0', '1', '0', '0', 26, '����ó������չ�ڲ�¼', 2);
  END IF;
  COMMIT; 
END;
/
--����ó�����ʲ�ѯ--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='����ó�����ʲ�ѯ' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
  VALUES ((select max(RES_CODE)+1 from bt_sys_res), '����ó�����ʲ�ѯ', 'lcs',
  (select res_code from bt_sys_res where res_name='��ѯ' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=query', '0', '1', '0', '0', 29, '����ó������չ�ڲ�¼', 2);
  END IF;
  COMMIT; 
END;
/
