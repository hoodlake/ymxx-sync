--�޸��ˣ�������
--�޸�ʱ��:2012-12-24
--�޸�����:����ϸ����ʷ��ϸ���ൽ��ϸ����ͨ����ϸ�����չ��������ʾ������ϸ����ʷ��ϸ��
--�����˵�����ϸ 

DECLARE
     BSR_COUNT NUMBER;
BEGIN 
     SELECT  COUNT(*) INTO BSR_COUNT FROM BT_SYS_RES T1 ,BT_SYS_RES T2   WHERE T1.RES_NAME='��ϸ' AND T1.SYS_CODE='fqs' AND T2.RES_NAME='�������ݱ���'  
		 AND T2.RES_CODE=T1.FATHER_CODE;   
     IF BSR_COUNT < 1 THEN 
		    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET,STATUS, RES_ORDER, RMK, REVERSE1,
				REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)  
			SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), '��ϸ', 'fqs', (select s2.res_code from bt_sys_res s2 where s2.res_name='�������ݱ���' 
				and s2.sys_code = 'fqs' ), '', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, ''
			FROM  BT_SYS_RES WHERE res_name = '�������ݱ���' and sys_code = 'fqs';
     END IF;
     COMMIT;
END;
/

UPDATE  BT_SYS_RES  SET   FATHER_CODE=(SELECT RES_CODE FROM BT_SYS_RES WHERE RES_NAME='��ϸ' AND SYS_CODE='fqs'),  RES_LEVEL=3
WHERE  RES_NAME='���е�����ϸ' OR  RES_NAME='������ʷ��ϸ'  AND SYS_CODE='fqs';



DECLARE
     BSR_COUNT NUMBER;
BEGIN 
     SELECT  COUNT(*) INTO BSR_COUNT FROM BT_SYS_RES T1 ,BT_SYS_RES T2   WHERE T1.RES_NAME='���' AND T1.SYS_CODE='fqs' AND T2.RES_NAME='�������ݱ���'  
     AND T2.RES_CODE=T1.FATHER_CODE;   
     IF BSR_COUNT < 1 THEN 
        insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET,STATUS, RES_ORDER, RMK, REVERSE1,
        REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)  
      SELECT (select max(s1.RES_CODE)+1 from bt_sys_res s1), '���', 'fqs', (select s2.res_code from bt_sys_res s2 where s2.res_name='�������ݱ���' 
        and s2.sys_code = 'fqs' ), '', '0', '1', '0', '0', 2, '', '', '', '', '', '', null, null, null, null, null, 2, ''
      FROM  BT_SYS_RES WHERE res_name = '�������ݱ���' and sys_code = 'fqs';
     END IF;
     COMMIT;
END;
/

UPDATE  BT_SYS_RES  SET   FATHER_CODE=(SELECT RES_CODE FROM BT_SYS_RES WHERE RES_NAME='���' AND SYS_CODE='fqs' AND FATHER_CODE=(SELECT RES_CODE FROM BT_SYS_RES WHERE RES_NAME='�������ݱ���')),  RES_LEVEL=3
WHERE  RES_NAME='���е�ǰ���' OR  RES_NAME='������ʷ���'  AND SYS_CODE='fqs';

commit;