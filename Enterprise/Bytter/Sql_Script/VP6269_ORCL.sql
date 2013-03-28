--修改人:浦勇军
--修改时间:2012-08-17
--修改内容:资金调拨是否由资金下拨单生成指令 默认不生成付款指令
insert into bt_param (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10)
values ('allocation_createbisexc', 'fcs', '是否由资金下拨单生成指令','0', null, null, null, '资金调拨生成付款指令生成参数，包括下拨,请款，头寸调拨几个功能', '1,是;0,否', '', '', '', '', 1.00,32.00, null, null, null);
---修改资金调拨参数
---add by puyj 2012-09-03 16:35:57
update bt_param p set p.sys_code = 'nis',
p.reverse1 = '0,否;1,先记账后付款;2,先付款后记账',
p.param_value1 = (
  select case p2.param_value1  when  '0' then '1'
                               when  '1' then '0'
         end 
  from bt_param p2  where p2.code = 'allocation_instructions'
)
where p.code = 'allocation_instructions';

delete from bt_param p where p.code = 'allocation_createbisexc' and p.sys_code = 'fcs';
commit;
