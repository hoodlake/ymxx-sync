
--�޸���:������
--�޸�ʱ��:2012-11-17
--�޸�����:������������нӿ�����_ʵ�ַ�ʽ�����˲��

alter table bt_net_chalk
add IS_ERP char(1)
go
alter table bt_net_chalk
add IS_Success_MatchPer char(1)
go

-- Create table
create table BT_NET_CHALK_ERP_DTL
(
  BIF_SERIAL      VARCHAR(50) not null,
  LINE_NO         decimal(5,0) not null,
  CORP_CODE       CHAR(4),
  CORP_NAME       VARCHAR(80) ,
  MONEY           decimal(14,2)
)

go
alter table BT_NET_CHALK_ERP_DTL WITH NOCHECK ADD 
   constraint PK_BT_NET_CHALK_ERP_DTL primary key CLUSTERED(BIF_SERIAL,LINE_NO) ON [PRIMARY] 
GO


CREATE NONCLUSTERED INDEX IX_BT_NET_CHALK_ERP_DTL ON BT_NET_CHALK_ERP_DTL
	(
	BIF_SERIAL,
	LINE_NO
	) ON [PRIMARY]
GO
