--�޸���:������
--�޸�ʱ��:2012-11-27
--�޸�����:�������-���ʵ�������

--�������

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '���ʵ�������' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES
    (id,
    Sys_Code,
    Notice_Type,
    Notice_Name,
    Pre_Days,
    Title,
    Content,
    Trigger_Name,
    Trigger_Cndt,
    Show_Type,
    Valide_Sign,
    Create_Time,
    Modify_Time)
   values( (select max(id) + 1 from SYS_SUBSCRIBE_RULES),
        'cms',
        (select max(id) + 1 from SYS_SUBSCRIBE_RULES),
        '���ʵ�������',
        10,
        '���ʵ�������',
        '����${count}�����ʵ��ڣ�',
        null,
        null,
        2,
        1,
        sysdate,
        null);
  END IF;
  COMMIT; 
END;





