-- �޸����ڣ�20120918
-- �޸��ˣ��ന��
-- ���ܲ��ɶ����ʽ�ά���ű�
drop table BT_BANKACC_FREEZEACC;
create table BT_BANKACC_FREEZEACC
(
  FID            NUMBER not null,
  BANKACC        VARCHAR2(30),
  UF_FLAG        VARCHAR2(1),
  BAL            NUMBER(20,2),
  FREEZE_MONEY   NUMBER(20,2),
  AVAL_BAL       NUMBER(20,2),
  FREEZE_DATE    DATE,
  FREEZE_RESSION VARCHAR2(500),
  FATHER_FID     NUMBER,
  STATUS         NUMBER(10),
  OP             VARCHAR2(20),
  OP_CODE        VARCHAR2(20),
  OP_DATE        DATE,
  REVERSE1       VARCHAR2(50),
  REVERSE2       VARCHAR2(50),
  REVERSE3       VARCHAR2(50),
  REVERSE4       VARCHAR2(50),
  REVERSE5       VARCHAR2(50),
  REVERSE6       VARCHAR2(50),
  REVERSE7       VARCHAR2(50),
  REVERSE8       VARCHAR2(50),
  FREEZE_ACC     VARCHAR2(30),
  APPROVES       NVARCHAR2(200),
  NEXTCHECKER    VARCHAR2(100),
  CORP_ID        INTEGER,
  B_STATUS VARCHAR2(1)
);
-- Add comments to the columns 
comment on column BT_BANKACC_FREEZEACC.FID
  is 'ID';
comment on column BT_BANKACC_FREEZEACC.BANKACC
  is '�˺�';
comment on column BT_BANKACC_FREEZEACC.UF_FLAG
  is '0������    1���ⶳ';
comment on column BT_BANKACC_FREEZEACC.BAL
  is '���';
comment on column BT_BANKACC_FREEZEACC.FREEZE_MONEY
  is '���ᣬ�ⶳ���';
comment on column BT_BANKACC_FREEZEACC.AVAL_BAL
  is '�ɶ�����';
comment on column BT_BANKACC_FREEZEACC.FREEZE_DATE
  is '���ᣬ�ⶳ����';
comment on column BT_BANKACC_FREEZEACC.FREEZE_RESSION
  is 'ԭ��';
comment on column BT_BANKACC_FREEZEACC.FATHER_FID
  is '�����ʱ��Ϊ0���ⶳ��ʱ������ⶳʱ������Ӧ�Ķ������ݵ�FID';
comment on column BT_BANKACC_FREEZEACC.STATUS
  is '10--�ύ����
-1--���
95����ͨ��
0--�ݴ�
-2--ɾ��
';
comment on column BT_BANKACC_FREEZEACC.OP
  is '����Ա';
comment on column BT_BANKACC_FREEZEACC.OP_CODE
  is '����Ա����';
comment on column BT_BANKACC_FREEZEACC.OP_DATE
  is '����ʱ��';
comment on column BT_BANKACC_FREEZEACC.FREEZE_ACC
  is '���';
comment on column BT_BANKACC_FREEZEACC.APPROVES
  is '��������Ա';
comment on column BT_BANKACC_FREEZEACC.NEXTCHECKER
  is '��һ��������';
comment on column BT_BANKACC_FREEZEACC.CORP_ID
  is '��λID';
comment on column BT_BANKACC_FREEZEACC.B_STATUS
is 'ԭ��STATUS����,2������״̬ 6���ѱ��ⶳ';
-- Create/Recreate primary, unique and foreign key constraints 
alter table BT_BANKACC_FREEZEACC add constraint PK_BT_BANKACC_FREEZEACC primary key (FID);
     --
