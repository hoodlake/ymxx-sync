--�޸����ڣ�20130228
--�޸��ˣ���̺�
--�޸����ݣ��˺���Ȩ����
--�������ã�
--�˺���Ȩ����
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '�˺���Ȩ����' and Sys_Code = 'adm';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(23,'adm','23','�˺���Ȩ����', 10, '�˺���Ȩ����', '����${count}���˺���Ȩ���ѣ�',null,null,2,1,getdate(),null);
      END;
END;
GO
