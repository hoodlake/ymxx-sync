--修改日期：2012.11.29
--修改人：黄茜
--修改内容：erp接口业务表和付款表都新增字段allow_edit_paytype
--修改原因：VP单：[VP7224]修改录入单据无法编辑OA传递到资金系统数据的付款方式问题

--付款方式是否可以编辑 0，不可编辑；1，可编辑； 默认为0
alter table erp_pay_info add allow_edit_paytype char(1) default '0';

--付款方式是否可以编辑 0，不可编辑；1，可编辑； 默认为0
alter table nis_billhead add allow_edit_paytype char(1);
