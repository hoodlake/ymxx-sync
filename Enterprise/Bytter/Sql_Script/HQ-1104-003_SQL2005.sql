--修改人：胡双
--修改日期：2012-12-31、
--修改内容：添加“结果显示正值”列，即如果为负数，则显示成默认

ALTER TABLE RPT1104_REPORT_CSS ADD NO_SHOW_MINUS CHAR(1);
--COMMENT ON COLUMN RPT1104_REPORT_CSS.NO_SHOW_MINUS IS '不显示负数，如果为负数则显示为默认值，默认显示，0或null为显示，1不显示';
