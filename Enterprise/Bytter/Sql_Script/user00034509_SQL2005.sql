--�޸��ˣ����
--�жһ�Ʊ
--���Ʊ��ҵ�����������ͬ�ֻ㡱�ֶ�
--[VP6753]�¿�˹ERP�ϻ��²��ӿڿ���
IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('AB_RECEIVE') AND NAME='AS_SPOT_EXCHANGE')  
alter table AB_RECEIVE add AS_SPOT_EXCHANGE char(1) default 0
GO
