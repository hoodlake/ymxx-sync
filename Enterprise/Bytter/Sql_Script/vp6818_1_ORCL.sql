--�޸��� ���
--�޸�ʱ�� 2012-11-27
--�޸����� �����ʽ��������ͬ������ѯ�赥�ͽ�����

--�޸��� ���
--�޸�ʱ�� 2012-11-27
--�޸����� �����ʽ��������ͬ������ѯ�赥�ͽ�����

create table ERP_FUND_RECTIFY
(
  ID            int not null,
  CUSTOMER_CODE VARCHAR2(100),
  CUSTOMER_NAME VARCHAR2(100),
  CORP_CODE     VARCHAR2(100),
  AMT           NUMBER(15,2),
  COM_CODE      VARCHAR2(100),
  BANK_CODE     VARCHAR2(100),
  BANK_ACC      VARCHAR2(100),
  BUDAT         DATE,
  BYTTER_CORP_CODE VARCHAR2(100)
);

comment on column ERP_FUND_RECTIFY.CUSTOMER_CODE
  is '�ͻ����';
comment on column ERP_FUND_RECTIFY.CUSTOMER_NAME
  is '�ͻ�����';
comment on column ERP_FUND_RECTIFY.CORP_CODE
  is '��λ����';
comment on column ERP_FUND_RECTIFY.AMT
  is '���';
comment on column ERP_FUND_RECTIFY.COM_CODE
  is '��˾����';
comment on column ERP_FUND_RECTIFY.BANK_CODE
  is '���д���';
comment on column ERP_FUND_RECTIFY.BANK_ACC
  is '�����˺�';
comment on column ERP_FUND_RECTIFY.BUDAT
  is '��������';
  comment on column ERP_FUND_RECTIFY.BUDAT
  is '��Ӧ���ع�˾����';

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '�ʽ��������ͬ������ѯ', 'nis', RES_CODE, '/dataExchange/capitalRectifyDataSynAction.do?method=initData', '0', '0', '0', '0', 7, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '�տ�' and father_code=0;

commit;
