
--�޸���:���¾�
--�޸�ʱ��:2012-09-19
--�����Ӧ�ֶ�
alter table FBS_CORP_ITEM  add ITEM_PERCENT        numeric(5,2);
alter table FBS_CORP_ITEM  add RELATE_ITEMCODE     VARCHAR(200);
alter table FBS_CORP_ITEM  add CORRESPOND_ITEMCODE VARCHAR(200);
alter table FBS_CORP_ITEM  add IS_MUST_ITEM        VARCHAR(1);


