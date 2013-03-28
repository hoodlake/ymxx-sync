--创建人：费滔 
--修改日期：2012-12-06
--修改内容: 代发工资修改页面增加返回信息列
--修改原因:需求：WY-YC1-006

ALTER TABLE nis_wage ADD(returnMsg  varchar2(240)); 
comment on column nis_wage.returnMsg
  is '返回信息';
  commit;