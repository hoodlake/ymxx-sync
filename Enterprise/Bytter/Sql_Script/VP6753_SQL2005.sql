--�޸����ڣ�20121019
--�޸��ˣ����
--��������-���ݴ���
GO

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res
   WHERE res_name = '���ݴ���' and sys_code = 'exchange';
  IF @VN_COUNT < 1
    BEGIN
      insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2,
       REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      select(select max(res_code) + 1 from bt_sys_res), '���ݴ���', 'exchange', 0, '','0', '0', '0', '0', 14, '���ݴ���','', '', '', '', '', null, null, null, null, null, 1, '';
    END;
END;
GO
--�޸����ڣ�20121019
--�޸��ˣ����
--��������-���ݴ���-ƾ֤ģ�嶨��
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='ƾ֤ģ�嶨��' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
     REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
     select(select max(RES_CODE) + 1 from bt_sys_res),'ƾ֤ģ�嶨��','exchange',res_code,'/netbank/ErpVoucherTemplate.do?method=selectCorp'
     ,'0','1','0','0',2,'ƾ֤ģ�嶨��','','','','','',null,null,null,null,null,2  
     from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange'
    END;
END;
GO

--�޸����ڣ�20121019
--�޸��ˣ���̺�
--��������-���ݴ���-��ƿ�Ŀ����
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='��ƿ�Ŀ����' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF @VN_COUNT < 1
    BEGIN
    insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
    REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
    select (select max(RES_CODE) + 1 from bt_sys_res),'��ƿ�Ŀ����','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toAccountingItemsCorp'
    ,'0','1','0','0',3,'��ƿ�Ŀ����','','','','','',null,null,null,null,null,2  
    from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
    END;
END;
GO

--�޸����ڣ�20121019
--�޸��ˣ����
--��������-���ݴ���-�ո�������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='�ո�������' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
     REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
     select (select max(RES_CODE) + 1 from bt_sys_res),'�ո�������','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCorpPage'
     ,'0','1','0','0',4,'�ո�������','','','','','',null,null,null,null,null,2  
     from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
    END;
END;
GO

--�޸����ڣ�20121019
--�޸��ˣ���̺�
--��������-���ݴ���-���ӻ�ƿ�Ŀ����
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
   FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='�ո����Ʒ�¼ȷ��' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
     REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
     select (select max(RES_CODE) + 1 from bt_sys_res),'�ո����Ʒ�¼ȷ��','exchange',res_code,'/netbank/bisSpiltMergn.do?method=toCheckCorpPage'
     ,'0','1','0','0',5,'�ո����Ʒ�¼ȷ��','','','','','',null,null,null,null,null,2  
     from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
    END;
END;
GO

--2.2	ƾ֤ģ�涨��
--2.2.1ƾ֤����ERP_VOUCHER_TYPE��
create table ERP_VOUCHER_TYPE  (
   ID                   NUMERIC(20)                          not null,
   VOUCHER_TYPE_CODE    varchar(2),
   VOUCHER_TYPE_NAME    CHAR(10),
   constraint PK_ERP_VOUCHER_TYPE primary key (ID)
);
GO
--��ʼ��ƾ֤���
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(1,'01','��');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(2,'02','��');
insert into ERP_VOUCHER_TYPE(ID,VOUCHER_TYPE_CODE,VOUCHER_TYPE_NAME)values(3,'03','ת');
GO
--2.2.2��������ERP_ TRANSFER_TYPE��
create table ERP_TRANSFER_TYPE  (
   ID                   NUMERIC(20)                          not null,
   TRANSFER_TYPE_CODE   varchar(2),
   TRANSFER_TYPE_NAME   varchar(100),
   constraint PK_ERP_TRANSFER_TYPE primary key (ID)
);
GO
--��ʼ���������
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(1,'01','��OMS');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(2,'02','��SAP');
insert into ERP_TRANSFER_TYPE(ID,TRANSFER_TYPE_CODE,TRANSFER_TYPE_NAME)values(3,'03','����');
GO
--2.2.3ƾ֤ģ�嶨������ERP_VOUCHER_TEMPLATE��
create table ERP_VOUCHER_TEMPLATE  (
   ID                   NUMERIC(20)                          not null,
   BUSINESS_CODE        varchar(32),
   CORP_CODE            varchar(4),
   TRANSFER_TYPE_CODE   VARCHAR(2),
   VOUCHER_TYPE_CODE    CHAR(2),
   BUSINESS_TYPE        varchar(100),
   ITEM_CODE            VARCHAR(40),
   MODIFY_DATE          DATETIME,
   RMK                  varchar(200),
   STATUS               NUMERIC(20)                         default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE primary key (ID)
);
GO
--2.2.4ƾ֤ģ�嶨���¼��ERP_VOUCHER_TEMPLATE_DTL��
create table ERP_VOUCHER_TEMPLATE_DTL  (
   ID                   NUMERIC(20)                          not null,
   ENTRY_CODE           varchar(32),
   BUSINESS_CODE        varchar(32),
   LOAN_DIRECTION       CHAR(1),
   SUBJECT_CODE         varchar(60),
   SUBJECT_NAME         varchar(100),
   SPECIAL_ACCOUNT_CODE varchar(100),
   CASH_FLOW_CODE       varchar(100),
   SUBJECT_CLASS        varchar(100),
   ACCOUNT_TYPE         varchar(100),
   DES                  varchar(200),
   STATUS               NUMERIC(20)                         default 0,
   constraint PK_ERP_VOUCHER_TEMPLATE_DTL primary key (ID)
);
GO
--2.3	Ԥ���Ŀ��ҵ�����Ͷ�Ӧ
--��ԭԤ���Ŀά������������ҵ������
alter table fbs_item add BUSINESS_TYPE varchar(100);
GO

--2.4	������Դ�����ҹ�����
--������Դ�����ҹ������ERP_DATA_SOURCES��
create table ERP_DATA_SOURCES  (
   ID                   NUMERIC(20)                          not null,
   DATA_SOURCES_CODE    CHAR(1),
   DATA_SOURCES_NAME    varchar(100),
   CD_SIGN              CHAR(1),
   IS_RECONCILIATION CHAR(1),
   IS_MANUAL_CONFIRMATION CHAR(1),
   MATCHING_RULE        varchar(100),
   MATCHING_TABLE_NAME  varchar(100),
   RMK                  varchar(200),
   constraint PK_ERP_DATA_SOURCES primary key (ID)
);
GO
--��ʼ��������Դ�Լ����ҹ������ݣ�ע��ֻʵ�ָ���ң�����ֻ��ϵͳ�����ERP������Դ�Ĳ���Ҫ���ң�
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(1,'0','����','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','����');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(2,'1','ϵͳ����','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','ϵͳ����');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(3,'2','ERP����','1','1','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','ERP����');
insert into ERP_DATA_SOURCES(ID,DATA_SOURCES_CODE,DATA_SOURCES_NAME,CD_SIGN,IS_RECONCILIATION,IS_MANUAL_CONFIRMATION,MATCHING_RULE,MATCHING_TABLE_NAME,RMK)
values(4,'3','��������','1','0','0','payer_acc_no,payee_acc_no,atm,trans_time','bis_exc','��������');
GO
--2.5	���ݲ�¼����
--���ݲ�¼�����erp_additional_define��

