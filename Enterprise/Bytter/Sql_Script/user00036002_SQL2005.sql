--�޸�����:����Ѻ��Ǽ������ֶ�
--�޸���:����
--�޸�ʱ��:2012-12-07
--�۾���
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('GUA_MORTGAGE_INFO') AND NAME='DEPRECIATION_RATE')  
alter table gua_mortgage_info add depreciation_rate NUMERIC(8,6); 
GO

