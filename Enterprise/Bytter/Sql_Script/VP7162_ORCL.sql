--修改人：胡双
--修改日期：2012-11-30
--修改内容：增加菜单：承兑汇票-库存票据业务-票据拆分
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = '票据拆分' and sys_code = 'ads';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'票据拆分','ads',RES_CODE,'/AB/billSplit.do?method=toBillSplitList'
   ,'0','1','0','0',4,'','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '库存票据业务' and sys_code = 'ads';
  END IF;
  COMMIT; 
END;
/

--修改人：胡双
--修改日期：2012-12-03
--修改内容：定义票据拆分表
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'AB_RECEIVE_SPLIT';
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE AB_RECEIVE_SPLIT(ID NUMBER NOT NULL,
                                BILL_ID NUMBER,                                
                VOUCHER_NO VARCHAR2(20),
                STATUS CHAR(1) DEFAULT ''0'',
                SPLIT_DETAIL VARCHAR2(500),
				RMK          VARCHAR2(200),
				APPROVER_CODE VARCHAR2(8),
                                CONSTRAINT PK_AB_RECEIVE_SPLIT PRIMARY
                                KEY(ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column AB_RECEIVE_SPLIT.STATUS is '拆分状态：默认为 0未拆分，1已拆分';
comment on column AB_RECEIVE_SPLIT.VOUCHER_NO is '拆分凭证号';
comment on column AB_RECEIVE_SPLIT.SPLIT_DETAIL IS '拆分明细，数据格式：单位ID:金额,单位ID:金额';
comment on column AB_RECEIVE_SPLIT.RMK is '备注';
comment on column AB_RECEIVE_SPLIT.APPROVER_CODE is '操作人CODE';

--修改人：胡双
--修改日期：2012-12-03
--修改内容：增加拆分权限：拆分录入
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 4 and sys_code = 'ads';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('ads', 4, '拆分录入');
  END IF;
  COMMIT; 
END;
/

--补
alter table ab_receive add ITEM_CODE varchar2(20);