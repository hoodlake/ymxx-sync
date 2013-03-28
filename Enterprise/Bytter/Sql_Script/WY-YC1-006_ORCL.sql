--�޸��ˣ�����
--�޸����ڣ�2012-11-23
--�޸�����: �ײŴ�������ϵͳ��������
--�޸�ԭ��: �ײŴ�������ϵͳ��������

declare 
exist_num  number(2) ;
begin 
select count(*) into exist_num  from  bt_sys_res where res_name = '�������ʸ����ѯ' and sys_code = 'nis'  ; 
if(exist_num < 1) then 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res ), '�������ʸ����ѯ', 'nis', (select res_code from bt_sys_res  where res_name = '��������' and sys_code = 'nis' ), '/netbank/allWageQueryList.jsp', '0', '1', '0', '0', (select RES_ORDER+1 from bt_sys_res  where res_name='�������ʽ����ѯ' and  sys_code = 'nis'), '�������ʸ����ѯ', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end ;
/
commit;



--�޸����ڣ�20121121
--�޸��ˣ�����
--�޸����ݣ���������������ʷ��
--�޸�ԭ����������������ʷ��
create table NIS_WAGE_HIS
(
  NIS_WAGE_HIS_ID  CHAR(12) not null,
  wage_no        CHAR(12) not null,
  wage_title     VARCHAR2(100),
  corp_code      VARCHAR2(20),
  payer_acc      VARCHAR2(30),
  payer_bank     VARCHAR2(100),
  bank_type      CHAR(4),
  wages          NUMBER(15,2),
  wageday        DATE,
  wish_payday    DATE,
  status         INTEGER,
  voucher_stat   CHAR(1),
  billcode       VARCHAR2(16),
  op             VARCHAR2(30),
  enter_date     DATE default sysdate,
  optime         date,
  op_name        VARCHAR2(30),
  checkers       VARCHAR2(150),
  super_checkers VARCHAR2(150),
  approves       VARCHAR2(150),
  nextchecker    VARCHAR2(150),
  SERIAL_NO_ERP varchar2(32),
  zflag_type char(2),
  zflag_reson varchar2(240),
  ISFROMERP varchar2(1)
);
alter table NIS_WAGE_HIS
  add constraint PK_NIS_WAGE_HIS primary key (NIS_WAGE_HIS_ID); 
comment on table NIS_WAGE_HIS
  is '����������ʷ��';
comment on column NIS_WAGE_HIS.wage_no
  is '����������ʷ������ID';
comment on column NIS_WAGE_HIS.wage_no
  is '���ʱ��';
comment on column NIS_WAGE_HIS.wage_title
  is '���ʱ���';
comment on column NIS_WAGE_HIS.corp_code
  is '���λ';
comment on column NIS_WAGE_HIS.payer_acc
  is '�����˺�';
comment on column NIS_WAGE_HIS.payer_bank
  is '�������';
comment on column NIS_WAGE_HIS.bank_type
  is '�������';
comment on column NIS_WAGE_HIS.wages
  is '�����ܶ�';
comment on column NIS_WAGE_HIS.wageday
  is '���ʷ�������';
comment on column NIS_WAGE_HIS.wish_payday
  is '����֧������';
comment on column NIS_WAGE_HIS.status
  is '״̬ 0���ݴ棻11����������-1����أ�95������ͨ��';
comment on column NIS_WAGE_HIS.voucher_stat
  is '����״̬ ��bis_voucher_stat��';
comment on column NIS_WAGE_HIS.billcode
  is '������';
comment on column NIS_WAGE_HIS.op
  is '������Աcode';
comment on column NIS_WAGE_HIS.enter_date
  is '¼��ʱ��';
comment on column NIS_WAGE_HIS.op_name
  is '����������';
  comment on column NIS_WAGE_HIS.optime
  is '�˻�ʱ��';
comment on column NIS_WAGE_HIS.checkers
  is '������Ա';
comment on column NIS_WAGE_HIS.super_checkers
  is '�ϼ�������';
comment on column NIS_WAGE_HIS.approves
  is '�Ѿ�������';
comment on column NIS_WAGE_HIS.nextchecker
  is '��һ��������';
comment on column NIS_WAGE_HIS.SERIAL_NO_ERP
  is 'erp�ĵ���';
comment on column NIS_WAGE_HIS.zflag_type
  is '�˵�����';
comment on column NIS_WAGE_HIS.zflag_reson
  is '�˵�ԭ��';
comment on column NIS_WAGE_HIS.ISFROMERP
  is '�Ƿ�����erp:0���ǣ�1��';


--�޸����ڣ�20121121
--�޸��ˣ�����
--�޸����ݣ���������������ʷ��ϸ��
--�޸�ԭ����������������ʷ��ϸ��
create table NIS_WAGE_DETAIL_HIS
(
  wage_dtl_no_id  CHAR(10) not null,
  wage_dtl_no  CHAR(10) not null,
  NIS_WAGE_HIS_ID char(12),
  user_name    VARCHAR2(50),
  empno        VARCHAR2(50),
  bank_acc     VARCHAR2(30),
  bank_type    CHAR(4),
  wages        NUMBER(15,2),
  wage_no      CHAR(12),
  bill_no      CHAR(12),
  status       INTEGER,
  voucher_stat CHAR(1),
  purpose      VARCHAR2(10),
  rmk          VARCHAR2(100),
  verify       VARCHAR2(32),
  voucher_no   VARCHAR2(12),
  return_msg   varchar2(150),
  optime       date,
  reverse1     VARCHAR2(100),
  reverse2     VARCHAR2(100),
  reverse3     VARCHAR2(100),
  reverse4     VARCHAR2(100),  
  reverse5     VARCHAR2(100),
  SERIAL_NO_ERP varchar2(32),
  zflag_type char(2),
  zflag_reson varchar2(240),
  ISFROMERP varchar2(1)
);
alter table NIS_WAGE_DETAIL_HIS
  add constraint PK_NIS_WAGE_DETAIL_HIS primary key (wage_dtl_no_id);
