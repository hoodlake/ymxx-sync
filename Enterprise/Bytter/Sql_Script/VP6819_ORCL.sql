--�޸����ڣ�20121129
--�޸���lishc
--�޸����ݣ�������ͬ����  ������ҵ û�йҵ���
-- Add/modify columns 
alter table CMS_LOAN_INFO add guarantee_Contract varchar2(20);
-- Add comments to the columns 
comment on column CMS_LOAN_INFO.guarantee_Contract
  is '
������ͬ����    ������ҵ';