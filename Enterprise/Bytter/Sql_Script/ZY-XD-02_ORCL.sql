--�޸�����:����ϵͳģ�飭�ʽ��������
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS  WHERE SYS_CODE = 'mec';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS (SYS_CODE, SYS_NAME, SYS_APP, FIRST_PAGE, VALID_SIGN, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', '�ʽ��������', null, 'mec', '1', '�ʽ��������', null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�����ʽ�������Ĳ���Ȩ��_¼��Ȩ��
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 1;
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 1, '¼��', null, null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�����ʽ�������Ĳ���Ȩ��_��ѯȨ��
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_OPERATION  WHERE SYS_CODE = 'mec' AND OP_TYPE = 2;
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
   VALUES ('mec', 2, '��ѯ', null, null, null, null, null, null, null, null, null, null, null);
  END IF;
  COMMIT; 
END;
/

--�޸�����:����һ���˵� �ʽ��������-�ڴ����
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
   select (select max(res_code) + 1 from bt_sys_res), '�ڴ����', 'mec', 0, '','0', '0', '0', '0', 3, '�ڴ����','', '', '', '', '', null, null, null, null, null, 1 from dual;
  END IF;
  COMMIT; 
END;
/

--�޸�����:���������˵� �ʽ��������-�ڴ����-��������
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='��������' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '��������', 'mec', res_code, '/mec/mecBasicSet.do?method=toEdit', '0', '1', '0', '0', 1, '��������', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/

--�޸�����:���������˵� �ʽ��������-�ڴ����-�ڲ��ʽ��ϱ�
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='�ڲ��ʽ��ϱ�' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '�ڲ��ʽ��ϱ�', 'mec', res_code, '/mec/mecFundReport.do?method=toTreeList', '0', '1', '0', '0', 2, '�ڲ��ʽ��ϱ�', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/

--�޸�����:���������˵� �ʽ��������-�ڴ����-���ƻ�
--�޸���:�ž���
--�޸�ʱ��:2012-11-26
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='���ƻ�' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '���ƻ�', 'mec', res_code, '/mec/mecDrawPlan.do?method=toTreeList', '0', '1', '0', '0', 3, '���ƻ�', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/

--�޸�����:�����ڴ�����������ñ�MEC_BASIC_SET
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
create table MEC_BASIC_SET  (
   ID                   NUMBER NOT NULL,
   MEMORY_BANK          VARCHAR2(100),
   EXTERNAL_CREDIT_BANK VARCHAR2(100),
   MEMORY_UNIT          VARCHAR2(100),
   EXTERNAL_CREDIT_UNIT VARCHAR2(100),
   WITHDRAWALS_MARGIN_RATIO NUMBER(15, 2),
   ENDMONTH_RATIO       NUMBER(15, 2),
   CONSTRAINT PK_MEC_BASIC_SET PRIMARY KEY (ID)
 );
comment on table MEC_BASIC_SET is '�ڴ�����������ñ�';
comment on column MEC_BASIC_SET.MEMORY_BANK is '�ڴ�����';
comment on column MEC_BASIC_SET.EXTERNAL_CREDIT_BANK is '�������';
comment on column MEC_BASIC_SET.MEMORY_UNIT is '�ڴ浥λ';
comment on column MEC_BASIC_SET.EXTERNAL_CREDIT_UNIT is '�����λ';
comment on column MEC_BASIC_SET.WITHDRAWALS_MARGIN_RATIO is '��֤�����';
comment on column MEC_BASIC_SET.ENDMONTH_RATIO is '��ĩ��֤�����';

--�޸�����:���������˺Ź����MEC_MANAGER_BANKACC
--�޸���:�ž���
--�޸�ʱ��:2012-11-21
create table MEC_MANAGER_BANKACC  (
     ID                   NUMBER NOT NULL,
     BANKACC              VARCHAR2(30),
     MIN_CAPITAL_VAL      NUMBER(15,2),
     CONSTRAINT PK_MEC_MANAGER_BANKACC PRIMARY KEY (ID)
  );
comment on table MEC_MANAGER_BANKACC is '�����˺Ź����';
comment on column MEC_MANAGER_BANKACC.BANKACC is '�˺�';
comment on column MEC_MANAGER_BANKACC.MIN_CAPITAL_VAL is '����ʽ�ֵ';

--�޸�����:�����ڴ��ʽ��ϱ���MEC_FUND_REPORT
--�޸���:�ž���
--�޸�ʱ��:2012-11-22
create table MEC_FUND_REPORT  (
   ID                   NUMBER NOT NULL,
   FUND_CODE            VARCHAR2(20),
   CORP_CODE            VARCHAR2(12),
   REPORT_TIME          DATE,
   CREATE_DATE          DATE,
   RMK                  VARCHAR2(100),
   CONSTRAINT PK_MEC_FUND_REPORT PRIMARY KEY (ID)
);
comment on table MEC_FUND_REPORT is '�ڴ��ʽ��ϱ���';
comment on column MEC_FUND_REPORT.FUND_CODE is '�������ɹ��򣺵�λ����+���ڣ�YYMMDD��+3λ˳���';
comment on column MEC_FUND_REPORT.CORP_CODE is '�ϱ���λ';
comment on column MEC_FUND_REPORT.REPORT_TIME is '�ϱ�ʱ��';
comment on column MEC_FUND_REPORT.CREATE_DATE is '¼������';
comment on column MEC_FUND_REPORT.RMK is '��ע';

--�޸�����:�����ڴ��ʽ��ϱ���ϸ��MEC_FUND_REPORT_DT
--�޸���:�ž���
--�޸�ʱ��:2012-11-22
create table MEC_FUND_REPORT_DT  (
   ID                   NUMBER NOT NULL,
   PARENT_ID            NUMBER NOT NULL,
   BANKACC              VARCHAR2(30),
   BANK_CODE            VARCHAR2(50),
   CUR_CODE             VARCHAR2(50),
   BANK_BAL             NUMBER(15,2),
   MIN_CAPITAL_VAL      NUMBER(15,2),
   REDUNDANT_CURRENT    NUMBER(15,2),
   REDUNDANT_REGULAR    NUMBER(15,2),
   DISPOSABLE_FUND      NUMBER(15,2),
   CONSTRAINT PK_MEC_FUND_REPORT_DT PRIMARY KEY (ID)
);
comment on table MEC_FUND_REPORT_DT is '�ڴ��ʽ��ϱ���ϸ��';
comment on column MEC_FUND_REPORT_DT.PARENT_ID is '�ڴ��ʽ��ϱ�Id';
comment on column MEC_FUND_REPORT_DT.BANKACC is '�˺�';
comment on column MEC_FUND_REPORT_DT.BANK_CODE is '���д���';
comment on column MEC_FUND_REPORT_DT.CUR_CODE is '�ұ����';
comment on column MEC_FUND_REPORT_DT.BANK_BAL is '�ʽ����';
comment on column MEC_FUND_REPORT_DT.MIN_CAPITAL_VAL is '����ʽ����';
comment on column MEC_FUND_REPORT_DT.REDUNDANT_CURRENT is '�����ʽ���ڲ���';
comment on column MEC_FUND_REPORT_DT.REDUNDANT_REGULAR is '�����ʽ��ڲ���';
comment on column MEC_FUND_REPORT_DT.DISPOSABLE_FUND is '��֧����ɢ�ʽ�';


--�޸�����:�������ƻ���MEC_DRAW_PLAN
--�޸���:�ž���
--�޸�ʱ��:2012-11-26
create table MEC_DRAW_PLAN  (
   ID                   NUMBER NOT NULL, 
   DRAW_CODE            VARCHAR2(20),
   CORP_CODE            VARCHAR2(30),
   BANK_CODE            VARCHAR2(20),
   MONEY                NUMBER(15,2),
   CUR                  VARCHAR2(6),
   LOAN_DATE            DATE,
   RMK                  VARCHAR2(100),
   CREATE_DATE          DATE,
   CONSTRAINT PK_MEC_DRAW_PLAN PRIMARY KEY (ID)
);
comment on table MEC_DRAW_PLAN is '��ȡ�ƻ���'; 
comment on column MEC_DRAW_PLAN.DRAW_CODE is '��ȡ�������ɹ��򣺵�λ����+���ڣ�YYMMDD��+3λ˳���';
comment on column MEC_DRAW_PLAN.CORP_CODE is '���뵥λ';
comment on column MEC_DRAW_PLAN.BANK_CODE is '���б��';
comment on column MEC_DRAW_PLAN.MONEY is '���';
comment on column MEC_DRAW_PLAN.CUR is '�ұ�';
comment on column MEC_DRAW_PLAN.LOAN_DATE is '��������';
comment on column MEC_DRAW_PLAN.RMK is '��ע';
comment on column MEC_DRAW_PLAN.CREATE_DATE is '¼������';
