--�޸����ڣ�2012.7.12
--�޸��ˣ�����
--�޸����ݣ����ű�_�����������֧������
--�޸�ԭ�����ű�_�����������֧������

--���ܱ�־��1���������ݣ��գ���������
alter table nis_billhead add collect_flag char(1)
go
--�Ƿ�����erp��1���ǣ��գ���
alter table nis_expense_detail add isfromerp char(1)
go
--erp���ݱ��
alter table nis_expense_detail add pay_info_id int

go

--�޸����ڣ�2012.7.12
--�޸��ˣ����±�
--�޸����ݣ����ű�_�����������֧������
--�޸�ԭ�����ű�_�����������֧������

--֪ͨ����
alter table erp_pay_info add  FEENOTICENO         VARCHAR(15)
go
--������
alter table erp_pay_info add  BARCODE             VARCHAR(30)
go
--����֧�����ڣ�Ϊ��ȡ��ǰ���ڣ�
alter table erp_pay_info add  WISH_PAYDAY         DATETIME
go
--�������κ�
alter table erp_pay_info add  SEND_BATCH          VARCHAR(10)
go
--����״̬( ���н��׺��˻ص��ݣ�����bis_voucher_stat �е� stat)
alter table erp_pay_info add  ZFLAG_YQ            CHAR(1)
go
--0����Ϊ�Թ���1��˽ �������⸶������
alter table erp_pay_info add  ISFORINDIVIDUAL     CHAR(1)
go
--ERP�˵�ԭ��
alter table erp_pay_info add  ZFLAG_RESON         VARCHAR(240)
go
--ERP�˵�����
alter table erp_pay_info add  ZFLAG_TYPE          CHAR(2)
go
--��SERIAL_NO_ERP
alter table erp_pay_info add  SUMMAY_ID           VARCHAR(100)
go
--1����0�ӽڵ� ���� ��������
alter table erp_pay_info add   IS_PARENT           CHAR(1)
go
--erp��������
alter table erp_pay_info add  SEND_DATE           DATETIME

go


--�޸����ڣ�2012.7.12
--�޸��ˣ��ž���
--�޸����ݣ������˵����˵�����ά����

--�����˵����ͱ�
create table BT_CHARGEBACKTYPE  (
   ID                   INT,        
   TYPE_CODE            VARCHAR(2)                     not null,   --�˵����
   TYPE_NAME            VARCHAR(100),                              --�˵�����
   IS_DEFAULT           CHAR(1),                                    --�Ƿ�Ĭ��
   REMARK               VARCHAR(100),                              --��ע
   IS_VALID             CHAR(1),                                    --�Ƿ���Ч
   constraint PK_BT_CHARGEBACKTYPE primary key (ID)
)
go
--�޸�ԭ�����ű�_�����������֧������
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
   '�˵�����ά��',
   'adm',
   RES_CODE,
   '/admin/btChargebacktype.do?method=toList',
   '0',
   '1',
   '0',
   '0',
   10,
   '�˵�����ά��',
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
   2 from bt_sys_res where sys_code = 'adm' and RES_NAME = '��������ά��'

go
