--修改人：胡双
--修改日期：2012-08-07
--修改内容1：新增“承兑汇票月对账”菜单
--修改内容2：新增表"MONTH_RECONCILE" 承兑汇票月对账功能需要用到
--修改原因：新增功能月对账须存储对账状态

--新增“承兑汇票月对账”菜单
INSERT INTO BT_SYS_RES
(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),'承兑汇票月对账','ads',151,'/AB/monthReconci.do?method=treeView','0','1','0','0','10','2'
go

--新增表"MONTH_RECONCILE" 承兑汇票月对账功能需要用到
CREATE TABLE MONTH_RECONCILE(
       ID          NUMERIC(28) NOT NULL , --主键
       CORP_ID     NUMERIC(10)          , --单位ID
       YEAR        NUMERIC(4)           , --年份           
       MONTH       NUMERIC(2)           , --月份
       START_DATE  DATETIME                , --对账开始日期
       END_DATE    DATETIME                , --对账结束日期
       STATUS      NUMERIC              , --对账状态
       CONSTRAINT PK_MONTH_RECONCILE PRIMARY KEY (ID)
)
go
