--修改人：胡双
--修改日期：2012-12-26
--修改内容：修改RETURN_MSG列的长度

ALTER TABLE BIS_ACC_HIS_DTL MODIFY RETURN_MSG VARCHAR2(500);
ALTER TABLE BIS_ACC_HIS_DTL_MERGEN MODIFY RETURN_MSG VARCHAR2(500);
ALTER TABLE BIS_ACC_HIS_DTL_SPLIT MODIFY RETURN_MSG VARCHAR2(500);
ALTER TABLE AB_OPERATION MODIFY RETURN_MSG VARCHAR2(500);
