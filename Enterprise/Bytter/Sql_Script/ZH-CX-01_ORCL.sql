--�޸����ڣ�2012.12.13
--�޸��ˣ����
--�޸����ݣ��к����񱨱�ͳ��ҳ����ʾ
--�޸�ԭ����������

DECLARE 
VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='fqs' AND t1.res_code='2007' AND t1.father_code='9218';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (res_code,res_name,sys_code,father_code,res_url,func_flag,res_type,link_target,status,res_order,res_level) 
   values('2007','�ʽ�����״����','fqs','9218','/monitor/report/zhcwzjllb_query.jsp','0','1','0','0','1','2');
  END IF;
  COMMIT;
END; 
/