--�޸����� 2012-11-14
--�޸��� ���
--�޸����� ��GSFZYS���ZWFZYS_JE�ֶ�������float(8)�ĳ�number(15,2)
update GSFZYS set ZWFZYS_JE=NULL;
alter table GSFZYS modify ZWFZYS_JE number(15,2);
commit;



