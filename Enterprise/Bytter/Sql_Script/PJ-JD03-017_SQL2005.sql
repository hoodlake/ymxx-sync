--�޸��ˣ���˫
--�޸����ڣ�2012-08-02
--�޸�����1��������Ʊ������/�������˵���
--�޸�����2����AB_RECEIVE������IS_LOCK���ֶ�
--�޸�ԭ��PJ-JD03-017(���Ʊ��ҵ��������Ʊ���Ƿ��������������Ʊ�ݵ�����������)

--������Ʊ������/�������˵���
INSERT INTO BT_SYS_RES
(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),'Ʊ������/����','ads',164,'/AB/lockUnlock.do?method=toList','0','1','0','0','14','2'
go

--����Ƿ������ֶ�
--IS_LOCKΪNULL��0���������״̬��1��������״̬
ALTER TABLE AB_RECEIVE ADD IS_LOCK CHAR(1)
go

