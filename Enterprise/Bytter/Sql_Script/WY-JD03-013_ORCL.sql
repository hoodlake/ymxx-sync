--�޸����ڣ�2012.7.12
--�޸��ˣ�����
--�޸����ݣ����ű�_�����������֧������
--�޸�ԭ�����ű�_�����������֧������

--���ܱ�־��1���������ݣ��գ���������
alter table nis_billhead add collect_flag char(1);

--�Ƿ�����erp��1���ǣ��գ���
alter table nis_expense_detail add isfromerp char(1);

--erp���ݱ��
alter table nis_expense_detail add pay_info_id number;


--�޸����ڣ�2012.7.12
--�޸��ˣ����±�
--�޸����ݣ����ű�_�����������֧������
--�޸�ԭ�����ű�_�����������֧������

--֪ͨ����
alter table erp_pay_info add  FEENOTICENO VARCHAR2(15);

--������
alter table erp_pay_info add  BARCODE VARCHAR2(30);

--����֧�����ڣ�Ϊ��ȡ��ǰ���ڣ�
alter table erp_pay_info add  WISH_PAYDAY         DATE;

--�������κ�
alter table erp_pay_info add  SEND_BATCH          VARCHAR2(10);

--����״̬( ���н��׺��˻ص��ݣ�����bis_voucher_stat �е� stat)
alter table erp_pay_info add  ZFLAG_YQ            CHAR(1);

--0����Ϊ�Թ���1��˽ �������⸶������
alter table erp_pay_info add  ISFORINDIVIDUAL     CHAR(1);

--ERP�˵�ԭ��
alter table erp_pay_info add  ZFLAG_RESON         VARCHAR2(240);

--ERP�˵�����
alter table erp_pay_info add  ZFLAG_TYPE          CHAR(2);

--��SERIAL_NO_ERP
alter table erp_pay_info add  SUMMAY_ID           VARCHAR2(100);

--1����0�ӽڵ� ���� ��������
alter table erp_pay_info add   IS_PARENT           CHAR(1);

--erp��������
alter table erp_pay_info add  SEND_DATE           DATE;


--�޸����ڣ�2012.7.12
--�޸��ˣ��ž���
--�޸����ݣ������˵����˵�����ά����
--�޸�ԭ�����ű�_�����������֧������

--�����˵����ͱ�
create table BT_CHARGEBACKTYPE  (
   ID                   number,        
   TYPE_CODE            VARCHAR2(2)                     not null,   --�˵����
   TYPE_NAME            VARCHAR2(100),                              --�˵�����
   IS_DEFAULT           CHAR(1),                                    --�Ƿ�Ĭ��
   REMARK               VARCHAR2(100),                              --��ע
   IS_VALID             CHAR(1),                                    --�Ƿ���Ч
   constraint PK_BT_CHARGEBACKTYPE primary key (ID)
);

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
values
  ((select max(RES_CODE) + 1 from bt_sys_res),
   '�˵�����ά��',
   'adm',
   (select RES_CODE
      from bt_sys_res
     where sys_code = 'adm'
       and RES_NAME = '��������ά��'),
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
   2);

commit;
