--�޸�ʱ��2012-11-03
--�޸��� ���ʱ� 
--�޸�����   ó������


---����ó���������ڵ�λ��  
update bt_sys_res set res_order=4 where sys_code='cms' and res_order=3 and res_url is null 

go 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó������', 'cms', 0, '', '0', '0', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 1, '')
go 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó����������¼��', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=save', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, '')
go 

insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(RES_CODE) + 1 from bt_sys_res), 'ó�����������ݴ�', 'cms', (select  max(res_code)  from bt_sys_res  where res_name='ó������' and sys_code='cms' and res_url is null), '/cms/financ_add.jsp?flag=tempsave', '0', '0', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, '')
go 

/*==============================================================*/
/* ó��������Ϣ��                                               */
/*============================================================ */
create table FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   -----���ʵ����
   TYPE_CODE            varchar2(10)                    not null,   -----�������
   BILL_CODE            CHAR(10),                                   -----�����Ϣ
   FOFE_CODE            CHAR(14),                                   -----����������Ϣ
   ENTER_DATE           DATE                            not null,   -----¼������ 
   OP                   VARCHAR2(8)                     not null,   -----������Ա 
   EDITOP               VARCHAR2(8),                                -----�༭��Ա 
   EDIT_DATE            DATE,                                       -----�༭���� 
   DEPOSIT_DATE         DATE,                                       -----��֤������
   DEPOSIT_INTER_RATES  NUMBER(6,4),                                -----��֤������
   ATTACHMENT           varchar2(200),                              -----����   
   FLAG                 CHAR(1),                                    ---1����ʾ���� 2����ʾ����
   constraint PK_FINANC_INFO primary key (CODE)
) 

/*==============================================================*/
/* ����ʹ������Ϣ                                               */                         
/*==============================================================*/
 

create table FINANC_LOAN_USER  (
   GUID                 CHAR(40)                        not null,
   REQ_CODE             char(14)                        not null,   ----���ʵ����
   LOAN_USER            VARCHAR(80)                     not null,   ---����ʹ����
   AMOUNT               NUMBER(18, 2),                              ---���
   constraint PK_FINANC_LOAN_USER primary key (GUID)
)

/*==============================================================*/
/* ó���������                                               */                         
/*==============================================================*/ 

create table FINANC_TYPE  (
   GUID                 CHAR(40)                        not null,
   TYPE_CODE            VARCHAR2(10)                    not null,   ---���ͱ��
   NAME                 VARCHAR(100)                    not null,   ---����
   constraint PK_FINANC_TYPE primary key (GUID)
)

/*==============================================================*/
/* ������������Ϣ                                               */                         
/*==============================================================*/ 

create table FOFE_FINANC_INFO  (
   GUID                 VARCHAR2(36)                    not null,
   CODE                 CHAR(14)                        not null,   --���ʵ����
   REQ_DATE             DATE                            not null,   --��������
   END_DATE             DATE,                                       --���ݵ�������
   DIS_DATE             DATE,                                       --��Ϣ����
   RATE                 NUMBER(6,4)                     not null,   --����
   LOAN                 NUMBER(8,4)                     not null,   --��Ϣ
   MONEY                NUMBER(18,2),                               --���˽��
   OP                   VARCHAR2(8),                                --¼�����Ա
   ENTRY_DATE           DATE,                                       --¼��ʱ��
   EDIT_OP              VARCHAR2(8),                                --�޸Ĳ���Ա
   EDIT_DATE            DATE,                                       --�޸�����
   constraint PK_FOFE_FINANC_INFO primary key (CODE)
)

go 


