--修改人:盖喜洋
--修改时间:2012-11-23
--修改内容:-在系统基本设置中增加是否启用IP段管理
delete from bt_sys_res where RES_NAME='登陆管理' and SYS_CODE='adm'
go
delete from bt_sys_res where RES_NAME='登陆IP段管理' and SYS_CODE='adm'
go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '登陆管理', 'adm', 1, '', '0', '1', '0', '0', 11, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(res_code) + 1 from bt_sys_res), '登陆IP段管理', 'adm', (select res_code from bt_sys_res where res_name='登陆管理' and sys_code='adm'), '/admin/ipsec.do?method=queryIpsecList', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, ''
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
insert into bt_param(code,sys_code,name,param_value1,param_type,rmk,reverse1,reverse6,reverse7) values('isIpControl','adm','登录启用IP段管理',0,0,'是否启用IP段管理 1-启用 0-不启用','1,启用;0,不启用',1,5)
go