
-- �޸����ڣ�20130205
-- �޸��ˣ�������
--�޸����ݣ�����ָ��ά���޸ġ�ˢ�¡��˵������ӡ�����ɾ����ȫѡ����ѡ���˵� 

declare @max_id_cs20130205 int;
declare @max_id_cs20130205_id int;
declare @max_id_cs20130205_1 int;
 begin
    select  @max_id_cs20130205 =  count(*) from bt_function 
    where upper_function_id = (select FUNCTION_ID   from bt_function where FUNCTION_IDEN='w_bis_query_cmd') 
	and user_event = 'ue_selectall';
    if @max_id_cs20130205=0 
      begin
     	 select   @max_id_cs20130205_id = FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bis_query_cmd';        
     	 select  @max_id_cs20130205_1 = max(function_id)+1 from BT_FUNCTION;
     	  insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130205_1 , '', 'ȫѡ', 'bmp\selectall.bmp', 'ue_selectall', 'A', 'Btn', @max_id_cs20130205_id , 3, '', '1', 'electron', 'ȫ��ѡ��', '1');
      
      	 select   @max_id_cs20130205_1 = max(function_id)+1 from BT_FUNCTION;
     	 insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
      values (@max_id_cs20130205_1, '', '��ѡ', 'bmp\disselect.bmp', 'ue_disselect', 'I', 'Btn', @max_id_cs20130205_id, 3, '', '1', 'electron', '����ѡ��', '1');

      	update bt_function  set USER_EVENT ='ue_filter',FUNCTION_NAME ='ˢ������',RMK ='ˢ������'  where upper_function_id = @max_id_cs20130205_id and USER_EVENT ='ue_refresh';
     end;
 end;
go





