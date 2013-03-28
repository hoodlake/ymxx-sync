--�޸ı�

--�ļ��ϴ���¼������ Ψһ�ļ����ֶΣ��� java.uuid ����
alter table cms_precative_upload_file 
add UNIONFILENAME varchar(36);
go

--ί�д����������ֶ� ����ƻ�ID
alter table CMS_PRECATIVE_LOAN_REPAY
add REPAYMENT_SCHEDULE_ID NUMeric(10);
go


--ί�д���������ֶ� ������Ϣ
alter table CMS_PRECATIVE_LOAN_REPAY 
add REPAY_MONEY_RATE NUMeric(10,2);
go

--�½��� CMS_PRECATIVE_LOAN_CCAL ί�д���������Ϣ
--������
create table CMS_PRECATIVE_LOAN_SEND
(
  BILL_CODE                CHAR(13) not null,
  PRECATIVE_ID             NUMeric(10) not null,
  FATHER_CODE              VARCHAR(13),
  CONTRACT_CODE            VARCHAR(20),
  MONEY                    NUMeric(15,2) not null,
  RATE                     NUMeric(8,6),
  SEND_DATE                DATEtime not null,
  DEADLINE_DATE            DATEtime not null,
  REPAY_TYPE               CHAR(2) not null,
  OP                       VARCHAR(8) not null,
  NEXT_CHECKER             VARCHAR(150),
  APPROVES                 VARCHAR(200),
  STATUS                   NUMeric not null,
  ENTER_DATE               DATEtime not null,
  RMK                      VARCHAR(400),
  VOUCHER_NO               CHAR(15),
  ORDER_NO                 CHAR(36),
  TALLIER_CODE             CHAR(8),
  DEPOSIT_ACC              VARCHAR(50),
  VOUCHER_NO2              CHAR(15),
  VOUCHER_NO1              CHAR(15),
  LOAN_ACC                 VARCHAR(50),
  FLOAT_WAY                VARCHAR(15),
  RATE_ENTRIES_EFFECT_DATE DATEtime,
  INTEREST_WAY             VARCHAR(15),
  REFERENCE_RATE_TYPE      VARCHAR(50),
  REPAY_CYCLE              VARCHAR(50),
  POINTS_PROPORTION_SELECT VARCHAR(50),
  POINTS_PROPORTION_TEXT   NUMeric(15,2),
  TERM                     NUMeric,
  CORP_ID                  NUMeric(10),
  SEND_TIME                NUMeric(10)
);
go 
  
alter table CMS_PRECATIVE_LOAN_SEND
  add constraint PK_CMS_PRECATIVE_LOAN_SEND primary key (BILL_CODE);
go

create index INDEX_CMS_PRECATIVE_LOAN_SEND on CMS_PRECATIVE_LOAN_SEND (BILL_CODE, STATUS, NEXT_CHECKER, APPROVES);

go


IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_CMS_PRECATIVE_LOAN_INFO')
DROP VIEW V_CMS_PRECATIVE_LOAN_INFO
go
--�½���ͼ
CREATE  VIEW V_CMS_PRECATIVE_LOAN_INFO AS
select info.BILL_CODE,
       info.PD_CODE,
       info.PRECATIVE_ID,
       info.CORP_ID,
       info.CONTRACT_CODE,
       info.POUNDAGE,
       info.LOAN_OPP,
       info.PURPOSE,
       info.CURRENCY,
       info.TERM,
       info.RATE,
       info.MONEY,
       info.HYPOTHEC_CODE,
       info.SURETY_EXPLAIN,
       info.REPAIR_OP,
       info.END_DATE,
       info.START_DATE,
       info.OP,
       info.NEXT_CHECKER,
       info.APPROVES,
       info.STATUS,
       info.ENTER_DATE,
       info.RMK,
       info.VOUCHER_NO,
       info.REVERSE1,
       info.REVERSE2,
       info.REVERSE3,
       info.REVERSE4,
       info.REVERSE5,
       info.REVERSE6,
       info.REVERSE7,
       info.REVERSE8,
       info.REVERSE9,
       info.REVERSE10,
       info.ORDER_NO,
       info.TALLIER_CODE,
       info.POUNDAGE_RATE,
       info.DEPOSIT_ACC,
       info.VOUCHER_NO2,
       info.VOUCHER_NO1,
       info.LOAN_ACC,
       info.IS_BANK,
       info.APP_CODE,
       info.BANK_CODE,
       info.GUA_HYPOTHEC_CODE,
       info.REPAY_TYPE,
       info.INTEREST_WAY,
       info.LOAN_SEND_OUT_TYPE,
       info.SKIP_LOAN_SEND_OUT,
       info.FLOAT_WAY,
       info.RATE_ENTRIES_EFFECT_DATE,
       info.REFERENCE_RATE_TYPE,
       info.REPAY_CYCLE,
       info.POINTS_PROPORTION_SELECT,
       info.POINTS_PROPORTION_TEXT,
       corp1.corp_code precative_id_corp_code,
       corp1.corp_name precative_id_corp_name,
       corp3.corp_code corp_id_corp_code,
       corp3.corp_name corp_id_corp_name,
       corp2.corp_code loan_opp_corp_code,
       corp2.corp_name loan_opp_corp_name,
       bank.bank_name,
       cur.cur_name,
       typ.type_name
  from cms_precative_loan_info info
 inner join bt_corp corp1 on corp1.id = info.precative_id --ί�з�
 inner join bt_corp corp2 on corp2.id = info.loan_opp --�����������
  left join bt_corp corp3 on corp3.id = info.corp_id --���з��������is_bank=1, ���з�������
  left join bt_bank bank on bank.bank_code = info.bank_code --�������з�
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join cms_provide_loan_type typ on typ.type_code = info.hypothec_code
                                     and typ.operation_type = 'C';
