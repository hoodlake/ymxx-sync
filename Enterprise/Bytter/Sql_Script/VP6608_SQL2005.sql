
--�޸����ڣ�20121205
--�޸��ˣ�������
--�޸����ݣ����Ӽ�������Ϣƾ֤�ֶ�
--�������ã�
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