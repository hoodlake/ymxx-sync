declare
@VN_COUNT decimal
begin
IF EXISTS (SELECT 1
                FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_DICTIONARY')
                AND   TYPE = 'U')
     begin
	    update bt_warning_dictionary set rmk = '交易明细摘要' where class_id = '01' and code='11' and code_name = '支出户流入';
     end 
end;
GO