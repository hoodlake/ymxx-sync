--修改日期：20121126
--修改人： 李程
--修改原因：vp6804奥克斯AD域单点登录，增加用户映射表。OUTER_USER_CODE这里写用户的WINDOWS登录名，即短名；USER_CODE：bt_user里面的user_code
---------增加两个系统参数
IF NOT EXISTS (SELECT 1 FROM  SYSOBJECTS  WHERE  ID = OBJECT_ID('OUTER_USER_RELATIONSHIP') AND TYPE = 'U')
CREATE TABLE OUTER_USER_RELATIONSHIP(
    OUTER_USER_CODE VARCHAR(200) NOT NULL,
    USER_CODE VARCHAR(8) NOT NULL,
    CONSTRAINT PK_OUTER_USER_RELATIONSHIP PRIMARY KEY (USER_CODE)
);
begin
declare
  @SN_COUNT int;
begin
	SELECT @SN_COUNT=COUNT(*) FROM bt_param
      WHERE code = 'SENDTODO';
    if @SN_COUNT=0
      begin
	    insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
		values ('sendToDo', 'adm', '是否实时传输待办', '0', null, null, '0', '是否启用,1-启用,0-不启用', '1,启用;0,不启用', '', '', '', '', 1.00, 14.00, null, null, null);
      end ;
end ;

declare
  @VN_COUNT int;
begin
	SELECT @VN_COUNT=COUNT(*) FROM bt_param
      WHERE code = 'SENDADDRESS';
    if @VN_COUNT=0
      begin
	    insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
  		values ('sendAddress', 'adm', '传输待办地址', '', null, null, '0', '', '', '', '', '', '', 0.00, 15.00, null, null, null);
      end ;
end ;
end;
GO