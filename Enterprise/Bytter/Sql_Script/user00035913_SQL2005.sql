--�޸����ڣ�2012.12.5
--�޸��ˣ����
--�޸����ݣ����ű���ϵͳԭ�еĹ��ʽ�����;����Ϊ��ֵ�����ݸ���ΪϵͳĬ�ϵ�����������;���롣
--�޸�ԭ��user00035913���ݽ���-�Ŵ�������;ά�����⡣

BEGIN
	DECLARE
		@VN_COUNT INT ; SELECT
			@VN_COUNT = COUNT (*)
		FROM
			LC_PURPOSE
		WHERE
			purpose_code IS NULL ;
		IF 0 < 1
		BEGIN
			WHILE @VN_COUNT >0
				BEGIN
					update LC_PURPOSE set purpose_code = (select gen_value from tb_generator where gen_name='BT_PURPOSE_ID') 
						where id = (select min(id) from LC_PURPOSE where purpose_code IS NULL);
					update tb_generator set gen_value=(
           select gen_value+1 from tb_generator where gen_name='BT_PURPOSE_ID'
						) where gen_name='BT_PURPOSE_ID';
				SET @VN_COUNT=@VN_COUNT-1
				end
		END ;
END

GO