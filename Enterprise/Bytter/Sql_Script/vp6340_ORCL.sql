--修改日期：20130228
--修改人：祁继鸿
--修改内容：账号授权提醒
--参数设置：
--账号授权提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '账号授权提醒' and Sys_Code = 'adm';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (23, 'adm', '23', '账号授权提醒', 10, '账号授权提醒', '您有${count}笔账号授权提醒！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/
