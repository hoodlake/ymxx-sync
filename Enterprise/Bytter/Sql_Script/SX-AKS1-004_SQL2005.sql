--�޸�ʱ��2012-11-08
--�޸��� �����
--�޸�����  CMS_PROVIDE_LOAN_INFO�����ֶΣ��м�ҵ��ѡ�ʹ���ˡ��Ŵ���ͬ�š��ڲ���ͬ�š���Ŀ���� 

ALTER TABLE CMS_PROVIDE_LOAN_INFO ADD USERS VARCHAR(80)
GO

ALTER TABLE CMS_PROVIDE_LOAN_INFO ADD CREDIT_CONTRACT_NO VARCHAR(40)
GO

ALTER TABLE CMS_PROVIDE_LOAN_INFO ADD INSIDE_CONTRACT_NO VARCHAR(40)
GO

ALTER TABLE CMS_PROVIDE_LOAN_INFO ADD PROJECT_NAME VARCHAR(80)
GO

INSERT INTO CMS_LOAN_CLASS (CLC_ID, CLC_PARENT_ID, CLC_CODE, CLC_NAME, CLC_MEMO, CLC_ISVALID) select (SELECT ISNULL(MAX(CLC.CLC_ID), 0) + 1 FROM CMS_LOAN_CLASS CLC), (SELECT CLC.CLC_ID FROM CMS_LOAN_CLASS CLC WHERE CLC.CLC_CODE = '02'), '024', '�����ʽ����', '��Ϊ������������Ӫ�����ж����ʽ����󣬱�֤������Ӫ��������ж����ŵĴ��', 1
GO

INSERT INTO CMS_LOAN_CLASS (CLC_ID, CLC_PARENT_ID, CLC_CODE, CLC_NAME, CLC_MEMO, CLC_ISVALID) select (SELECT ISNULL(MAX(CLC.CLC_ID), 0) + 1 FROM CMS_LOAN_CLASS CLC), (SELECT CLC.CLC_ID FROM CMS_LOAN_CLASS CLC WHERE CLC.CLC_CODE = '02'), '025', '��Ŀ����', 'ָΪĳһ�ض�������Ŀ����ͨ�ʽ�ķ�����', 1
GO

UPDATE CMS_PROVIDE_LOAN_INFO SET CLC_ID = (SELECT CLC.CLC_CODE FROM CMS_LOAN_CLASS CLC WHERE CLC.CLC_NAME = '�����ʽ����')
GO