
--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  ��������ݱ��������ֶδ�������
ALTER TABLE CMS_LOAN_INFO ADD(LOAN_GENRE varchar2(1)); 
comment on column CMS_LOAN_INFO.LOAN_GENRE
  is '�������ͣ�1�������ʽ����     2��Ʊ�ݽ��';

--��ʷ�����¼���������ֶ�ֵĬ�ϸ�ֵΪ�����ʽ����
update CMS_LOAN_INFO set LOAN_GENRE = 1;
 
--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  ����Ʊ�ݱ��������ֶ�
ALTER TABLE AB_RECEIVE ADD(LOAN_REPAY_BILL_CODE  varchar2(13)); 
comment on column AB_RECEIVE.LOAN_REPAY_BILL_CODE
  is '�������е�����';

 --�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸����� ����� 
ALTER TABLE CMS_LOAN_REPAY ADD(PAY_TYPE  varchar2(1)); 
comment on column CMS_LOAN_REPAY.PAY_TYPE
  is '֧����ʽ   1:�ֻ�֧��   2:Ʊ��֧��';
  commit;