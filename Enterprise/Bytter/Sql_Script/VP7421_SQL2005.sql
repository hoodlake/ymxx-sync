--�޸����ڣ�2012.12.25
--�޸��ˣ����
--�޸����ݣ��¿�˹��ƾ֤ģ�嶨����䣬�˵�
--�޸�ԭ��vp7421,��Ӳ˵�"ƾ֤ģ�嶨�����"

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
		AND t.res_name = 'ƾ֤ģ���������ά��' ;
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
				'ƾ֤ģ���������ά��',
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
				res_name = '��ѯ'
			AND sys_code = 'exchange' ;
			END ;
			END ;
			END;

GO
