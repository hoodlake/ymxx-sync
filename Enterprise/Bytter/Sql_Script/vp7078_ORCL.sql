
--修改人：李德成
--修改日期：2012-12-03
--修改内容：增加定价管理查询权限
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 1 and sys_code = 'amm';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('amm', 1, '查询');
  END IF;
  COMMIT; 
END;
/

--修改人：李德成
--修改日期：2012-12-03
--修改内容：增加基础平台利率维护权限
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 1 and sys_code = 'adm';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('adm', 1, '利率维护');
  END IF;
  COMMIT; 
END;
/

--修改人：李德成
--修改日期：2012-12-03
--修改内容：增加基础平台账号授权权限
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 2 and sys_code = 'adm';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('adm', 2, '账号授权');
  END IF;
  COMMIT; 
END;
/