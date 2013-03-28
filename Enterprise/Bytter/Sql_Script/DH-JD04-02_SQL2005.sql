--修改日期：2012.12.21
--修改人：李程
--修改内容：德豪国际结算
--修改原因：新增字段，添加菜单

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('LC_ENROL') AND NAME='security_currency')  
alter table  lc_enrol add security_currency varchar(2);

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='inv_no')  
alter table  lc_bill_arrival add inv_no varchar(50);

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='amount_money')  
alter table  lc_bill_arrival add amount_money numeric(30,2);

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='presenting_date')  
alter table  lc_bill_arrival add presenting_date DATETIME;

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='shipnent_date')  
alter table  lc_bill_arrival add shipnent_date DATETIME;

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='received_date')  
alter table  lc_bill_arrival add received_date DATETIME;

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='po')  
alter table  lc_bill_arrival add po varchar(50);

IF NOT EXISTS(SELECT * 
FROM SYSCOLUMNS 
WHERE ID=OBJECT_ID('lc_bill_arrival') AND NAME='customer')  
alter table  lc_bill_arrival add customer varchar(50);

-- lc_enrol.security_currency IS '保证金币别';
-- lc_bill_arrival.inv_no IS '商业发票号';
-- lc_bill_arrival.amount_money IS '发票金额';
-- lc_bill_arrival.presenting_date IS '交单日期';
-- lc_bill_arrival.shipnent_date IS '装运日期';
-- lc_bill_arrival.received_date IS '接收日期';
-- lc_bill_arrival.po IS '订单';
-- lc_bill_arrival.customer IS '客户';

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
		AND t.res_name = '交单管理' ;
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
				'交单查询',
				'lcs',
				res_code,
				'/credit/allQueryPresenting.jsp',
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
			AND sys_code = 'lcs' ;
			END ;
			END ;
			END;

GO
