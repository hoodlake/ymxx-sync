--修改人 田进
--修改时间 2012-08-06
--修改内容 增加yph_ab_receive表和票据应收菜单
--修改原因 一品红承兑汇票需求
create table yph_ab_receive
(
       state varchar(4000),--单据类型
       dept_code varchar(240),--开票单位/持票集团
       code varchar(150),--票据号码
       money number(15,2),--票面金额
       issue_date varchar(10),--出票日期
       maturity_date varchar(10),--到票日期
       acceptor varchar(720),--开户行/付款行名称（承兑人）
       payer varchar(150),--出票人
       pre_hand varchar(360),--前手
       receiver varchar(4000),--收款人全称（后手）
       enter_date varchar(10),--收票日期
       poundage number(15,2),--手续费
       ball varchar(150),--保证金
       resume varchar(2000),--摘要
       oper_date varchar(4000),--处理日期
       bank_acc varchar(100),--托收/贴现账户
       bank_acc_num varchar(30),--托收/贴现账号
       bank varchar(720),--托收/贴现开户行
       xie_meeting varchar(1),--是否解汇
       create_date varchar(19),--创建日期
       last_update_date varchar(19),--最后一次更新日期
       primary key(code,state)
);

insert into BT_SYS_RES (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
select (select max(RES_CODE) + 1 from bt_sys_res), '票据应收', 'exchange', RES_CODE, '/dataExchange/yphAbReceiveAction.do?method=queryList', '0', '0', '0', '0', 1, null, null, null, null, null, null, null, null, null, null, null, 2, '' from bt_sys_res where res_name = '数据管理';


alter table ab_emit add Data_source char(3);
alter table ab_emit add Update_date date;
