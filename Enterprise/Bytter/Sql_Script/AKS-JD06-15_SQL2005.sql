
--修改人:蒲勇军
--修改时间:2012-09-19
--添加相应字段
alter table FBS_CORP_ITEM  add ITEM_PERCENT        numeric(5,2);
alter table FBS_CORP_ITEM  add RELATE_ITEMCODE     VARCHAR(200);
alter table FBS_CORP_ITEM  add CORRESPOND_ITEMCODE VARCHAR(200);
alter table FBS_CORP_ITEM  add IS_MUST_ITEM        VARCHAR(1);


