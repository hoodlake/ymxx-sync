--修改日期：2012.11.15
--修改人：刘勇
--修改内容：承兑汇票接口
--修改原因：新增字段
--在bt_external_corp表中新增字段
ALTER TABLE bt_external_corp ADD (sourceSystem VARCHAR2(10));
COMMENT ON COLUMN bt_external_corp.sourceSystem IS '来源系统';

ALTER TABLE bt_external_corp ADD (customeStatus number);
COMMENT ON COLUMN bt_external_corp.customeStatus IS '客户状态';

--在ERP_MIDDLE_SYSTEM_DATABASE表中新增字段
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD (relevanceERP VARCHAR2(10));
COMMENT ON COLUMN ERP_MIDDLE_SYSTEM_DATABASE.relevanceERP IS '关联ERP系统';


