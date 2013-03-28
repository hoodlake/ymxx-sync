--修改时间：2013-01-30
--修改人：费滔
--修改原因：V10.4BUG,发现以下提醒没法通过参数是否启用控制控制
--银行借款提醒
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '银行借款提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(29,'cms','29','银行借款提醒', '10', '银行借款提醒', '您有${count}笔银行借款到期！',null,null,2,1,getdate(),null);
      END;
END;
GO
