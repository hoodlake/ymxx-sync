--�޸����ڣ�2012.9.1
--�޸��ˣ����پ�
--�޸����ݣ�BTS-JD1-0031 �����������������Ϣ
--�޸�ԭ��������Ҫ
--���ӱ��ֶ�


alter table FC_INSTRATE_ADJUST add useInterzoneAdjust int;
alter table FC_INSTRATE_ADJUST add interzoneRate varchar(2048);
--begin lipf 2012-10-18
--����״̬
alter table FC_INSTRATE_ADJUST add billStatus varchar(10);
--������ʽ
alter table FC_INSTRATE_ADJUST add changType varchar(10);
--end




--�޸����ڣ�2012.9.19
--�޸��ˣ�������
--�޸����ݣ�BTS-JD1-0031 �����������������Ϣ
--�޸�ԭ��������Ҫ
--���ӱ��ֶ�
-- Create table
-- Create table
create table FC_INSTRATE_ADJUST_REF
(
  ID           int not null,
  EXECUTE_TIME datetime,
  ACCOUNT      VARCHAR(50),
  DOWN_LIMIT   VARCHAR(50),
  UP_LIMIT     VARCHAR(50),
  NEW_RATE     int,
  REF_ID       int
);


-- Create/Recreate primary, unique and foreign key constraints 
alter table FC_INSTRATE_ADJUST_REF
  add constraint PK_ID primary key (ID);
  
--�޸ı���  
update  BT_SYS_RES set RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView'+char(38)+char(38)+'title=1' where  RES_URL ='/admin/fcInstrateAdjustAction.do?method=listView' and res_name='�ڲ�����ά��';
update BT_SYS_RES set RES_URL ='/check/fcInstrateAdjustCheck.do?method=list'+char(38)+char(38)+'title=1' where  RES_URL ='/check/fcInstrateAdjustCheck.do?method=list' and res_name='����ά������' and father_code=(select res_code from bt_sys_res where res_name = '�ڲ�����' and sys_code='amm');
go




