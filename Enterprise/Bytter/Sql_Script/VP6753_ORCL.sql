--�޸����ڣ�20121019
--�޸��ˣ����
--��������-���ݴ���
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2,
   REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
   values((select max(res_code) + 1 from bt_sys_res), '���ݴ���', 'exchange', 0, '','0', '0', '0', '0', 14, '���ݴ���','', '', '', '', '', null, null, null, null, null, 1, '');
  END IF;
  COMMIT; 
END;
/

--�޸����ڣ�20121019
--�޸��ˣ����
--��������-���ݴ���-ƾ֤ģ�嶨��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='ƾ֤ģ�嶨��' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'ƾ֤ģ�嶨��','exchange',res_code,'/netbank/ErpVoucherTemplate.do?method=selectCorp'
   ,'0','1','0','0',2,'ƾ֤ģ�嶨��','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/

--�޸����ڣ�20121019
--�޸��ˣ���̺�
--��������-���ݴ���-��ƿ�Ŀ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='��ƿ�Ŀ����' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'��ƿ�Ŀ����','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toAccountingItemsCorp'
   ,'0','1','0','0',3,'��ƿ�Ŀ����','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/
--�޸����ڣ�20121019
--�޸��ˣ����
--��������-���ݴ���-�ո�������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='�ո�������' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'�ո�������','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCorpPage'
   ,'0','1','0','0',4,'�ո�������','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/

--�޸����ڣ�20121019
--�޸��ˣ���̺�
--��������-���ݴ���-���ӻ�ƿ�Ŀ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='�ո����Ʒ�¼ȷ��' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'�ո����Ʒ�¼ȷ��','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCheckCorpPage'
   ,'0','1','0','0',5,'�ո����Ʒ�¼ȷ��','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/

