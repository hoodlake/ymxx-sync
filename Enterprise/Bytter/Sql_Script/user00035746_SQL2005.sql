--�޸����ڣ�2012.12.5
--�޸��ˣ����
--�޸����ݣ���;������Ϊ���Ŵ�������������ϵͳ��ʽ��Ҳ������ά�������ű���ϵͳԭ�е���;����Ϊ���Ŵ����������ݸ���ΪϵͳĬ�ϵ�����������;���롣
--�޸�ԭ��user00035746���ݽ���-�Ŵ�������;ά�����⡣

BEGIN
	DECLARE
		@VN_COUNT INT ; SELECT
			@VN_COUNT = COUNT (*)
		FROM
			cms_pl_purpose
		WHERE
			purpose_code = '�Ŵ�����' ;
		IF 0 < 1
		BEGIN
			WHILE @VN_COUNT >0
				BEGIN
					update cms_pl_purpose set purpose_code = (select gen_value from tb_generator where gen_name='BT_PURPOSE_ID') 
						where id = (select min(id) from cms_pl_purpose where purpose_code = '�Ŵ�����');
					update tb_generator set gen_value=(
           select gen_value+1 from tb_generator where gen_name='BT_PURPOSE_ID'
						) where gen_name='BT_PURPOSE_ID';
				SET @VN_COUNT=@VN_COUNT-1
				end
		END ;
END

GO