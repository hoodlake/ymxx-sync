-- �޸����ｭ��
--���ڣ�2012-10-19
--���� �¿�˹_���ʽ���_GJ-AKS1-001 

-- ��֤����� 
ALTER TABLE GUA_GUARANTEE_INFO ADD BAIL_RATIO NUMERIC(6, 4)
GO

--�������еǼǲ˵�--
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
         '���еǼ�',
         'grt',
         res_code,
         '/guarantee/lg/perform_reg.jsp',
         '0',
         '1',
         '0',
         '0',
         5,
         '���еǼ�',
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
  where res_name = '��Ա��λ��������' and sys_code='grt'
GO


-- ���еǼǱ� --
CREATE TABLE GUA_PERFORM_REG
(
	GUID                      VARCHAR(40)  primary key,        -- ��¼���� GUID
	GUARA_ID                  NUMERIC(10) not null,            -- ��Ӧ�����Ǽǵļ�¼ID       
	CONTRACT_NO               VARCHAR(50) not null,            -- ��ͬ���
	CONTRACT_DATE             datetime not null,                -- ��ͬǩ������
	PAYMENT_METHOD            VARCHAR(50),                      -- �տʽ
	PAYMENT_DATE              datetime,                         -- �տ�����
	GUA_NUMBER                NUMERIC(10) not null,             -- ��������
	NOTES                     VARCHAR(500),                     -- ��ע
	ATTACHEMENT_NAME          VARCHAR(500),                     -- ����ʵ�����ƣ��������ʹ��";"�ָ�
	STATUS                    NUMERIC not null,                 -- ���еǼǼ�¼״̬
	OP_CODE                   VARCHAR(8) not null,              -- ¼��ԱCODE
	OP_DATE                   datetime not null                 -- ¼������
)
GO

ALTER TABLE GUA_PERFORM_REG ADD CONSTRAINT GUARA_ID_UNIQUE unique(GUARA_ID)
GO