-- Add/modify columns 
alter table BT_BANKACC_APP add attachment_path VARCHAR2(500);
-- Add comments to the columns 
comment on column BT_BANKACC_APP.attachment_path
  is 'ÉêÇë¿ª»§¸½¼þ';