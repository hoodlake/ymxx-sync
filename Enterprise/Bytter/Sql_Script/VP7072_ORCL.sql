--修改日期：20121130
--修改人lishc
--修改内容：表外记账 改名字
-- Add/modify columns 
update  bt_sys  bsy  set bsy.sys_name='表外账务',bsy.rmk='表外账务' where bsy.sys_name='表外帐务';
commit
/