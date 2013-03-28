--修改人：胡双
--修改日期：2012-08-29
--修改原因：VP6436要求网点用户可以对某单位的承兑汇票月对账
--          功能进行操作，但却没有相应菜单下其他菜单项的权限
--修改内容：添加新的操作类型：月对账
INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('ads', 6, '月对账');
--修改时间：2012-08-30
--修改原因：有用户反馈背书申请、托收、贴现到账等菜单项查询变慢
--修改内容：创建一个索引,为了提高查询效率
CREATE INDEX IDX_AB_OPERATION_BILL_ID ON AB_OPERATION (BILL_TYPE,BILL_ID);