comment on table NIS_WAGE_DETAIL_HIS
  is '����������ʷ��ϸ��';
  comment on column NIS_WAGE_DETAIL_HIS.wage_dtl_no_id
  is '����������ʷ��ϸ������ID';
comment on column NIS_WAGE_DETAIL_HIS.wage_dtl_no
  is '������ϸ���';
comment on column nis_wage_detail_his.NIS_WAGE_HIS_ID
  is '������ʷ����ID';
comment on column NIS_WAGE_DETAIL_HIS.user_name
  is '����';
comment on column NIS_WAGE_DETAIL_HIS.empno
  is '����';
comment on column NIS_WAGE_DETAIL_HIS.bank_acc
  is '�����˺�';
comment on column NIS_WAGE_DETAIL_HIS.bank_type
  is '�������';
comment on column NIS_WAGE_DETAIL_HIS.wages
  is 'ʵ������';
comment on column NIS_WAGE_DETAIL_HIS.wage_no
  is '�������ʱ�ţ�nis_wage��';
comment on column NIS_WAGE_DETAIL_HIS.bill_no
  is '����ţ�nis_billhead��';
comment on column NIS_WAGE_DETAIL_HIS.status
  is '״̬ 0���ݴ棻11����������-1����أ�95������ͨ��';
comment on column NIS_WAGE_DETAIL_HIS.voucher_stat
  is '����״̬ ��bis_voucher_stat��';
comment on column NIS_WAGE_DETAIL_HIS.purpose
  is '��;��nis_wage_purpose��';
comment on column NIS_WAGE_DETAIL_HIS.rmk
  is '��ע';
comment on column NIS_WAGE_DETAIL_HIS.verify
  is '�����˺�+ʵ������MD5����';
comment on column NIS_WAGE_DETAIL_HIS.voucher_no
  is '����ָ��� (voucher_no)';
comment on column NIS_WAGE_DETAIL_HIS.return_msg
  is '������Ϣ';  
comment on column NIS_WAGE_DETAIL_HIS.optime
  is '�˻�ʱ��';  
comment on column NIS_WAGE_DETAIL_HIS.reverse1
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL_HIS.reverse2
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL_HIS.reverse3
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL_HIS.reverse4
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL_HIS.reverse5
  is '�����ֶ�';
comment on column NIS_WAGE_DETAIL_HIS.SERIAL_NO_ERP
  is 'erp�ĵ���';
comment on column NIS_WAGE_DETAIL_HIS.zflag_type
  is '�˵�����';
comment on column NIS_WAGE_DETAIL_HIS.zflag_reson
  is '�˵�ԭ��';
comment on column NIS_WAGE_DETAIL_HIS.ISFROMERP
  is '�Ƿ�����erp:0���ǣ�1��';



--�޸����ڣ�20121121
--�޸��ˣ�����
--�޸����ݣ��޸Ĵ�����������
--�޸�ԭ���޸Ĵ�����������
ALTER TABLE nis_wage ADD(ISFROMERP varchar2(1));    
ALTER TABLE nis_wage ADD(zflag_type char(2)); 
ALTER TABLE nis_wage ADD(zflag_reson varchar2(240)); 
ALTER TABLE nis_wage ADD(SERIAL_NO_ERP varchar2(32));
ALTER TABLE nis_wage ADD allow_edit_paymoney char(1) default '0'; 
ALTER TABLE nis_wage ADD allow_edit_payeracc char(1) default '1';
ALTER TABLE nis_wage ADD allow_edit_payeeacc char(1) default '0';
ALTER TABLE nis_wage ADD isforindividual char(1) default '1'; 
comment on column nis_wage.ISFROMERP
  is '�Ƿ�����erp:0���ǣ�1��';
comment on column nis_wage.zflag_type
  is '�˵�����';
comment on column nis_wage.zflag_reson
  is '�˵�ԭ��';
comment on column nis_wage.SERIAL_NO_ERP
  is 'Erp���ݺ�';
comment on column nis_wage.allow_edit_paymoney
  is '�������Ƿ���Ա༭0�����ɱ༭��1���ɱ༭��';
comment on column nis_wage.allow_edit_payeeacc
  is '�տ�Ƿ���Ա༭0�����ɱ༭��1���ɱ༭';
comment on column nis_wage.isforindividual
  is '0����Ϊ�Թ���1��˽�������⸶����';

--�޸����ڣ�20121121
--�޸��ˣ�����
--�޸����ݣ��޸Ĵ���������ϸ��
--�޸�ԭ���޸Ĵ���������ϸ��

ALTER TABLE nis_wage_detail ADD(zflag_type char(2)); 
ALTER TABLE nis_wage_detail ADD(zflag_reson varchar2(240)); 
ALTER TABLE nis_wage_detail ADD(SERIAL_NO_ERP varchar2(32)); 
comment on column nis_wage_detail.zflag_type
  is '�˵�����';
comment on column nis_wage_detail.zflag_reson
  is '�˵�ԭ��';
comment on column nis_wage_detail.SERIAL_NO_ERP
  is 'Erp���ݺ�';












