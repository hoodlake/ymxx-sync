--�޸���:�´���
--�޸�ʱ��:2012-11-26
--�޸�����:VP7503-7504��������ҵ�����Ļ��ܱ����У���������
--�������ۺϲ�ѯϵͳ>>�ֽ𼰳жһ�Ʊ���ܱ�>>��ҵ�����Ļ��ܱ����У� �˵�
---------------��������˾��ƿ�Ŀ����˵�
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT = COUNT(*)
  FROM BT_SYS_RES
  WHERE SYS_CODE= 'fqs'
   and RES_NAME = '��ҵ�����Ļ��ܱ����У�'
   and RES_URL = '/monitor/collectEcSearch.jsp';
  IF @VN_COUNT < 1
    BEGIN
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
   RES_LEVEL,
   RES_ROLE)
  select (select max(RES_CODE) + 1 from bt_sys_res),
         '��ҵ�����Ļ��ܱ����У�',
         'fqs',
         RES_CODE,
         '/monitor/collectEcSearch.jsp',
         '0',
         '1',
         '0',
         '0',
         5,
         '��ҵ�����Ļ��ܱ����У�',
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
         3,
         ''
    from bt_sys_res
   where res_name = '�ֽ𼰳жһ�Ʊ���ܱ�' and sys_code='fqs';
    END;
END;
GO