go



IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='V_CMS_PRECATIVE_LOAN_SEND')
DROP VIEW V_CMS_PRECATIVE_LOAN_SEND
go
CREATE  VIEW V_CMS_PRECATIVE_LOAN_SEND AS
select send.BILL_CODE,
       send.PRECATIVE_ID,--ί�з�
       send.FATHER_CODE,
       send.CONTRACT_CODE,
       send.MONEY,
       send.RATE,
       send.SEND_DATE,
       send.DEADLINE_DATE,
       send.REPAY_TYPE,
       send.OP,
       send.NEXT_CHECKER,
       send.APPROVES,
       send.STATUS,
       send.ENTER_DATE,
       send.RMK,
       send.VOUCHER_NO,
       send.ORDER_NO,
       send.TALLIER_CODE,
       send.DEPOSIT_ACC,
       send.VOUCHER_NO2,
       send.VOUCHER_NO1,
       send.LOAN_ACC,
       send.FLOAT_WAY,
       send.RATE_ENTRIES_EFFECT_DATE,
       send.INTEREST_WAY,
       send.REFERENCE_RATE_TYPE,
       send.REPAY_CYCLE,
       send.POINTS_PROPORTION_SELECT,
       send.POINTS_PROPORTION_TEXT,
       send.TERM,
       cur.cur_code,
       cur.cur_name,
       corp1.corp_code,
       corp1.corp_name,
       corp2.corp_code  corp_id_corp_code,
       corp2.corp_name  corp_id_corp_name,
       corp3.corp_code  loan_opp_corp_code,
       corp3.corp_name  loan_opp_corp_name,
       usr.user_code,
       usr.user_name,
       typ.type_code,
       typ.type_name,
       info.hypothec_code,
       info.purpose,
       info.pd_code,
       info.loan_send_out_type,
       info.skip_loan_send_out,
       info.gua_hypothec_code,
       info.bank_code,
       info.app_code,
       info.is_bank,
       info.repair_op,
       info.surety_explain,
       info.poundage_rate,
       info.poundage,
       info.corp_id,--���з�
       info.loan_opp,--�����
       bank.bank_name --������
  from cms_precative_loan_send send
   inner join   cms_precative_loan_info info   on send.father_code = info.bill_code
   inner join    bt_corp                 corp1 on info.precative_id = corp1.id
   left join    bt_corp                 corp2 on info.corp_id=corp2.id
   inner join    bt_corp                 corp3 on info.loan_opp=corp3.id
   inner join    bt_currency             cur   on info.currency = cur.cur_code
   inner join    cms_provide_loan_type   typ   on info.hypothec_code = typ.type_code and typ.operation_type = 'C'
   inner join    bt_user                 usr   on send.op = usr.user_code
   left  join    bt_bank                  bank on bank.bank_code=info.bank_code;
go


IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='v_cms_precative_loan_send_info')
DROP VIEW v_cms_precative_loan_send_info
go
create  view v_cms_precative_loan_send_info as
select info.BILL_CODE            info_bill_code,        --ί�д���¼�뵥��
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --ί���˵�λId
       info.CURRENCY             info_CURRENCY,         --�ұ����
       info.TERM                 info_TERM,             --��������
       info.MONEY                info_MONEY,            --������
       info.ENTER_DATE           info_ENTER_DATE,       --����¼������
       info.hypothec_code        info_hypothec_code,    --������ʽ����
       send.BILL_CODE            send_BILL_CODE,        --���ű�ţ�������
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --���ű�ţ����룩
       send.MONEY                send_MONEY,            --���Ž��
       send.SEND_DATE            send_SEND_DATE,        --��������
       send.STATUS               send_STATUS,           --����״̬
       temp.USEDMONEY,                                  --�ѷ��Ž��
       cur.cur_name,                                    --�ұ�����
       corp.corp_name precative_corp_name,              --ί��������
       typ.type_name                                    --������ʽ����
  from cms_precative_loan_info info
  --���ͬʱֻ����һ�����ż�¼��ҵ����
  left join cms_precative_loan_send send on  info.bill_code =
                                            send.father_code
                                        and send.status >= -1
                                        and send.status < 102 --102�������
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code =
                                            info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code
 where info.status = 97 --��¼���
   and (temp.usedmoney < info.money or temp.usedmoney is null) --���Ž��δ��;
