--�޸��ˣ���˫
--�޸����ڣ�2012-12-27
--�޸����ݣ����ڡ����ˡ����ٱ���Ҫ��
--������Դ����������Ҫ�������������

--ɾ������Ȩ�޷��䣬ǰ����5������Ǹ���Ȩ��
DELETE BT_MANAGER_CORP_OPR
 WHERE SYS_CODE = 'ads'
   AND SYS_CODE = 'ads'
   AND OP_TYPE = 5
   AND EXISTS (SELECT OP_TYPE
          FROM BT_SYS_OPERATION
         WHERE SYS_CODE = 'ads'
           AND OP_TYPE = 5
           AND TYPE_NAME = '��ָ���');
COMMIT;
--ɾ������Ȩ��ѡ��
DELETE BT_SYS_OPERATION
 WHERE SYS_CODE = 'ads'
   AND OP_TYPE = 5
   AND TYPE_NAME = '��ָ���';
COMMIT;
