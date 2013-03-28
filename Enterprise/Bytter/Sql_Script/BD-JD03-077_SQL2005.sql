
--修改人:蒲勇军
--修改时间:2012-10-24 17:04:26
--修改内容:添加资金预警查询菜单 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE)+1 from bt_sys_res ), '资金预警查询', 'fwg', (select res_code from bt_sys_res  where res_name='预警展示处理' and sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryWarningAll', '0', '1', '0', '0', 9, '', '', '', '', '', '', null, null, null, null, null, 2, ''
GO



--修改日期：2012.10.25
--修改人：周兵
--修改内容：增加摘要预警三个字段，(zhaiyao_operator 中1为‘且’，2为‘或’；operator2中3为‘包含’，4为‘不包含’；warning_rmk2为内容。
--修改原因：在摘要预警中需要多加入是否包含这一条件

alter table bt_warning_strategy_detail add zhaiyao_operator varchar(1)
alter table bt_warning_strategy_detail add operator2 varchar(1)
alter table bt_warning_strategy_detail add warning_rmk2 varchar(200)
go



--修改日期：2012.10.26
--修改人：刘之三
--修改内容：增加预警展示中十一个表的一个字段，(remark 备注)
--修改原因：预警查询时，如果将预警状态进行更改，需要进行备注说明。

alter table bt_warning_cash add remark varchar(200);
alter table bt_warning_bal add remark varchar(200);
alter table bt_warning_payee add remark varchar(200);
alter table bt_warning_largepay add remark varchar(200);
alter table bt_warning_overflow add remark varchar(200);
alter table bt_warning_balancedown add remark varchar(200);
alter table bt_warning_dtlrmk add remark varchar(200);
alter table bt_warning_outpay add remark varchar(200);
alter table bt_warning_dezjzc add remark varchar(200);
alter table bt_warning_swyzsb add remark varchar(200);
alter table bt_warning_zchlr add remark varchar(200);
go


--修改日期：2012.10.30
--修改人：周兵
--修改内容： 账户余额持续下降预警信息,增加 上4月末(last_four_month_end),上4月平均(last_four_month_ave),上5月末(last_five_month_end),上5月平均(last_five_month_ave)
--修改原因：在账户余额持续下降预警信息，原需求为不论一级、二级、三级预警都是扫描最近四个月。而现在改为一级预警扫描最近两个个月，二级预警扫描最近四个月，三级预警扫描最近六个月

alter table bt_warning_balancedown add last_four_month_end decimal(15,2);
alter table bt_warning_balancedown add last_four_month_ave decimal(15,2);
alter table bt_warning_balancedown add last_five_month_end decimal(15,2);
alter table bt_warning_balancedown add last_five_month_ave decimal(15,2);
go

--修改日期：2012.11.01
--修改人：周兵
--修改内容： 增加预警限额说明
--修改原因：以前的为strategy_money，现在改为一段字符串，显示在某个数值之间。如1<且>2等.并且把strategy_money的值放入strategy_detail_str
alter table bt_warning_bal add strategy_detail_str varchar(40);
alter table bt_warning_cash add strategy_detail_str varchar(40);
alter table bt_warning_payee add strategy_detail_str varchar(40);
alter table bt_warning_largepay add strategy_detail_str varchar(40);
go
update bt_warning_bal set strategy_detail_str=strategy_money where strategy_detail_str is null;
update bt_warning_cash set strategy_detail_str=strategy_money where strategy_detail_str is null;
update bt_warning_payee set strategy_detail_str=strategy_money where strategy_detail_str is null;
update bt_warning_largepay set strategy_detail_str=strategy_money where strategy_detail_str is null;
go