--2.2	ƾ֤ģ�涨��
--2.2.1ƾ֤����ERP_VOUCHER_TYPE��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_VOUCHER_TYPE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_VOUCHER_TYPE(ID NUMBER not null,
                                VOUCHER_TYPE_CODE VARCHAR2(2),
                                VOUCHER_TYPE_NAME CHAR(10),
                                constraint PK_ERP_VOUCHER_TYPE primary
                                key(ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column ERP_VOUCHER_TYPE.VOUCHER_TYPE_CODE is 'ƾ֤������';
comment on column ERP_VOUCHER_TYPE.VOUCHER_TYPE_NAME is 'ƾ֤�������';

--��ʼ��ƾ֤���
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(1,'01','��');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(2,'02','��');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(3,'03','ת');

--2.2.2��������ERP_ TRANSFER_TYPE��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_TRANSFER_TYPE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_TRANSFER_TYPE  (
   ID  NUMBER  not null,
   TRANSFER_TYPE_CODE   VARCHAR2(2),
   TRANSFER_TYPE_NAME   VARCHAR2(100),
   constraint PK_ERP_TRANSFER_TYPE primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_TRANSFER_TYPE.TRANSFER_TYPE_CODE is
'����������';
comment on column ERP_TRANSFER_TYPE.TRANSFER_TYPE_NAME is
'�����������';
--��ʼ���������
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(1,'01','��OMS');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(2,'02','��SAP');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(3,'03','����');
--select * from bt_corp
--2.2.3ƾ֤ģ�嶨������ERP_VOUCHER_TEMPLATE��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_VOUCHER_TEMPLATE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_VOUCHER_TEMPLATE (
   ID NUMBER not null,
   BUSINESS_CODE        VARCHAR2(32),
   CORP_CODE            VARCHAR2(4),
   TRANSFER_TYPE_CODE   VARCHAR(2),
   VOUCHER_TYPE_CODE    CHAR(2),
   BUSINESS_TYPE        VARCHAR2(100),
   ITEM_CODE            VARCHAR2(40),
   MODIFY_DATE          DATE,
   RMK                  VARCHAR2(200),
   STATUS NUMBER  default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_VOUCHER_TEMPLATE.BUSINESS_CODE is
'ҵ�����';
comment on column ERP_VOUCHER_TEMPLATE.CORP_CODE is
'��λ����';
comment on column ERP_VOUCHER_TEMPLATE.VOUCHER_TYPE_CODE is
'ƾ֤��𣨹���ERP_VOUCHER_TYPE��';
comment on column ERP_VOUCHER_TEMPLATE.TRANSFER_TYPE_CODE is
'������𣨹���ERP_TRANSFER_TYPE��';
comment on column ERP_VOUCHER_TEMPLATE.BUSINESS_TYPE is
'ҵ������';
comment on column ERP_VOUCHER_TEMPLATE.MODIFY_DATE is
'��������';
comment on column ERP_VOUCHER_TEMPLATE.RMK is
'��ע';
comment on column ERP_VOUCHER_TEMPLATE.STATUS is
'״̬
0��Ĭ��
-2��ɾ��';

--2.2.4ƾ֤ģ�嶨���¼��ERP_VOUCHER_TEMPLATE_DTL��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_VOUCHER_TEMPLATE_DTL';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_VOUCHER_TEMPLATE_DTL (
   ID  NUMBER  not null,
   ENTRY_CODE           VARCHAR2(32),
   BUSINESS_CODE        VARCHAR2(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         VARCHAR2(60),
   SUBJECT_NAME         VARCHAR2(100),
   SPECIAL_ACCOUNT_CODE VARCHAR2(100),
   CASH_FLOW_CODE       VARCHAR2(100),
   SUBJECT_CLASS        VARCHAR2(100),
   ACCOUNT_TYPE         VARCHAR2(100),
   DES                  VARCHAR2(200),
   STATUS NUMBER default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE_DTL primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_VOUCHER_TEMPLATE_DTL.ENTRY_CODE is
'��¼����';
comment on column ERP_VOUCHER_TEMPLATE_DTL.BUSINESS_CODE is
'ҵ����루����ERP_VOUCHER_TEMPLATE��';
comment on column ERP_VOUCHER_TEMPLATE_DTL.LOAN_DIRECTION is
'������� 0,�� 1,��';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SUBJECT_CODE is
'��Ŀ���';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SUBJECT_NAME is
'��Ŀ����';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SPECIAL_ACCOUNT_CODE is
'�ر������';
comment on column ERP_VOUCHER_TEMPLATE_DTL.CASH_FLOW_CODE is
'�ֽ���������';
comment on column ERP_VOUCHER_TEMPLATE_DTL.SUBJECT_CLASS is
'��Ŀ����';
comment on column ERP_VOUCHER_TEMPLATE_DTL.ACCOUNT_TYPE is
'�˻�����';
comment on column ERP_VOUCHER_TEMPLATE_DTL.DES is
'ժҪ';
comment on column ERP_VOUCHER_TEMPLATE_DTL.STATUS is
'״̬
0��Ĭ��
-2��ɾ��';

--2.3	Ԥ���Ŀ��ҵ�����Ͷ�Ӧ
--��ԭԤ���Ŀά������������ҵ������
alter table fbs_item add BUSINESS_TYPE VARCHAR2(100);
comment on column fbs_item.BUSINESS_TYPE is
'ҵ������';


--2.4	������Դ�����ҹ�����
--������Դ�����ҹ������ERP_DATA_SOURCES��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_DATA_SOURCES';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_DATA_SOURCES  (
   ID NUMBER not null,
   DATA_SOURCES_CODE    CHAR(1),
   DATA_SOURCES_NAME    VARCHAR2(100),
   CD_SIGN              CHAR(1),
   IS_RECONCILIATION CHAR(1),
   IS_MANUAL_CONFIRMATION CHAR(1),
   MATCHING_RULE        VARCHAR2(100),
   MATCHING_TABLE_NAME  VARCHAR2(100),
   RMK                  VARCHAR2(200),
   constraint PK_ERP_DATA_SOURCES primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column ERP_DATA_SOURCES.DATA_SOURCES_CODE is
'������Դ����';
comment on column ERP_DATA_SOURCES.DATA_SOURCES_NAME is
'������Դ����';
comment on column ERP_DATA_SOURCES.CD_SIGN is
'���� 0,�� 1,�� 2,ȫ��';
comment on column ERP_DATA_SOURCES.IS_RECONCILIATION is
'�Ƿ���� 0,�� 1,��';
comment on column ERP_DATA_SOURCES.IS_MANUAL_CONFIRMATION is
'���Һ���Ҫ�ֹ�ȷ�� 0,�� 1,��';
comment on column ERP_DATA_SOURCES.MATCHING_RULE is
'���ҹ��򣨶���ֶ��ö��Ÿ�����';
comment on column ERP_DATA_SOURCES.MATCHING_TABLE_NAME is
'���ұ���';
comment on column ERP_DATA_SOURCES.RMK is
'��ע';
--��ʼ��������Դ�Լ����ҹ������ݣ�ע��ֻʵ�ָ���ң�����ֻ��ϵͳ�����ERP������Դ�Ĳ���Ҫ���ң�
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(1,'0','����','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','����');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(2,'1','ϵͳ����','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','ϵͳ����');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(3,'2','ERP����','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','ERP����');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(4,'3','��������','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','��������');

--2.5	���ݲ�¼����
--���ݲ�¼�����erp_additional_define��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_ADDITIONAL_DEFINE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_ADDITIONAL_DEFINE  (
   ID NUMBER not null,
   FIELD_CODE           VARCHAR2(60),
   FIELD_NAME           VARCHAR2(100),
   IS_ADDITIONAL        CHAR(1),
   IS_SHOW              CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_ADDITIONAL_DEFINE.ID is
'���';
comment on column ERP_ADDITIONAL_DEFINE.FIELD_CODE is
'��¼�ֶ�';
comment on column ERP_ADDITIONAL_DEFINE.FIELD_NAME is
'��¼�ֶ�������';
comment on column ERP_ADDITIONAL_DEFINE.IS_ADDITIONAL is
'�Ƿ���Ҫ��¼ 0,�� 1,��';
comment on column ERP_ADDITIONAL_DEFINE.IS_SHOW is
'�Ƿ���ʾ 0,�� 1,��';
--��ʼ�����ݲ�¼��������
--���ھ�����Ŀ
/*
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(1,'TRANS_TIME','��������','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(2,'CORP_CODE','��λ����','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(3,'BANK_ACC','�տ��˺�','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(4,'BANK_NAME','�տ����','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(5,'CUR','�ұ�','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(6,'AMT','���','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(7,'POSTSCRIPT','��;','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(8,'OPP_ACC_NO','�����˺�','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(9,'OPP_ACC_NAME','�����˻�����','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(10,'OPP_ACC_BANK','�������','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(11,'BUDGET_CODE','Ԥ���Ŀ','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(12,'BUSINESS_CODE','ҵ������','0','0');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(13,'DATA_SOURCES_CODE','������Դ','0','0');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(14,'COST_CENTER','�ɱ�����','0','0');
*/
--���ڰ¿�˹��Ŀ
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(1,'TRANS_TIME','��������','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(2,'CORP_CODE','��λ����','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(3,'BANK_ACC','�տ��˺�','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(4,'BANK_NAME','�տ����','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(5,'CUR','�ұ�','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(6,'AMT','���','0','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(7,'POSTSCRIPT','��;','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(8,'OPP_ACC_NO','�����˺�','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(9,'OPP_ACC_NAME','�����˻�����','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(10,'OPP_ACC_BANK','�������','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(11,'BUDGET_CODE','Ԥ���Ŀ','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(12,'BUSINESS_CODE','ҵ������','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(13,'DATA_SOURCES_CODE','������Դ','1','1');
insert into ERP_ADDITIONAL_DEFINE(ID,FIELD_CODE,FIELD_NAME,IS_ADDITIONAL,IS_SHOW)values(14,'COST_CENTER','�ɱ�����','1','1');

--2.6	�������ݹ���
--2.7	�ո��¼����_��������
--�޸��ˣ���˫
--�޸����ڣ�2012-10-29
--�޸����ݣ����������в����б��У����Ӳ������Ƿ�����һ�Զ��ȷ�ϡ���ȱʡΪ�����ã�ѡ�д˲���ʱ����ʾһ�Զ��ǩ����Ӧ���ܣ�
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('oneToMany','nis','�Ƿ�����һ�Զ��ȷ��',0,0,'0 ������;1 ����','0,������;1,����',1);

--��ʷ��ϸ�������ֶΡ�Ψһȷ�ϡ���Ĭ��0
alter table bis_acc_his_dtl add unique_confirm CHAR(1) default '0';
--����ʷ��ϸ���������ֶ�
alter table bis_acc_his_dtl add data_sources_code CHAR(1) default '0';
alter table bis_acc_his_dtl add bill_status CHAR(1) default '0';
alter table bis_acc_his_dtl add mergern_id number;
alter table bis_acc_his_dtl add budget_code VARCHAR2(40);
alter table bis_acc_his_dtl add subject_code VARCHAR2(20);
alter table bis_acc_his_dtl add subject_name VARCHAR2(40);
alter table bis_acc_his_dtl add BUSINESS_TYPE VARCHAR2(100);
alter table bis_acc_his_dtl add cost_center_code VARCHAR2(20);
alter table bis_acc_his_dtl add nz_stauts CHAR(1) default '0';
alter table bis_acc_his_dtl add erp_voucher_no VARCHAR2(30);
alter table bis_acc_his_dtl add is_blend CHAR(1) default '0';
alter table bis_acc_his_dtl add SUPER_SUBJECT_CODE VARCHAR2(40);
alter table BIS_ACC_HIS_DTL add vendor_num varchar2(31);
comment on column bis_acc_his_dtl.data_sources_code is
'������Դ(0������  1��ϵͳ����  2,ERP����  3������)';
comment on column bis_acc_his_dtl.bill_status is
'״̬��Ĭ��0��ԭ��  1,�ѹ��� 2���Ѳ��  3���Ѻϲ� 4��Ψһ��';
comment on column bis_acc_his_dtl.mergern_id is
'�ϲ�Id';
comment on column bis_acc_his_dtl.budget_code is
'Ԥ���Ŀ';
comment on column bis_acc_his_dtl.subject_code is
'��ƿ�Ŀ';
comment on column bis_acc_his_dtl.subject_name is
'��ƿ�Ŀ����';
comment on column bis_acc_his_dtl.BUSINESS_TYPE is
'ҵ������';
comment on column bis_acc_his_dtl.cost_center_code is
'�ɱ�����';
comment on column bis_acc_his_dtl.nz_stauts is
'Ťת״̬';
comment on column bis_acc_his_dtl.erp_voucher_no is
'erpƾ֤��';
comment on column bis_acc_his_dtl.is_blend is
'�Ƿ񹴶� Ĭ��0��δ���� 1���ѹ���';
comment on column bis_acc_his_dtl.SUPER_SUBJECT_CODE is
'�ϼ���ƿ�Ŀ';
comment on column bis_acc_his_dtl.vendor_num is
'��Ӧ�̱���';

--������ʷ����
UPDATE bis_acc_his_dtl SET nz_stauts='0' WHERE nz_stauts IS NULL;
UPDATE bis_acc_his_dtl SET data_sources_code='0' WHERE data_sources_code IS NULL;

--��ָ����������ֶ�
alter table bis_exc add data_sources_code CHAR(1);
alter table bis_exc add serial_id CHAR(32);
comment on column bis_exc.data_sources_code is
'������Դ(0������  1��ϵͳ����  2,ERP����  3������)';
comment on column bis_exc.serial_id is
'��ϸ���';

--������ֱ�bis_acc_his_dtl_split��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BIS_ACC_HIS_DTL_SPLIT';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BIS_ACC_HIS_DTL_SPLIT  (
   ID NUMBER not null,
   SERIAL_ID CHAR(32)  not null,
   TRANS_TIME           DATE,
   CORP_ID              VARCHAR2(20),
   CORP_NAME            VARCHAR2(80),
   BANK_ACC             VARCHAR2(50),
   BANK_NAME            VARCHAR2(140),
   ACC_NAME             VARCHAR2(140),
   CUR                  VARCHAR2(10),
   AMT                  NUMBER(15,2),
   OPP_ACC_NO           VARCHAR2(50),
   OPP_ACC_NAME         VARCHAR2(140),
   OPP_ACC_BANK         VARCHAR2(140),
   ABS                  VARCHAR2(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          VARCHAR2(40),
   BUDGET_NAME          VARCHAR2(100),
   SUBJECT_CODE         VARCHAR2(30),
   SUBJECT_NAME         VARCHAR2(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     VARCHAR2(20),
   BUSINESS_TYPE        VARCHAR2(100),
   DATA_SOURCES_CODE    VARCHAR2(12),
   NZ_STATUS            CHAR(1)   DEFAULT ''0'',
   POSTSCRIPT           VARCHAR2(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       VARCHAR2(30),
   SUPER_SUBJECT_CODE   VARCHAR2(40),
   CUR_CODE		VARCHAR2(10),
   constraint PK_BIS_ACC_HIS_DTL_SPLIT primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on table BIS_ACC_HIS_DTL_SPLIT is
'��ʷ��ϸ��ֱ�';
comment on column BIS_ACC_HIS_DTL_SPLIT.SERIAL_ID is
'��ϸ���';
comment on column BIS_ACC_HIS_DTL_SPLIT.TRANS_TIME is
'����ʱ��';
comment on column BIS_ACC_HIS_DTL_SPLIT.CORP_ID is
'��λId';
comment on column BIS_ACC_HIS_DTL_SPLIT.CORP_NAME is
'��λ����';
comment on column BIS_ACC_HIS_DTL_SPLIT.BANK_ACC is
'�����˺�';
comment on column BIS_ACC_HIS_DTL_SPLIT.BANK_NAME is
'��������';
comment on column BIS_ACC_HIS_DTL_SPLIT.ACC_NAME is
'�˻���';
comment on column BIS_ACC_HIS_DTL_SPLIT.CUR is
'�ұ�';
comment on column BIS_ACC_HIS_DTL_SPLIT.AMT is
'���';
comment on column BIS_ACC_HIS_DTL_SPLIT.OPP_ACC_NO is
'�Ը��˺�';
comment on column BIS_ACC_HIS_DTL_SPLIT.OPP_ACC_NAME is
'�Ը��˺ſ�����';
comment on column BIS_ACC_HIS_DTL_SPLIT.OPP_ACC_BANK is
'�Ը��˺ſ�����';
comment on column BIS_ACC_HIS_DTL_SPLIT.ABS is
'ժҪ';
comment on column BIS_ACC_HIS_DTL_SPLIT.CD_SIGN is
'��֧��־ 0���� 1����';
comment on column BIS_ACC_HIS_DTL_SPLIT.BUDGET_CODE is
'Ԥ���Ŀ';
comment on column BIS_ACC_HIS_DTL_SPLIT.BUDGET_NAME is
'Ԥ���Ŀ����';
comment on column BIS_ACC_HIS_DTL_SPLIT.SUBJECT_CODE is
'��Ŀ���';
comment on column BIS_ACC_HIS_DTL_SPLIT.SUBJECT_NAME is
'��Ŀ����';
comment on column BIS_ACC_HIS_DTL_SPLIT.IS_BL is
'�Ƿ�¼ 0����  1����';
comment on column BIS_ACC_HIS_DTL_SPLIT.COST_CENTER_CODE is
'�ɱ����ı���';
comment on column BIS_ACC_HIS_DTL_SPLIT.BUSINESS_TYPE is
'ҵ������';
comment on column BIS_ACC_HIS_DTL_SPLIT.DATA_SOURCES_CODE is
'������Դ';
comment on column BIS_ACC_HIS_DTL_SPLIT.NZ_STATUS is
'Ťת״̬
0��ԭʼ״̬��Ĭ�ϣ�
1����ƥ��
2����ȷ��';
comment on column BIS_ACC_HIS_DTL_SPLIT.POSTSCRIPT is
'����';
comment on column BIS_ACC_HIS_DTL_SPLIT.HIS_STATUS is
'��ϸ��ʷ״̬';
comment on column BIS_ACC_HIS_DTL_SPLIT.ERP_VOUCHER_NO is
'erpƾ֤��';
comment on column BIS_ACC_HIS_DTL_SPLIT.SUPER_SUBJECT_CODE is
'�ϼ���ƿ�Ŀ';

--��ӹ�Ӧ�̱��� 
alter table BIS_ACC_HIS_DTL_SPLIT add vendor_num varchar2(31);

--�����ϲ���bis_acc_his_dtl_mergen��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BIS_ACC_HIS_DTL_MERGEN';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BIS_ACC_HIS_DTL_MERGEN  (
   ID  NUMBER not null,
   TRANS_TIME           DATE,
   CORP_ID              VARCHAR2(20),
   CORP_NAME            VARCHAR2(80),
   BANK_ACC             VARCHAR2(50),
   BANK_NAME            VARCHAR2(140),
   ACC_NAME             VARCHAR2(140),
   CUR                  VARCHAR2(10),
   AMT                  NUMBER(15,2),
   OPP_ACC_NO           VARCHAR2(50),
   OPP_ACC_NAME         VARCHAR2(140),
   OPP_ACC_BANK         VARCHAR2(140),
   ABS                  VARCHAR2(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          VARCHAR2(40),
   BUDGET_NAME          VARCHAR2(100),
   SUBJECT_CODE         VARCHAR2(30),
   SUBJECT_NAME         VARCHAR2(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     VARCHAR2(20),
   BUSINESS_TYPE        VARCHAR2(100),
   DATA_SOURCES_CODE    VARCHAR2(12),
   NZ_STATUS            CHAR(1) DEFAULT ''0'',
   POSTSCRIPT           VARCHAR2(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       VARCHAR2(30),
   SUPER_SUBJECT_CODE   VARCHAR2(40),
   CUR_CODE		VARCHAR2(10),
   constraint PK_BIS_ACC_HIS_DTL_MERGEN primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on table BIS_ACC_HIS_DTL_MERGEN is
'��ʷ��ϸ�ϲ���';
comment on column BIS_ACC_HIS_DTL_MERGEN.TRANS_TIME is
'����ʱ��';
comment on column BIS_ACC_HIS_DTL_MERGEN.CORP_ID is
'��λId';
comment on column BIS_ACC_HIS_DTL_MERGEN.CORP_NAME is
'��λ����';
comment on column BIS_ACC_HIS_DTL_MERGEN.BANK_ACC is
'�����˺�';
comment on column BIS_ACC_HIS_DTL_MERGEN.BANK_NAME is
'��������';
comment on column BIS_ACC_HIS_DTL_MERGEN.ACC_NAME is
'�˻���';
comment on column BIS_ACC_HIS_DTL_MERGEN.CUR is
'�ұ�';
comment on column BIS_ACC_HIS_DTL_MERGEN.AMT is
'���';
comment on column BIS_ACC_HIS_DTL_MERGEN.OPP_ACC_NO is
'�Է��˺�';
comment on column BIS_ACC_HIS_DTL_MERGEN.OPP_ACC_NAME is
'�Է�������';
comment on column BIS_ACC_HIS_DTL_MERGEN.OPP_ACC_BANK is
'�Է�������';
comment on column BIS_ACC_HIS_DTL_MERGEN.ABS is
'ժҪ';
comment on column BIS_ACC_HIS_DTL_MERGEN.CD_SIGN is
'��֧����';
comment on column BIS_ACC_HIS_DTL_MERGEN.BUDGET_CODE is
'Ԥ���Ŀ';
comment on column BIS_ACC_HIS_DTL_MERGEN.BUDGET_NAME is
'Ԥ������';
comment on column BIS_ACC_HIS_DTL_MERGEN.SUBJECT_CODE is
'��Ŀ����';
comment on column BIS_ACC_HIS_DTL_MERGEN.SUBJECT_NAME is
'��Ŀ����';
comment on column BIS_ACC_HIS_DTL_MERGEN.IS_BL is
'�Ƿ�¼';
comment on column BIS_ACC_HIS_DTL_MERGEN.COST_CENTER_CODE is
'�ɱ�����';
comment on column BIS_ACC_HIS_DTL_MERGEN.BUSINESS_TYPE is
'ҵ�����';
comment on column BIS_ACC_HIS_DTL_MERGEN.DATA_SOURCES_CODE is
'������Դ';
comment on column BIS_ACC_HIS_DTL_MERGEN.NZ_STATUS is
'Ťת״̬
0��ԭʼ״̬��Ĭ�ϣ�
1����ƥ��
2����ȷ��';
comment on column BIS_ACC_HIS_DTL_MERGEN.POSTSCRIPT is
'����';
comment on column BIS_ACC_HIS_DTL_MERGEN.HIS_STATUS is
'��ϸ��ʷ״̬';
comment on column BIS_ACC_HIS_DTL_MERGEN.ERP_VOUCHER_NO is
'erpƾ֤��';
comment on column BIS_ACC_HIS_DTL_MERGEN.SUPER_SUBJECT_CODE is
'�ϼ���ƿ�Ŀ';

--���ӹ�Ӧ�̱���
alter table BIS_ACC_HIS_DTL_MERGEN add vendor_num varchar2(31);


--�ɱ����ı�ERP_COST_CENTER��
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_COST_CENTER';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_COST_CENTER  (
   ID NUMBER not null,
   COST_CENTER_CODE     VARCHAR2(20),
   COST_CENTER_NAME     VARCHAR2(100),
   COST_CONTROL_RANGE   NUMERIC(15, 2),
   CORP_CODE            CHAR(4),
   COST_CONTER_TYPE     CHAR(1),
   VALID_DATE           DATE,
   END_DATE             DATE,
   constraint PK_ERP_COST_CENTER primary key (ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on table ERP_COST_CENTER is
'�ɱ�����ά����';
comment on column ERP_COST_CENTER.ID is
'���';
comment on column ERP_COST_CENTER.COST_CENTER_CODE is
'�ɱ����ı���';
comment on column ERP_COST_CENTER.COST_CENTER_NAME is
'�ɱ���������';
comment on column ERP_COST_CENTER.COST_CONTROL_RANGE is
'�ɱ����Ʒ�Χ';
comment on column ERP_COST_CENTER.CORP_CODE is
'��˾����';
comment on column ERP_COST_CENTER.COST_CONTER_TYPE is
'�ɱ���������';
comment on column ERP_COST_CENTER.VALID_DATE is
'��Ч��ʼ����';
comment on column ERP_COST_CENTER.END_DATE is
'��ֹ����';

 create or replace view view_bis_acc_his_dtl_buget as 
 select dtl.serial_id serial_id,
        dtl.trans_time trans_time,      --��������
       corp.id corp_id,                --��λId
       corp.corp_name corp_name,       --��λ����
       dtl.acc_name acc_name,        --�տ���
       dtl.bank_acc bank_acc,          --�տ��˺�
       dtl.bank_name bank_name,        --�տ����
       currency.cur_name cur,          --�ұ�
       currency.cur_code cur_code,
       dtl.amt amt,                    --���
       dtl.opp_acc_no opp_acc_no,      --�����˺�
       dtl.opp_acc_name opp_acc_name,  --�����˻�����
       dtl.opp_acc_bank opp_acc_bank,  --�������
       dtl.abs abs,                    --��;
       dtl.cd_sign cd_sign,            --��֧����         
        dtl.nz_stauts nz_stauts,  --��ת״̬       
        dtl.bill_status,                  --����״̬
        dtl.subject_code,                 --ƥ����ҵ��Ŀ
        dtl.subject_name,                 --ƥ����ҵ��Ŀ
        dtl.business_type,                 --ҵ������       
        dtl.cost_center_code,                 --�ɱ�����
        dtl.postscript,                       --��; 
        dtl.data_sources_code,                --������Դ     
        dtl.SUPER_SUBJECT_CODE,   
        fi.name budget_code_name, --ƥ��Ԥ������
        dtl.budget_code budget_code_dtl,
        fi.name budget_name, --ƥ��Ԥ������
        dtl.budget_code budget_code,
        dtl.vendor_num vendor_num,--��Ӧ�̱���
        dtl.is_blend is_blend,
        dtl.unique_confirm unique_confirm       
  from  bis_acc_his_dtl dtl 
        left join fbs_item fi on fi.code =  dtl.budget_code
   left join bt_currency currency on dtl.cur = currency.cur_code,
  v_acc_list acc, bt_corp corp
  where dtl.bank_acc = acc.BANK_ACC
   and acc.CORP_CODE = corp.corp_code;
/
      
--  view_bis_acc_his_dtl_s_m_o  ��ֺϲ�ԭʼ������ͼ
  --  view_bis_acc_his_dtl_s_m_o  ��ֺϲ�ԭʼ������ͼ
create or replace view view_bis_acc_his_dtl_s_m_o as
select to_char(split.id) id,
       split.serial_id serial_id,
       split.nz_status nz_stauts,  --��ת״̬
       split.trans_time trans_time,      --��������
       split.corp_id  corp_id,                --��λId
       split.corp_name corp_name,       --��λ����
       split.acc_name acc_name,          --�տ���
       split.bank_acc bank_acc,          --�տ��˺�
       split.bank_name bank_name,        --�տ����
       split.cur_code cur_code,          --�ұ����
       split.cur cur,          --�ұ�����
       split.amt amt,                    --���
       split.opp_acc_no opp_acc_no,      --�����˺�
       split.opp_acc_name opp_acc_name,  --�����˻�����
       split.opp_acc_bank opp_acc_bank,  --�������
       split.abs abs,                    --��;
       split.cd_sign cd_sign,            --��֧����
       split.budget_code budget_code,--ƥ��Ԥ���Ŀ
       split.budget_name budget_name, --ƥ��Ԥ������
       split.subject_code subject_code,--ƥ����ҵ��Ŀ
       split.subject_name subject_name, --ƥ����ҵ��Ŀ
       split.business_type,              --ҵ������
       split.cost_center_code,              --�ɱ�����
       split.postscript,              --��;
       split.data_sources_code,                       --������Դ
       split.SUPER_SUBJECT_CODE,       --�ϼ���ƿ�Ŀ
       split.is_bl is_bl,             --�Ƿ񹴶�  0 ����   1 ��
       split.vendor_num vendor_num,
       '2' as IS_SPLIT_MERGN_ONE                
  from bis_acc_his_dtl_split split
union all
select to_char(mergen.id) id,
       '' as serial_id,
       mergen.nz_status nz_stauts,  --��ת״̬
       mergen.trans_time trans_time,      --��������
       mergen.corp_id  corp_id,                --��λId
       mergen.corp_name corp_name,       --��λ����
       mergen.acc_name acc_name,          --�տ���
       mergen.bank_acc bank_acc,          --�տ��˺�
       mergen.bank_name bank_name,        --�տ����
       mergen.cur_code cur_code,          --�ұ����
       mergen.cur cur,          --�ұ�
       mergen.amt amt,                    --���
       mergen.opp_acc_no opp_acc_no,      --�����˺�
       mergen.opp_acc_name opp_acc_name,  --�����˻�����
       mergen.opp_acc_bank opp_acc_bank,  --�������
       mergen.abs abs,                    --��;
       mergen.cd_sign cd_sign,            --��֧����
       mergen.budget_code budget_code,--ƥ��Ԥ���Ŀ
       mergen.budget_name budget_name, --ƥ��Ԥ������
       mergen.subject_code subject_code,--ƥ����ҵ��Ŀ
       mergen.subject_name subject_name, --ƥ����ҵ��Ŀ
       mergen.business_type,              --ҵ������
       mergen.cost_center_code,              --�ɱ�����
       mergen.postscript,              --��;
       mergen.data_sources_code,                       --������Դ
       mergen.SUPER_SUBJECT_CODE,
       '' as is_bl,
       mergen.vendor_num vendor_num,
       '3' as IS_SPLIT_MERGN_ONE                
  from bis_acc_his_dtl_mergen mergen
  union all
select one.serial_id id,
       one.serial_id serial_id,
       one.nz_stauts nz_stauts,  --��ת״̬
       one.trans_time trans_time,      --��������
       to_char(one.corp_id)  corp_id,                --��λId
       one.corp_name corp_name,       --��λ����
       one.acc_name acc_name,          --�տ���
       one.bank_acc bank_acc,          --�տ��˺�
       one.bank_name bank_name,        --�տ����
       one.cur_code cur_code,          --�ұ����
       one.cur cur,          --�ұ�
       one.amt amt,                    --���
       one.opp_acc_no opp_acc_no,      --�����˺�
       one.opp_acc_name opp_acc_name,  --�����˻�����
       one.opp_acc_bank opp_acc_bank,  --�������
       one.abs abs,                    --��;
       one.cd_sign cd_sign,            --��֧����
       one.budget_code budget_code,--ƥ��Ԥ���Ŀ
       one.budget_name budget_name, --ƥ��Ԥ������
       one.subject_code subject_code,--ƥ����ҵ��Ŀ
       one.subject_name subject_name, --ƥ����ҵ��Ŀ
       one.business_type,              --ҵ������
       one.cost_center_code,              --�ɱ�����
       one.postscript,              --��;
       one.data_sources_code,                       --������Դ
       one.SUPER_SUBJECT_CODE,
       one.is_blend is_bl,
       one.vendor_num vendor_num,
       '4' as IS_SPLIT_MERGN_ONE              
  from view_bis_acc_his_dtl_buget one
  where one.bill_status = '0'
  and ('0' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis'))
      or ('1' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis') and unique_confirm='1');
 /

--�жһ�Ʊ
--���Ʊ��ҵ�����������ͬ�ֻ㡱�ֶ�
 
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
    VC_STR := ' ALTER TABLE AB_RECEIVE ADD AS_SPOT_EXCHANGE CHAR(1) DEFAULT ''0'' ';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--�ո���ƥ������趨
update bt_sys_res set res_url='/admin/budgetRuleCorp.jsp' where  sys_code='adm' and RES_NAME = '�ո���ƥ������趨';

insert into bt_sys_res
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
values
  ((select max(res_code) + 1 from bt_sys_res),
   'ERP��������',
   'exchange',
   0,
   '',
   '0',
   '0',
   '0',
   '0',
   14,
   'ERP��������',
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
   1,
   '');
   
   
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'ERP���ݿ�ά��', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP��������'), '/dataexchange/erpMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'ERP���ݿ�ά��', '', '', '', '', '', null, null, null, null, null, 2, '');

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'SAP���ݿ�ά��', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP��������'), '/dataexchange/sapMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'SAP���ݿ�ά��', '', '', '', '', '', null, null, null, null, null, 2, '');
  

-- Create table
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'ERP_MIDDLE_SYSTEM_DATABASE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table ERP_MIDDLE_SYSTEM_DATABASE(
  id             VARCHAR2(32) not null,
  ip             VARCHAR2(30),
  port           VARCHAR2(20),
  user_name      VARCHAR2(30),
  data_base_name VARCHAR2(50),
  pass_word      VARCHAR2(20),
  db_type        VARCHAR2(50),
  op_code        VARCHAR2(50),
  op_name        VARCHAR2(50),
  reverse1       VARCHAR2(200),
  reverse2       VARCHAR2(100),
  op_time        VARCHAR2(50))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

-- Add comments to the columns 
comment on column ERP_MIDDLE_SYSTEM_DATABASE.id
  is '����';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.ip
  is 'ip��ַ';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.port
  is '�˿ں�';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.user_name
  is '�û���';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.data_base_name
  is '���ݿ�����';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.pass_word
  is '����';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.db_type
  is '��������';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.op_code
  is '��������';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.op_name
  is '������';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.reverse1
  is '��ע';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.reverse2
  is '��ǰ����˾����ʹ��';
comment on column ERP_MIDDLE_SYSTEM_DATABASE.op_time
  is '��������';

  
-- Create table
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'SAP_MIDDLE_SYSTEM_DATABASE';
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table SAP_MIDDLE_SYSTEM_DATABASE(
  id        VARCHAR2(32) not null,
  corpcode  VARCHAR2(30),
  client    VARCHAR2(20),
  user_name VARCHAR2(20),
  pass_word VARCHAR2(20),
  ashost    VARCHAR2(20),
  sysnr     VARCHAR2(10),
  lang      VARCHAR2(10),
  reverse1  VARCHAR2(200),
  reverse2  VARCHAR2(200),
  reverse3  VARCHAR2(300),
  reverse4  VARCHAR2(300),
  reverse5  VARCHAR2(300),
  op_time   TIMESTAMP(6))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

-- Add comments to the columns 
comment on column SAP_MIDDLE_SYSTEM_DATABASE.id
  is '����';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.corpcode
  is '��˾����';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.client
  is '�ͻ���';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.user_name
  is '�û���';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.pass_word
  is '����';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.ashost
  is '��ַ';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.sysnr
  is 'ͬ��00';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.lang
  is '����ZH';
comment on column SAP_MIDDLE_SYSTEM_DATABASE.op_time
  is '����ʱ��';

--start ���Ժ���ҵ���� ����Դ ���
alter table bis_exc rename column REVERSE8 to nextchecker ;
alter table bis_exc rename column REVERSE9 to approves ;
alter table bis_exc rename column REVERSE10 to status ;

alter table bis_exc modify nextchecker varchar2(20) ;
alter table bis_exc modify approves varchar2(150) ;
alter table bis_exc modify status number(4) ;

update bt_approve_business set next_checker_field='nextchecker' where business_code = 'salepayt_app';
--end

--ʱ�䣺2012-11-13
--���ݣ�����Ψһ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isUniqueConfirm';
  IF VN_COUNT < 1 THEN
   INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
   VALUES('isUniqueConfirm','nis','Ψһ����Ҫ�ֹ�ȷ��',0,0,'0 ����Ҫ;1 ��Ҫ','0,����Ҫ;1,��Ҫ',1);
  END IF;
  COMMIT; 
END;
/


--ʱ�䣺2012-11-14
--���ݣ������ѹ��ҵ��費��Ҫ��¼���ݲ���
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isGdBl';
  IF VN_COUNT < 1 THEN
    INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
	VALUES('isGdBl',   'nis',   '�ѹ��ҵĲ���Ҫ��¼����',   0,   0,   '0 ����Ҫ;1 ��Ҫ',   '0,����Ҫ;1,��Ҫ',   1);
  END IF;
  COMMIT; 
END;
/

--�޸����ڣ�2012-11-15
--�޸��ˣ���˫
--��������-SAP�ӿ�-�ɱ����ĵ���
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='�ɱ����ĵ���' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'�ɱ����ĵ���','exchange',res_code,'/netbank/costCenterImport.do?method=toSelectCorp'
   ,'0','1','0','0',3,'�ɱ����ĵ���','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
  END IF;
  COMMIT; 
END;
/
--ʱ�䣺2012-11-14
--���ݣ����첹¼ʱ�ֹ��޸Ŀ�������
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isBlCanModify';
  IF VN_COUNT < 1 THEN
    INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
   VALUES('isBlCanModify','nis','���첹¼ʱ�ֹ��޸Ŀ�������',0,0,'0 ���ɸ�;1 �ɸ�','0,���ɸ�;1,�ɸ�',1);
  END IF;
  COMMIT; 
END;
/

--�޸����ڣ�2012-11-21
--�޸��ˣ�����
--�¿�˹�жҽӿ�
--��bt_external_corp���������ֶ�
ALTER TABLE bt_external_corp ADD (sourceSystem VARCHAR2(10));
COMMENT ON COLUMN bt_external_corp.sourceSystem IS '��Դϵͳ';

ALTER TABLE bt_external_corp ADD (customeStatus number);
COMMENT ON COLUMN bt_external_corp.customeStatus IS '�ͻ�״̬';

--��ERP_MIDDLE_SYSTEM_DATABASE���������ֶ�
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD (relevanceERP VARCHAR2(10));
COMMENT ON COLUMN ERP_MIDDLE_SYSTEM_DATABASE.relevanceERP IS '����ERPϵͳ';


commit;

