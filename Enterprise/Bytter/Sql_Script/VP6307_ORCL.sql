--�޸���:�´���
--�޸�ʱ��:2012-10-24
--�޸�����:VP6307����˾��Ʒ�¼�������˵�
--------------����˾��Ʒ�¼
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'AB_TALLY_FC_PARAM';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table AB_TALLY_FC_PARAM
(
  OPERATION_ID    NUMBER not null,
  VOUCHER_ORDER   NUMBER not null,
  OPERATION_TYPE  NUMBER not null,
  DEBIT_SUBJECTS  VARCHAR2(200),
  CREDIT_SUBJECTS VARCHAR2(200),
  constraint PK_FC_PRARM primary key (OPERATION_ID, VOUCHER_ORDER, OPERATION_TYPE)
)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
---------------��������˾��ƿ�Ŀ����˵�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE SYS_CODE= 'adm'
   and RES_NAME = '����˾��ƿ�Ŀ����'
   and RES_URL = '/admin/fcTallyAction.do?method=listTallyParam';
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '����˾��ƿ�Ŀ����',
         'adm',
         RES_CODE,
         '/admin/fcTallyAction.do?method=listTallyParam',
         '0',
         '1',
         '0',
         '0',
         2,
         '����˾��ƿ�Ŀ����',
         '',
         '',
         '',
         '',
         '',
         null,
         null,
         null,
         null,
         null,
         3,
         ''
    from bt_sys_res
   where res_name = 'ҵ���Ʒ�¼����' and sys_code='adm';
  END IF;
  COMMIT; 
END;
/
--------------�޸�ԭ�жҷ�¼��������
   update BT_SYS_RES res
      set res_name = '�������Ļ�ƿ�Ŀ����'
    where res.sys_code = 'adm'
      and res.res_name = '�жһ�Ʊ'
      and res.res_url = '/admin/tallyAction.do?method=listTallyParam';
 commit; 
 
---�޸��ˣ�����
 --�޸�����:ZY-CD-01_ORCL.sql ����ab_operation������ȱ���ֶ�
 --
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_OPERATION' AND COLUMN_NAME = 'RATMODEL';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_OPERATION add RATMODEL char(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--�޸��ˣ����
--�жһ�Ʊ
--���Ʊ��ҵ�����������ͬ�ֻ㡱�ֶ�
--[VP6753]�¿�˹ERP�ϻ��²��ӿڿ���
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'AB_RECEIVE' AND COLUMN_NAME = 'AS_SPOT_EXCHANGE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := 'alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/