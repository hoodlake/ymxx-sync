--修改日期：2012.11.15
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(ZY-WD-03-01)
--是否银行办理
alter table cms_precative_loan_info add is_bank char(1) default '0';
--委托申请单号
alter table cms_precative_loan_info add app_code varchar(20);
--银行代码
alter table cms_precative_loan_info add bank_code char(4);
--担保合同编码
alter table cms_precative_loan_info add gua_hypothec_code varchar(50);
--还款方式
alter table cms_precative_loan_info add repay_type varchar(30);
--计息方式
alter table cms_precative_loan_info add interest_way varchar(15);
--贷款发放方式
alter table cms_precative_loan_info add loan_send_out_type varchar(1);
--跳过贷款发放功能
alter table cms_precative_loan_info add skip_loan_send_out varchar(1);
--浮动方式
alter table cms_precative_loan_info add float_way varchar(15);
--利率调整生效日期
alter table cms_precative_loan_info add rate_entries_effect_date DATETIME;
--浮动利率
alter table cms_precative_loan_info add reference_rate_type varchar(50);
--贷款周期
alter table cms_precative_loan_info add repay_cycle varchar(50);
--下拉选择点数或比例
alter table cms_precative_loan_info add points_proportion_select varchar(50);
--输入框维护贷款合同规定的点数或比例
alter table cms_precative_loan_info add points_proportion_text varchar(50);

go