--�޸����ڣ�2013.01.22
--�޸��ˣ����
--�޸����ݣ��º����ʽ���
--�޸�ԭ���������ܱ��ص�¼�룬���ص�ͳ��
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
		AND t.res_name = '���ص�' ;
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
				'���ص�',
				'lcs',
				0,
				'',
				'0',
				'0',
				'0',
				'0',
				30,
				'���ص�',
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
		AND t.res_name = '¼�뱨�ص�' ;
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
	'¼�뱨�ص�',
	'lcs',
	res_code,
	'/credit/customsFormAdd.jsp',
	'0',
	'1',
	'0',
	'0',
	2,
	'¼�뱨�ص�',
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
				res_name = '���ص�'
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
		AND t.res_name = '���ص�ͳ��' ;
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
	'���ص�ͳ��',
	'lcs',
	res_code,
	'/credit/customsFormStatistics.jsp',
	'0',
	'1',
	'0',
	'0',
	2,
	'���ص�ͳ��',
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
				res_name = '���ص�'
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
