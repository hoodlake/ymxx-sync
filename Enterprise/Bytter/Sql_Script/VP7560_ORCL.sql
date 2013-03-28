
--修改日期：20121205
--修改人：吴生火
--修改内容：增加自动记账登录用户表
--参数设置：


DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  --查看现有系统是否有BT_USER_ONLINE表
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'BT_USER_ONLINE';
  --如果没有则新增表，如果有就不处理
  IF VN_COUNT < 1 THEN
    VC_STR := 'create table BT_USER_ONLINE
				(  USER_CODE       VARCHAR2(8) not null,
                                   ONLINE_SIGN      CHAR(1),
				   constraint PK_BT_USER_ONLINE primary key (USER_CODE)
				)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
