--�޸���:����
--�޸�ʱ��:2013-01-09
--�޸�����:VP7503-7504������ƾ֤������������
--���������ݽ���---���ݹ���---ƾ֤����  �˵�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM BT_SYS_RES
   WHERE SYS_CODE= 'exchange'
   and RES_NAME = 'ƾ֤����'
   and RES_URL = '/dataExchange/erpZxbAction.do?method=queryList';
  IF VN_COUNT < 1 THEN
  
  insert into bt_sys_res 
  (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, 
  REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select  (select max(RES_CODE) + 1 from bt_sys_res), 'ƾ֤����', 'exchange', 9137, '/dataExchange/erpZxbAction.do?method=queryList', 
        '0', '1', '0', '0', 2, 'ƾ֤����', '', '', '', '', '', null, null, null, null, null, 2, ''
 from bt_sys_res
   where res_code=9137;
     
  END IF;
  COMMIT; 
END;
/

--�޸���:����
--�޸�ʱ��:2013-01-09
--�޸�����:--���������ݽ���---���ݹ���---ƾ֤������Ϣ��

create table ERP_ZXB_ZFIS
(
  SEQNO         VARCHAR(32) not null,
  BUKRS_IN      NUMERIC(4),
  BANKNUM_IN    VARCHAR(25),
  WAERS_IN      VARCHAR(5),
  DMBTR_IN      NUMERIC(17,2),
  ZZHLB_IN      VARCHAR(5),
  BUKRS_OUT     VARCHAR(4),
  BANKNUM_OUT   VARCHAR(25),
  WAERS_OUT     VARCHAR(5),
  DMBTR_OUT     NUMERIC(17,2),
  ZZHLB_OUT     VARCHAR(5),
  DEAL_DATE     DATETIME,
  STATUS        CHAR(1),
  ZSTATUS       CHAR(1),
  LOG_DESC      VARCHAR(200),
  REC_DOC_IN    VARCHAR(20),
  REC_DOC_OUT   VARCHAR(20),
  REC_DATE      VARCHAR(20),
  AC_BUDAT      VARCHAR(20),
  AC_DOC_NO_IN  VARCHAR(20),
  AC_DOC_NO_OUT VARCHAR(20),
  AC_PERSON     VARCHAR(50),
  CREATE_DATE   DATETIME,
  UPDATE_DATE   DATETIME
)
;
-- Add comments to the columns 
comment on column ERP_ZXB_ZFIS.SEQNO
  is '��ˮ��';
comment on column ERP_ZXB_ZFIS.BUKRS_IN
  is '���빫˾����';
comment on column ERP_ZXB_ZFIS.BANKNUM_IN
  is '���빫˾�˺�';
comment on column ERP_ZXB_ZFIS.WAERS_IN
  is '�������';
comment on column ERP_ZXB_ZFIS.DMBTR_IN
  is '������
';
comment on column ERP_ZXB_ZFIS.ZZHLB_IN
  is '�����˻�����';
comment on column ERP_ZXB_ZFIS.BUKRS_OUT
  is '������˾����';
comment on column ERP_ZXB_ZFIS.BANKNUM_OUT
  is '������˾�˺�';
comment on column ERP_ZXB_ZFIS.WAERS_OUT
  is '��������';
comment on column ERP_ZXB_ZFIS.DMBTR_OUT
  is '�������';
comment on column ERP_ZXB_ZFIS.ZZHLB_OUT
  is '�����˻�����';
comment on column ERP_ZXB_ZFIS.DEAL_DATE
  is '��������
';
comment on column ERP_ZXB_ZFIS.STATUS
  is '�Ƿ���ɹ���ʶ	:Y��ɹ���X��ʧ��';
comment on column ERP_ZXB_ZFIS.ZSTATUS
  is '����״̬����δ����;1����ǰ��ƾ֤;2ǰ��ƾ֤���ͨ��;3ǰ��ƾ֤��˲�ͨ��;4���ɻ��ƾ֤;5��Ч�˻�;ƾ֤����ʧ�ܣ�';
comment on column ERP_ZXB_ZFIS.LOG_DESC
  is '��־����';
comment on column ERP_ZXB_ZFIS.REC_DOC_IN
  is 'ǰ��ƾ֤��
';
comment on column ERP_ZXB_ZFIS.REC_DOC_OUT
  is 'ǰ��ƾ֤��';
comment on column ERP_ZXB_ZFIS.REC_DATE
  is 'ǰ��ƾ֤��������';
comment on column ERP_ZXB_ZFIS.AC_BUDAT
  is '��������
';
comment on column ERP_ZXB_ZFIS.AC_DOC_NO_IN
  is '����ƾ֤��';
comment on column ERP_ZXB_ZFIS.AC_DOC_NO_OUT
  is '����ƾ֤��';
comment on column ERP_ZXB_ZFIS.AC_PERSON
  is '������
';
