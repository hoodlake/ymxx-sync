--�޸����ڣ�2012.12.25
--�޸��ˣ����
--�޸����ݣ��¿�˹��ƾ֤ģ�嶨����䣬�˵�
--�޸�ԭ��vp7421,��Ӳ˵�"ƾ֤ģ�嶨�����"

DECLARE
  N_COUNT NUMBER;
BEGIN
  SELECT COUNT(*) INTO N_COUNT FROM BT_SYS_RES t where t.sys_code='exchange' and t.res_name='ƾ֤ģ���������ά��';  
  IF N_COUNT < 1 THEN
  insert into BT_SYS_RES (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL)
      select (select max(RES_CODE) + 1 from bt_sys_res),'ƾ֤ģ���������ά��','exchange',res_code,'/netbank/ErpVoucherTemplate.do?method=doList'||'&'||'corpCode=-1','0','1','0','0',6,null,null,null,null,null,null,null,null,null,null,null,2
  from bt_sys_res
   where res_name = '���ݴ���'
   and sys_code='exchange';
    END IF;
END;
/

COMMIT;
