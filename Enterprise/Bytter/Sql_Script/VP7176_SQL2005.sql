-- �޸����ڣ�20121217
-- �޸��ˣ�������
--�޸����ݣ����̼�ERP�ӿ����еĽӿڴ���,�����������нӿڻ����߼��ϵͳ


declare 
 @max_id_cs20121217 int;
 begin
    select @max_id_cs20121217=count(*) from BIS_BIF_INIT where BIF_CODE='9999';
    if @max_id_cs20121217=0  
		begin
        insert into bis_bif_init (BIF_CODE, NAME, MOD_ID, SVR_END_TIME, SVR_START_TIME)
        values ('9999', 'ERP�ӿ�', 'ERP','1900-01-01 23:59:00', '1900-01-01 00:00:00');
        end 
end 
go



-- �޸����ڣ�20121231
-- �޸��ˣ�������
--�޸����ݣ����̼������˺Ų�¼��ʾ���ܲ���(���ϵͳ������˺�)

declare 
  @max_id_cs20121231 int;
 begin
   select @max_id_cs20121231=count(*) from fc_param where param_code='bankacc_add';
   if @max_id_cs20121231=0  
		begin
		 insert into fc_param ( PARAM_CODE, PARAM_NAME, PARAM_VALUE, RMK, COL_ADD1, COL_ADD2, WINDOW_NAME)
		 values ( 'bankacc_add', '�����˺Ų�¼', '0', '1����,0������', '', '', '');
        end 
 end 
    
go

