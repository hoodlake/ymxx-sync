--修改时间：2012-12-17
--修改人：费滔
--修改原因：资金预算执行总比率提醒功能修改的需求 工作台消息设置

alter table FBS_ITEM add FBS_PROCESS_RATE numeric(5,2);
--资金预算执行总比率提醒
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '资金预算执行总比率提醒' and Sys_Code = 'fbs';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(20,'fbs','20','资金预算执行总比率提醒', '10', '资金预算执行总比率提醒', '预算科目（采购费用）执行比率已达到xx%！',null,null,2,1,getdate(),null);
      END;
END;
GO
--借款还息提醒
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '借款还息提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(21,'cms','21','借款还息提醒', '10', '借款还息提醒', '您有${count}笔借款于本月（结息日）到期！',null,null,2,1,getdate(),null);
      END;
END;
--贷款还息提醒
GO
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM SYS_SUBSCRIBE_RULES
   WHERE Notice_Name = '贷款还息提醒' and Sys_Code = 'cms';
  IF @VN_COUNT < 1
    BEGIN
      insert into SYS_SUBSCRIBE_RULES(id,Sys_Code,Notice_Type,Notice_Name,Pre_Days,Title,Content,Trigger_Name,Trigger_Cndt,Show_Type,Valide_Sign,Create_Time,Modify_Time)
        values(22,'cms','22','贷款还息提醒', '10', '贷款还息提醒', '您有${count}笔贷款于本月（结息日）到期！',null,null,2,1,getdate(),null);
      END;
END;
GO