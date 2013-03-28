--�޸��ˣ���˫
--�޸����ڣ�2012-11-30
--�޸����ݣ����Ӳ˵����жһ�Ʊ-���Ʊ��ҵ��-Ʊ�ݲ��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from bt_sys_res  where res_name = 'Ʊ�ݲ��' and sys_code = 'ads';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res (RES_CODE,RES_NAME,SYS_CODE,FATHER_CODE,RES_URL,FUNC_FLAG,RES_TYPE,LINK_TARGET,STATUS,RES_ORDER,RMK,
   REVERSE1,REVERSE2,REVERSE3,REVERSE4,REVERSE5,REVERSE6,REVERSE7,REVERSE8,REVERSE9,REVERSE10,RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res),'Ʊ�ݲ��','ads',RES_CODE,'/AB/billSplit.do?method=toBillSplitList'
   ,'0','1','0','0',4,'','','','','','',null,null,null,null,null,2  
   from bt_sys_res  where res_name = '���Ʊ��ҵ��' and sys_code = 'ads';
  END IF;
  COMMIT; 
END;
/

--�޸��ˣ���˫
--�޸����ڣ�2012-12-03
--�޸����ݣ�����Ʊ�ݲ�ֱ�
DECLARE
  VC_STR   VARCHAR2(2000);
  VN_COUNT NUMBER;
BEGIN
  SELECT COUNT(*)
    INTO VN_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'AB_RECEIVE_SPLIT';
  IF VN_COUNT < 1 THEN
    VC_STR := 'CREATE TABLE AB_RECEIVE_SPLIT(ID NUMBER NOT NULL,
                                BILL_ID NUMBER,                                
                VOUCHER_NO VARCHAR2(20),
                STATUS CHAR(1) DEFAULT ''0'',
                SPLIT_DETAIL VARCHAR2(500),
				RMK          VARCHAR2(200),
				APPROVER_CODE VARCHAR2(8),
                                CONSTRAINT PK_AB_RECEIVE_SPLIT PRIMARY
                                KEY(ID))';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

comment on column AB_RECEIVE_SPLIT.STATUS is '���״̬��Ĭ��Ϊ 0δ��֣�1�Ѳ��';
comment on column AB_RECEIVE_SPLIT.VOUCHER_NO is '���ƾ֤��';
comment on column AB_RECEIVE_SPLIT.SPLIT_DETAIL IS '�����ϸ�����ݸ�ʽ����λID:���,��λID:���';
comment on column AB_RECEIVE_SPLIT.RMK is '��ע';
comment on column AB_RECEIVE_SPLIT.APPROVER_CODE is '������CODE';

--�޸��ˣ���˫
--�޸����ڣ�2012-12-03
--�޸����ݣ����Ӳ��Ȩ�ޣ����¼��
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    from BT_SYS_OPERATION  where OP_TYPE = 4 and sys_code = 'ads';
  IF VN_COUNT < 1 THEN
   INSERT INTO BT_SYS_OPERATION (SYS_CODE, OP_TYPE, TYPE_NAME) VALUES ('ads', 4, '���¼��');
  END IF;
  COMMIT; 
END;
/

--��
alter table ab_receive add ITEM_CODE varchar2(20);