--�޸����ڣ�2012-07-30
--�޸��ˣ�  ����
--�޸�����: �����ӱ�TB_GENERATOR��DATAEXCHANGE_ERP_TYPE_ID��Ӧ��value�����ݱ�ERP_TYPE��Ӧ
--�޸�ԭ��: ϵͳ��ʼ��ʱERP_TYPE�������������ݣ������ӱ�TB_GENERATOR��valueȴ��1��ʼ����������ʱ����
delete from TB_GENERATOR where gen_name='DATAEXCHANGE_ERP_TYPE_ID'
go
insert into TB_GENERATOR(GEN_NAME,GEN_VALUE) select 'DATAEXCHANGE_ERP_TYPE_ID',(select count(TYPE_ID)+1 from ERP_TYPE)
go