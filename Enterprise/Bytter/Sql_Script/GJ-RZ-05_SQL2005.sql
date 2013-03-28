DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '���ʵ�������' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
	    insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values( (select max(id) + 1 from SYS_SUBSCRIBE_RULES),'cms',(select max(id) + 1 from SYS_SUBSCRIBE_RULES),'���ʵ�������',10,'���ʵ�������','����${count}�����ʵ��ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO