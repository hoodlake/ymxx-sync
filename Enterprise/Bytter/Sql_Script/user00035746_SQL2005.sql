--修改日期：2012.12.5
--修改人：李程
--修改内容：用途代码名为“信贷管理”，不符合系统格式，也不利于维护。本脚本将系统原有的用途代码为“信贷管理”的数据更新为系统默认的自增长的用途代码。
--修改原因：user00035746广州建筑-信贷管理用途维护问题。

BEGIN
	DECLARE
		@VN_COUNT INT ; SELECT
			@VN_COUNT = COUNT (*)
		FROM
			cms_pl_purpose
		WHERE
			purpose_code = '信贷管理' ;
		IF 0 < 1
		BEGIN
			WHILE @VN_COUNT >0
				BEGIN
					update cms_pl_purpose set purpose_code = (select gen_value from tb_generator where gen_name='BT_PURPOSE_ID') 
						where id = (select min(id) from cms_pl_purpose where purpose_code = '信贷管理');
					update tb_generator set gen_value=(
           select gen_value+1 from tb_generator where gen_name='BT_PURPOSE_ID'
						) where gen_name='BT_PURPOSE_ID';
				SET @VN_COUNT=@VN_COUNT-1
				end
		END ;
END

GO