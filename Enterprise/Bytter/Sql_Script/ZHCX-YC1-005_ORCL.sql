--�޸����ڣ�2012.11.14
--�޸��ˣ��ܱ�
--�޸����ݣ��ʽ�ͷ��Ԥ�������ߣ�
--�޸�ԭ���ʽ�ͷ��Ԥ�������ߣ�

DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '�ʽ�ͷ��Ԥ�������ߣ�' and sys_code = 'fqs' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
      values (( select max(res_code)+1 from bt_sys_res ) , '�ʽ�ͷ��Ԥ�������ߣ�', 'fqs', ( select min(res_code) from bt_sys_res r where r.res_name = '�ʽ�Ԥ��' and r.sys_code = 'fqs'  ), '/allocation/fundAllocation.do?method=toQueryReport', '0', '1', '0', '0', 1, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/
commit;
