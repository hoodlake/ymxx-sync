
--  ����������Ʊ����Ѻ�Ƿ��������Ѻ��  
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('BIRIM','ads','Ʊ����Ѻ�Ƿ��������Ѻ�����',0,0,'0 ������;1 ����','0,������;1,����',1)
go 
--���Ʊ�����ӵ���Ѻ���� 
ALTER TABLE ab_receive ADD MORPLE_CODE VARCHAR(50) 
go 
--�Կ�Ʊ�ݱ����ӵ���Ѻ���ź͵�����ʽ���
ALTER TABLE ab_emit ADD  MORPLE_CODE VARCHAR(50) 
go 

ALTER TABLE ab_emit ADD  GUA_TYPE VARCHAR(2) 

go 