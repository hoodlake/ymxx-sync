
--修改日期：20121218
--修改人：吴生火
--修改内容：华强电子账务改进需求,增加“不加密是否提醒”参数
--参数设置：
DECLARE
   @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
    FROM FC_PARAM
   WHERE PARAM_CODE='encrypt_remind';
  IF @VN_COUNT < 1
   insert into fc_param (PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
	values ( 'encrypt_remind', '不加密是否提醒', '1', '1为不加密提醒,0为不加密不提醒', '', '', '');
 
END;
go

