-- 孙江华--
-- 2013.1.4--
-- 国际贸易融资展期表 
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('FINANCE_EXTEND')
                  AND   TYPE = 'U')
	create table FINANCE_EXTEND
	(
	  GUID         VARCHAR(36) not null,     
	  BILL_CODE    VARCHAR(14) not null,     --展期Code
	  FINANCE_CODE VARCHAR(14) not null,     --贸易融资Code
	  ISSUE_CODE   VARCHAR(36) not null,     --发放记录Code
	  EXPIRY_DATE  DATETIME not null,        --展期到期日期
	  RATE         NUMERIC(6,4) not null,    --展期利率
	  CONTRACT_NO  VARCHAR(30),              --展期合同号
	  RMK          VARCHAR(256),             --备注
	  APPROVES     VARCHAR(400),             --已经审批人
	  NEXT_CHECKER VARCHAR(400),             --下一审批人
	  STATUS       INT not null,             --记录状态
	  OP           VARCHAR(10) not null,     --操作员
	  ENTER_DATE   DATE not null,            --录入时间
	  CORP_ID      INT not null,             --展期单位
	  LOAN_MONEY   NUMERIC(15,2) not null,   --发放金额
	  BACK_REASON  VARCHAR(256),             --补录打回原因
	  FLAG         INT                       --1:国内贸易融资， 2：国际贸易融资
	)  
GO

alter table FINANCE_EXTEND add constraint FINANCE_EXT_PK primary key (GUID)
go

alter table FINANCE_EXTEND add constraint FINANCE_EXT_BILLCODE unique (BILL_CODE)
go

-- 融资类型表
IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('TEST1')
                  AND   TYPE = 'U')
	create table FINANCE_TYPE
	(
	  CODE VARCHAR(10) not null,       -- 融资类型id
	  NAME VARCHAR(40) not null,       -- 融资名称
	  FLAG INT not null              -- 1：国内贸易融资，2:国际贸易融资
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
      VALUES ('10', '打包贷款', 2);
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
    	VALUES ('20', '进口押汇', 2);
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
      VALUES ('30', '出口押汇', 2);
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
    	 VALUES ('40', '福费廷', 2);
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
    	VALUES ('1', '应收账款保理', 1);
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
    	VALUES ('2', '订单融资', 1);
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
    	VALUES ('3', '应收账款', 1);
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
    	VALUES ('4', '国内信用证代付', 1);
    END;
END;
GO


--国际贸易融资展期申请--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期申请' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
	VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期申请', 'lcs',
	(select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAdd', '0', '1', '0', '0', 23, '国际贸易融资展期申请', 2)
  END IF;
  COMMIT; 
END;
GO

--国际贸易融资展期修改--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期修改' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
	VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期修改', 'lcs',
	(select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendEdit', '0', '1', '0', '0', 24, '国际贸易融资展期修改', 2)
  END IF;
  COMMIT; 
END;
GO


--国际贸易融资展期打回--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期打回' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
	VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期打回', 'lcs',
	(select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendBack', '0', '1', '0', '0', 25, '国际贸易融资展期打回', 2)
  END IF;
  COMMIT; 
END;
GO

--国际贸易融资展期补录--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资展期补录' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
	VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资展期补录', 'lcs',
	(select res_code from bt_sys_res where res_name='国际贸易融资' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=extendAddition', '0', '1', '0', '0', 26, '国际贸易融资展期补录', 2)
  END IF;
  COMMIT; 
END;
GO

--国际贸易融资查询--
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name='国际贸易融资查询' and sys_code='lcs';
  IF VN_COUNT < 1 THEN
	INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
	VALUES ((select max(RES_CODE)+1 from bt_sys_res), '国际贸易融资查询', 'lcs',
	(select res_code from bt_sys_res where res_name='查询' and sys_code='lcs'), '/interfinance/interCorp.jsp?operate=query', '0', '1', '0', '0', 29, '国际贸易融资展期补录', 2)
  END IF;
  COMMIT; 
END;
GO