;
go


--�˵�  �Ŵ�����>>ί�д���>>ί�д����

DECLARE
  @VN_COUNT    NUMeric;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    FROM bt_sys_res t1 WHERE t1.sys_code='cms' AND t1.res_name='ί�д����' AND t1.res_url='/cms/cmsPrecativeLoanSendAction.do?method=goMainPage';
  IF @VN_COUNT < 1 
  begin
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  select  (select max(res_code)+1 from bt_sys_res) , 'ί�д����', 'cms', (select res_code from bt_sys_res where sys_code='cms' and res_name='ί�д���' and father_code=0), '/cms/cmsPrecativeLoanSendAction.do?method=goMainPage', '0', '0', '0', '0', 9, '��Զ', '', '', '', '', '', null, null, null, null, null, 1, ''
   from bt_sys_res  where res_name = 'ί�д���' and sys_code = 'cms' and father_code=0;
  END;
   
END;
go

--����ҵ��  cms_C3 ί�д����

DECLARE
  @VN_COUNT    NUMeric;
BEGIN
  SELECT @VN_COUNT=COUNT(*)
    from bt_approve_business where business_code='cms_C3';
  IF @VN_COUNT < 1 
  begin
    insert into bt_approve_business (business_code,sys_code,business_name,business_level,table_name,money_field,next_checker_field,bill_code_field,url1,class_path)
	select 'cms_C3','cms','ί�д����','A,B,C','cms_precative_loan_send','money','next_checker','bill_code','../cms/cmsPrecativeLoanSendShow.jsp','com.byttersoft.cms.form.CmsPrecativeLoanSendForm'
	;
  END; 
END;
go

--����������
DECLARE
 @VN_count NUMeric,
 @maxId   NUMeric    ;
begin 
 select @VN_count=count(*) 
 from bt_key_generator where keyalisename='CMS_PRECATIVE_LOAN_SEND' and genstrate='cu';
 if @VN_count<1 
 begin
	 select @maxId=max(id)+1 from bt_key_generator;
    insert into bt_key_generator(id,keyalisename,custgenclass,genstrate)
    values(@maxId,'CMS_PRECATIVE_LOAN_SEND','com.byttersoft.keyservice.usrdefgenerator.CmsPrecativeLoanSendKeyGenerator','cu');
  end ;
  
end; 
go


--���������ݴ���װ����send ����
insert into cms_precative_loan_send
  (bill_code,
   precative_id,
   father_code,
   contract_code,
   money,
   rate,
   send_date,
   deadline_date,
   repay_type,
   op,
   next_checker,
   approves,
   status,
   enter_date,
   rmk,
   voucher_no,
   order_no,
   tallier_code,
   deposit_acc,
   voucher_no2,
   voucher_no1,
   loan_acc,
   float_way,
   rate_entries_effect_date,
   interest_way,
   reference_rate_type,
   repay_cycle,
   points_proportion_select,
   points_proportion_text,
   term,
   corp_id,
   send_time) 
  select info.bill_code,
         info.precative_id,
         info.bill_code,
         info.contract_code,
         info.money,
         info.rate,
         info.start_date,
         info.end_date,
         '02',--�����ݵĻ��ʽȫ�Ƕ�λ���
         info.op,
         info.next_checker,
         info.approves,
         info.status,
         info.enter_date,
         info.rmk,
         info.voucher_no,
         info.order_no,
         info.tallier_code,
         info.deposit_acc,
         info.voucher_no2,
         info.voucher_no1,
         info.loan_acc,
          '01', --������ʽ�̶�01 �̶�����
         info.rate_entries_effect_date,
          '01', --��Ϣ��ʽ�̶� 01 ������Ϣ
         info.reference_rate_type,
         info.repay_cycle,
         info.points_proportion_select,
         convert(int,info.points_proportion_text),
         info.term,
         info.corp_id,
         1 --���Ŵ����̶�1
    from cms_precative_loan_info info 
    where info.status>=97  --��¼����Ժ������
    and info.loan_send_out_type is null --������֮ǰ�����ݴ��ֶ�һ��Ϊ��
    and info.bill_code not in(select father_code from cms_precative_loan_send) --�ڷ��ű����޷�����ϸ
;
go

