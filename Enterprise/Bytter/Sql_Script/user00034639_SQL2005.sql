--修改时间2012-11-12
--修改人 andy.huang
--修改内容  冗余资金查询
DECLARE
  @VN_COUNT    int;
BEGIN

   select @VN_COUNT=max(res_code)  from BT_SYS_RES;
   IF @VN_COUNT !=0 
     insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
	values (@VN_COUNT + 1, '冗余资金查询', 'bankacc', 40000, '/newBankacc/redundancyAction.do?method=queryAllRedundancy', '0', '0', '', '0', null, '', '', '', '', '', '', null, null, null, null, null, 2, '');
end;