create table ERP_ADDITIONAL_DEFINE  (
   ID                   NUMERIC(20)                          not null,
   FIELD_CODE           varchar(60),
   FIELD_NAME           varchar(100),
   IS_ADDITIONAL        CHAR(1),
   IS_SHOW              CHAR(1),
   constraint PK_ERP_ADDITIONAL_DEFINE primary key (ID)
);
GO
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
go
--2.6	�������ݹ���
--2.7	�ո��¼����_��������
--�޸��ˣ���˫
--�޸����ڣ�2012-10-29
--�޸����ݣ����������в����б��У����Ӳ������Ƿ�����һ�Զ��ȷ�ϡ���ȱʡΪ�����ã�ѡ�д˲���ʱ����ʾһ�Զ��ǩ����Ӧ���ܣ�
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('oneToMany','nis','�Ƿ�����һ�Զ��ȷ��',0,0,'0 ������;1 ����','0,������;1,����',1);
GO
--��ʷ��ϸ�������ֶΡ�Ψһȷ�ϡ���Ĭ��0
alter table bis_acc_his_dtl add unique_confirm CHAR(1) default '0';
go
--����ʷ��ϸ���������ֶ�
alter table bis_acc_his_dtl add data_sources_code CHAR(1) default '0';
alter table bis_acc_his_dtl add bill_status CHAR(1) default '0';
alter table bis_acc_his_dtl add mergern_id NUMERIC(20);
alter table bis_acc_his_dtl add budget_code varchar(40);
alter table bis_acc_his_dtl add subject_code varchar(20);
alter table bis_acc_his_dtl add subject_name varchar(40);
alter table bis_acc_his_dtl add BUSINESS_TYPE varchar(100);
alter table bis_acc_his_dtl add cost_center_code varchar(20);
alter table bis_acc_his_dtl add nz_stauts CHAR(1) default '0';
alter table bis_acc_his_dtl add erp_voucher_no varchar(30);
alter table bis_acc_his_dtl add is_blend CHAR(1) default '0';
alter table bis_acc_his_dtl add SUPER_SUBJECT_CODE varchar(40);
alter table bis_acc_his_dtl add vendor_num varchar(31);
go
--������ʷ����
UPDATE bis_acc_his_dtl SET nz_stauts='0' WHERE nz_stauts IS NULL;
UPDATE bis_acc_his_dtl SET data_sources_code='0' WHERE data_sources_code IS NULL;
GO
--��ָ����������ֶ�
alter table bis_exc add data_sources_code CHAR(1);
alter table bis_exc add serial_id CHAR(32);
GO
--������ֱ�bis_acc_his_dtl_split��
create table BIS_ACC_HIS_DTL_SPLIT  (
   ID                   NUMERIC(20)                          not null,
   SERIAL_ID            CHAR(32)                        not null,
   TRANS_TIME           DATETIME,
   CORP_ID              varchar(20),
   CORP_NAME            varchar(80),
   BANK_ACC             varchar(50),
   BANK_NAME            varchar(140),
   ACC_NAME             varchar(140),
   CUR                  varchar(10),
   AMT                  NUMERIC(15,2),
   OPP_ACC_NO           varchar(50),
   OPP_ACC_NAME         varchar(140),
   OPP_ACC_BANK         varchar(140),
   ABS                  varchar(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          varchar(40),
   BUDGET_NAME          varchar(100),
   SUBJECT_CODE         varchar(30),
   SUBJECT_NAME         varchar(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     varchar(20),
   BUSINESS_TYPE        varchar(100),
   DATA_SOURCES_CODE    varchar(12),
   NZ_STATUS            CHAR(1)                         DEFAULT '0',
   POSTSCRIPT           varchar(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       varchar(30),
   SUPER_SUBJECT_CODE   varchar(40),
   CUR_CODE		varchar(10),
   constraint PK_BIS_ACC_HIS_DTL_SPLIT primary key (ID)
);
GO
--��ӹ�Ӧ�̱��� 
alter table BIS_ACC_HIS_DTL_SPLIT add vendor_num varchar(31);
GO
--�����ϲ���bis_acc_his_dtl_mergen��
create table BIS_ACC_HIS_DTL_MERGEN  (
   ID                   NUMERIC(20)                          not null,
   TRANS_TIME           DATETIME,
   CORP_ID              varchar(20),
   CORP_NAME            varchar(80),
   BANK_ACC             varchar(50),
   BANK_NAME            varchar(140),
   ACC_NAME             varchar(140),
   CUR                  varchar(10),
   AMT                  NUMERIC(15,2),
   OPP_ACC_NO           varchar(50),
   OPP_ACC_NAME         varchar(140),
   OPP_ACC_BANK         varchar(140),
   ABS                  varchar(140),
   CD_SIGN              CHAR(1),
   BUDGET_CODE          varchar(40),
   BUDGET_NAME          varchar(100),
   SUBJECT_CODE         varchar(30),
   SUBJECT_NAME         varchar(100),
   IS_BL                CHAR(1),
   COST_CENTER_CODE     varchar(20),
   BUSINESS_TYPE        varchar(100),
   DATA_SOURCES_CODE    varchar(12),
   NZ_STATUS            CHAR(1)                         DEFAULT '0',
   POSTSCRIPT           varchar(140),
   HIS_STATUS           CHAR(1),
   ERP_VOUCHER_NO       varchar(30),
   SUPER_SUBJECT_CODE   varchar(40),
   CUR_CODE		varchar(10),
   constraint PK_BIS_ACC_HIS_DTL_MERGEN primary key (ID)
);
GO
--���ӹ�Ӧ�̱���
alter table BIS_ACC_HIS_DTL_MERGEN add vendor_num varchar(31);
GO
--�ɱ����ı�ERP_COST_CENTER��
create table ERP_COST_CENTER  (
   ID                   NUMERIC(20)                          not null,
   COST_CENTER_CODE     varchar(20),
   COST_CENTER_NAME     varchar(100),
   COST_CONTROL_RANGE   NUMERIC(15, 2),
   CORP_CODE            CHAR(4),
   COST_CONTER_TYPE     CHAR(1),
   VALID_DATE           DATETIME,
   END_DATE             DATETIME,
   constraint PK_ERP_COST_CENTER primary key (ID)
);
GO
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME=' view_bis_acc_his_dtl_buget ')
DROP VIEW view_bis_acc_his_dtl_buget
GO
create view view_bis_acc_his_dtl_buget as 
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
        dtl.is_blend is_blend,
        dtl.vendor_num vendor_num,--��Ӧ�̱���
        dtl.unique_confirm unique_confirm       
  from  bis_acc_his_dtl dtl 
        left join fbs_item fi on fi.code =  dtl.budget_code
   left join bt_currency currency on dtl.cur = currency.cur_code,
  v_acc_list acc, bt_corp corp
  where dtl.bank_acc = acc.BANK_ACC
   and acc.CORP_CODE = corp.corp_code
GO
  
--  view_bis_acc_his_dtl_s_m_o  ��ֺϲ�ԭʼ������ͼ
  --  view_bis_acc_his_dtl_s_m_o  ��ֺϲ�ԭʼ������ͼ
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME=' view_bis_acc_his_dtl_s_m_o ')
DROP VIEW view_bis_acc_his_dtl_s_m_o
GO 
create view view_bis_acc_his_dtl_s_m_o as
select convert(split.id,20) id,
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
select convert(mergen.id,20) id,
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
       convert(one.corp_id,20)  corp_id,                --��λId
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
      or ('1' = (select param_value1 from bt_param where code = 'isUniqueConfirm' and sys_code='nis') and unique_confirm='1')
go

--�жһ�Ʊ
--���Ʊ��ҵ�����������ͬ�ֻ㡱�ֶ�
 
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='AS_SPOT_EXCHANGE')  
ALTER TABLE AB_RECEIVE ADD AS_SPOT_EXCHANGE CHAR(1) DEFAULT '0'
GO


