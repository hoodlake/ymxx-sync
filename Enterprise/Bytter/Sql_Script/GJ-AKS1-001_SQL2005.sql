-- 修改人孙江华
--日期：2012-10-19
--需求 奥克斯_国际结算_GJ-AKS1-001 

-- 保证金比例 
ALTER TABLE GUA_GUARANTEE_INFO ADD BAIL_RATIO NUMERIC(6, 4)
GO

--增加履行登记菜单--
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
         '履行登记',
         'grt',
         res_code,
         '/guarantee/lg/perform_reg.jsp',
         '0',
         '1',
         '0',
         '0',
         5,
         '履行登记',
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
  where res_name = '成员单位保函管理' and sys_code='grt'
GO


-- 履行登记表 --
CREATE TABLE GUA_PERFORM_REG
(
	GUID                      VARCHAR(40)  primary key,        -- 记录主键 GUID
	GUARA_ID                  NUMERIC(10) not null,            -- 对应保函登记的记录ID       
	CONTRACT_NO               VARCHAR(50) not null,            -- 合同编号
	CONTRACT_DATE             datetime not null,                -- 合同签订日期
	PAYMENT_METHOD            VARCHAR(50),                      -- 收款方式
	PAYMENT_DATE              datetime,                         -- 收款日期
	GUA_NUMBER                NUMERIC(10) not null,             -- 保函份数
	NOTES                     VARCHAR(500),                     -- 备注
	ATTACHEMENT_NAME          VARCHAR(500),                     -- 附件实际名称，多个附件使用";"分隔
	STATUS                    NUMERIC not null,                 -- 履行登记记录状态
	OP_CODE                   VARCHAR(8) not null,              -- 录入员CODE
	OP_DATE                   datetime not null                 -- 录入日期
)
GO

ALTER TABLE GUA_PERFORM_REG ADD CONSTRAINT GUARA_ID_UNIQUE unique(GUARA_ID)
GO