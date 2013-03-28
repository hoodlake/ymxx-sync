--修改日期：2012.8.14
--修改人：黄茜
--修改内容：erp接口业务表和付款表都新增字段allow_edit_paymoney
--修改原因：VP单：5997深圳科士达2012062901---从ERP转移过来的付款信息金额可修改

--付款金额是否可以编辑 0，不可编辑；1，可编辑； 默认为0
alter table erp_pay_info add allow_edit_paymoney char(1) default '0';

--付款金额是否可以编辑 0，不可编辑；1，可编辑； 默认为0
alter table nis_billhead add allow_edit_paymoney char(1);

--字段长度太短，修改为100个字符
alter table erp_pay_info alter column bank_name varchar(100);
