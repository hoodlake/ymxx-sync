 delete from bt_sys_res where RES_NAME='单位分组维护' and sys_code='adm'   
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '单位分组维护', 'adm', (select res_code from bt_sys_res where res_name='基础数据维护' and sys_code='adm'), '/admin/CorpGroups.do?method=toList', '0', '1', '0', '0', 16, '', '', '', '', '', '', null, null, null, null, null, 3, ''
 go

-- CREATE TABLE 单位分组 for 大屏幕报表
if exists (select * from sysobjects where id = object_id(N'[GJ_CORP_GROUPS]')) 
drop table GJ_CORP_GROUPS
GO
CREATE TABLE GJ_CORP_GROUPS
(
  ID       NUMERIC,
  PG_NAME  VARCHAR(50),
  PG_CODE  char(4),
  SUPER_ID NUMERIC,
  display   char(1),
  CORP    VARCHAR(30),
  PG_LEVEL   NUMERIC
  constraint ID primary key (ID)
);
go 

