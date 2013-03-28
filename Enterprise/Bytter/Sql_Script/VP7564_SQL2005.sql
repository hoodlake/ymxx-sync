
-- 修改日期：20130115
-- 修改人：吴生火
--修改内容：增加菜单 “手续费计提账号维护”

declare @max_id_cs20130115 int;
declare @max_id_cs20130115_id int;
declare @max_id_cs20130115_1 int;
 begin
    select  @max_id_cs20130115 =  count(*) from bt_function where FUNCTION_IDEN='w_handle_charge_cd_acc';
    if @max_id_cs20130115=0 
      begin
     	 select   @max_id_cs20130115_id = FUNCTION_ID from bt_function where function_name='基础数据维护'and sys_code = 'counter';        
     	 select  @max_id_cs20130115 = max(function_id)+1 from BT_FUNCTION;
     	 insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130115, 'w_handle_charge_cd_acc', '手续费计提账号维护', '', '', '', 'Mnu', @max_id_cs20130115_id, 10, 'L', '1', 'counter', '手续费计提账号维护', '1');
      
      	 select   @max_id_cs20130115_1 = max(function_id)+1 from BT_FUNCTION;
     	 insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130115_1, '', '查询', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', @max_id_cs20130115, 1, '', '1', 'counter', '查询记录', '1');

      	select @max_id_cs20130115_1 = max(function_id)+1 from BT_FUNCTION;
      	insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130115_1, '', '保存', 'bmp\save.bmp', 'ue_save', 'S', 'Btn', @max_id_cs20130115, 2, '', '1', 'counter', '保存修改', '1');
     end;
  
 end;
go


--修改内容：增加“是否收取手续费”标志
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from syscolumns a inner join sysobjects b on a.id=b.id where b.name= 'fc_acc' and a.name='handle_charge';
  IF @VN_COUNT < 1 
     alter table fc_acc add handle_charge char(1) default '1';
     
END;
go


