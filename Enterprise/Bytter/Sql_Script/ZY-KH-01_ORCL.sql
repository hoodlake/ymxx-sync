--�޸�����:����ϵͳģ�飭�ʽ��������
--�޸���:����
--�޸�ʱ��:2012-11-22
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
--�޸���:����
--�޸�ʱ��:2012-11-22
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
--�޸���:����
--�޸�ʱ��:2012-11-22
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

--�޸�����:�ʽ��������--���˵���(�����˵�)
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec'and res_name='���˵���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'���˵���','mec','0','0','0',4);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�ʽ��������--���˵���(�����˵�)--�������ʣ������˵���
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='��������';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'��������','mec',(select res_code from 
bt_sys_res where res_name='���˵���' and sys_code='mec'),'/cms/cmsCheckRate.do','1','0',1);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�ʽ��������--���˵���(�����˵�)--���˹��������˵���
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='���˹���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'���˹���','mec',(select res_code from 
bt_sys_res where res_name='���˵���' and sys_code='mec'),'/cms/cmsCheckRule.do','1','0',2);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�ʽ��������--���˵���(�����˵�)--���˼��㣨�����˵���
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='���˼���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'���˼���','mec',(select res_code from 
bt_sys_res where res_name='���˵���' and sys_code='mec'),'/cms/cmsCheckDtl.do','1','0',3);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�ʽ��������--���˵���(�����˵�)--���˻��ܣ������˵���
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='���˻���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'���˻���','mec',(select res_code from 
bt_sys_res where res_name='���˵���' and sys_code='mec'),'/cms/cmsCheckCollect.do','1','0',4);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�ʽ��������--���˵���(�����˵�)--���˲�ѯ�������˵���
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'mec' and res_name='���˲�ѯ';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'���˲�ѯ','mec',(select res_code from 
bt_sys_res where res_name='���˵���' and sys_code='mec'),'/cms/cmsCheckSearch.do','1','0',5);
  END IF;
  COMMIT; 
END;
/

--�޸�����:�������б�tb_genertor(���˻�������)
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM tb_generator WHERE gen_name='CMS_CHECK_COLLECT_ID';
  IF VN_COUNT < 1 THEN
  INSERT INTO tb_generator(ID,gen_name,gen_value) VALUES((SELECT MAX(ID) FROM 

tb_generator)+1 ,'CMS_CHECK_COLLECT_ID',1);

  END IF;
  COMMIT; 
END;
/

--�޸�����:�������б�tb_genertor(���˹�������)
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM tb_generator WHERE gen_name='CMS_CHECK_RULE_ID';
  IF VN_COUNT < 1 THEN
  INSERT INTO tb_generator(ID,gen_name,gen_value) VALUES((SELECT MAX(ID) FROM 

tb_generator)+1 ,'CMS_CHECK_RULE_ID',1);

  END IF;
  COMMIT; 
END;
/

--�޸�����:�������б�tb_genertor(���˼�������)
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM tb_generator WHERE gen_name='CMS_CHECK_DTL_ID';
  IF VN_COUNT < 1 THEN
  INSERT INTO tb_generator(ID,gen_name,gen_value) VALUES((SELECT MAX(ID) FROM 

tb_generator)+1 ,'CMS_CHECK_DTL_ID',1);

  END IF;
  COMMIT; 
END;
/

--�޸�����:�鿴����ϵͳ�Ƿ���CMS_CHECK_RATE
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_RATE';
  IF VN_COUNT < 1 THEN
  VC_STR := 'create table CMS_CHECK_RATE(
  CORP_ID    NUMBER(10) not null,
  CHECK_RATE NUMBER(8,6) not null,
     constraint PK_CMS_CHECK_RATE primary key (CORP_ID))';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/

--�޸�����:�鿴����ϵͳ�Ƿ���CMS_CHECK_RULE
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_RULE';
  IF VN_COUNT < 1 THEN
  VC_STR := 'create table CMS_CHECK_RULE(
  ID            NUMBER(10) not null,
  OUT_CORP_ID   VARCHAR2(100) not null,
  IN_CORP_ID    VARCHAR2(100) not null,
  OUT_RULE_CODE VARCHAR2(100),
  OUT_RULE_SQL  VARCHAR2(200),
  OUT_RULE_NAME VARCHAR2(200),
  IN_RULE_CODE  VARCHAR2(100),
  IN_RULE_SQL   VARCHAR2(200),
  IN_RULE_NAME  VARCHAR2(200),
  constraint PK_CMS_CHECK_RULE primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/


--�޸�����:�鿴����ϵͳ�Ƿ���CMS_CHECK_DTL
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_DTL';
  IF VN_COUNT < 1 THEN
  VC_STR := 'create table CMS_CHECK_DTL(
  ID          NUMBER(10) not null,
  BILL_CODE   VARCHAR2(20) not null,
  CHECK_DATE  DATE not null,
  OUT_CORP_ID NUMBER(10) not null,
  IN_CORP_ID  NUMBER(10) not null,
  MONEY       NUMBER(15,2) not null,
  RATE        NUMBER(8,6),
  CHECK_RATE  NUMBER(8,6),
  OUT_INCOME  NUMBER(15,2) not null,
  IN_INCOME   NUMBER(15,2) not null,
  PRS_CODE    VARCHAR2(20) not null,
  constraint PK_CMS_CHECK_DTL primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/

--�޸�����:�鿴����ϵͳ�Ƿ���CMS_CHECK_COLLECT
--�޸���:����
--�޸�ʱ��:2012-11-22
DECLARE
  VN_COUNT    NUMBER;
  VC_STR VARCHAR2(2000);
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'CMS_CHECK_COLLECT';
  IF VN_COUNT < 1 THEN
   VC_STR := 'create table CMS_CHECK_COLLECT
(
  ID              NUMBER(10) not null,
  BILL_CODE       VARCHAR2(20) not null,
  CHECK_DATE      DATE not null,
  OUT_CORP_ID     NUMBER(10) not null,
  INCREASE_INCOME NUMBER(15,2) not null,
  DECREASE_INCOME NUMBER(15,2) not null,
          constraint PK_CMS_CHECK_COLLECT primary key (ID)
  )';
      EXECUTE IMMEDIATE VC_STR;
  END IF;
  COMMIT; 
END;
/


--���˼�����ͼ
create or replace view v_cms_check_dtl_temp as
select c1.corp_name as out_corp_name,
       c2.corp_name as in_corp_name,
       b.precative_id,  --������λID 3
       b.loan_opp, --���뵥λ����  5
       a.money, --������
       a.rate, --��������
       a.term,--����
       c.check_rate, --��������,
		a.bill_code,--ί���������
        (select out_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type') from CMS_CHECK_RULE where OUT_RULE_SQL is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp)) out_rule, --��������
       (select in_rule_sql ||(select (case param_value when 'M' then '/30000' else '/36000' end) from fc_param where param_code='interest_rate_type')  from CMS_CHECK_RULE where IN_RULE_SQL is not null and out_corp_id=(select corp_code from bt_corp where id=b.precative_id) and in_corp_id=(select corp_code from bt_corp where id=b.loan_opp))  in_rule,  --�������
       a.send_date,
       a.deadline_date
  from cms_precative_loan_send a, cms_precative_loan_info b,cms_check_rate c,bt_corp c1,bt_corp c2
 where a.father_code = b.bill_code
   and c.corp_id=b.precative_id
   and b.precative_id=c1.id
   and b.loan_opp = c2.id
/   
alter table cms_check_rate modify check_rate number(9,6);
