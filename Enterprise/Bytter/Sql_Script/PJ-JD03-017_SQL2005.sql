--修改人：胡双
--修改日期：2012-08-02
--修改内容1：新增“票据锁定/解锁”菜单项
--修改内容2：表AB_RECEIVE新增“IS_LOCK”字段
--修改原因：PJ-JD03-017(库存票据业务新增“票据是否锁定”，需控制票据的锁定及解锁)

--新增“票据锁定/解锁”菜单项
INSERT INTO BT_SYS_RES
(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),'票据锁定/解锁','ads',164,'/AB/lockUnlock.do?method=toList','0','1','0','0','14','2'
go

--添加是否锁定字段
--IS_LOCK为NULL或0都代表解锁状态，1代表锁定状态
ALTER TABLE AB_RECEIVE ADD IS_LOCK CHAR(1)
go

