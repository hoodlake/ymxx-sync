--修改人：吴生火
--修改日期：2012-10-17
--修改内容: vp6789生成电子回单取系统科目or维护科目

 
insert into fc_param ( PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
values ('sys_fc_subject', '生成电子回单取系统科目or维护科目', '0', '0为取系统科目1为取维护科目', '', '', '');
go
