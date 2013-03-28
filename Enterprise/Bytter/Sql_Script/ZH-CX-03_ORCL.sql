--日期：2012-12-13
--创建人：黄盈
--创建内容：银行账户收支情况表菜单

DECLARE
  VN_COUNT    NUMBER;
  vn_father_code NUMBER;
  vn_res_order NUMBER;
  vn_sys_code varchar2(22) :='fqs';
  vn_father_res_name varchar2(50) :='银行数据报表';
  vn_res_name varchar2(50) :='银行账户收支情况表';
  vn_res_url varchar2(200) :='/aqs/queryBankRecPay.jsp';
BEGIN
  SELECT COUNT(*) INTO VN_COUNT from bt_sys_res  where res_name = vn_res_name and sys_code = vn_sys_code;
  select max(res_order)+1 into vn_res_order  from bt_sys_res where sys_code = vn_sys_code;
  select res_code into vn_father_code from bt_sys_res where res_name=vn_father_res_name and sys_code = vn_sys_code;
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4,REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL)
   values((select max(res_code) + 1 from bt_sys_res), vn_res_name, vn_sys_code, vn_father_code, vn_res_url,'0', '1', '0', '0', vn_res_order,vn_res_name ,'', '', '', '', '', null, null, null, null, null, 2);
  END IF;
  COMMIT; 
END;
/