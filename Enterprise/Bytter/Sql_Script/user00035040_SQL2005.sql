--修改人:余川锋
--修改时间:2012-11-20
--修改内容:bis_serial 表增加 bis_query_cmd的主键
DECLARE
  @VN_COUNT INT;
BEGIN  
  select @VN_COUNT = COUNT(*) from bis_serial where table_name='bis_query_cmd';
  IF @VN_COUNT < 1
    BEGIN
      insert into bis_serial(table_name,last_serial) select 'bis_query_cmd',(select max(serial_id)+1 from bis_query_cmd);
    END;
END;
GO