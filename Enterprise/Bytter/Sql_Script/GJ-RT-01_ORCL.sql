--ʱ�䣺2012-12-17
--���ݣ����ӱ�����λ����
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param WHERE code='isBbCorpParam';
  IF VN_COUNT < 1 THEN
   INSERT INTO bt_param(code, sys_code, NAME, param_value1, rmk,reverse1, reverse6)
   VALUES('isBbCorpParam','cms','������λ��������',0,'���ö����λ��;�ָ�','˵��:���ö����λ��;�ָ�',0.00);
  END IF;
  COMMIT; 
END;
/

DECLARE
  VC_STR   VARCHAR2(5000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
   INTO VN_COUNT
    FROM bt_sys_res
  where res_name = '�쵼��ѯ'
  and sys_code='wpf' and res_url='/workPicture/infoAction.do?method=picture';  
  IF VN_COUNT < 1 THEN
   
  insert into bt_sys_res
  (RES_CODE,
   RES_NAME,
   SYS_CODE,
   FATHER_CODE,
   RES_URL,
   FUNC_FLAG,
   RES_TYPE,
   LINK_TARGET,
   STATUS,
   RES_ORDER,
   RMK,
   REVERSE1,
   REVERSE2,
   REVERSE3,
   REVERSE4,
   REVERSE5,
   REVERSE6,
   REVERSE7,
   REVERSE8,
   REVERSE9,
   REVERSE10,
   RES_LEVEL,
   RES_ROLE)
  
  select (select max(RES_CODE) + 1 from bt_sys_res),
   '�쵼��ѯ',
   'wpf',
   9001,
   '/workPicture/infoAction.do?method=picture',
   '0',
   '0',
   '0',
   '0',
   10,
   '',
   '',
   '',
   '',
   '',
   '',
   null,
   null,
   null,
   null,
   null,
   2,
   ''  
  from  bt_sys_res  where res_name = '����̨����'
  and sys_code='wpf' ;
  END IF;
END;  
/


commit; 