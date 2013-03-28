--修改时间：2012-12-17
--修改人：费滔
--修改原因：资金预算执行总比率提醒功能修改的需求 工作台消息设置
alter table FBS_ITEM add FBS_PROCESS_RATE NUMBER(5,2);
comment on column FBS_ITEM.FBS_PROCESS_RATE
  is '添加设置预算执行比率';
 
--资金预算执行总比率提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '资金预算执行总比率提醒' and Sys_Code = 'fbs';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (20, 'fbs', '20', '资金预算执行总比率提醒', '10', '资金预算执行总比率提醒', '预算科目（采购费用）执行比率已达到xx%！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/
--借款还息提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '借款还息提醒' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (21, 'cms', '21', '借款还息提醒', '10', '借款还息提醒', '您有${count}笔借款于本月（结息日）到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;

/
--贷款还息提醒
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from SYS_SUBSCRIBE_RULES  where Notice_Name = '贷款还息提醒' and Sys_Code = 'cms';
  IF VN_COUNT < 1 THEN
    insert into SYS_SUBSCRIBE_RULES (ID, SYS_CODE, NOTICE_TYPE, NOTICE_NAME, PRE_DAYS, TITLE, CONTENT, TRIGGER_NAME, TRIGGER_CNDT, SHOW_TYPE, VALIDE_SIGN, CREATE_TIME, MODIFY_TIME)
values (22, 'cms', '22', '贷款还息提醒', '10', '贷款还息提醒', '您有${count}笔贷款于本月（结息日）到期！', '', '', '2;', '1', sysdate, null);
  END IF;
  COMMIT; 
END;
/