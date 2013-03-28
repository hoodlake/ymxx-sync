--�޸�����:��ί�д���ű������ֶ�
--�޸���:�ž���
--�޸�ʱ��:2012-12-10
alter table CMS_PRECATIVE_LOAN_SEND add DEFERRED_REPAY_DATE DATETIME;

--�޸�����:����ί�д���չ�������CMS_PRE_DEFERRED
--�޸���:����
--�޸�ʱ��:2012-12-6
create table CMS_PRE_DEFERRED  (
   BILL_CODE            CHAR(13)                        not null,
   PLI_CODE             CHAR(13),
   CORP_ID              NUMERIC(10),
   ENTER_DATE           DATETIME,
   MATURE_DATE          DATETIME,
   DEFERRED_LIMT        NUMERIC(10),
   ACC_CODE             CHAR(16),
   DEFERRED_REPAY_DATE  DATETIME,
   EXPIRY_ACT_TYPE      VARCHAR(10),
   DEFERRED_RATE        NUMERIC(8,6),
   CONTRACT_CODE        VARCHAR(50),
   FINANCING_PLAN_ID    VARCHAR(100),
   RMK                  VARCHAR(100),
   NEXT_CHECKER         VARCHAR(150),
   APPROVES             VARCHAR(200),
   STATUS               NUMERIC(10),
   REPAIR_OP            VARCHAR(8),
   OP                   VARCHAR(8),
   REVERSE1             VARCHAR(300),
   REVERSE2             VARCHAR(300),
   REVERSE3             VARCHAR(300),
   REVERSE4             VARCHAR(300),
   REVERSE5             VARCHAR(300),
   REVERSE6             NUMERIC(15, 2),
   REVERSE7             NUMERIC(15,2),
   REVERSE8             NUMERIC(15,2),
   REVERSE9             NUMERIC(15,2),
   REVERSE10            NUMERIC(15,2),
   constraint PK_CMS_PRE_DEFERRED primary key (BILL_CODE)
);

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ������
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT =COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ������' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF @VN_COUNT < 1
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ������', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'+char(38)+'pageType=apply', '0', '1', '0', '0', 10, 'ί�д���չ������', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END;
END;
GO

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ���޸�
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT =COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ���޸�' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF @VN_COUNT < 1
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ���޸�', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'+char(38)+'pageType=edit', '0', '1', '0', '0', 11, 'ί�д���չ���޸�', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END;
END;
GO

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ�ڴ��
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT =COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ�ڴ��' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF @VN_COUNT < 1
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ�ڴ��', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'+char(38)+'pageType=reEdit', '0', '1', '0', '0', 12, 'ί�д���չ�ڴ��', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END;
END;
GO

--�޸�����:�����˵� �Ŵ�����>>ί�д���>>ί�д���չ�ڲ�¼
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT =COUNT(*)
    FROM bt_sys_res t1, bt_sys_res t2 WHERE t1.sys_code='cms' AND t1.res_name='ί�д���չ�ڲ�¼' AND t1.father_code=t2.res_code AND t2.res_name='ί�д���';
  IF @VN_COUNT < 1
  BEGIN
   insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ί�д���չ�ڲ�¼', 'cms', res_code, '/cms/cmsPreDeferred.do?method=toTreeList'+char(38)+'pageType=correct', '0', '1', '0', '0', 13, 'ί�д���չ�ڲ�¼', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms';
  END;
END;
GO

--�޸�����:����ҵ��  cms_C4 ί�д���չ��
--�޸���:�ž���
--�޸�ʱ��:2012-12-6
DECLARE
  @VN_COUNT    INT;
BEGIN
  SELECT @VN_COUNT =COUNT(*)
    from bt_approve_business where business_code='cms_D4';
  IF @VN_COUNT < 1
  BEGIN
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_D4','cms','ί�д���չ��','A,B,C','CMS_PRE_DEFERRED','money','next_checker','bill_code','../cms/cmsPreDeferred_audit.jsp','com.byttersoft.cms.form.CmsPreDeferredForm';
  END;
