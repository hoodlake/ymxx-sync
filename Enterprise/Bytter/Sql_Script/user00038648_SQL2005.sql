
 --���¾�
 --2013-02-26 18:12:24
 --ɾ������˵�
 
 DELETE FROM BT_SYS_RES   WHERE  RES_NAME = 'Ԥ�����Բ�ѯ' AND SYS_CODE = 'fwg' AND RES_CODE NOT IN (SELECT MAX(RES_CODE) FROM BT_SYS_RES WHERE RES_NAME = 'Ԥ�����Բ�ѯ' AND SYS_CODE = 'fwg' )  
 go
 
