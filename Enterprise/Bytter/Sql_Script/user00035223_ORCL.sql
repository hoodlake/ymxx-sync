--�޸��ˣ���֮��
--�޸����ڣ�  2012-11-26
--�޸�����: fbs_corp_item���Ԥ�����ڱ���
--�޸�ԭ��: �ײ���Ԥ����������

alter table fbs_corp_item add priorPeriod_Budget_Rate number(5,2);  
comment on column fbs_corp_item.priorPeriod_Budget_Rate is '���Ԥ�����ڱ���'; 
   
commit;