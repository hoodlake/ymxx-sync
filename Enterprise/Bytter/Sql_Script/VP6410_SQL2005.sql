--�޸����ڣ�20120829
--�޸��ˣ�����
--�޸����ݣ����������ݱ���˵�������ʽ�������ܱ�˵�
--�޸�ԭ��:VPҪ���޸�

delete from bt_sys_res where  res_name='�ʽ�������ܱ�' and res_url = '/aqs/netEveryDateMoney.do?method=getFirstLevelNetInfo';
insert into bt_sys_res
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
         '�ʽ�������ܱ�',
         'fqs',
         RES_CODE,
         '/aqs/netEveryDateMoney.do?method=getFirstLevelNetInfo',
         '0',
         '1',
         '0',
         '0',
         9,
         '�ʽ�������ܱ�',
         '',
         '',
         '',
         '',
         '',
         null,
         null,
         null,
         null,
         null,
         2
    from bt_sys_res
   where res_name = '�������ݱ���'
     and sys_code = 'fqs'
	 go;
