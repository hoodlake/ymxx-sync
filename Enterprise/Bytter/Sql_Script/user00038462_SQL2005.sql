--修改时间：2013-01-29
--修改人：费滔
--修改原因：V10.4BUG,发现以下提醒没法通过参数是否启用控制控制




--承兑解汇提醒
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '承兑解汇提醒' and Sys_Code = 'ads';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(24,'ads','24','承兑解汇提醒', '10', '承兑解汇提醒', '您有${count}笔承兑解汇到期！',null,null,2,1,getdate(),null);
      END;
END;
GO
--承兑托收提醒
DECLARE 
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '承兑托收提醒' and Sys_Code = 'ads';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(25,'ads','25','承兑托收提醒', '10', '承兑托收提醒', '您有${count}笔承兑托收到期！',null,null,2,1,getdate(),null);
      END;
END;
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '贷款到期提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(26,'cms','26','贷款到期提醒', '10', '贷款到期提醒', '您有${count}笔贷款到期到期！',null,null,2,1,getdate(),null);
      END;
END;
GO
-- 委托贷款提醒
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '委托贷款提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(27,'cms','27','委托贷款提醒', '10', '委托贷款提醒', '您有${count}笔委托贷款到期！',null,null,2,1,getdate(),null);
      END;
END;
GO
--委托存款提醒
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '委托存款提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(28,'cms','28','委托存款提醒', '10', '委托存款提醒', '您有${count}笔委托存款到期！',null,null,2,1,getdate(),null);
      END;
END;
GO
