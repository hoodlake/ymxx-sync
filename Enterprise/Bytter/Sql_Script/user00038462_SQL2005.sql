--�޸�ʱ�䣺2013-01-29
--�޸��ˣ�����
--�޸�ԭ��V10.4BUG,������������û��ͨ�������Ƿ����ÿ��ƿ���




--�жҽ������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '�жҽ������' and Sys_Code = 'ads';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(24,'ads','24','�жҽ������', '10', '�жҽ������', '����${count}�ʳжҽ�㵽�ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
--�ж���������
DECLARE 
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '�ж���������' and Sys_Code = 'ads';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(25,'ads','25','�ж���������', '10', '�ж���������', '����${count}�ʳж����յ��ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '���������' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(26,'cms','26','���������', '10', '���������', '����${count}�ʴ���ڵ��ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
-- ί�д�������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = 'ί�д�������' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(27,'cms','27','ί�д�������', '10', 'ί�д�������', '����${count}��ί�д���ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
--ί�д������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = 'ί�д������' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(28,'cms','28','ί�д������', '10', 'ί�д������', '����${count}��ί�д��ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
