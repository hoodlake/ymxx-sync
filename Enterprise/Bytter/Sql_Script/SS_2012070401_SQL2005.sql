begin transaction
--�޸����ڣ�2012.7.2
--�޸��ˣ�����
--�޸����ݣ������������������
--�޸�ԭ�������������������

--������������á��˵�
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '�������',
         'rat',
         res_code,
         '/rat/ration/occupytz_index.jsp',
         '0',
         '1',
         '0',
         '0',
         3,
         '�������  ',
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
         2
    from bt_sys_res
   where res_name = '�������Ŷ��'
     and sys_code = 'rat';
go

--����������ñ�
create table RAT_FINANCIAL_EXPENSE  (
   ID                   int,              --���
   ENTERDATE            datetime,             --¼��ʱ��
   MONEY                numeric(15, 2),     --ռ�ý��
   CANTONS              VARCHAR(50),     --��ͬ��
   CORP_CODE            VARCHAR(20),     --���ŵ�λ
   BANK_CODE            VARCHAR(20),     --��������
   CUR                  VARCHAR(20),     --�ұ�
   BEGINDATE             datetime,            --��������
   LOAN                 numeric(15, 2),     --������Ϣ
   DISCOUNT             numeric(15, 2),     --����Ϣ
   INLAND_CREDIT_TRADE  numeric(15, 2),      --��������֤Ѻ����Ϣ
   INTERNATION_CREDIT_TRADE numeric(15, 2), --��������֤Ѻ����Ϣ
   BANK_BUSINESS_EXPENSES numeric(15, 2),   --�����м�ҵ�����
   CHARGE               numeric(15, 2),     --������
   OTHER                numeric(15, 2)      --����
);
go

--����ϵͳ�������Ƿ����ó��ڶ�ȡ�
insert into bt_param
       (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
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
       REVERSE10) values (
       'isStartOpenRat','rat','�Ƿ����ó��ڶ��','0',null,null,0,'0,������;1,����','0,������;1,����',null,null,null,null,1,3,null,null,null);
go
       
--�޸����ڣ�2012.7.2
--�޸��ˣ���̺� �����ֶ��������ź�ͬ���볨�ڽ��
--�޸����ݣ������������������
--�޸�ԭ�������������������    
alter table rat_bkration add contract_number varchar(100);
--�������ź�ͬ��
alter table rat_bkration add open_money numeric(15,2) Default 0;
--���ڽ��

alter table rat_bkration_detail add open_money numeric(15,2) Default 0;
--���ڽ��
alter table rat_bkration_detail add super_add_open_money numeric(15,2) Default 0;
--����ͨ����׷�ӳ��ڽ��
alter table rat_bkration_detail add super_distribute_open_money numeric(15,2) Default 0;
--����ͨ���ķ��䳨�ڽ��

alter table rat_bkration_add add open_money numeric(15,2) Default 0;
--���ڽ��
alter table rat_bkration_add_detail add open_money numeric(15,2) Default 0;
--���ڽ��

alter table rat_bkration_dis add open_money numeric(15,2) Default 0;
--���ڽ��
alter table rat_bkration_dis_detail add open_money numeric(15,2) Default 0;
--���ڽ��
alter table rat_bkration_dis_detail add SUPER_PROCESS_Open_MONEY numeric(15,2) Default 0;
--��������ʽռ�ý��
alter table rat_bkration_dis_detail add SUPER_RELIEF_Open_MONEY numeric(15,2) Default 0;
--���ڵ������
alter table rat_bkration_dis_detail add SUPER_BY_RELIEF_Open_MONEY numeric(15,2) Default 0;
--���ڱ��������
alter table rat_bkration_dis_detail add FREEZE_Open_MONEY numeric(15,2) Default 0;
--���ڶ�����,û�б���ʽռ��


alter table rat_bkration_relief add relief_Open_Money numeric(15,2) Default 0;
--������--���ڽ��

alter table rat_uration_apply add open_money numeric(15,2) Default 0;
--̨��ռ�����볨�ڽ��
alter table rat_uration_apply add assurePercent numeric(15,2) Default 0;
--̨��ռ�ñ�֤�����
go


--�޸����ڣ�2012.7.2
--�޸��ˣ�����
--�޸����ݣ������������������
--�޸�ԭ�������������������

--�����������������ͳ�Ʊ��˵�
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
   RES_LEVEL)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '�����������ͳ�Ʊ�',
         'rat',
         res_code,
         '/rat/bankRatResultAction.do?method=goForQuery',
         '0',
         '1',
         '0',
         '0',
         6,
         '�����������ͳ�Ʊ�  ',
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
         2
    from bt_sys_res
   where res_name = '�������Ŷ��'
     and sys_code = 'rat';
go

commit;