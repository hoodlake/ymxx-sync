--修改人：胡双
--修改日期：2012-11-26
--修改内容：增加菜单：承兑汇票-查询统计-库存票据历史余额查询统计
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = '库存票据历史余额查询统计' and sys_code = 'ads';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'库存票据历史余额查询统计','ads',RES_CODE,'/AB/billHisGather.do?method=receiveHisBalance'
   ,'0','1','0','0',4,'','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '查询统计' and sys_code = 'ads';
  END IF;
  COMMIT; 
END;
/