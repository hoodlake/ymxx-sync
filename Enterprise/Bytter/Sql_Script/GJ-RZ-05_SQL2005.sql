DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '融资到期提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
	    insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values( (select max(id) + 1 from SYS_SUBSCRIBE_RULES),'cms',(select max(id) + 1 from SYS_SUBSCRIBE_RULES),'融资到期提醒',10,'融资到期提醒','您有${count}笔融资到期！',null,null,2,1,getdate(),null);
      END;
END;
GO