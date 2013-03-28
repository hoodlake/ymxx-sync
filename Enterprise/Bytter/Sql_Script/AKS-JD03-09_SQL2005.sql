-- 修改日期：20120907
-- 修改原因：增加对内自开、对外自开功能 
-- 修改人： 邹仁斌
--更新汇票表增加字段open_flag
--说明 ， open_flag=1表示对内 ,open_flag=2表示对外 
alter table ab_emit add open_flag char(1)
GO
