--�޸���:�ന��
--�޸�ʱ��:2012-11-20
--�޸�����:bis_serial ������ bis_query_cmd������
DECLARE
  VN_COUNT NUMBER;
BEGIN  
   select COUNT(*) INTO VN_COUNT from bis_serial where table_name='bis_query_cmd';
   IF VN_COUNT < 1 THEN
    insert into bis_serial(table_name,last_serial)
    values('bis_query_cmd',(select nvl(max(serial_id)+1,0) from bis_query_cmd));
  END IF;
  COMMIT; 
END;
/