--�޸����ڣ�2012-11-07
--�޸��ˣ�¬����
--�޸����ݣ������˵�
--�޸�ԭ����Զ����ZY-ZH-06

--�����˵���˻�����>>��ѯ>>�˻����Բ����ѯ
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
   '�˻����Բ����ѯ',
   'bankacc',
   RES_CODE,
   '/bankacc/queryDifference.do?method=queryList',
   '',
   '0',
   '',
   '0',
   2,
   '�˻����Բ����ѯ',
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
   2 from BT_SYS_RES WHERE SYS_CODE = 'bankacc' AND RES_NAME = '��ѯ';
   
   go
