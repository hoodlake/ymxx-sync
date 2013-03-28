--修改日期：20120927
--修改人：张新宝
--修改内容：新增项目档案表3列“是否结算、所属分类码、所属分类名称”
--修改原因：vp6714诚通用友借口需求变更
alter table u8_projectFiles add  is_clearing VARCHAR2(10);
alter table u8_projectFiles add  classification_code VARCHAR2(10);
alter table u8_projectFiles add  classification_name VARCHAR2(50);