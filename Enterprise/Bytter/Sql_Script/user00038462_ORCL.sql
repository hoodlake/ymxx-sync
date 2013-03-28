--修改时间：2013-01-29
--修改人：费滔
--修改原因：V10.4BUG,发现以下提醒没法通过参数是否启用控制控制
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '承兑解汇提醒' and Sys_Code = 'ads';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (24, 'ads', '24', '承兑解汇提醒', '10', '承兑解汇提醒', '您有${count}笔承兑解汇到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

--承兑托收提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '承兑托收提醒' and Sys_Code = 'ads';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (25, 'ads', '25', '承兑托收提醒', '10', '承兑托收提醒', '您有${count}笔承兑托收到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 
--贷款到期提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '贷款到期提醒' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (26, 'cms', '26', '贷款到期提醒', '10', '贷款到期提醒', '您有${count}笔贷款到期到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

--委托贷款提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '委托贷款提醒' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (27, 'cms', '27', '委托贷款提醒', '10', '委托贷款提醒', '您有${count}笔委托贷款到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 

--委托存款提醒比率提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '委托存款提醒' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (28, 'cms', '28', '委托存款提醒', '10', '委托存款提醒', '您有${count}笔委托存款到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/ 
