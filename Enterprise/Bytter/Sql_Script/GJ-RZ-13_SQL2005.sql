update bt_param set name='启用信贷台账管理' where code='is_charging'
go
 
 delete from bt_sys_res where RES_NAME='贷款台账管理' and sys_code='cms' and RES_LEVEL=1
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款台账管理', 'cms', 0, '', '0', '1', '0', '0', 0, '', '', '', '', '', '', null, null, null, null, null, 1, ''
 go
 
 delete from bt_sys_res where RES_NAME='贷款申请录入' and sys_code='cms' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款申请录入', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=1', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='贷款合同生成' and sys_code='cms' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款合同生成', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/LoanPreview.jsp?view_type=8', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='贷款发放' and sys_code='cms' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms')
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款发放', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/LoanSendOutPreview.jsp', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='贷款台帐' and sys_code='cms' and RES_LEVEL=2
 go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款台帐', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/cmsLoanBill.do?method=toList', '0', '1', '0', '0', 4, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='贷款减免' and sys_code='cms' and RES_LEVEL=2
 go
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款减免', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/cmsLoanAnnul.do?method=initQuery', '0', '1', '0', '0', 5, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 
 delete from bt_sys_res where RES_NAME='贷款还款台账' and sys_code='cms' and RES_LEVEL=2
 go
  insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款还款台账', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/cmsLoanRepay.do?method=initQuery', '0', '1', '0', '0', 6, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
  delete from bt_sys_res where RES_NAME='贷款合同设置' and sys_code='cms' and RES_LEVEL=2  and father_code=(select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms')
  go
 insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '贷款合同设置', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '/cms/ContractManage.jsp?li_code=0&opflag=1', '0', '1', '0', '0', 8, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='资金占用费' and sys_code='cms' and RES_LEVEL=2
 go
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '资金占用费', 'cms', (select res_code from bt_sys_res where res_name='贷款台账管理' and sys_code='cms'), '', '0', '1', '0', '0', 7, '', '', '', '', '', '', null, null, null, null, null, 2, ''
 go
 
 delete from bt_sys_res where RES_NAME='计费' and sys_code='cms' and RES_LEVEL=3
 go
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '计费', 'cms', (select res_code from bt_sys_res where res_name='资金占用费' and sys_code='cms'), '/cms/billing.do?method=toList', '0', '1', '0', '0', 1, '', '', '', '', '', '', null, null, null, null, null, 3, ''
 go
 
 delete from bt_sys_res where RES_NAME='核算占用费' and sys_code='cms' and RES_LEVEL=3
 go
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '核算占用费', 'cms', (select res_code from bt_sys_res where res_name='资金占用费' and sys_code='cms'), '/cms/accountingFee.do?method=toList', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 3, ''
 go
 
 delete from bt_sys_res where RES_NAME='缴费记录' and sys_code='cms' and RES_LEVEL=3
 go
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
 select (select max(res_code) + 1 from bt_sys_res), '缴费记录', 'cms', (select res_code from bt_sys_res where res_name='资金占用费' and sys_code='cms'), '/cms/cmsPaymentRecord.do?method=toList', '0', '1', '0', '0', 3, '', '', '', '', '', '', null, null, null, null, null, 3, ''
 go