END;
GO

--�޸�����:ί�д������Ϣ�鿴��ͼ
--�޸���:����
--�޸�ʱ��:2012-12-7
create view v_cms_pre_loan_send_info as
select send.BILL_CODE            send_BILL_CODE,        --���ű�ţ�������
       info.BILL_CODE            info_bill_code,        --ί�д���¼�뵥��
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --ί���˵�λId
       info.CURRENCY             info_CURRENCY,         --�ұ����
       info.TERM                 info_TERM,             --��������
       info.MONEY                info_MONEY,            --������
       info.ENTER_DATE           info_ENTER_DATE,       --����¼������
       info.hypothec_code        info_hypothec_code,    --������ʽ����
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --���ű�ţ����룩
       send.MONEY                send_MONEY,            --���Ž��
       send.SEND_DATE            send_SEND_DATE,        --��������
       send.STATUS               send_STATUS,           --����״̬
       cur.cur_name,                                    --�ұ�����
       temp.USEDMONEY,                                  --�ѷ��Ž��
       corp.corp_name precative_corp_name,              --ί��������
       typ.type_name                                    --������ʽ����
  from cms_precative_loan_send send
  left join cms_precative_loan_info info on  info.bill_code = send.father_code
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code = info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code;
GO
 
 --�޸�����:����ί�д���չ��������ͼ
--�޸���:�ž���
--�޸�ʱ��:2012-12-7
create view V_PRECATIVE_LOAN_SEND_DEFERRED as
select * from (
      select app.BILL_CODE            app_bill_code,        --ί�д���¼�뵥��
             app.PRECATIVE_ID         app_PRECATIVE_ID,     --ί���˵�λId
             app.CORP_ID              app_CORP_ID,          --�����˵�λid
             app.Loan_Opp             app_loan_Opp,         --����˵�λid���������
             app.CURRENCY             app_CURRENCY,         --�ұ����
             app.TERM                 app_TERM,             --��������
             app.MONEY                app_MONEY,            --������
             app.ENTER_DATE           app_ENTER_DATE,       --����¼������
             app.hypothec_code        app_hypothec_code,    --������ʽ����
             typ.type_name            app_hypothec_Name,    --������ʽ����
             send.corp_id             corp_id,         --��λ
             send.BILL_CODE           BILL_CODE,       --���ű�ţ�������
             send.CONTRACT_CODE       CONTRACT_CODE,   --���ű�ţ����룩
             send.MONEY               MONEY,           --���Ž��
             send.SEND_DATE           SEND_DATE,       --��������
             send.STATUS              STATUS,          --����״̬
             send.DEADLINE_DATE       DEADLINE_DATE,    --��������
             send.ENTER_DATE,                            --¼������
             send.term,                                  --����
             isnull(repay.repay_money,0) repay_money        --�ѻ����
        from cms_precative_loan_send send
        --���ͬʱֻ����һ�����ż�¼��ҵ����
        join cms_precative_loan_info app on app.bill_code = send.father_code
        left join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=app.hypothec_code
        left join (select lr.pl_code, sum(lr.money) repay_money
                    from CMS_PRECATIVE_LOAN_REPAY lr where lr.status >= 102
                   group by lr.pl_code) repay on send.Bill_Code = repay.pl_code 
        where send.status in(102,103) --�Ѽ���
              and not exists (select plr.bill_code from CMS_PRECATIVE_LOAN_REPAY plr where plr.pl_code=send.bill_code and plr.status>=0 and plr.status<102) --���ڻ�����
              --չ�ڻ���Ҫ��ʾ��������
              --and not exists (select pd.bill_code from CMS_PRE_DEFERRED pd where send.bill_code=pd.pli_code and (pd.status > -2 and pd.status < 102)) --����չ����
        ) sd
        --�ſû����
        where sd.money > sd.repay_money; 
GO
