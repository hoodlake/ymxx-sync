--修改人:盖喜洋
--修改时间:2012-11-23
--修改内容:-IP段管理
--新建登录IP段
DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '登陆管理' and sys_code = 'adm' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values ((select max(res_code) + 1 from bt_sys_res), '登陆管理', 'adm', 1, '', '0', '1', '0', '0', 11, '', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
end;
/


DECLARE
VN_COUNT     number(10,2);
begin
   SELECT COUNT(*)
    INTO VN_COUNT 
    FROM bt_sys_res
   WHERE res_name = '登陆IP段管理' and sys_code = 'adm' and res_level = 3;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values ((select max(res_code) + 1 from bt_sys_res), '登陆IP段管理', 'adm', (select res_code from bt_sys_res where res_name='登陆管理' and sys_code='adm'), '/admin/ipsec.do?method=queryIpsecList', '0', '0', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, '');
   END IF;
ENd;
/
DECLARE
  tb NUMBER;
BEGIN
  SELECT COUNT(*) INTO tb FROM tabs WHERE table_name='BT_LOGIN_IPSEC';
   IF tb <> 0 THEN
     EXECUTE IMMEDIATE 'DROP TABLE BT_LOGIN_IPSEC';
     EXECUTE IMMEDIATE 'create table BT_LOGIN_IPSEC  (
   ID                  VARCHAR2(40)    NOT NULL,
   IPSEC_NAME            VARCHAR2(80),
   IPSEC_START           VARCHAR2(30),
   IPSEC_END             VARCHAR2(30),
   IS_VALID                   CHAR,
   REMARK                VARCHAR2(200)
)';
   ELSE
     EXECUTE IMMEDIATE 'create table BT_LOGIN_IPSEC  (
   ID                  VARCHAR2(40)    NOT NULL,
   IPSEC_NAME            VARCHAR2(80),
   IPSEC_START           VARCHAR2(30),
   IPSEC_END             VARCHAR2(30),
   IS_VALID                   CHAR,
   REMARK                VARCHAR2(200)
)';
   END IF;
END; 
/
DECLARE
  tb NUMBER;
BEGIN
  SELECT COUNT(*) INTO tb FROM tabs WHERE table_name='BT_USER_IPSEC';
   IF tb <> 0 THEN
     EXECUTE IMMEDIATE 'DROP TABLE BT_USER_IPSEC';
     EXECUTE IMMEDIATE 'create table BT_USER_IPSEC(
    IPSEC_ID                  VARCHAR2(40)    NOT NULL,
  USER_CODE         VARCHAR2(40) NOT NULL
)';
   ELSE
     EXECUTE IMMEDIATE 'create table BT_USER_IPSEC(
    IPSEC_ID                  VARCHAR2(40)    NOT NULL,
  USER_CODE         VARCHAR2(40) NOT NULL
)';
   END IF;
END; 
/
alter table BT_LOGIN_IPSEC
  add constraint PK_BT_LOGIN_IPSEC primary key (ID);
  
-- Add comments to the columns 
   comment on column BT_LOGIN_IPSEC.ID
  is '主键';
  comment on column BT_LOGIN_IPSEC.IPSEC_NAME
  is '段名';
  comment on column BT_LOGIN_IPSEC.IPSEC_START
  is '起始IP';
  comment on column BT_LOGIN_IPSEC.IPSEC_END
  is '截至IP';
  comment on column BT_LOGIN_IPSEC.IS_VALID
  is '是否有效(1有效；0无效)';
  comment on column BT_LOGIN_IPSEC.REMARK
  is '备注';
--------------------



delete from bt_param where code='isIpControl';
insert into bt_param(code,sys_code,name,param_value1,param_type,rmk,reverse1,reverse6,reverse7) values('isIpControl','adm','登录启用IP段管理',0,0,'是否启用IP段管理 1-启用 0-不启用','1,启用;0,不启用',1,5);
commit;