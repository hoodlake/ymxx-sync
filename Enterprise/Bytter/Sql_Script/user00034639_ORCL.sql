--�޸�ʱ��2012-11-12
--�޸��� andy.huang
--�޸�����  �����ʽ��ѯ
DECLARE
  VN_COUNT    NUMBER;
BEGIN

   select max(res_code) into VN_COUNT from BT_SYS_RES;
   IF VN_COUNT !=0 THEN
     VN_COUNT:=VN_COUNT+1;
     insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values (VN_COUNT, '�����ʽ��ѯ', 'bankacc', 40000, '/newBankacc/redundancyAction.do?method=queryAllRedundancy', '0', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end;
/