--�޸�ʱ��2012-9-11
--�޸��� ��³�
--�޸�����  �ʽ�鼯���²�ͳ�Ʊ���

declare
  @VN_COUNT int;
begin
	SELECT @VN_COUNT=COUNT(*) FROM bt_sys_res
      WHERE res_name = '�ʽ�鼯���²�ͳ�Ʊ���' and sys_code = 'fqs' and res_level = 2;
    if @VN_COUNT=0
      begin
	      update bt_sys_res set res_order = res_order + 1 where father_code in (select res_code from bt_sys_res where res_name='�ڲ��˺Ų�ѯ' and sys_code='fqs') and res_order > 8;
	      insert into BT_SYS_RES   
			  (RES_CODE, 
			   RES_NAME,
			   SYS_CODE,
			   FATHER_CODE, 
			   RES_URL,
			   FUNC_FLAG,
			   RES_TYPE,
			   LINK_TARGET,
			   STATUS,
			   RES_ORDER,
			   RMK,
			   REVERSE1,
			   REVERSE2,
			   REVERSE3,
			   REVERSE4,
			   REVERSE5,
			   REVERSE6,
			   REVERSE7,
			   REVERSE8,
			   REVERSE9,
			   REVERSE10,
			   RES_LEVEL)
			  select (select max(RES_CODE) + 1 from bt_sys_res),
			         '�ʽ�鼯���²�ͳ�Ʊ���',
			         'fqs',
			         res_code,
			         '/monitor/gatherAndInsideCount.do?method=toQuery',
			         '0',
			         '1',
			         '0',
			         '0',
			         9,
			         null,
			         null,
			         null,
			         null,
			         null,
			         null,
			         null,
			         null,
			         null,
			         null,
			         null,
			         2
			  from bt_sys_res
			   where res_name = '�ڲ��˺Ų�ѯ'
			   and sys_code='fqs';
      end ;
end ;
go