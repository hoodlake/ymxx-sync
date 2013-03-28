--修改日期：20130228
--修改人：祁继鸿
--修改内容：账号授权提醒
--参数设置：
--账号授权提醒
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '账号授权提醒' and Sys_Code = 'adm';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(23,'adm','23','账号授权提醒', 10, '账号授权提醒', '您有${count}笔账号授权提醒！',null,null,2,1,getdate(),null);
      END;
END;
GO
