DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1 WHERE t1.sys_code='cms' AND t1.res_name='Ʊ������';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL,RES_ROLE)
   values ((select max(res_code) + 1 from bt_sys_res), 'Ʊ������', 'cms', 0, '', '0', '1', '0', '0', 8, '', 1,'');
  END IF;
  COMMIT; 
END;
/

--����Ҫ�������˵��ģ����������ģ�����ֻ��Ҫ�����Ϳ����ˡ�
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='��������' AND t1.father_code=t2.res_code AND t2.res_name='Ʊ������';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL,RES_ROLE)
   values ((select max(res_code) + 1 from bt_sys_res), '��������', 'cms', (select res_code from bt_sys_res  where res_name='Ʊ������' and res_level=1), '/AB/bill/discountCms.jsp', '0', '1', '0', '0', 1, '', 2,'');
  END IF;
  COMMIT; 
END;
/

DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='���ֲ�¼' AND t1.father_code=t2.res_code AND t2.res_name='Ʊ������';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL,RES_ROLE)
   values ((select max(res_code) + 1 from bt_sys_res), '���ֲ�¼', 'cms', (select res_code from bt_sys_res  where res_name='Ʊ������' and res_level=1), '/AB/discountManage.do?method=loadlist'||'&'||'operationType=4'||'&'||'discountCms=true', '0', '1', '0', '0', 1, '', 2,'');
  END IF;
  COMMIT; 
END;
/

alter table ab_receive add ITEM_CODE varchar2(20);
