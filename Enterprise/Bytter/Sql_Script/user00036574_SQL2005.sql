declare
@VN_COUNT decimal
begin
IF EXISTS (SELECT 1
                FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_WARNING_DICTIONARY')
                AND   TYPE = 'U')
     begin
	    update bt_warning_dictionary set rmk = '������ϸժҪ' where class_id = '01' and code='11' and code_name = '֧��������';
     end 
end;
GO