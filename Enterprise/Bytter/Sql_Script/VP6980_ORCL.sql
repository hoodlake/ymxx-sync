-- 修改日期：2013-01-14
-- 修改人：刘勇
--修改内容：VP6980 一品红 离线付款数据转移需求
--增加菜单 离线付款数据转移
DECLARE
  VN_COUNT    NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO VN_COUNT
      FROM bt_sys_res
      WHERE RES_NAME ='离线付款数据转移';
      IF VN_COUNT = 0 THEN
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values ((select max(res_code) + 1 from bt_sys_res), '离线付款数据转移', 'exchange', (select res_code from bt_sys_res where res_name='数据管理'), '/dataExchange/erpPayInfo.do?method=showDeliver'||chr(38)||'sys_flag=offLine', '0', '1', '0', '0', 1, '离线付款数据转移', '', '', '', '', '', null, null, null, null, null, 2, '');
end if;
end;
/


--增加数据交换是否处理离线账号数据参数

DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
    WHERE code ='dataProcessOffLine';
    IF VN_COUNT = 0 THEN
insert into bt_param
       (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
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
       REVERSE10) values (
       'dataProcessOffLine','nis','数据交换是否处理离线账户数据','0',null,null,0,'数据交换是否处理离线账户数据,默认0','0,不处理;1,处理',null,null,null,null,1,null,null,null,null);
end if;
end;
/

commit;