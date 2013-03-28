-- �ｭ��--
-- 2013.1.4--
-- ����ó������չ�ڱ� 
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANCE_EXTEND')
                  AND   TYPE = 'U')
	create table FINANCE_EXTEND
	(
	  GUID         VARCHAR(36) not null,     
	  BILL_CODE    VARCHAR(14) not null,     --չ��Code
	  FINANCE_CODE VARCHAR(14) not null,     --ó������Code
	  ISSUE_CODE   VARCHAR(36) not null,     --���ż�¼Code
	  EXPIRY_DATE  DATETIME not null,        --չ�ڵ�������
	  RATE         NUMERIC(6,4) not null,    --չ������
	  CONTRACT_NO  VARCHAR(30),              --չ�ں�ͬ��
	  RMK          VARCHAR(256),             --��ע
	  APPROVES     VARCHAR(400),             --�Ѿ�������
	  NEXT_CHECKER VARCHAR(400),             --��һ������
	  STATUS       INT not null,             --��¼״̬
	  OP           VARCHAR(10) not null,     --����Ա
	  ENTER_DATE   DATE not null,            --¼��ʱ��
	  CORP_ID      INT not null,             --չ�ڵ�λ
	  LOAN_MONEY   NUMERIC(15,2) not null,   --���Ž��
	  BACK_REASON  VARCHAR(256),             --��¼���ԭ��
	  FLAG         INT                       --1:����ó�����ʣ� 2������ó������
	)  
GO

alter table FINANCE_EXTEND add constraint FINANCE_EXT_PK primary key (GUID)
go

alter table FINANCE_EXTEND add constraint FINANCE_EXT_BILLCODE unique (BILL_CODE)
go

-- �������ͱ�
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('TEST1')
                  AND   TYPE = 'U')
	create table FINANCE_TYPE
	(
	  CODE VARCHAR(10) not null,       -- ��������id
	  NAME VARCHAR(40) not null,       -- ��������
	  FLAG INT not null              -- 1������ó�����ʣ�2:����ó������
	)
go

alter table FINANCE_TYPE add constraint FINANCE_TYPE_PK primary key (CODE)
go

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '10';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
      VALUES ('10', '�������', 2);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '20';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    	VALUES ('20', '����Ѻ��', 2);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '30';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
      VALUES ('30', '����Ѻ��', 2);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '40';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    	 VALUES ('40', '����͢', 2);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '1';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    	VALUES ('1', 'Ӧ���˿��', 1);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '2';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    	VALUES ('2', '��������', 1);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '3';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    	VALUES ('3', 'Ӧ���˿�', 1);
    END;
END;
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FINANCE_TYPE
   WHERE CODE = '4';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO FINANCE_TYPE(CODE, NAME, FLAG)
    	VALUES ('4', '��������֤����', 1);
    END;
END;
GO


--����ó������չ������--
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
	(select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAdd', '0', '1', '0', '0', 23, '����ó������չ������', 2)
  END IF;
  COMMIT; 
END;
GO

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
	(select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendEdit', '0', '1', '0', '0', 24, '����ó������չ���޸�', 2)
  END IF;
  COMMIT; 
END;
GO


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
	(select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendBack', '0', '1', '0', '0', 25, '����ó������չ�ڴ��', 2)
  END IF;
  COMMIT; 
END;
GO

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
	(select res_code from bt_sys_res where res_name='����ó������' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAddition', '0', '1', '0', '0', 26, '����ó������չ�ڲ�¼', 2)
  END IF;
  COMMIT; 
END;
GO

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
	(select res_code from bt_sys_res where res_name='��ѯ' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=query', '0', '1', '0', '0', 29, '����ó������չ�ڲ�¼', 2)
  END IF;
  COMMIT; 
END;
GO

