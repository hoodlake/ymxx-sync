
--修改日期：20121205
--修改人：吴生火
--修改内容：增加记账主表付息凭证字段
--参数设置：
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    from syscolumns a inner join sysobjects b on a.id=b.id where b.name= 'fc_accbook' and a.name='interest_charge';
  IF @VN_COUNT < 1 
     alter table fc_accbook add interest_charge varchar(1)  ;
     alter table fc_accbook_blned  add interest_charge varchar(1) ;
     alter table fc_pre_accbook add interest_charge varchar(1) 
END;
go