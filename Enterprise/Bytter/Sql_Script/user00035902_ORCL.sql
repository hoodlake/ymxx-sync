--�����ˣ����� 
--�޸����ڣ�2012-12-06
--�޸�����: ���������޸�ҳ�����ӷ�����Ϣ��
--�޸�ԭ��:����WY-YC1-006

ALTER TABLE nis_wage ADD(returnMsg  varchar2(240)); 
comment on column nis_wage.returnMsg
  is '������Ϣ';
  commit;