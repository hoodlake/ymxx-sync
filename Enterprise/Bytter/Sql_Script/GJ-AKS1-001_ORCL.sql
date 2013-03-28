-- �޸����ｭ��
--���ڣ�2012-10-19
--���� �¿�˹_���ʽ���_GJ-AKS1-001 

-- ��֤����� 
ALTER TABLE GUA_GUARANTEE_INFO ADD BAIL_RATIO NUMBER(6, 4);

--�������еǼǲ˵�--
INSERT INTO bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, RES_LEVEL)
VALUES ((select max(RES_CODE)+1 from bt_sys_res), '���еǼ�', 'grt',
(select res_code from bt_sys_res where res_name='��Ա��λ��������' and sys_code='grt'), '/guarantee/lg/perform_reg.jsp', '0', '1', '0', '0', 5, '���еǼ�', 2);

-- ���еǼǱ� --
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

comment on column GUA_PERFORM_REG.GUID   is '��¼���� GUID';
comment on column GUA_PERFORM_REG.GUARA_ID   is '��Ӧ�����Ǽǵļ�¼ID';
comment on column GUA_PERFORM_REG.CONTRACT_NO  is '��ͬ���';
comment on column GUA_PERFORM_REG.CONTRACT_DATE   is '��ͬǩ������';
comment on column GUA_PERFORM_REG.PAYMENT_METHOD is '�տʽ'; 
comment on column GUA_PERFORM_REG.PAYMENT_DATE is '�տ�����'; 
comment on column GUA_PERFORM_REG.GUA_NUMBER is '��������'; 
comment on column GUA_PERFORM_REG.NOTES is '��ע'; 
comment on column GUA_PERFORM_REG.ATTACHEMENT_NAME is '�������ƣ��������ʹ��";"�ָ�'; 
comment on column GUA_PERFORM_REG.STATUS is '���еǼǼ�¼״̬'; 
comment on column GUA_PERFORM_REG.OP_CODE is '¼��ԱCODE'; 
comment on column GUA_PERFORM_REG.OP_DATE is '¼������'; 
