--修改日期：20121225
--修改人：黄盈
--需求编号：VP5888
--修改内容：添加清理标记及修改视图v_info_user添加isclear
DECLARE
  num INTEGER;
BEGIN
  SELECT COUNT(1) INTO num FROM USER_TAB_COLUMNS WHERE TABLE_NAME =upper('WPF_INFO_USER') AND COLUMN_NAME = 'ISCLEAR';
  IF num = 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE WPF_INFO_USER ADD ISCLEAR NUMBER DEFAULT 1';
  END IF;
  COMMIT;
END;
/

create or replace view v_info_user as
select  info.id as info_id, rel.user_code as user_code, info.infotype as infotype,
info.subject as subject,info.send_time as send_time,info.info_message as info_message,
info.storage_filename as storage_filename,info.filename as filename,info.owner as owner,
info.status as status, rel.isread as isread , rel.isclear as isclear ,rel.id
from WPF_INFORMATION  info, WPF_INFO_USER rel  where info.id=rel.info_id;
/