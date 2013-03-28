--修改日期：2013.01.22
--修改人：李程
--修改内容：德豪国际结算
--修改原因：新增功能报关单录入，报关单统计
BEGIN
	DECLARE
		@N_COUNT INT ;
	BEGIN
		SELECT
			@N_COUNT = COUNT (*)
		FROM
			BT_SYS_RES t
		WHERE
			t.sys_code = 'lcs'
		AND t.res_name = '报关单' ;
		IF @N_COUNT < 1
		BEGIN
			INSERT INTO bt_sys_res (
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
				RES_LEVEL,
				RES_ROLE
			) SELECT
				(
					SELECT
						MAX (res_code) + 1
					FROM
						bt_sys_res
				),
				'报关单',
				'lcs',
				0,
				'',
				'0',
				'0',
				'0',
				'0',
				30,
				'报关单',
				'',
				'',
				'',
				'',
				'',
				NULL,
				NULL,
				NULL,
				NULL,
				NULL,
				1,
				'' ;
			END ;
			END ;
			END;

GO



BEGIN
	DECLARE
		@N_COUNT INT ;
	BEGIN
		SELECT
			@N_COUNT = COUNT (*)
		FROM
			BT_SYS_RES t
		WHERE
			t.sys_code = 'lcs'
		AND t.res_name = '录入报关单' ;
		IF @N_COUNT < 1
		BEGIN
			INSERT INTO bt_sys_res (
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
RES_LEVEL,
RES_ROLE
)
	SELECT (
		SELECT
			MAX (res_code) + 1
		FROM
			bt_sys_res
	),
	'录入报关单',
	'lcs',
	res_code,
	'/credit/customsFormAdd.jsp',
	'0',
	'1',
	'0',
	'0',
	2,
	'录入报关单',
	'',
	'',
	'',
	'',
	'',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	2,
	''
FROM
				bt_sys_res
			WHERE
				res_name = '报关单'
			AND sys_code = 'lcs'  
;
			END ;
			END ;
			END;

GO

BEGIN
	DECLARE
		@N_COUNT INT ;
	BEGIN
		SELECT
			@N_COUNT = COUNT (*)
		FROM
			BT_SYS_RES t
		WHERE
			t.sys_code = 'lcs'
		AND t.res_name = '报关单统计' ;
		IF @N_COUNT < 1
		BEGIN
			INSERT INTO bt_sys_res (
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
RES_LEVEL,
RES_ROLE
)
	SELECT (
		SELECT
			MAX (res_code) + 1
		FROM
			bt_sys_res
	),
	'报关单统计',
	'lcs',
	res_code,
	'/credit/customsFormStatistics.jsp',
	'0',
	'1',
	'0',
	'0',
	2,
	'报关单统计',
	'',
	'',
	'',
	'',
	'',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	2,
	''
FROM
				bt_sys_res
			WHERE
				res_name = '报关单'
			AND sys_code = 'lcs'  
;
			END ;
			END ;
			END;

GO

IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('lc_bill_customs')
                  AND   TYPE = 'U')
create table lc_bill_customs (
       id numeric(15) primary key,
       uuid varchar(32),
       corps varchar(150),
       render_no varchar(150),
       record_no varchar(150),
       customs_date datetime,
       abled numeric(3) default 0  
);

IF NOT EXISTS (SELECT 1
                 FROM  SYSOBJECTS
                WHERE  ID = OBJECT_ID('customs_relations')
                  AND   TYPE = 'U')
create table customs_relations (
       id numeric(15) primary key,
       cid varchar(32),
       arrival_no varchar(20),
       abled numeric(3) default 0
);
go
