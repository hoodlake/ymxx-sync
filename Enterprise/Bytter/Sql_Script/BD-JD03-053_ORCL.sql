
--�޸���:������
--�޸�ʱ��:2012-11-17
--�޸�����:������������нӿ�����_ʵ�ַ�ʽ�����˲��

alter table bt_net_chalk
add IS_ERP char(1);
comment on column bt_net_chalk.IS_ERP
is '�Ƿ�����ERP�ӿ�,1��,0��';
alter table bt_net_chalk
add IS_Success_MatchPer char(1);
comment on column bt_net_chalk.IS_Success_MatchPer
is '����ƥ���Ƿ�ɹ�,1��,0��';

-- Create table
create table BT_NET_CHALK_ERP_DTL
(
  BIF_SERIAL      VARCHAR2(50) not null,
  LINE_NO         NUMBER(5) not null,
  CORP_CODE       CHAR(4),
  CORP_NAME       VARCHAR2(80) ,
  MONEY           NUMBER(14,2)
)
;
-- Add comments to the columns 
comment on column BT_NET_CHALK_ERP_DTL.BIF_SERIAL
  is '�ӿ���ˮ��,��bt_net_chalk.bif_serial��Ӧ';
comment on column BT_NET_CHALK_ERP_DTL.LINE_NO
  is '�к�,�������õıȽ�˳�����';
comment on column BT_NET_CHALK_ERP_DTL.CORP_CODE
  is '��λ����';
comment on column BT_NET_CHALK_ERP_DTL.CORP_NAME
  is '��λ����';
comment on column BT_NET_CHALK_ERP_DTL.MONEY
  is '������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table BT_NET_CHALK_ERP_DTL
  add constraint PK_BT_NET_CHALK_ERP_DTL primary key (BIF_SERIAL,LINE_NO)
;

commit;