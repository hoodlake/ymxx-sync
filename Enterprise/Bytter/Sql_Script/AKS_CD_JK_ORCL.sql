--�޸����ڣ�2012.11.15
--�޸��ˣ�����
--�޸����ݣ��жһ�Ʊ�ӿ�
--�޸�ԭ�������ֶ�
--��bt_external_corp���������ֶ�
ALTER TABLE bt_external_corp ADD (sourceSystem VARCHAR2(10));
COMMENT ON COLUMN bt_external_corp.sourceSystem IS '��Դϵͳ';

ALTER TABLE bt_external_corp ADD (customeStatus number);
COMMENT ON COLUMN bt_external_corp.customeStatus IS '�ͻ�״̬';

--��ERP_MIDDLE_SYSTEM_DATABASE���������ֶ�
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD (relevanceERP VARCHAR2(10));
COMMENT ON COLUMN ERP_MIDDLE_SYSTEM_DATABASE.relevanceERP IS '����ERPϵͳ';


