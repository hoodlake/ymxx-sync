
--�޸����ڣ�20121205
--�޸��ˣ�������
--�޸����ݣ������Զ����˵�¼�û���
--�������ã�

IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('BT_USER_ONLINE')
                  AND   TYPE = 'U')
        create table BT_USER_ONLINE
				(  USER_CODE       VARCHAR(8) not null,
                                   ONLINE_SIGN      CHAR(1),
				   constraint PK_BT_USER_ONLINE primary key (USER_CODE)
				)
GO
