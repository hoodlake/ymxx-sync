declare
@VN_COUNT decimal
begin
IF EXISTS (SELECT 1
                FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_SYS_OPERATION')
                AND   TYPE = 'U')
     begin
	    -- ����Ԥ������ά��¼��
    	update bt_sys_operation set type_name = 'Ԥ������ά��¼��' where type_name = '¼��' and op_type = 1 and sys_code='fwg';
    	-- ��������
	    select @VN_COUNT = count(*) from bt_sys_operation where type_name = 'һ��Ԥ������' and op_type = 3 and sys_code='fwg';
	    if (@VN_COUNT = 0 ) 
		begin  
			insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 3, 'һ��Ԥ������');
		end;
	    select @VN_COUNT = count(*) from bt_sys_operation where type_name = '����Ԥ������' and op_type = 4 and sys_code='fwg';
	    if (@VN_COUNT = 0 ) 
		begin  
			insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 4, '����Ԥ������');
		end;
	    select @VN_COUNT = count(*) from bt_sys_operation where type_name = '����Ԥ������' and op_type = 5 and sys_code='fwg';
	    if (@VN_COUNT = 0 ) 
		begin  
			insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 5, '����Ԥ������');
		end;
     end 
end;
GO