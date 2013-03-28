
--修改日期：20121205
--修改人：吴生火
--修改内容：增加自动记账登录用户表
--参数设置：

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
