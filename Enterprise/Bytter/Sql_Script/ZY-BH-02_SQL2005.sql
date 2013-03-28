--修改日期：2012.11.27
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(保函申请挂预算)

--ZY-XD-06融资信息查询菜单
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM bt_param
   WHERE CODE='gua_budget_sel' AND SYS_CODE = 'grt';
  IF @VN_COUNT < 1
    BEGIN
      insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
values ('gua_budget_sel','grt','保函申请时默认选择的预算科目',null,null,null,0,'保函申请时默认选择的预算科目','说明：如不设置则默认为不挂预算',null,null,null,null,0,8,null,null,null);
    END;
END;
GO