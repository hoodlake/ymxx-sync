--修改日期：2012.01.06
--修改人：黄学安
--修改内容：修改综合查询-信贷报表借款汇总表和贷款汇总表连接
--修改原因：综合查询和信贷管理中的查询不统一
update bt_sys_res  set res_url='/aqs/LoanBalanceCollect.jsp?isLoan=false' where res_name='借款汇总表' and sys_code='fqs';
update bt_sys_res  set res_url='/aqs/LoanBalanceCollect.jsp?isLoan=true' where res_name='贷款汇总表' and sys_code='fqs';
go