--�޸����ڣ�2012-07-30
--�޸��ˣ�  ����
--�޸�����: �����ӱ�TB_GENERATOR��DATAEXCHANGE_ERP_TYPE_ID��Ӧ��value�����ݱ�ERP_TYPE��Ӧ
--�޸�ԭ��: ϵͳ��ʼ��ʱERP_TYPE�������������ݣ������ӱ�TB_GENERATOR��valueȴ��1��ʼ����������ʱ����
delete from TB_GENERATOR where gen_name='DATAEXCHANGE_ERP_TYPE_ID';
insert into TB_GENERATOR(GEN_NAME,GEN_VALUE) values('DATAEXCHANGE_ERP_TYPE_ID',(select count(*) from ERP_TYPE)); 
commit;