--�ո���ƥ������趨
update bt_sys_res set res_url='/admin/budgetRuleCorp.jsp' where  sys_code='adm' and RES_NAME = '�ո���ƥ������趨';
GO
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
select (select max(res_code) + 1 from bt_sys_res),
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
   '';
GO   
   
insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select(SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'ERP���ݿ�ά��', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP��������'), '/dataexchange/erpMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'ERP���ݿ�ά��', '', '', '', '', '', null, null, null, null, null, 2, '';

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select(SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES), 'SAP���ݿ�ά��', 'exchange', (SELECT RES_CODE FROM BT_SYS_RES WHERE SYS_CODE = 'exchange' AND RES_NAME = 'ERP��������'), '/dataexchange/sapMiddleSystemDataBase.do?method=toList', '0', '0', '0', '0', 1, 'SAP���ݿ�ά��', '', '', '', '', '', null, null, null, null, null, 2, '';
  
GO
-- Create table
create table ERP_MIDDLE_SYSTEM_DATABASE
(
  id             VARCHAR(32) not null,
  ip             VARCHAR(30),
  port           VARCHAR(20),
  user_name      VARCHAR(30),
  data_base_name VARCHAR(50),
  pass_word      VARCHAR(20),
  db_type        VARCHAR(50),
  op_code        VARCHAR(50),
  op_name        VARCHAR(50),
  reverse1       VARCHAR(200),
  reverse2       VARCHAR(100),
  op_time        VARCHAR(50)
);
GO  
-- Create table
create table SAP_MIDDLE_SYSTEM_DATABASE
(
  id        VARCHAR(32) not null,
  corpcode  VARCHAR(30),
  client    VARCHAR(20),
  user_name VARCHAR(20),
  pass_word VARCHAR(20),
  ashost    VARCHAR(20),
  sysnr     VARCHAR(10),
  lang      VARCHAR(10),
  reverse1  VARCHAR(200),
  reverse2  VARCHAR(200),
  reverse3  VARCHAR(300),
  reverse4  VARCHAR(300),
  reverse5  VARCHAR(300),
  op_time   TIMESTAMP(6)
);

go

--start ���Ժ���ҵ���� ����Դ ���
Alter table bis_exc add NEXTCHECKER varchar(20);
Alter table bis_exc add APPROVES varchar(150);
Alter table bis_exc add STATUS int;

update bt_approve_business set next_checker_field='nextchecker' where business_code = 'salepayt_app';
--end
go

--ʱ�䣺2012-11-13
--���ݣ�����Ψһ����
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param WHERE code='isUniqueConfirm';
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
	  VALUES('isUniqueConfirm','nis','Ψһ����Ҫ�ֹ�ȷ��',0,0,'0 ����Ҫ;1 ��Ҫ','0,����Ҫ;1,��Ҫ',1);
    END;
END;
GO

--ʱ�䣺2012-11-14
--���ݣ������ѹ��ҵ��費��Ҫ��¼���ݲ���
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param WHERE code='isGdBl';
  IF @VN_COUNT < 1
    BEGIN
        INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
		VALUES('isGdBl',   'nis',   '�ѹ��ҵĲ���Ҫ��¼����',   0,   0,   '0 ����Ҫ;1 ��Ҫ',   '0,����Ҫ;1,��Ҫ',   1);
    END;
END;
GO

--ʱ�䣺2012-11-14
--���ݣ����첹¼ʱ�ֹ��޸Ŀ�������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param WHERE code='isBlCanModify';
  IF @VN_COUNT < 1
    BEGIN
   INSERT INTO bt_param(code, sys_code, NAME, param_value1, param_type, rmk, Reverse1, reverse6)
   VALUES('isBlCanModify','nis','���첹¼ʱ�ֹ��޸Ŀ�������',0,0,'0 ���ɸ�;1 �ɸ�','0,���ɸ�;1,�ɸ�',1);
    END;
END;
GO

--�޸����ڣ�2012-11-15
--�޸��ˣ���˫
--��������-SAP�ӿ�-�ɱ����ĵ���
DECLARE
  @VN_COUNT    INT;
BEGIN
   SELECT @VN_COUNT = COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='exchange' AND t1.res_name='�ɱ����ĵ���' AND t1.father_code=t2.res_code AND t2.res_name='���ݴ���';
  IF @VN_COUNT < 1
    BEGIN
       insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
	   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL)	
	   select (select max(RES_CODE) + 1 from bt_sys_res),'�ɱ����ĵ���','exchange',res_code,'/netbank/costCenterImport.do?method=toSelectCorp'
	   ,'0','1','0','0',3,'�ɱ����ĵ���','','','','','',null,null,null,null,null,2  
	   from bt_sys_res  where res_name = '���ݴ���' and sys_code = 'exchange';
    END;
END;
GO

--�޸����ڣ�2012-11-21
--�޸��ˣ�����
--�¿�˹�жҽӿ�
--��bt_external_corp���������ֶ�
ALTER TABLE bt_external_corp ADD sourceSystem VARCHAR(10);

ALTER TABLE bt_external_corp ADD customeStatus int;

--��ERP_MIDDLE_SYSTEM_DATABASE���������ֶ�
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD relevanceERP VARCHAR(10);

GO
