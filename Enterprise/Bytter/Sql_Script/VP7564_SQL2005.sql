
-- �޸����ڣ�20130115
-- �޸��ˣ�������
--�޸����ݣ����Ӳ˵� �������Ѽ����˺�ά����

declare @max_id_cs20130115 int;
declare @max_id_cs20130115_id int;
declare @max_id_cs20130115_1 int;
 begin
    select  @max_id_cs20130115 =  count(*) from bt_function where FUNCTION_IDEN='w_handle_charge_cd_acc';
    if @max_id_cs20130115=0 
      begin
     	 select   @max_id_cs20130115_id = FUNCTION_ID from bt_function where function_name='��������ά��'and sys_code = 'counter';        
     	 select  @max_id_cs20130115 = max(function_id)+1 from BT_FUNCTION;
     	 insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130115, 'w_handle_charge_cd_acc', '�����Ѽ����˺�ά��', '', '', '', 'Mnu', @max_id_cs20130115_id, 10, 'L', '1', 'counter', '�����Ѽ����˺�ά��', '1');
      
      	 select   @max_id_cs20130115_1 = max(function_id)+1 from BT_FUNCTION;
     	 insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130115_1, '', '��ѯ', 'bmp\query.bmp', 'ue_query', 'Q', 'Btn', @max_id_cs20130115, 1, '', '1', 'counter', '��ѯ��¼', '1');

      	select @max_id_cs20130115_1 = max(function_id)+1 from BT_FUNCTION;
      	insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130115_1, '', '����', 'bmp\save.bmp', 'ue_save', 'S', 'Btn', @max_id_cs20130115, 2, '', '1', 'counter', '�����޸�', '1');
     end;
  
 end;
go


--�޸����ݣ����ӡ��Ƿ���ȡ�����ѡ���־
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from syscolumns a inner join sysobjects b on a.id=b.id where b.name= 'fc_acc' and a.name='handle_charge';
  IF @VN_COUNT < 1 
     alter table fc_acc add handle_charge char(1) default '1';
     
END;
go


