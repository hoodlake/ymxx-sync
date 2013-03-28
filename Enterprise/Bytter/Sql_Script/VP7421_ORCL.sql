--修改日期：2012.12.25
--修改人：李程
--修改内容：奥克斯，凭证模板定义分配，菜单
--修改原因：vp7421,添加菜单"凭证模板定义分配"

DECLARE
  N_COUNT NUMBER;
BEGIN
  SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='exchange' and t.res_name='凭证模板基础数据维护';  
  IF N_COUNT < 1 THEN
  insert into BT_SYS_RES (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL)
      select (select max(RES_CODE) + 1 from bt_sys_res),'凭证模板基础数据维护','exchange',res_code,'/netbank/ErpVoucherTemplate.do?method=doList'||'&'||'corpCode=-1','0','1','0','0',6,null,null,null,null,null,null,null,null,null,null,null,2
  from bt_sys_res
   where res_name = '数据处理'
   and sys_code='exchange';
    END IF;
END;
/

COMMIT;
