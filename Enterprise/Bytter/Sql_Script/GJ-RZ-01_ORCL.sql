------------���Ӳ˵�    �ⲿ����̨�˹���   ------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '�ⲿ����̨�˹���'
  and sys_code='cms';  
  IF VN_COUNT < 1 THEN
   
  insert into BT_SYS_RES   
  (RES_CODE, 
   RES_NAME,
   SYS_CODE,
   FATHER_CODE, 
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '�ⲿ����̨�˹���',
         'cms',
         0,
         '',
         '0',
         '1',
         '0',
         '0',
         7,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         1
  from bt_sys_res
   where res_name = '�������'
   and sys_code='cms' ;
  END IF;
END; 
/
-----------------��������  ���˵� ��------------------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
   INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '��������'
  and sys_code='cms' and res_url='/cms/outFinApplyAction.do?method=treeView';  
  IF VN_COUNT < 1 THEN
   
  insert into BT_SYS_RES   
  (RES_CODE, 
   RES_NAME,
   SYS_CODE,
   FATHER_CODE, 
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '��������',
         'cms',
         res_code,
         '/cms/outFinApplyAction.do?method=treeView',
         '0',
         '1',
         '0',
         '0',
         1,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '�ⲿ����̨�˹���'
   and sys_code='cms' ;
  END IF;
END; 
/
-----------------��ȡȷ�Ϻ�   ���˵� ��------------------------------------

DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
   INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '��ȡȷ�Ϻ�'
  and sys_code='cms' and res_url='/cms/outFinApplyAction.do?method=getConLetter';  
  IF VN_COUNT < 1 THEN
   
   insert into BT_SYS_RES   
  (RES_CODE, 
   RES_NAME,
   SYS_CODE,
   FATHER_CODE, 
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '��ȡȷ�Ϻ�',
         'cms',
         res_code,
         '/cms/outFinApplyAction.do?method=getConLetter',
         '0',
         '1',
         '0',
         '0',
         1,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         null,
         2
  from bt_sys_res
   where res_name = '�ⲿ����̨�˹���'
   and sys_code='cms'; 
  END IF;
END;
/
--�޸����ڣ�20121123
--�޸��ˣ����
--�Ŵ�����-�ⲿ����̨�˹���-����̨��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='����̨��' AND t1.father_code=t2.res_code AND t2.res_name='�ⲿ����̨�˹���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'����̨��','cms',res_code,'/cms/financeAccount.do?method=tofinanceAccounPage'
   ,'0','1','0','0',3,'����̨��','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '�ⲿ����̨�˹���' and sys_code = 'cms';
  END IF;
  COMMIT; 
END;
/
--�޸����ڣ�20121123
--�޸��ˣ����
--�Ŵ�����-�ⲿ����̨�˹���-����̨������

DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO VN_COUNT
  FROM BT_APPROVE_BUSINESS
  where BUSINESS_CODE = 'cms_R2'
  and sys_code='cms' and table_name='cms_out_financ' 
  and URL1='../cms/financinShowInclude.jsp'  and CLASS_PATH='com.byttersoft.cms.form.FinanceAccountForm'  ;  
  IF VN_COUNT < 1 THEN
  
  INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
  VALUES ('cms_R2', 'cms', '����̨��', 'A,B,C', 'cms_out_financ', '', 'project_Money', '', 'next_checker', 'bill_code', '../cms/financinShowInclude.jsp', 'com.byttersoft.cms.form.FinanceAccountForm');
  END IF;
END;
/
------------------------�����ⲿ���������--------------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'CMS_OUT_FINANC';
  IF VN_COUNT < 1 THEN
    VC_STR := ' 
    create table cms_out_financ(
     BILL_CODE varchar2(20),----������
     enter_date date,--¼������
     financ_Type varchar2(10),--��������
     legal_Person varchar2(10),--����
     company_Name varchar2(40),--��ҵ����
     apply_Date date,--��������
     bank_Type varchar2(10),--�������
     deal_Bank varchar2(10),--��������
     cur_Code varchar2(10),--�ұ�
     credit_Type varchar2(10),--����Ʒ��
     project_Money number(18,2),--���������
     corp_id varchar2(10),----��λ
     status int,---״̬
     warrant_Money number(18,2),--���뵣�����
     warrant_Type varchar2(100),--�������
     warrant_Category varchar2(10),--������ʽ
     contract varchar2(100),--��ͬ���
     upload_File_Name VARCHAR2(500),--�ϴ��ļ���
     warrant_year varchar2(50),--��
     warrant_Quarter varchar2(50),--����
     capital_Fund_Money number(18,2),--�ʲ��ܶ�
     debts_Money number(18,2),--��ծ�ܶ�
     ownership_Money number(18,2),--������Ȩ���ܶ�
     flow_Money number(18,2),--�����ʲ�
     flow_Debts_Money number(18,2),--������ծ
     flow_Debts_Rate number(18,2),--�ʲ���ծ��
     flow_Rate number(18,2),--��������
     fast_Move_Rate number(18,2),--�ٶ�����
     company_Borrow_Money number(18,2),--��ҵ����ܶ�
     bank_Loan_Money number(18,2),--���У����д���
     gatherBall_Borrow_Money number(18,2),--���Ž������Ľ��
     gatherBall_Warrant number(18,2),--���ŶԸ���ҵ����
     flow_Loan_Money number(18,2),--���У������ʽ����
     bank_Accept_Draft number(18,2),--���гжһ�Ʊ
     item_Indemnity number(18,2),--�����ۺϱ���
     other_Number number(18,2),--���������ģ�
     item_Name varchar2(100),--��Ŀ����
     build_Unit varchar2(50),--���赥λ
     shi_Gong_Unit varchar2(50),--ʩ����λ
     item_Money number(18,2),--��Ŀ�����
     operate_Type_Ying varchar2(10),--��Ӫ����:��Ӫ����Ӫ
     operate_Type_Bao varchar2(10),--��Ӫ�����ܰ����ְ�
     indemnity_Money number(18,2),--�������
     indemnity_Limit varchar2(50),--������ֹ����
     appoint_Pattern varchar2(10),--�Ƿ�׷�ָ����ʽ
     item_Begin_Date date,--���̿�������
     item_end_Date date,--���̿�������
     item_Delay_Pay_Money number(18,2),--���������⳥
     item_Guarantee_Time varchar2(50),--���̱�����
     item_Prior_Money number(18,2),--����Ԥ����
     item_Schedule_Money number(18,2),--���̽��ȿ�
     item_Deplay_Punish_Money number(18,2),--����֧������
     item_Persist_Money number(18,2),--���̱�����
     arbitration_Org varchar2(100), --�ٲû���
     NEXT_CHECKER varchar2(150),
     approves varchar2(200),
     op varchar2(20),
     apply_fa_type varchar2(2),
     fa_type_code varchar2(20),
     fa_type_money number(18,2),
     fa_type_datestart date,
     fa_type_dateend date,
     fa_type_attchment VARCHAR2(500),
     rmk varchar2(200),
     project_rmk varchar2(500),
     SQ_BILL_CODE varchar2(30),
	 PAYBACK_NO varchar2(100),
     pb_hx_attechment varchar2(500),
	 book_no   varchar2(100)
  )' ;
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END; 
/



--�޸����ڣ�20121225
--�޸��ˣ�zourb 
--�޸����ݣ������������ֶ�
--�������ã�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM user_tab_columns
  where table_name='CMS_OUT_FINANC' AND COLUMN_NAME='REASON';
  IF VN_COUNT < 1 THEN
     execute immediate 'alter table cms_out_financ add reason varchar2(100)';
  COMMIT;
 END IF; 
END;
/


comment on column CMS_OUT_FINANC.BILL_CODE
  is '������';
comment on column CMS_OUT_FINANC.ENTER_DATE
  is '¼������';
comment on column CMS_OUT_FINANC.FINANC_TYPE
  is '��������';
comment on column CMS_OUT_FINANC.LEGAL_PERSON
  is '����';
comment on column CMS_OUT_FINANC.COMPANY_NAME
  is '��ҵ����';
comment on column CMS_OUT_FINANC.APPLY_DATE
  is '��������';
comment on column CMS_OUT_FINANC.BANK_TYPE
  is '�������';
comment on column CMS_OUT_FINANC.DEAL_BANK
  is '��������';
comment on column CMS_OUT_FINANC.CUR_CODE
  is '�ұ�';
comment on column CMS_OUT_FINANC.CREDIT_TYPE
  is '����Ʒ��';
comment on column CMS_OUT_FINANC.PROJECT_MONEY
  is '���������';
comment on column CMS_OUT_FINANC.CORP_ID
  is '��λ';
comment on column CMS_OUT_FINANC.STATUS
  is '״̬';
comment on column CMS_OUT_FINANC.WARRANT_MONEY
  is '���뵣�����';
comment on column CMS_OUT_FINANC.WARRANT_TYPE
  is '�������';
comment on column CMS_OUT_FINANC.WARRANT_YEAR
  is '��';
comment on column CMS_OUT_FINANC.WARRANT_QUARTER
  is '����';
comment on column CMS_OUT_FINANC.CAPITAL_FUND_MONEY
  is '�ʲ��ܶ�';
comment on column CMS_OUT_FINANC.DEBTS_MONEY
  is '��ծ�ܶ�';
comment on column CMS_OUT_FINANC.OWNERSHIP_MONEY
  is '������Ȩ���ܶ�';
comment on column CMS_OUT_FINANC.FLOW_MONEY
  is '�����ʲ�';
comment on column CMS_OUT_FINANC.FLOW_DEBTS_MONEY
  is '������ծ';
comment on column CMS_OUT_FINANC.FLOW_DEBTS_RATE
  is '�ʲ���ծ��';
comment on column CMS_OUT_FINANC.FLOW_RATE
  is '��������';
comment on column CMS_OUT_FINANC.FAST_MOVE_RATE
  is '�ٶ�����';
comment on column CMS_OUT_FINANC.COMPANY_BORROW_MONEY
  is '��ҵ����ܶ�';
comment on column CMS_OUT_FINANC.BANK_LOAN_MONEY
  is '���У����д���';
comment on column CMS_OUT_FINANC.GATHERBALL_BORROW_MONEY
  is '���Ž������Ľ��';
comment on column CMS_OUT_FINANC.GATHERBALL_WARRANT
  is '���ŶԸ���ҵ����';
comment on column CMS_OUT_FINANC.FLOW_LOAN_MONEY
  is '���У������ʽ����';
comment on column CMS_OUT_FINANC.BANK_ACCEPT_DRAFT
  is '���гжһ�Ʊ';
comment on column CMS_OUT_FINANC.ITEM_INDEMNITY
  is '�����ۺϱ���';
comment on column CMS_OUT_FINANC.OTHER_NUMBER
  is '���������ģ�';
comment on column CMS_OUT_FINANC.ITEM_NAME
  is '��Ŀ����';
comment on column CMS_OUT_FINANC.BUILD_UNIT
  is '���赥λ';
comment on column CMS_OUT_FINANC.SHI_GONG_UNIT
  is 'ʩ����λ';
comment on column CMS_OUT_FINANC.ITEM_MONEY
  is '��Ŀ�����';
comment on column CMS_OUT_FINANC.OPERATE_TYPE_YING
  is '��Ӫ����:��Ӫ����Ӫ';
comment on column CMS_OUT_FINANC.OPERATE_TYPE_BAO
  is '��Ӫ�����ܰ����ְ� ';
comment on column CMS_OUT_FINANC.INDEMNITY_MONEY
  is '�������';
comment on column CMS_OUT_FINANC.INDEMNITY_LIMIT
  is '������ֹ����';
comment on column CMS_OUT_FINANC.APPOINT_PATTERN
  is '�Ƿ�׷�ָ����ʽ';
comment on column CMS_OUT_FINANC.ITEM_BEGIN_DATE
  is '���̿�������';
comment on column CMS_OUT_FINANC.ITEM_END_DATE
  is '���̿�������';
comment on column CMS_OUT_FINANC.ITEM_DELAY_PAY_MONEY
  is '���������⳥';
comment on column CMS_OUT_FINANC.ITEM_GUARANTEE_TIME
  is '���̱�����';
comment on column CMS_OUT_FINANC.ITEM_PRIOR_MONEY
  is '����Ԥ����';
comment on column CMS_OUT_FINANC.ITEM_SCHEDULE_MONEY
  is '���̽��ȿ�';
comment on column CMS_OUT_FINANC.ITEM_DEPLAY_PUNISH_MONEY
  is '����֧������';
comment on column CMS_OUT_FINANC.ITEM_PERSIST_MONEY
  is '���̱�����';
comment on column CMS_OUT_FINANC.ARBITRATION_ORG
  is '�ٲû���';
  

 ----------------------------------����������������---------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO VN_COUNT
  FROM bt_param
  where  sys_code='cms' and code='special_financ_Type' and name='������������' ;
  IF VN_COUNT < 1 THEN
    insert into bt_param (code,sys_code,name,reverse6)values('special_financ_Type','cms','������������',0); 
  END IF;
END; 
/
 ------------------------------ ������������--------------------------------------
DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO VN_COUNT
    FROM BT_APPROVE_BUSINESS
  where BUSINESS_CODE = 'cms_R1'
  and sys_code='cms' and table_name='cms_out_financ' 
  and URL1='../cms/outFinancShowInclude.jsp'  and CLASS_PATH='com.byttersoft.cms.form.OutFinancingApplyForm'  ;  
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_APPROVE_BUSINESS(BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, CLASS_PATH)
   VALUES ('cms_R1', 'cms', '��������', 'A,B,C', 'cms_out_financ', '', 'project_Money', '', 'next_checker', 'bill_code', '../cms/outFinancShowInclude.jsp', 'com.byttersoft.cms.form.OutFinancingApplyForm');
  END IF;
END;
/
 
commit ;  

  