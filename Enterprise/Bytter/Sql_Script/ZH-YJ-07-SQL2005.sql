declare
@VN_COUNT decimal
begin
IF EXISTS (SELECT 1
                FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_SYS_OPERATION')
                AND   TYPE = 'U')
     begin
	    -- 更新预警策略维护录入
    	update bt_sys_operation set type_name = '预警策略维护录入' where type_name = '录入' and op_type = 1 and sys_code='fwg';
    	-- 插入数据
	    select @VN_COUNT = count(*) from bt_sys_operation where type_name = '一级预警处理' and op_type = 3 and sys_code='fwg';
	    if (@VN_COUNT = 0 ) 
		begin  
			insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 3, '一级预警处理');
		end;
	    select @VN_COUNT = count(*) from bt_sys_operation where type_name = '二级预警处理' and op_type = 4 and sys_code='fwg';
	    if (@VN_COUNT = 0 ) 
		begin  
			insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 4, '二级预警处理');
		end;
	    select @VN_COUNT = count(*) from bt_sys_operation where type_name = '三级预警处理' and op_type = 5 and sys_code='fwg';
	    if (@VN_COUNT = 0 ) 
		begin  
			insert into bt_sys_operation (SYS_CODE, OP_TYPE, TYPE_NAME) values ('fwg', 5, '三级预警处理');
		end;
     end 
end;
GO