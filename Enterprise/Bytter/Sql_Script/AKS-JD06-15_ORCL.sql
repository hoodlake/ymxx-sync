


--修改人:蒲勇军
--修改时间:2012-09-19
--添加相应字段
alter table FBS_CORP_ITEM  add ITEM_PERCENT        NUMBER(5,2);
alter table FBS_CORP_ITEM  add RELATE_ITEMCODE     VARCHAR2(200);
alter table FBS_CORP_ITEM  add CORRESPOND_ITEMCODE VARCHAR2(200);
alter table FBS_CORP_ITEM  add IS_MUST_ITEM        VARCHAR2(1);

comment on column FBS_CORP_ITEM.ITEM_PERCENT  is '收支比例';
comment on column FBS_CORP_ITEM.RELATE_ITEMCODE  is '相应科目';
comment on column FBS_CORP_ITEM.CORRESPOND_ITEMCODE  is '对应科目';
comment on column FBS_CORP_ITEM.IS_MUST_ITEM  is '是否刚性科目 1是 否则其他';




