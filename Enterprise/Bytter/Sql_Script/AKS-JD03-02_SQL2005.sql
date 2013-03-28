--修改日期：20120908
--修改人：祁继鸿
--修改内容：承兑汇票与网上银行付款关联功能完善类的需求
--参数设置：增加网上银行承兑汇票付款方式
insert into fc_voucher_type (VOUCHER_TYPE, VOUCHER_NAME, SYS_VOUCHER_CODE, CASH_TRANSFER_SIGN, RMK, VALID_SIGN, IS_ELECTRON_PAY)
values ('49', '承兑汇票', '49', 'T', '', '1', '1');
go

--修改日期：20120908
--修改人：祁继鸿
--修改内容：承兑汇票与网上银行付款关联功能完善类的需求
--参数设置：增加网上银行承兑汇票付款方式
insert into bt_paytype (SYS_VOUCHER_CODE, SYS_VOUCHER_NAME, RMK, VALID_SIGN, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('49', '承兑汇票', '', '1', '', '', '', '', '', null, null, null, null, null);
go

--修改日期：20120908
--修改人：祁继鸿
--修改内容：承兑汇票与网上银行付款关联功能完善类的需求
--参数设置：增加网上银行承兑汇票付款方式
insert into bt_payment_param (ID, VOUCHER_TYPE, ISACCOUNT)
select (select max(id)+1 from bt_payment_param), '49', '0';
go

--修改日期：20120915
--修改人：祁继鸿
--修改内容：承兑汇票与网上银行付款关联功能完善类的需求
--参数设置：增加网上银行付款单票据号码字段
alter table nis_billhead add billNumber varchar(100);
go

