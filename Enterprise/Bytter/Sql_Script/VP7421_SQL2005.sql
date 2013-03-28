--修改日期：2012.12.25
--修改人：李程
--修改内容：奥克斯，凭证模板定义分配，菜单
--修改原因：vp7421,添加菜单"凭证模板定义分配"

BEGIN
	DECLARE
		@N_COUNT INT ;
	BEGIN
		SELECT
			@N_COUNT = COUNT (*)
		FROM
			BT_SYS_RES t
		WHERE
			t.sys_code = 'exchange'
		AND t.res_name = '凭证模板基础数据维护' ;
		IF @N_COUNT < 1
		BEGIN
			INSERT INTO BT_SYS_RES (
				RES_CODE,
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
				RES_LEVEL
			) SELECT
				(
					SELECT
						MAX (RES_CODE) + 1
					FROM
						bt_sys_res
				),
				'凭证模板基础数据维护',
				'exchange',
				res_code,
				'/netbank/ErpVoucherTemplate.do?method=doList&corpCode=-1',
				'0',
				'1',
				'0',
				'0',
				4,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				2
			FROM
				bt_sys_res
			WHERE
				res_name = '查询'
			AND sys_code = 'exchange' ;
			END ;
			END ;
			END;

GO
