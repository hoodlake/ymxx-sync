--�޸����ڣ�2013-01-09
--�޸��ˣ���ѧ��
--�޸����ݣ�����Ԥ����Ϣ
-- Add/modify columns 
alter table CMS_PROVIDE_LOAN_INFO add antic_interest NUMBER(15,2);
-- Add comments to the columns 
comment on column CMS_PROVIDE_LOAN_INFO.antic_interest
  is 'Ԥ����Ϣ';