delete from bt_sys_res where FATHER_CODE=(select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��');
delete from bt_sys_res where res_name='���ɶ����ʽ�ά��';
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '���ɶ����ʽ�ά��', 'bankacc', (select res_code from bt_sys_res  where res_name='�����˻�����'), '', '0', '1', '0', '0', 2, '�ҵĲ��ɶ����ʽ�ά��', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�˻���������', 'bankacc', (select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��'), '/bankacc/freezeaccapp.do?method=listCorps', '0', '1', '0', '0', 1, '�˻���������', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�˻����������ݴ�', 'bankacc', (select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��'), '/bankacc/freezeaccapp.do?method=listAppStage', '0', '1', '0', '0', 2, '�˻����������ݴ�', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�˻�����������', 'bankacc', (select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��'), '/bankacc/freezeaccapp.do?method=listAppBack', '0', '1', '0', '0', 3, '�˻�����������', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�˻��ⶳ����', 'bankacc', (select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��'), '/bankacc/unfreezeaccapp.do?method=listFreezeAcc', '0', '1', '0', '0', 4, '�˻��ⶳ����', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�˻��ⶳ�����ݴ�', 'bankacc', (select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��'), '/bankacc/unfreezeaccapp.do?method=listAppStage', '0', '1', '0', '0', 5, '�˻��ⶳ�����ݴ�', '', '', '', '', '', null, null, null, null, null, 3, '');
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(res_code) + 1 from bt_sys_res), '�˻��ⶳ������', 'bankacc', (select res_code from bt_sys_res  where res_name='���ɶ����ʽ�ά��'), '/bankacc/unfreezeaccapp.do?method=listAppBack', '0', '1', '0', '0', 6, '�˻��ⶳ������', '', '', '', '', '', null, null, null, null, null, 3, '');
delete from BT_APPROVE_BUSINESS where BUSINESS_CODE='freezeacc';
insert into BT_APPROVE_BUSINESS (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('freezeacc', 'bankacc', '�˻���������', 'A,B,C', 'bt_bankacc_freezeacc', '', 'freeze_money', '', 'nextchecker', 'freeze_acc', '../bankacc/freezecheck.jsp', '', '', '', '', 'com.byttersoft.bankacc.form.FreezeAccForm', '', '', '', '', '', null, null, null, null, null, '');
delete from BT_APPROVE_BUSINESS where BUSINESS_CODE='unfreezeacc';
insert into BT_APPROVE_BUSINESS (BUSINESS_CODE, SYS_CODE, BUSINESS_NAME, BUSINESS_LEVEL, TABLE_NAME, BILL_CODE_FIELD2, MONEY_FIELD, TABLE_FIELD, NEXT_CHECKER_FIELD, BILL_CODE_FIELD, URL1, URL2, URL3, URL4, URL5, CLASS_PATH, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, TOTAL_SET)
values ('unfreezeacc', 'bankacc', '�˻��ⶳ����', 'A,B,C', 'bt_bankacc_freezeacc', '', 'freeze_money', '', 'nextchecker', 'freeze_acc', '../bankacc/unfreezecheck.jsp', '', '', '', '', 'com.byttersoft.bankacc.form.UnFreezeAccForm', '', '', '', '', '', null, null, null, null, null, '');
     --end
delete from bt_bankacc_freezeacc;
insert into bt_bankacc_freezeacc
  (fid, bankacc, uf_flag, bal, freeze_money, aval_bal, freeze_date, freeze_ression, father_fid, status, 
  op, op_code, op_date, reverse1, reverse2, reverse3, reverse4, reverse5, reverse6, reverse7, reverse8, 
  freeze_acc, approves, nextchecker, corp_id,b_status)
select 
  fid, bankacc, uf_flag, bal, freeze_money, aval_bal, freeze_date, freeze_ression, father_fid, 95, 
  op, op_code, freeze_date, reverse1, reverse2, reverse3, reverse4, reverse5, reverse6, reverse7, reverse8,  
  '',null,null,null,status
from bt_bankacc_freeze;
declare
   maxid number:=1;
begin
   for i in(select * from BT_BANKACC_FREEZE) loop
       update BT_BANKACC_FREEZEACC set FREEZE_ACC=to_char(FREEZE_DATE,'yyyymmdd')|| case length(maxid) when null then '000' when 1 then '00' when 2 then '0' end||maxid
       where rownum=1 and (FREEZE_ACC is null or FREEZE_ACC='');
       maxid:=maxid+1;
   end loop;
end;
/
commit;