-- 修改日期：20121217
-- 修改人：梁铭利
--修改内容：中烟加ERP接口银行的接口代码,以区分走银行接口还是走监管系统


declare 
 @max_id_cs20121217 int;
 begin
    select @max_id_cs20121217=count(*) from BIS_BIF_INIT where BIF_CODE='9999';
    if @max_id_cs20121217=0  
		begin
        insert into bis_bif_init (BIF_CODE, NAME, MOD_ID, SVR_END_TIME, SVR_START_TIME)
        values ('9999', 'ERP接口', 'ERP','1900-01-01 23:59:00', '1900-01-01 00:00:00');
        end 
end 
go



-- 修改日期：20121231
-- 修改人：梁铭利
--修改内容：中烟加银行账号补录提示功能参数(监管系统导入的账号)

declare 
  @max_id_cs20121231 int;
 begin
   select @max_id_cs20121231=count(*) from fc_param where param_code='bankacc_add';
   if @max_id_cs20121231=0  
		begin
		 insert into fc_param ( PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
		 values ( 'bankacc_add', '银行账号补录', '0', '1提醒,0不提醒', '', '', '');
        end 
 end 
    
go

