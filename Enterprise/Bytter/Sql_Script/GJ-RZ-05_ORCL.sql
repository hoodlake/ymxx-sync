--修改人:胡韶珍
--修改时间:2012-11-27
--修改内容:添加数据-融资到期提醒

--添加数据

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '融资到期提醒' and Sys_Code = 'cms';
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
        '融资到期提醒',
        10,
        '融资到期提醒',
        '您有${count}笔融资到期！',
        null,
        null,
        2,
        1,
        sysdate,
        null);
  END IF;
  COMMIT; 
END;





