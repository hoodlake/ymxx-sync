


--�޸���:���¾�
--�޸�ʱ��:2012-09-19
--�����Ӧ�ֶ�
alter table FBS_CORP_ITEM  add ITEM_PERCENT        NUMBER(5,2);
alter table FBS_CORP_ITEM  add RELATE_ITEMCODE     VARCHAR2(200);
alter table FBS_CORP_ITEM  add CORRESPOND_ITEMCODE VARCHAR2(200);
alter table FBS_CORP_ITEM  add IS_MUST_ITEM        VARCHAR2(1);

comment on column FBS_CORP_ITEM.ITEM_PERCENT  is '��֧����';
comment on column FBS_CORP_ITEM.RELATE_ITEMCODE  is '��Ӧ��Ŀ';
comment on column FBS_CORP_ITEM.CORRESPOND_ITEMCODE  is '��Ӧ��Ŀ';
comment on column FBS_CORP_ITEM.IS_MUST_ITEM  is '�Ƿ���Կ�Ŀ 1�� ��������';




