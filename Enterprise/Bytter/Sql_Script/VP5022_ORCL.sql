--�޸����ڣ�2012.9.1
--�޸��ˣ����پ�
--�޸����ݣ�BTS-JD1-0031 �����������������Ϣ
--�޸�ԭ��������Ҫ
--���ӱ��ֶ�


alter table FC_INSTRATE_ADJUST add (useInterzoneAdjust number(2));
alter table FC_INSTRATE_ADJUST add (interzoneRate varchar2(2048));
--begin lipf 2012-10-18
--����״̬
alter table FC_INSTRATE_ADJUST add (billStatus varchar2(10));
--������ʽ
alter table FC_INSTRATE_ADJUST add (changType varchar2(10));
--end

commit;


--�޸����ڣ�2012.9.19
--�޸��ˣ�������
--�޸����ݣ�BTS-JD1-0031 �����������������Ϣ
--�޸�ԭ��������Ҫ
--���ӱ��ֶ�
-- Create table
-- Create table
create table FC_INSTRATE_ADJUST_REF
(
  ID           NUMBER not null,
  EXECUTE_TIME DATE,
  ACCOUNT      VARCHAR2(50),
  DOWN_LIMIT   VARCHAR2(50),
  UP_LIMIT     VARCHAR2(50),
  NEW_RATE     NUMBER(20,6),
  REF_ID       NUMBER(10)
);

-- Create/Recreate primary, unique and foreign key constraints 
alter table FC_INSTRATE_ADJUST_REF  add constraint PK_ID primary key (ID);

--�޸ı���
update BT_SYS_RES set RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView'||chr(38)||chr(38)||'title=1' where  RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView' and res_name='�ڲ�����ά��';
update BT_SYS_RES set RES_URL ='/check/fcInstrateAdjustCheck.do?method=list'||chr(38)||chr(38)||'title=1' where  RES_URL ='/check/fcInstrateAdjustCheck.do?method=list' and res_name='����ά������' and father_code=(select res_code from bt_sys_res where res_name = '�ڲ�����' and sys_code='amm');
commit;

