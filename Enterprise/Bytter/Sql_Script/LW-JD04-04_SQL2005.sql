--�޸�ʱ�䣺2012-12-17
--�޸��ˣ�����
--�޸�ԭ���ʽ�Ԥ��ִ���ܱ������ѹ����޸ĵ����� ����̨��Ϣ����

alter table FBS_ITEM add FBS_PROCESS_RATE numeric(5,2);
--�ʽ�Ԥ��ִ���ܱ�������
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '�ʽ�Ԥ��ִ���ܱ�������' and Sys_Code = 'fbs';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(20,'fbs','20','�ʽ�Ԥ��ִ���ܱ�������', '10', '�ʽ�Ԥ��ִ���ܱ�������', 'Ԥ���Ŀ���ɹ����ã�ִ�б����Ѵﵽxx%��',null,null,2,1,getdate(),null);
      END;
END;
GO
--��Ϣ����
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '��Ϣ����' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(21,'cms','21','��Ϣ����', '10', '��Ϣ����', '����${count}�ʽ���ڱ��£���Ϣ�գ����ڣ�',null,null,2,1,getdate(),null);
      END;
END;
--���Ϣ����
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '���Ϣ����' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(22,'cms','22','���Ϣ����', '10', '���Ϣ����', '����${count}�ʴ����ڱ��£���Ϣ�գ����ڣ�',null,null,2,1,getdate(),null);
      END;
END;
GO