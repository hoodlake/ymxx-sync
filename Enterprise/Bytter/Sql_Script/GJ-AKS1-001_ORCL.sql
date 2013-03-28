-- 修改人孙江华
--日期：2012-10-19
--需求 奥克斯_国际结算_GJ-AKS1-001 

-- 保证金比例 
ALTER TABLE GUA_GUARANTEE_INFO ADD BAIL_RATIO NUMBER(6, 4);

--增加履行登记菜单--
INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
VALUES ((select max(RES_CODE)+1 from bt_sys_res), '履行登记', 'grt',
(select res_code from bt_sys_res where res_name='成员单位保函管理' and sys_code='grt'), '/guarantee/lg/perform_reg.jsp', '0', '1', '0', '0', 5, '履行登记', 2);

-- 履行登记表 --
CREATE TABLE GUA_PERFORM_REG
(
	GUID                      VARCHAR2(40)  primary key,     
	GUARA_ID                  NUMBER(10) not null,               
	CONTRACT_NO               VARCHAR2(50) not null,       
	CONTRACT_DATE             DATE not null,               
	PAYMENT_METHOD            VARCHAR2(50),                
	PAYMENT_DATE              DATE,                         
	GUA_NUMBER                NUMBER(10) not null,          
	NOTES                     VARCHAR2(500),                
	ATTACHEMENT_NAME          VARCHAR2(500),                
	STATUS                    NUMBER not null,              
	OP_CODE                   VARCHAR2(8) not null,        
	OP_DATE                   DATE not null               
);

ALTER TABLE GUA_PERFORM_REG ADD CONSTRAINT GUARA_ID_UNIQUE unique(GUARA_ID); 

comment on column GUA_PERFORM_REG.GUID   is '记录主键 GUID';
comment on column GUA_PERFORM_REG.GUARA_ID   is '对应保函登记的记录ID';
comment on column GUA_PERFORM_REG.CONTRACT_NO  is '合同编号';
comment on column GUA_PERFORM_REG.CONTRACT_DATE   is '合同签订日期';
comment on column GUA_PERFORM_REG.PAYMENT_METHOD is '收款方式'; 
comment on column GUA_PERFORM_REG.PAYMENT_DATE is '收款日期'; 
comment on column GUA_PERFORM_REG.GUA_NUMBER is '保函份数'; 
comment on column GUA_PERFORM_REG.NOTES is '备注'; 
comment on column GUA_PERFORM_REG.ATTACHEMENT_NAME is '附件名称，多个附件使用";"分隔'; 
comment on column GUA_PERFORM_REG.STATUS is '履行登记记录状态'; 
comment on column GUA_PERFORM_REG.OP_CODE is '录入员CODE'; 
comment on column GUA_PERFORM_REG.OP_DATE is '录入日期'; 
