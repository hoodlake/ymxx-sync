--修改日期：2012.12.05
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(抵质押物登记脚本修改)
--所属区域
alter table GUA_MORTGAGE_INFO add AREA_CORP_NAME varchar(50);
--合作经办银行
alter table GUA_MORTGAGE_INFO add coorperation_bank_name varchar(100);
--银行角色
alter table GUA_MORTGAGE_INFO add bank_role varchar(100);
--是否占用银行授信
alter table GUA_MORTGAGE_INFO add occupy_bank_credit char(1);
--业务操作地区--省
alter table GUA_MORTGAGE_INFO add province varchar(50);
--业务操作地区--市
alter table GUA_MORTGAGE_INFO add city varchar(50);
--等级
alter table GUA_MORTGAGE_INFO add level_code varchar(50);
--规格
alter table GUA_MORTGAGE_INFO add specification varchar(100);
--抵押货物值与客户实际占用的授信额度比例关系
alter table GUA_MORTGAGE_INFO add occupy_credit_relation varchar(50);
--质押监管合同中客户与银行约定的授信额度总额
alter table GUA_MORTGAGE_INFO add occupy_credit_money NUMERIC(9,2);
--客户已占用的银行授信额度百分比
alter table GUA_MORTGAGE_INFO add occupy_credit_proportion NUMERIC(8,6);
--提醒级别
alter table GUA_MORTGAGE_INFO add alert_level char(1);

GO