-- �޸����ڣ�20121210
-- �޸��ˣ�������
--�޸����ݣ��ſ�ֳɶ��ں��г���

declare 
 @max_id_cs20121210 int;
 begin
    select @max_id_cs20121210=count(*) from fc_subject_sort where SYS_SUBJECT_CODE='1038';
    if @max_id_cs20121210=0  
		begin
        insert into fc_subject_sort (SYS_SUBJECT_CODE, SYS_SUBJECT_NAME, IF_UNIQUE, RMK)
        values ('1038', 'Ӧ����Ϣ-�г��ڷſ�', '1', '�ʲ���');

        insert into fc_subject_sort (SYS_SUBJECT_CODE, SYS_SUBJECT_NAME, IF_UNIQUE, RMK)
        values ('5015', '��Ϣ����-�г��ڷſ�', '1', '������');
        end 
end 
go