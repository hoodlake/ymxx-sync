--�޸����ڣ�20121225
--�޸��ˣ���ӯ
--�����ţ�VP5888
--�޸����ݣ���������Ǽ��޸���ͼv_info_user���isclear
IF NOT EXISTS (SELECT A.NAME FROM SYSCOLUMNS A, SYSOBJECTS B WHERE A.ID = B.ID AND LTRIM(A.NAME) = 'ISCLEAR' AND LTRIM(B.NAME) = 'WPF_INFO_USER')
	ALTER TABLE WPF_INFO_USER ADD ISCLEAR NUMERIC(18, 2)
GO

IF EXISTS (SELECT * FROM sysobjects WHERE  name = 'v_info_user ')  
DROP VIEW v_info_user  
GO 
CREATE VIEW v_info_user AS
select  info.id as info_id, rel.user_code as user_code, info.infotype as infotype,
info.subject as subject,info.send_time as send_time,info.info_message as info_message,
info.storage_filename as storage_filename,info.filename as filename,info.owner as owner,
info.status as status, rel.isread as isread , rel.isclear as isclear ,rel.id
from WPF_INFORMATION  info, WPF_INFO_USER rel  where info.id=rel.info_id;
GO
