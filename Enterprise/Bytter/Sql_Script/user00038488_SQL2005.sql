--�޸�ʱ�䣺2013-01-30
--�޸��ˣ�����
--�޸�ԭ��V10.4BUG,������������û��ͨ�������Ƿ����ÿ��ƿ���
--���н������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '���н������' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(29,'cms','29','���н������', '10', '���н������', '����${count}�����н��ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
