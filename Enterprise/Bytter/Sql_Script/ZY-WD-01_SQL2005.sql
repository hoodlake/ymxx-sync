--修改日期：2012-11-09
--修改人：黄茜
--修改内容：增加参数，信贷业务挂接预算系统；委贷项目、银行借款需要预设预算科目
--修改原因：中远——ZY-WD-01

--银行借款业务选择的预算科目
insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
       values ('bankloan_budget_sel','cms','银行借款业务选择的预算科目',null,null,null,0,'银行借款业务选择的预算科目','说明：如不设置则默认为不挂预算',null,null,null,null,0,25,null,null,null);
--委托贷款业务选择的预算科目
insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
       values ('wtloan_budget_sel','cms','委托贷款业务选择的预算科目',null,null,null,0,'银行借款业务选择的预算科目','说明：如不设置则默认为不挂预算',null,null,null,null,0,25,null,null,null);
--企业贷款业务选择的预算科目
insert into bt_param(CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_VALUE2, PARAM_VALUE3, PARAM_TYPE, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10) 
       values ('qyloan_budget_sel','cms','企业贷款业务选择的预算科目',null,null,null,0,'银行借款业务选择的预算科目','说明：如不设置则默认为不挂预算',null,null,null,null,0,25,null,null,null);

go
