
--����������Ʊ����Ѻ�Ƿ��������Ѻ��
INSERT INTO bt_param(code,sys_code,NAME,param_value1,param_type,rmk,Reverse1,reverse6) VALUES('BIRIM','ads','Ʊ����Ѻ�Ƿ��������Ѻ�����',0,0,'0 ������;1 ����','0,������;1,����',1);
commit;

--���Ʊ�����ӡ�����Ѻ���š�
ALTER TABLE ab_receive ADD  MORPLE_CODE VARCHAR2(50) ;

commit;

--�Կ�Ʊ�ݱ����ӡ�����Ѻ���š��͡�������ʽ��š�
ALTER TABLE ab_emit ADD MORPLE_CODE VARCHAR2(50) ;
  
commit; 

  
ALTER TABLE ab_emit ADD GUA_TYPE VARCHAR2(2) ;
  
commit; 
