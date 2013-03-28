--修改日期：2012.12.5
--修改人：李程
--修改内容：本脚本将系统原有的国际结算用途代码为空值的数据更新为系统默认的自增长的用途代码。
--修改原因：user00035913广州建筑-信贷管理用途维护问题。

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