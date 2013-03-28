--修改人:陈春燕
--修改时间:2012-11-26
--修改内容:VP7503-7504新增“企业及中心汇总表（银行）”，功能
--新增：综合查询系统>>现金及承兑汇票汇总表>>企业及中心汇总表（银行） 菜单
---------------新增财务公司会计科目管理菜单
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
  FROM BT_SYS_RES
  WHERE SYS_CODE= 'fqs'
   and RES_NAME = '企业及中心汇总表（银行）'
   and RES_URL = '/monitor/collectEcSearch.jsp';
  IF @VN_COUNT < 1
    BEGIN
       insert into BT_SYS_RES
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
         '企业及中心汇总表（银行）',
         'fqs',
         RES_CODE,
         '/monitor/collectEcSearch.jsp',
         '0',
         '1',
         '0',
         '0',
         5,
         '企业及中心汇总表（银行）',
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
         3,
         ''
    from bt_sys_res
   where res_name = '现金及承兑汇票汇总表' and sys_code='fqs';
    END;
END;
GO

