--�޸��ˣ���˫
--�޸����ڣ�2012-08-07
--�޸�����1���������жһ�Ʊ�¶��ˡ��˵�
--�޸�����2��������"MONTH_RECONCILE" �жһ�Ʊ�¶��˹�����Ҫ�õ�
--�޸�ԭ�����������¶�����洢����״̬

--�������жһ�Ʊ�¶��ˡ��˵�
INSERT INTO BT_SYS_RES
(RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RES_LEVEL)
select (SELECT MAX(RES_CODE) + 1 FROM BT_SYS_RES),'�жһ�Ʊ�¶���','ads',151,'/AB/monthReconci.do?method=treeView','0','1','0','0','10','2'
go

--������"MONTH_RECONCILE" �жһ�Ʊ�¶��˹�����Ҫ�õ�
CREATE TABLE MONTH_RECONCILE(
       ID          NUMERIC(28) NOT NULL , --����
       CORP_ID     NUMERIC(10)          , --��λID
       YEAR        NUMERIC(4)           , --���           
       MONTH       NUMERIC(2)           , --�·�
       START_DATE  DATETIME                , --���˿�ʼ����
       END_DATE    DATETIME                , --���˽�������
       STATUS      NUMERIC              , --����״̬
       CONSTRAINT PK_MONTH_RECONCILE PRIMARY KEY (ID)
)
go
