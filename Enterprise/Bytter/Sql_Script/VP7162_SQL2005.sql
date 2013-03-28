--修改人：胡双
--修改日期：2012-11-30
--修改内容：增加菜单：承兑汇票-库存票据业务-票据拆分
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
     from bt_sys_res  where res_name = '票据拆分' and sys_code = 'ads';
  IF @VN_COUNT < 1
    BEGIN
     insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'票据拆分','ads',RES_CODE,'/AB/billSplit.do?method=toBillSplitList'
   ,'0','1','0','0',4,'','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '库存票据业务' and sys_code = 'ads';
    END;
END;
GO

--修改人：胡双
--修改日期：2012-12-03
--修改内容：定义票据拆分表
CREATE TABLE AB_RECEIVE_SPLIT(
 ID            INT NOT NULL,
 BILL_ID       INT,                                
 VOUCHER_NO    VARCHAR(20),
 STATUS        CHAR(1) DEFAULT '0',
 SPLIT_DETAIL  VARCHAR(500),
 RMK           VARCHAR(200),
 APPROVER_CODE VARCHAR(8),
 CONSTRAINT PK_AB_RECEIVE_SPLIT PRIMARY
 KEY(ID));
GO

--修改人：胡双
--修改日期：2012-12-03
--修改内容：增加拆分权限：拆分录入
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from BT_SYS_OPERATION  where OP_TYPE = 4 and sys_code = 'ads';
  IF @VN_COUNT < 1
  BEGIN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('ads', 4, '拆分录入');
  END;
END;
GO

--补
alter table ab_receive add ITEM_CODE varchar(20);
GO