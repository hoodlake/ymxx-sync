--�޸�����:���������˵� �ʽ��������-�ڴ����-��Ѵ���
--�޸���:�ž���
--�޸�ʱ��:2012-11-29
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='mec' AND t1.res_name='��Ѵ���' AND t1.father_code=t2.res_code AND t2.res_name='�ڴ����';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '��Ѵ���', 'mec', res_code, '/mec/mecBestDepositSolution.do?method=toList', '0', '1', '0', '0', 4, '��Ѵ���', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '�ڴ����' and sys_code = 'mec';
  END IF;
  COMMIT; 
END;
/
