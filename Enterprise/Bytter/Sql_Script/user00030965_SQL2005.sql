--修改日期：20120813
--修改人：祁继鸿
--修改内容：更新付款方式表，插入代发工资
--参数设置：
--工资单制单
insert into fc_voucher_type
  (VOUCHER_TYPE,
   VOUCHER_NAME,
   SYS_VOUCHER_CODE,
   CASH_TRANSFER_SIGN,
   RMK,
   VALID_SIGN,
   IS_ELECTRON_PAY)
values
  ('48', '代发工资', '48', 'T', '', '1', '1');
  
commit;
