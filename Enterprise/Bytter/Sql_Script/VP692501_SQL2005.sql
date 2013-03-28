--修改日期：20121103
--修改人：  余川锋
--更改菜单银行实时余额名称
update bt_sys_res set res_name='银行实时余额及当日明细查询' where res_name='银行实时余额' and res_url='/aqs/bankAccRTBal.do?method=toQuery' and sys_code='fqs' and res_level=2
GO