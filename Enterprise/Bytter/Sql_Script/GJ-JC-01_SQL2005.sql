--�޸���:��ϲ��
--�޸�ʱ��:2012-11-23
--�޸�����:-��ϵͳ���������������Ƿ�����IP�ι���
delete from bt_sys_res where RES_NAME='��½����' and SYS_CODE='adm'
go
delete from bt_sys_res where RES_NAME='��½IP�ι���' and SYS_CODE='adm'
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��½����', 'adm', 1, '', '0', '1', '0', '0', 11, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '��½IP�ι���', 'adm', (select res_code from bt_sys_res where res_name='��½����' and sys_code='adm'), '/admin/ipsec.do?method=queryIpsecList', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, ''
 go
 
 
if exists (select * from sysobjects where id = object_id(N'[BT_LOGIN_IPSEC]')) 
drop table BT_LOGIN_IPSEC
GO
 create table BT_LOGIN_IPSEC  (
    ID                  VARCHAR(40)    NOT NULL,
   IPSEC_NAME            VARCHAR(80),
   IPSEC_START           VARCHAR(30),
   IPSEC_END             VARCHAR(30),
   IS_VALID                   CHAR,
   REMARK                VARCHAR(200)
   constraint PK_BT_LOGIN_IPSEC primary key (ID)
)
go 
if exists (select * from sysobjects where id = object_id(N'[BT_USER_IPSEC]')) 
drop table BT_USER_IPSEC
GO
create table BT_USER_IPSEC(
    IPSEC_ID                  VARCHAR(40)    NOT NULL,
  USER_CODE         VARCHAR(40) NOT NULL
)
go
delete from bt_param where code='isIpControl'
go
insert into bt_param(code,sys_code,name,param_value1,param_type,rmk,reverse1,reverse6,reverse7) values('isIpControl','adm','��¼����IP�ι���',0,0,'�Ƿ�����IP�ι��� 1-���� 0-������','1,����;0,������',1,5)
go