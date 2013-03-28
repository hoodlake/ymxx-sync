-- 修改日期：20120904
-- 修改人：吴生火
--修改内容：中化工程财务公司CS自动下拨时校验关系改进需求

ALTER TABLE BT_BANK_ACC ADD APPROP_COUNTER_ACC VARCHAR(50);

--修改人:蒲勇军
--修改时间:2012-09-10
--修改内容:自动下拨是否判断内部账号余额
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('autodownall_validate', 'nis', '自动下拨是否判断内部账号余额','0', null, null, null, '', '0,否;1,是', '自动下拨是否判断内部账号余额', '', '', '', 1.00,33.00, null, null, null);

go

