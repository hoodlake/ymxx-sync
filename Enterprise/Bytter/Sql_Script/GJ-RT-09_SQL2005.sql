--�޸����ڣ�20121225
--�޸��ˣ����
--�Ŵ�����-��ѯ-��ҵ/�����Ŵ�����ͳ�Ʊ�
GO
DECLARE
    @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)    
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='��ҵ/�����Ŵ�����ͳ�Ʊ�' AND t1.father_code=t2.res_code AND t2.res_name='��ѯ';
  IF @VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'��ҵ/�����Ŵ�����ͳ�Ʊ�','cms',res_code,'/cms/financeCorpBankHzTj.do?method=tofinanceCorpBankHzTj'
   ,'0','1','0','0',15,'��ҵ/�����Ŵ�����ͳ�Ʊ�','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '��ѯ' and sys_code = 'cms';
  END IF;
END;
GO
