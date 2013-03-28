--修改人：胡双
--修改日期：2012-11-22
--修改原因：VP6832要求添加“仅当前用户查询” 的参数权限控制

DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM BT_SYS_OPERATION
   WHERE SYS_CODE = 'ads'
     AND OP_TYPE = 3;
  IF @VN_COUNT < 1
    BEGIN
      INSERT INTO BT_SYS_OPERATION
        (SYS_CODE, OP_TYPE, TYPE_NAME)
      VALUES
        ('ads', 3, '仅当前用户查询');
    END;
END;
GO
