

--指令表添加指令来源字段
-- Add/modify columns 
alter table BIS_EXC add VOUCHER_FROM number(2,0);
-- Add comments to the columns 
comment on column BIS_EXC.VOUCHER_FROM
  is '1——来自下拨
2——来自头寸调拨
3——来自上划
4——来自请款
5——来自付款
6——来自柜台手工记账';


-- Add/modify columns 
--添加打回状态字段
alter table NIS_BILLHEAD add REFUSE_STATUS number;
--添加指令交易状态字段
alter table NIS_BILLHEAD add VOUCHER_STAT char(1);
-- Add comments to the columns 
comment on column NIS_BILLHEAD.REFUSE_STATUS
  is '1-记账打回
2-审批打回
3-指令打回';
comment on column NIS_BILLHEAD.VOUCHER_STAT
  is '该字段为付款指令状态
交易成功  0
等待结果  1
银行处理失败  2
准备发送 3
银行已接受 4
收付款数据不全 5
等待补充数据 6
指令无效 7
已打印支票 8
接口处理失败 9
审批通过 p
待审批 w
审批打回  R
补录打回 B';