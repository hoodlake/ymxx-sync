--修改人：胡双
--修改日期：2012-12-27
--修改内容：由于“复核”不再被需要，
--所以最发对此做清除，不要留下冗余的数据

--删除复核权限分配，前提是5代表的是复核权限
DELETE BT_MANAGER_CORP_OPR
 WHERE SYS_CODE = 'ads'
   AND SYS_CODE = 'ads'
   AND OP_TYPE = 5
   AND EXISTS (SELECT OP_TYPE
          FROM BT_SYS_OPERATION
         WHERE SYS_CODE = 'ads'
           AND OP_TYPE = 5
           AND TYPE_NAME = '拆分复核');
COMMIT;
--删除复核权限选项
DELETE BT_SYS_OPERATION
 WHERE SYS_CODE = 'ads'
   AND OP_TYPE = 5
   AND TYPE_NAME = '拆分复核';
COMMIT;
