--�޸�����:����ϵͳģ�飭�ʽ��������
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) FROM BT_SYS  WHERE SYS_CODE = 'mec';
  IF @VN_COUNT < 1 
  BEGIN
   INSERT INTO BT_SYS (SYS_CODE, SYS_NAME, SYS_APP, FIRST_PAGE, VALID_SIGN, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', '�ʽ��������', null, 'mec', '1', '�ʽ��������', null, null, null, null, null, null, null, null, null, null);
  END;
END;
GO

--�޸�����:�����ʽ�������Ĳ���Ȩ��_¼��Ȩ��
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 1;
  IF @VN_COUNT < 1 
  BEGIN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 1, '¼��', null, null, null, null, null, null, null, null, null, null, null);
  END;
END;
GO

--�޸�����:�����ʽ�������Ĳ���Ȩ��_��ѯȨ��
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 2;
  IF @VN_COUNT < 1 
  BEGIN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 2, '��ѯ', null, null, null, null, null, null, null, null, null, null, null);
  END;
END;
GO

--�޸�����:����һ���˵� �ʽ��������-�ڴ����
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  IF @VN_COUNT < 1 
  BEGIN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
   select (select max(res_code) + 1 from bt_sys_res), '�ڴ����', 'mec', 0, '','0', '0', '0', '0', 3, '�ڴ����','', '', '', '', '', null, null, null, null, null, 1;
  END;
END;
GO

--�޸�����:���������˵� �ʽ��������-�ڴ����-��������
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='��������' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF @VN_COUNT < 1 
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '��������', 'mec', res_code, '/mec/mecBasicSet.do?method=toEdit', '0', '1', '0', '0', 1, '��������', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END;
END;
GO

--�޸�����:���������˵� �ʽ��������-�ڴ����-�ڲ��ʽ��ϱ�
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='�ڲ��ʽ��ϱ�' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF @VN_COUNT < 1 
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '�ڲ��ʽ��ϱ�', 'mec', res_code, '/mec/mecFundReport.do?method=toTreeList', '0', '1', '0', '0', 2, '�ڲ��ʽ��ϱ�', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END;
END;
GO

--�޸�����:���������˵� �ʽ��������-�ڴ����-���ƻ�
--�޸���:�ž���
--�޸�ʱ��:2012-11-26
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT=COUNT(*) FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='���ƻ�' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF @VN_COUNT < 1
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '���ƻ�', 'mec', res_code, '/mec/mecDrawPlan.do?method=toTreeList', '0', '1', '0', '0', 3, '���ƻ�', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END;
END;
GO

--�޸�����:�����ڴ�����������ñ�MEC_BASIC_SET
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
create table MEC_BASIC_SET  (
   ID                   NUMERIC(20) NOT NULL,
   MEMORY_BANK          VARCHAR(100),
   EXTERNAL_CREDIT_BANK VARCHAR(100),
   MEMORY_UNIT          VARCHAR(100),
   EXTERNAL_CREDIT_UNIT VARCHAR(100),
   WITHDRAWALS_MARGIN_RATIO NUMERIC(15, 2),
   ENDMONTH_RATIO       NUMERIC(15, 2),
   CONSTRAINT PK_MEC_BASIC_SET PRIMARY KEY (ID)
);

--�޸�����:���������˺Ź����MEC_MANAGER_BANKACC
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
create table MEC_MANAGER_BANKACC  (
   ID                   NUMERIC(20) NOT NULL,
   BANKACC              VARCHAR(30),
   MIN_CAPITAL_VAL      NUMERIC(15,2),
   CONSTRAINT PK_MEC_MANAGER_BANKACC PRIMARY KEY (ID)
);

--�޸�����:�����ڴ��ʽ��ϱ���MEC_FUND_REPORT
--�޸���:�ž���
--�޸�ʱ��:2012-11-22
create table MEC_FUND_REPORT  (
   ID                   NUMERIC(20) NOT NULL,
   FUND_CODE            VARCHAR(20),
   CORP_CODE            VARCHAR(12),
   REPORT_TIME          DATETIME,
   CREATE_DATE          DATETIME,
   RMK                  VARCHAR(100),
   CONSTRAINT PK_MEC_FUND_REPORT PRIMARY KEY (ID)
);

--�޸�����:�����ڴ��ʽ��ϱ���ϸ��MEC_FUND_REPORT_DT
--�޸���:�ž���
--�޸�ʱ��:2012-11-22
create table MEC_FUND_REPORT_DT  (
   ID                   NUMERIC(20) NOT NULL,
   PARENT_ID            NUMERIC(20) NOT NULL,
   BANKACC              VARCHAR(30),
   BANK_CODE            VARCHAR(50),
   CUR_CODE             VARCHAR(50),
   BANK_BAL             NUMERIC(15,2),
   MIN_CAPITAL_VAL      NUMERIC(15,2),
   REDUNDANT_CURRENT    NUMERIC(15,2),
   REDUNDANT_REGULAR    NUMERIC(15,2),
   DISPOSABLE_FUND      NUMERIC(15,2),
   CONSTRAINT PK_MEC_FUND_REPORT_DT PRIMARY KEY (ID)
);

--�޸�����:�������ƻ���MEC_DRAW_PLAN
--�޸���:�ž���
--�޸�ʱ��:2012-11-26
create table MEC_DRAW_PLAN  (
   ID                   NUMERIC(20) NOT NULL, 
   DRAW_CODE            VARCHAR(20),
   CORP_CODE            VARCHAR(30),
   BANK_CODE            VARCHAR(20),
   MONEY                NUMERIC(15,2),
   CUR                  VARCHAR(6),
   LOAN_DATE            DATETIME,
   RMK                  VARCHAR(100),
   CREATE_DATE          DATETIME,
   CONSTRAINT PK_MEC_DRAW_PLAN PRIMARY KEY (ID)
);
