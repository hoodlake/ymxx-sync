--�޸����ڣ�2012.11.15
--�޸��ˣ�����
--�޸����ݣ��жһ�Ʊ�ӿ�
--�޸�ԭ�������ֶ�
--��bt_external_corp���������ֶ�
ALTER TABLE bt_external_corp ADD sourceSystem VARCHAR(10);

ALTER TABLE bt_external_corp ADD customeStatus int;

--��ERP_MIDDLE_SYSTEM_DATABASE���������ֶ�
ALTER table ERP_MIDDLE_SYSTEM_DATABASE ADD relevanceERP VARCHAR(10);


