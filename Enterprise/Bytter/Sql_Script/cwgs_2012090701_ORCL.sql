-- �޸����ڣ�201207701
-- �޸��ˣ�������
--�޸����ݣ��л���ƿ�Ŀ�ӳ�

---һ����Ŀ�ӳ�����Ϊ20λ��varchar2(20):
--sql:
alter table  AQS_RATE_ANALYSE_SUBJECT  modify  SUBJECT_CODE  varchar2(20);
alter table  DECISION_FUNC_VALUE  modify  SUBJECT_CODE  varchar2(20);
alter table  DECISION_FUNC_VALUE  modify  OPP_SUBJECT_CODE  varchar2(20);
alter table  DECISION_REPORT_DTL  modify  SUBJECT_CODE  varchar2(20);
alter table  DECISION_REPORT_DTL  modify  OPP_SUBJECT_CODE varchar2(20);
alter table  FC_ACC  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_ACC_HISTORY  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_MONTH_LEDGER  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_SUBJECT  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_SUBJECT_CASH  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_SUBJECT_DAY  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_SUBJECT_INIT  modify  SUBJECT_CODE  varchar2(20);
alter table  NC_ACC  modify  SUBJECT_CODE  varchar2(20);
alter table  U8_ACC  modify  SUBJECT_CODE  varchar2(20);
alter table  FC_REPORT_FORMAT  modify  SUBJECT  varchar2(20);
alter table  FQS_TEMPLET  modify  SUBJECT1  varchar2(20);

---�����ڲ��˺���ر� ��Ϊ50λ��varchar2(50):
alter table  FC_ACC_ATTRI drop constraint FK_FC_ACC_A_REFERENCE_FC_ACC;
alter table  FC_AGREED_DEPOSIT drop constraint FK_FC_AGREE_REFERENCE_FC_ACC;

alter table   FC_ACC modify BLNCTR_ACC varchar2(50);
alter table   FC_AGREED_DEPOSIT modify BLNCTR_ACC varchar2(50);
alter table   FC_ACC_ATTRI modify BLNCTR_ACC varchar2(50);

alter table FC_ACC_ATTRI
  add constraint FK_FC_ACC_A_REFERENCE_FC_ACC foreign key (BLNCTR_ACC)
  references FC_ACC (BLNCTR_ACC);
  
alter table FC_AGREED_DEPOSIT
  add constraint FK_FC_AGREE_REFERENCE_FC_ACC foreign key (BLNCTR_ACC)
  references FC_ACC (BLNCTR_ACC);
--sql:
alter table   FC_ACC modify BLNCTR_ACC varchar2(50);
alter table   FC_AGREED_DEPOSIT modify BLNCTR_ACC varchar2(50);
alter table   FC_ACC_ATTRI modify BLNCTR_ACC varchar2(50);
alter table   FC_ACC modify ACC_FOR_DEDUCT varchar2(50);
alter table   FC_ACC modify ACC_CUSSENT varchar2(50);
alter table   FC_ACC modify UNION_ACC varchar2(50);
alter table   FC_ACC modify PRECATION_ACC varchar2(50);
alter table   FC_ACC_HISTORY modify BLNCTR_ACC varchar2(50);
alter table   FC_ACC_HISTORY modify ACC_FOR_DEDUCT varchar2(50);
alter table   FC_ACC_HISTORY modify ACC_CUSSENT varchar2(50);
alter table   FC_ACC_HISTORY modify PRECATION_ACC varchar2(50);
alter table   FC_FIXED_DEPOSIT_BUS modify BLNCTR_ACC varchar2(50);
alter table   FC_FREEZE modify BLNCTR_ACC varchar2(50);
alter table   NC_ACC modify BLNCTR_ACC varchar2(50);
alter table   U8_ACC modify BLNCTR_ACC varchar2(50);
alter table   FC_ACC_ATTRI modify ATTRIBUTE_ACC varchar2(50);
alter table   BT_BANK_ACC modify BALANCE_ACCOUNT varchar2(50);           
alter table   BT_NET_CHALK modify CNT_ACCOUNT varchar2(50);
alter table   CGS_BILL modify PAYER_ACCOUNTS varchar2(50);    
alter table   CGS_BILL modify PAYEE_ACCOUNTS varchar2(50); 
alter table   CMS_PROVIDE_LOAN_INFO modify PL_ACCOUNT varchar2(50);
alter table   E_COMPARE_BILL modify ACCOUNT varchar2(50);
alter table   E_COMPARE_BILL_HIS modify ACCOUNT varchar2(50);
alter table   E_COMPARE_BILL_PRINT modify ACCOUNT varchar2(50);
alter table   E_COMPARE_BILL_PRINT_HIS modify ACCOUNT varchar2(50);
alter table   FC_ACCBOOK_BLNED_DTL modify ACCOUNT varchar2(50);
alter table   FC_ACCBOOK_DTL modify ACCOUNT varchar2(50);
alter table   FC_ACCBOOK_HIS_DTL modify ACCOUNT varchar2(50);
alter table   FC_ACCU_BALANCE modify ACCOUNT varchar2(50);
alter table   FC_ACCU_BALANCE_PREDRAW modify ACCOUNT varchar2(50);
alter table   FC_ACC_BALANCE modify ACCOUNT varchar2(50);
alter table   FC_ACC_BALANCE_PREDRAW modify ACCOUNT varchar2(50);
alter table   FC_ACC_COMPARISON modify ACCOUNT varchar2(50);
alter table   FC_ACC_GRANT modify ACCOUNT varchar2(50);   
alter table   FC_ACC_MONTH_BALANCE modify ACCOUNT varchar2(50);
alter table   FC_ACC_RATION_TYPE modify ACCOUNT varchar2(50);
alter table   FC_BANK_BALANCE modify ACCOUNT varchar2(50);
alter table   FC_BANK_BALANCE_ADJUST modify ACCOUNT varchar2(50);
alter table   FC_BANK_BILL modify ACCOUNT varchar2(50);
alter table   FC_BANK_BLNCTR_FORMAT modify ACCOUNT varchar2(50);
alter table   FC_BILL_FORMAT modify LEFT_PAYEE_ACCOUNT varchar2(50); 
alter table   FC_BILL_FORMAT modify LEFT_PAYER_ACCOUNT varchar2(50);  
alter table   FC_BILL_FORMAT modify RIGHT_PAYEE_ACCOUNT varchar2(50);  
alter table   FC_BILL_FORMAT modify RIGHT_PAYER_ACCOUNT varchar2(50); 
alter table   FC_CHECK_INIT modify ACCOUNT varchar2(50);     
alter table   FC_COMPARE_ACC modify ACCOUNT varchar2(50);
alter table   FC_DRAW_NOTICE modify ACCOUNT varchar2(50);
alter table   FC_HAND_CHARGE_ACC modify ACCOUNT varchar2(50);
alter table   FC_INIT_ACC modify ACCOUNT varchar2(50);
alter table   FC_INSTRATE_ADJUST modify ACCOUNT varchar2(50); 
alter table   FC_INTEREST_DTL modify ACCOUNT varchar2(50);
alter table   FC_ONLINE_LEDGER modify ACCOUNT varchar2(50);
alter table   FC_PREDRAW_DTL modify ACCOUNT varchar2(50);
alter table   FC_PRE_ACCBOOK_DTL modify ACCOUNT varchar2(50);
alter table   NE_INTERFACE_CHALK modify CNT_ACCOUNT varchar2(50);
alter table   NIS_RECEIVE_MSG modify ACCOUNT varchar2(50);
alter table   BIS_ACC_LIST modify COUNTER_ACC varchar2(50);
alter table   BIS_EXC modify COUNTER_ACC varchar2(50);         
alter table   BT_BANK_ACC modify COUNTER_ACC varchar2(50);
alter table   FC_COUNTER_EXC modify COUNTER_ACC varchar2(50);
alter table   BIS_ABC_STAND_BY_QRY modify  ACC varchar2(50); 
alter table   BIS_BILL modify ACC_CODE varchar2(50);          
alter table   BT_NET_VOUCHER modify ORIGINAL_ACC varchar2(50);
alter table   CMS_LOAN_DEFERRED modify LOAN_ACC varchar2(50);
alter table   CMS_LOAN_INFO modify LOAN_ACC varchar2(50);
alter table   CMS_LOAN_INFO modify REPAY_ACC varchar2(50);
alter table   CMS_LOAN_INFO modify NET_ACC varchar2(50);
alter table   CMS_LOAN_INFO modify PROVIDE_LOAN_ACC varchar2(50);
alter table   CMS_LOAN_INFO_NEXTNET modify  LOAN_ACC varchar2(50);
alter table   CMS_LOAN_INFO_NEXTNET modify REPAY_ACC varchar2(50);
alter table   CMS_LOAN_INFO_NEXTNET modify NET_ACC varchar2(50);
alter table   CMS_LOAN_REPAY modify LOAN_ACC varchar2(50);
alter table   CMS_LOAN_REPAY modify REPAY_ACC varchar2(50);
alter table   CMS_LOAN_REPAY_NEXTNET modify LOAN_ACC varchar2(50);
alter table   CMS_LOAN_REPAY_NEXTNET modify REPAY_ACC varchar2(50);
alter table   CMS_PL_DEFERRED modify ACC_CODE varchar2(50);
alter table   CMS_PRECATIVE_DEPOSIT_INFO modify DEPOSIT_ACC varchar2(50);
--alter table   CMS_PRECATIVE_DEPOSIT_INFO modify LOAN_ACC varchar2(50);
alter table   CMS_PROVIDE_LOAN_INFO modify ACC_CODE varchar2(50);
alter table   CMS_PROVIDE_LOAN_REPAY modify ACC_CODE varchar2(50);
alter table   E_LOAN_BILL modify DEPOSIT_ACC varchar2(50);
alter table   E_LOAN_BILL_HIS modify DEPOSIT_ACC varchar2(50);
alter table   FC_ACC_WRITEOFF modify WRITEOFF_ACC varchar2(50);
alter table   FC_CARRY modify CARRY_ACC varchar2(50);
alter table   FC_CHARGE_DTL modify DEBIT_ACC varchar2(50);
alter table   FC_RCV_REG modify BLNCTR_CURRENT_ACC varchar2(50);
alter table   FC_UNION_ACCBOOK modify SEND_ACC varchar2(50);
alter table   FC_UNION_ACCBOOK modify RECEIVE_ACC varchar2(50);

---��ӣ�
alter table   CMS_PRECATIVE_LOAN_INFO modify LOAN_ACC varchar2(50);
alter table   CGS_BILL modify NET_ACC varchar2(50);
alter table   nis_billhead modify NET_ACC varchar2(50);

alter table   CMS_PRECATIVE_LOAN_INFO modify DEPOSIT_ACC varchar2(50);

--����ժҪ�ӳ�VARCHAR2(200): 
--sql:
alter table BT_BANKACC_FUNDP_DTL modify SUMMARY_CONTENT VARCHAR2(200);
alter table BT_SUMMARY modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_ACCBOOK_BLNED_DTL modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_ACCBOOK_DTL modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_ACCBOOK_HIS_DTL modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_AUTO_SUMMARY modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_COMPARE_ACC modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_PRE_ACCBOOK_DTL modify SUMMARY_CONTENT VARCHAR2(200);
alter table FC_UNION_ACCBOOK modify SUMMARY_CONTENT VARCHAR2(200);
alter table NIS_RECEIVE_MSG modify SUMMARY_CONTENT VARCHAR2(200);
alter table E_NOTICE_BILL modify PURPOSE VARCHAR2(200); 
alter table E_POUNDAGE_BILL modify PURPOSE VARCHAR2(200);
alter table E_consign_bill modify  PURPOSE VARCHAR2(200);
alter table E_POUNDAGE_BILL modify  PURPOSE VARCHAR2(200);
alter table e_accept_bill modify  PURPOSE VARCHAR2(200);
alter table e_compare_bill modify  SUMMARY_COMMENT VARCHAR2(200);
alter table E_EXCHANGE_BILL modify  PURPOSE VARCHAR2(200);

---�ġ��洢����
 


CREATE OR REPLACE PROCEDURE P_BANK_CHECK (A_MODE CHAR,
                                          A_ACCOUNT CHAR,
                                          A_END VARCHAR2)
AS
 V_NEXT_DATE      DATE;
 V_TALLY_DATE     DATE;
 V_DEBIT_MONEY    NUMBER(14,2);
 V_CREDIT_MONEY   NUMBER(14,2);
 V_VOUCHER_ORDER_NO CHAR(18);
 V_BANK_ID        VARCHAR2(50);
 V_LINE_NO        INT;
 V_BILL_NO        VARCHAR2(30);
 V_IMPORT_TYPE    CHAR(1);
 V_TODAY          DATE;
 V_END_DATE       DATE;
 V_ERR            VARCHAR2(500);
 V_CNT            INT;
 V_ACCOUNT        VARCHAR2(50);

 CURSOR CUR_BANK_BILL IS
        SELECT TALLY_DATE,ACCOUNT,DEBIT_MONEY,CREDIT_MONEY,BANK_ID,BILL_NO ,IMPORT_TYPE
        FROM FC_BANK_BILL
        WHERE TALLY_DATE < V_NEXT_DATE AND
              ACCOUNT = V_ACCOUNT AND
              COMPARE_SIGN = 0;

BEGIN
 V_ACCOUNT := A_ACCOUNT   ;
 V_END_DATE := TO_DATE(A_END,'YYYY-MM-DD');
 V_TODAY := TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'),'YYYY-MM-DD');
 V_NEXT_DATE  := TO_DATE(TO_CHAR(V_END_DATE + 1,'YYYY-MM-DD'),'YYYY-MM-DD');
 BEGIN
   SELECT COUNT(*)
     INTO V_CNT
     FROM FC_BANK_BALANCE_ADJUST
    WHERE ACCOUNT = V_ACCOUNT AND END_DATE =  V_TODAY;
 EXCEPTION
    WHEN OTHERS THEN
         NULL;
 END ;

 IF V_CNT > 0 THEN
    V_ERR := '�˺�'|| V_ACCOUNT||'��'||TO_CHAR( V_TODAY,'YYYY-MM-DD')|| '�Ѿ�������������Ϣ��';
    RAISE_APPLICATION_ERROR(-20001,V_ERR);
    RETURN;
 END IF;
 --ת���������֮ǰ��δ���˵���������
 BEGIN
   UPDATE FC_COMPARE_ACC SET COMPARE_SIGN = '0'
        WHERE TALLY_DATE < V_NEXT_DATE
              AND ACCOUNT = V_ACCOUNT
              AND COMPARE_SIGN IS NULL;
 EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001,'�������Ķ��˱����!');
 END;



 --ת���������֮ǰ��δ���˵���������
 BEGIN
  UPDATE FC_BANK_BILL SET COMPARE_SIGN = '0'
     WHERE TALLY_DATE < V_NEXT_DATE
           AND ACCOUNT = V_ACCOUNT
           AND COMPARE_SIGN IS NULL;
 EXCEPTION
    WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-2001,'�������ж��˱����!');
 END;


 --�������

 OPEN CUR_BANK_BILL ;
 FETCH CUR_BANK_BILL INTO V_TALLY_DATE,V_ACCOUNT,V_DEBIT_MONEY,V_CREDIT_MONEY,V_BANK_ID,V_BILL_NO,V_IMPORT_TYPE;

 WHILE CUR_BANK_BILL%FOUND LOOP
   BEGIN
      V_CNT := 0;
      IF A_MODE = '1' THEN--�������ڣ�������
         BEGIN
           SELECT COUNT(*),VOUCHER_ORDER_NO,LINE_NO INTO V_CNT,V_VOUCHER_ORDER_NO,V_LINE_NO
              FROM FC_COMPARE_ACC
              WHERE ACCOUNT = V_ACCOUNT
                    AND TALLY_DATE < V_NEXT_DATE --TO_DATE('2004-10-09','YYYY-MM-DD')
                    AND COMPARE_SIGN = '0'
                    AND DEBIT_MONEY = V_CREDIT_MONEY
                    AND CREDIT_MONEY = V_DEBIT_MONEY
                    AND ROWNUM = 1
              GROUP BY VOUCHER_ORDER_NO,LINE_NO;
         EXCEPTION
           WHEN OTHERS THEN
                NULL;
         END;

         IF V_CNT > 0  THEN

             --��������ϸ��־�����ұ����Ӧ��������ϸ�ı��

            BEGIN
               UPDATE FC_COMPARE_ACC
                    SET COMPARE_SIGN = '1',
                        IMPORT_TYPE = V_IMPORT_TYPE,
                        BANK_ID = V_BANK_ID,
                        ADJUST_DATE =  V_END_DATE
                 WHERE  VOUCHER_ORDER_NO = V_VOUCHER_ORDER_NO
                   AND  LINE_NO = V_LINE_NO
                   AND  ACCOUNT = V_ACCOUNT ;

            EXCEPTION
                WHEN OTHERS THEN
                     NULL;
            END;

             --��������ϸ��־�����ұ������Ķ�Ӧ����ϸ�ı��
            BEGIN
               UPDATE FC_BANK_BILL
                 SET COMPARE_SIGN = '1',
                     VOUCHER_ORDER_NO = V_VOUCHER_ORDER_NO,
                     LINE_NO = V_LINE_NO,
                     ADJUST_DATE =  V_END_DATE
                WHERE BANK_ID = V_BANK_ID
                      AND IMPORT_TYPE = V_IMPORT_TYPE;

            EXCEPTION
               WHEN OTHERS THEN
                    NULL;
            END;
         END IF ;
      ELSE --�������ڣ��������Ʊ�ݺ���
         BEGIN
             SELECT COUNT(*),VOUCHER_ORDER_NO,LINE_NO INTO V_CNT,V_VOUCHER_ORDER_NO,V_LINE_NO
              FROM FC_COMPARE_ACC
              WHERE ACCOUNT = V_ACCOUNT
                    AND TALLY_DATE < V_NEXT_DATE
                    AND COMPARE_SIGN = '0'
                    AND DEBIT_MONEY = V_CREDIT_MONEY
                    AND CREDIT_MONEY = V_DEBIT_MONEY
                    AND BILL_NO = V_BILL_NO
                    AND ROWNUM = 1
              GROUP BY VOUCHER_ORDER_NO,LINE_NO;

         EXCEPTION
            WHEN OTHERS THEN
                 NULL;
         END;
         IF V_CNT > 0 THEN

              --��������ϸ��־�����ұ����Ӧ��������ϸ�ı��
              BEGIN
                 UPDATE FC_COMPARE_ACC
                      SET  COMPARE_SIGN = '1',
                           BANK_ID = V_BANK_ID,
                           IMPORT_TYPE = V_IMPORT_TYPE,
                           ADJUST_DATE =  V_END_DATE
                    WHERE  VOUCHER_ORDER_NO = V_VOUCHER_ORDER_NO
                     AND   LINE_NO = V_LINE_NO
                     AND   ACCOUNT = V_ACCOUNT ;
              EXCEPTION
                 WHEN OTHERS THEN
                      NULL;
              END;

              --��������ϸ��־�����ұ������Ķ�Ӧ����ϸ�ı��
              BEGIN
                 UPDATE FC_BANK_BILL
                     SET  COMPARE_SIGN = '1',
                          VOUCHER_ORDER_NO = V_VOUCHER_ORDER_NO,
                          LINE_NO = V_LINE_NO,
                          ADJUST_DATE =  V_END_DATE
                  WHERE   BANK_ID = V_BANK_ID
                      AND IMPORT_TYPE = V_IMPORT_TYPE;
              EXCEPTION
                 WHEN OTHERS THEN
                      NULL;
              END;
         END IF;
      END IF;
      FETCH CUR_BANK_BILL INTO V_TALLY_DATE,V_ACCOUNT,V_DEBIT_MONEY,V_CREDIT_MONEY,V_BANK_ID,V_BILL_NO,V_IMPORT_TYPE;
    END;
 END LOOP;
 CLOSE CUR_BANK_BILL ;


 --���������ڱ�
 BEGIN
    INSERT INTO FC_BANK_BALANCE_ADJUST(ACCOUNT,BANK_BALANCE,BANK_DEBIT,BANK_CREDIT,BLN_BALANCE,BLN_DEBIT,BLN_CREDIT,ADJUST_DATE,BANK_NO,BLN_NO,END_DATE,TALLY_DATE_BANK,TALLY_DATE_FC)
           SELECT ACCOUNT,BALANCE,DEBIT_MONEY,CREDIT_MONEY,0,0,0, V_TODAY,BILL_NO,NULL,V_END_DATE,TALLY_DATE,NULL
            FROM  FC_BANK_BILL
            WHERE ACCOUNT = V_ACCOUNT
                  AND TALLY_DATE < V_NEXT_DATE
                  AND COMPARE_SIGN = '0' ;
 EXCEPTION
    WHEN OTHERS THEN
         ROLLBACK ;
         --RAISE_APPLICATION_ERROR(-20001, SQLERRM);
         RAISE_APPLICATION_ERROR(-20001, '������������δ������ϸ��¼ʧ�ܣ�');
         RETURN ;
 END;


 BEGIN
    INSERT INTO  FC_BANK_BALANCE_ADJUST(ACCOUNT,BANK_BALANCE,BANK_DEBIT,BANK_CREDIT,BLN_BALANCE,BLN_DEBIT,BLN_CREDIT,ADJUST_DATE,BANK_NO,BLN_NO,END_DATE,TALLY_DATE_BANK,TALLY_DATE_FC)
           SELECT ACCOUNT,0,0,0,BALANCE,DEBIT_MONEY,CREDIT_MONEY, V_TODAY,NULL,BILL_NO,V_END_DATE,NULL,TALLY_DATE
           FROM FC_COMPARE_ACC
           WHERE TALLY_DATE < V_NEXT_DATE AND
                 ACCOUNT = V_ACCOUNT AND
                 COMPARE_SIGN = '0';
 EXCEPTION
    WHEN OTHERS THEN
         ROLLBACK ;
         --RAISE_APPLICATION_ERROR(-20001, SQLERRM);
         --'�������ӽ�������δ������ϸ��¼ʧ�ܣ�');
         RAISE_APPLICATION_ERROR(-20001, '������������δ������ϸ��¼ʧ�ܣ�');
         RETURN;
 END;


END P_BANK_CHECK;
/
  

CREATE OR REPLACE PROCEDURE PROC_GET_INTEREST_INOUT (
    a_net In varchar2,
    a_cur In varchar2,
    a_corp In varchar2,
    a_begindate In date,
    a_enddate In date,
    a_subject In char,
    a_init Out number,
    a_debit Out number,
    a_credit Out number,
    a_balance Out number)
 As
  v_begindate date;
  v_enddate date;
  v_tmp NUMBER(14, 2);
  v_subject varchar2(20);

Begin

   if a_enddate is null then
       v_enddate :=sysdate;
   end if;
   If  a_subject = '5011' THEN --�ſ���Ϣ����
      v_subject:='501001';
      --ȡ�ڳ����
      --v_begindate :=to_date('1900-01-01','yyyy-mm-dd');
      --v_enddate := a_begindate - 1;
      --PROC_GET_INTEREST_INOUT_5011(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,v_tmp,v_tmp,a_init);
      a_init := 0.00;

      --ȡ�跽����������
      v_begindate :=a_begindate;
      v_enddate := a_enddate;
      if a_corp<>a_net then
         PROC_GET_INTEREST_INOUT_5011(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,a_debit,a_credit,v_tmp);
       end if;
      --ȡ��ĩ���
      --v_begindate :=to_date('1900-01-01','yyyy-mm-dd');
      --v_enddate := a_enddate;
      --PROC_GET_INTEREST_INOUT_5011(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,v_tmp,v_tmp,a_balance);
      a_balance :=0.00;

  ElsIf a_subject = '5211' or a_subject = '5212' or  a_subject = '5013'  THEN --��Ϣ֧��
      a_init := 0.00; --ȡ�ڳ����
      a_balance :=0.00; --ȡ��ĩ���
      --ȡ�跽����������
      if a_corp<>a_net then
          v_begindate :=a_begindate;
          v_enddate := a_enddate;
          if a_subject='5211' then
             v_subject:='521001';
             --PROC_GET_INTEREST_INOUT_5211(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,a_debit,a_credit,v_tmp);
          elsif a_subject='5212'  then -- 5212  ��Ϣ֧��-��ҵ���ڴ��
             v_subject:='521002';
             PROC_GET_INTEREST_INOUT_5212(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,a_debit,a_credit,v_tmp);
          elsif a_subject='5213'  then
             v_subject:='521003';
          end if ;
      end if;
      --ȡ�ڳ����
      --v_begindate :=to_date('1900-01-01','yyyy-mm-dd');
      --v_enddate := a_begindate - 1;
      --PROC_GET_INTEREST_INOUT_5021(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,v_tmp,v_tmp,a_balance);

      --ȡ��ĩ���
      --v_begindate :=to_date('1900-01-01','yyyy-mm-dd');
      --v_enddate := a_enddate;
      --PROC_GET_INTEREST_INOUT_5021(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,v_tmp,v_tmp,a_balance);


  END IF;
end PROC_GET_INTEREST_INOUT;
/
CREATE OR REPLACE PROCEDURE PROC_GENERATE_ACCU (
    a_net_code in char,
    a_over_day in date,
    a_already_day in date
 )
 as
  v_balance_date Date;--��������
  v_Acc_Start_Date Date;--������
  v_acc varchar2(50); --�˺�
  v_rsvd_money NUMBER(14, 2); --��������
  v_day_adjust_cumu NUMBER(14, 2); --�����������
  v_A_cumu NUMBER(14, 2); --����A����
  v_B_cumu NUMBER(14, 2); --����B����
  v_interest_sign char(1); --��Ϣ��־�����ڻ�ȡ���Ƿ���δ��Ϣ����
  v_SUM_already_A NUMBER(14, 2);--�ܵ��Ѽƻ���A(��������A)
  v_SUM_already_B NUMBER(14, 2);--�ܵ��Ѽƻ���B(��������B)
  v_A_adjust_cumu NUMBER(14, 2); --����A��������
  v_B_adjust_cumu NUMBER(14, 2); --����B��������
  v_SUM_A_adjust_cumu NUMBER(14, 2); -- �ܵ�A��������
  v_SUM_B_adjust_cumu NUMBER(14, 2); -- �ܵ�B��������
  v_tally_date date; --��������
  v_interest_start_date date; --��Ϣ����
  v_IS_AGREED NUMBER; --��(1)��(0)Э�����
  v_day_idx date; --��������
  v_interest_time date;
  v_eom_interest_sign char(1);
  v_eom_interest_time date;

  --��������
  CURSOR cur_cumu_dtl IS
        SELECT a.acc_start_date,B.balance_date, B.account,
               --Modified by 2004.09.23
               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1)
                                 ELSE B.balance
                                 END)


                ELSE B.balance
                END
                ), --����A

               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE
                            WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                               OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN B.Balance - (SELECT rsvd_money
                                                          FROM fc_agreed_deposit
                                                         WHERE fc_agreed_deposit.start_date <= B.balance_date
                                                         AND (fc_agreed_deposit.terminate_time IS NULL
                                                              OR fc_agreed_deposit.terminate_time > B.balance_date )
                                                         AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                                           AND ROWNUM = 1)
                                 ELSE 0.00
                                 END)


                ELSE 0.00
                END
                )
                --����B

          FROM fc_acc A INNER JOIN fc_acc_balance B ON A.blnctr_acc = B.account
                LEFT OUTER JOIN fc_agreed_deposit C ON (A.blnctr_acc = C.blnctr_acc and C.terminate_optor IS NULL)
         WHERE A.interest_sign = '1'
           AND A.net_code = a_net_code
           AND  A.acc_type_code not in('05', '06', '08')--'05'��ҵ����'06'���ж���'08'֪ͨ���
           AND B.balance_date > a_already_day
           AND B.balance_date <= a_over_day;


  --��������
  CURSOR cur_adjust_dtl IS -- ��Ҫ������������ϸ��
         SELECT fc_accbook_dtl.account, --�˺�
                fc_accbook.tally_date, --��������
                fc_accbook.interest_start_date, --��Ϣ����
                ((fc_accbook_dtl.debit_money - fc_accbook_dtl.credit_money) --(�跽 �C ����)
                 * fc_acc.balance_way  --����
                 * sign(fc_accbook.tally_date - fc_accbook.interest_start_date) --�����ĵ�������
                ) -- ÿ���ܵĵ�������
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code ;--�ս�����


  --���������������˺�
  CURSOR cur_adjust_acc IS -- ���������������˺�
         SELECT DISTINCT fc_accbook_dtl.account --�˺�
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code ;--�ս�����
begin
    --���ɻ���A��B
    OPEN cur_cumu_dtl;
    FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    WHILE cur_cumu_dtl%FOUND LOOP
       --�������ڱ�����ڵ��ڿ������ڲſ����������ɻ��������ϣ������ʼ������������Ϊ0
       -- ����� 2009-05-08
       IF v_Acc_Start_Date> v_Balance_Date  Then
           NULL;
       ELSE

       BEGIN
            --��ȡ�ܵ��Ѽ�Ϣ����A���ܵ��Ѽ�Ϣ����B
            SELECT NVL(SUM(A_cumu), 0.00),
                   NVL(SUM(B_cumu), 0.00)
              INTO v_SUM_already_A,
                   v_SUM_already_B
              FROM fc_accu_balance
             WHERE balance_date = v_balance_date
               AND account = v_acc
               AND interest_sign = '1'; --�Ѽ�Ϣ

             v_A_cumu := v_A_cumu - v_SUM_already_A; --GREATEST(v_A_cumu - v_SUM_already_A, 0.00);
             v_B_cumu := v_B_cumu - v_SUM_already_B; --GREATEST(v_B_cumu - v_SUM_already_B, 0.00);

             --���»�����
             BEGIN
                  --��ȡ�Ƿ���δ��Ϣ�Ļ���
                  SELECT interest_sign
                    INTO v_interest_sign
                    FROM fc_accu_balance
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND interest_sign = '0'; --δ��Ϣ

                 --��δ��Ϣ�Ļ�����,����»���
                  UPDATE fc_accu_balance
                     SET A_cumu = v_A_cumu,
                         B_cumu = v_B_cumu
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND interest_sign = '0';

               Exception
                    WHEN NO_DATA_FOUND THEN --û��δ��Ϣ�Ļ�����,����������
                         INSERT INTO fc_accu_balance(balance_date, account,
                                                     A_cumu,
                                                     B_cumu,
                                                     A_adjust_cumu,
                                                     B_adjust_cumu,
                                                     interest_sign)
                              VALUES( v_balance_date,
                                      v_acc,
                                      v_A_cumu,
                                      v_B_cumu,
                                      0.00,--��������A
                                      0.00, --��������B
                                      '0' --�Ƿ��Ϣ��־
                                      );
                   WHEN TOO_MANY_ROWS THEN --���ݴ���(�����ϲ����ܳ��ֶ���)
                        ROllback Work;
                        RAISE_APPLICATION_ERROR(-20001, '���ݴ��󣺻������ֶ���!');
                        RETURN;
              END;


          EXCEPTION
               WHEN OTHERS THEN
                    Rollback Work;
                    RAISE_APPLICATION_ERROR(-20001, '���ɻ���������!');
                    RETURN;
       END;

       BEGIN--20111122 ���µ���ļ�Ϣ��־���ڵ���Ϣ
         SELECT interest_sign,interest_time,eom_interest_sign,eom_interest_time
          INTO v_interest_sign,v_interest_time,v_eom_interest_sign,v_eom_interest_time
          FROM fc_accu_balance_predraw
         WHERE balance_date = v_balance_date
           AND account = v_acc
           AND interest_sign = '1' and a_cumu=v_A_cumu and b_cumu=v_B_cumu; --�Ѽ�Ϣ
         Exception
          WHEN NO_DATA_FOUND THEN
            v_interest_sign:='0';
        END;
        IF v_interest_sign='1' THEN
          BEGIN
          UPDATE fc_accu_balance
          SET interest_sign=v_interest_sign,interest_time=v_interest_time,
              eom_interest_sign=v_eom_interest_sign,eom_interest_time=v_eom_interest_time
          WHERE balance_date = v_balance_date AND account = v_acc  AND interest_sign='0'
            AND a_cumu=v_A_cumu AND b_cumu=v_B_cumu;
          EXCEPTION
             WHEN OTHERS THEN
                  Rollback Work;
                  RAISE_APPLICATION_ERROR(-20001, '����Ԥ�ᵱ��Ļ���״̬����!');
                  RETURN;
          END;
        END IF;
       END IF;
       FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    END LOOP;

    CLOSE cur_cumu_dtl;


    --���µ�������
    OPEN cur_adjust_dtl;

    FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;
    WHILE cur_adjust_dtl%FOUND LOOP
        BEGIN

           v_SUM_A_adjust_cumu := 0;
           v_SUM_B_adjust_cumu := 0;

           v_day_idx := v_interest_start_date;

           WHILE v_day_idx < v_tally_date LOOP
                 v_A_adjust_cumu := 0;
                 v_B_adjust_cumu := 0;
                 --�������ã������˻������Ƿ�Э�������Э����ͬʱ�����������
                 BEGIN
                       v_IS_AGREED := FUN_IS_AGREED(v_ACC, v_day_idx, v_rsvd_money);
                    EXCEPTION
                       WHEN OTHERS THEN
                           ROllback Work;
                           CLOSE cur_adjust_dtl;
                           RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 IF v_IS_AGREED = 0 THEN --�����Э�����
                    v_A_adjust_cumu := v_day_adjust_cumu;
                 ELSE --����Э�����

                    BEGIN
                        SELECT SUM(NVL(A_cumu, 0.00) + NVL(a_adjusted, 0.00)), --A ����
                               SUM(NVL(B_cumu, 0.00) + NVL(b_adjusted, 0.00)) --B ����
                          INTO v_A_cumu, v_B_cumu
                          FROM fc_accu_balance
                         WHERE account = v_acc
                           AND balance_date = v_day_idx;
                      EXCEPTION
                        WHEN NO_DATA_FOUND THEN
                             NULL;
                    END;

                    IF v_day_adjust_cumu > 0 THEN--����
                       --MODIFIED  BY 2004.09.23 //v_A_cumu > 0 OR --A ���� > 0
                       IF (v_day_adjust_cumu + v_A_cumu > v_rsvd_money) THEN --���ܵĻ��� +���� A>��������
                          v_A_adjust_cumu := v_rsvd_money - v_A_cumu;
                          v_B_adjust_cumu := v_day_adjust_cumu - v_A_adjust_cumu;
                       ELSE --A ���� <0 ͬʱ �ܵĻ��� +���� A <=��������
                          v_A_adjust_cumu := v_day_adjust_cumu;

                       END IF;

                    ELSE --����

                       IF ABS(v_B_cumu) >= ABS(v_day_adjust_cumu) THEN --ABS(B����)>=ABS�������ܵĵ���������
                          v_B_adjust_cumu := v_day_adjust_cumu;
                       ELSE -- ABS(B����)<ABS�������ܵĵ���������
                          v_B_adjust_cumu := - v_B_cumu;
                          v_A_adjust_cumu := v_day_adjust_cumu + v_B_cumu;
                       END IF;

                    END IF;

                 END IF;

                 -- ADD by 2004.09.23
                 BEGIN
                       UPDATE fc_accu_balance
                          SET a_adjusted = NVL(a_adjusted, 0.00) + v_A_adjust_cumu,
                              b_adjusted = NVL(b_adjusted, 0.00) + v_B_adjust_cumu
                        WHERE account = v_acc
                          AND balance_date = v_day_idx
                          AND ROWNUM = 1; --ADD by 2005.10.24
                   EXCEPTION
                       WHEN OTHERS THEN
                            ROllback Work;
                            CLOSE cur_adjust_dtl;
                            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu + v_A_adjust_cumu;
                 v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu + v_B_adjust_cumu;

                 v_day_idx := v_day_idx + 1;

           END LOOP;

           --���»�������
           BEGIN
              /* --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
               SELECT NVL(SUM(A_adjust_cumu), 0.00),
                      NVL(SUM(B_adjust_cumu), 0.00)
                 INTO v_SUM_already_A,
                      v_SUM_already_B
                 FROM fc_accu_balance
                WHERE balance_date = v_balance_date
                  AND account = v_acc
                  AND interest_sign = '1'; --�Ѽ�Ϣ

               v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu - v_SUM_already_A; --GREATEST(v_SUM_A_adjust_cumu - v_SUM_already_A, 0.00);
               v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu - v_SUM_already_B; --GREATEST(v_SUM_B_adjust_cumu - v_SUM_already_B, 0.00);
               */
               UPDATE fc_accu_balance
                  SET A_adjust_cumu = A_adjust_cumu + v_SUM_A_adjust_cumu,
                      B_adjust_cumu = B_adjust_cumu + v_SUM_B_adjust_cumu
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;

    END LOOP;

    CLOSE cur_adjust_dtl;


    --�����˻���������  ����ȥ�Ѽ�Ϣ����������
    OPEN cur_adjust_acc;

    FETCH cur_adjust_acc INTO v_acc;
    WHILE cur_adjust_acc%FOUND LOOP
        BEGIN
             --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
             SELECT NVL(SUM(A_adjust_cumu), 0.00),
                    NVL(SUM(B_adjust_cumu), 0.00)
               INTO v_SUM_already_A,
                    v_SUM_already_B
               FROM fc_accu_balance
              WHERE balance_date = a_over_day
                AND account = v_acc
                AND interest_sign = '1'; --�Ѽ�Ϣ

             BEGIN
               UPDATE fc_accu_balance
                  SET A_adjust_cumu = A_adjust_cumu - v_SUM_already_A,
                      B_adjust_cumu = B_adjust_cumu - v_SUM_already_B
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_acc INTO v_acc;

    END LOOP;

    CLOSE cur_adjust_acc;

    --ɾ�����ɵ���Ч����(�����)
    BEGIN
       DELETE FROM fc_accu_balance a
         WHERE a_cumu = 0.00
           AND b_cumu = 0.00
           AND a_adjust_cumu = 0.00
           AND b_adjust_cumu = 0.00
           AND interest_sign = '0'
           AND balance_date > a_already_day
           AND balance_date <= a_over_day
           AND (SELECT count(*)
                  FROM fc_accu_balance
                 WHERE fc_accu_balance.account = a.account
                   AND fc_accu_balance.balance_date = a.balance_date) > 1;

     EXCEPTION
       WHEN OTHERS THEN
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
    END;

    RETURN;

END proc_generate_accu;


/
CREATE OR REPLACE PROCEDURE PROC_GENERATE_ACCU_FEX (
    a_net_code in char,
    a_over_day in date,
    a_already_day in date
 )
 as
  v_balance_date Date;--��������
  v_Acc_Start_Date Date;--������
  v_acc varchar2(50); --�˺�
  v_rsvd_money NUMBER(14, 2); --��������
  v_day_adjust_cumu NUMBER(14, 2); --�����������
  v_A_cumu NUMBER(14, 2); --����A����
  v_B_cumu NUMBER(14, 2); --����B����
  v_interest_sign char(1); --��Ϣ��־�����ڻ�ȡ���Ƿ���δ��Ϣ����
  v_SUM_already_A NUMBER(14, 2);--�ܵ��Ѽƻ���A(��������A)
  v_SUM_already_B NUMBER(14, 2);--�ܵ��Ѽƻ���B(��������B)
  v_A_adjust_cumu NUMBER(14, 2); --����A��������
  v_B_adjust_cumu NUMBER(14, 2); --����B��������
  v_SUM_A_adjust_cumu NUMBER(14, 2); -- �ܵ�A��������
  v_SUM_B_adjust_cumu NUMBER(14, 2); -- �ܵ�B��������
  v_tally_date date; --��������
  v_interest_start_date date; --��Ϣ����
  v_IS_AGREED NUMBER; --��(1)��(0)Э�����
  v_day_idx date; --��������
  --2011 fc���ӱ���
  v_cur char(2);--�ұ� ���ʱ�õ�
  v_acc_type char(2); -- �˺����� ��һ����账��
  v_equal_usd NUMBER(14, 2); --��ֵ300W��Ԫ����ҽ��
  v_cur_name varchar2(20);
  v_natural_cur  char(2);--��λ��


  --��������
  CURSOR cur_cumu_dtl IS
      SELECT a.acc_start_date,
           B.balance_date,
           B.account,
           --Modified by 2004.09.23
           (CASE
             WHEN (B.BALANCE > (SELECT conv_money
                                  FROM v_inter_exrate_usd a1
                                 WHERE a1.cur_fc = a.cur_code
                                   AND a1.opt_date <= B.balance_date
                                   AND a1.opt_date = (SELECT MAX(opt_date)
                                                        FROM v_inter_exrate_usd a2
                                                       WHERE a2.opt_date <= B.balance_date
                                                         AND a2.cur_fc = a1.cur_fc
                                                         AND ROWNUM = 1)))
              THEN (SELECT conv_money
                     FROM v_inter_exrate_usd a1
                    WHERE a1.cur_fc = a.cur_code
                      AND a1.opt_date <= B.balance_date
                      AND a1.opt_date = (SELECT MAX(opt_date)
                                           FROM v_inter_exrate_usd a2
                                          WHERE a2.opt_date <= B.balance_date
                                            AND a2.cur_fc = a1.cur_fc
                                            AND ROWNUM = 1))
               ELSE B.BALANCE
           END), --����A
           (CASE  WHEN (B.BALANCE > (SELECT conv_money
                                      FROM v_inter_exrate_usd a1
                                     WHERE a1.cur_fc = a.cur_code
                                       AND a1.opt_date <= B.balance_date
                                       AND a1.opt_date = (SELECT MAX(opt_date)
                                                            FROM v_inter_exrate_usd a2
                                                           WHERE a2.opt_date <= B.balance_date
                                                             AND a2.cur_fc = a1.cur_fc
                                                             AND ROWNUM = 1)))
                  THEN B.Balance - (SELECT conv_money
                                     FROM v_inter_exrate_usd a1
                                    WHERE a1.cur_fc = a.cur_code
                                      AND a1.opt_date <= B.balance_date
                                      AND a1.opt_date = (SELECT MAX(opt_date)
                                                           FROM v_inter_exrate_usd a2
                                                          WHERE a2.opt_date <= B.balance_date
                                                            AND a2.cur_fc = a1.cur_fc
                                                            AND ROWNUM = 1))
             ELSE  0.00
           END) --����B
      FROM fc_acc A
     INNER JOIN fc_acc_balance B ON A.blnctr_acc = B.account
     WHERE A.interest_sign = '1'
       AND A.net_code = a_net_code
       AND (A.acc_type_code = '01' and a.cur_code <> (select cur_code from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1)) --'01'�����ҵ����
       AND B.balance_date > a_already_day
       AND B.balance_date <= a_over_day
       union
        SELECT a.acc_start_date,B.balance_date, B.account,
               --Modified by 2004.09.23
               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1)
                                 ELSE B.balance
                                 END)


                ELSE B.balance
                END
                ), --����A

               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE
                            WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                               OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN B.Balance - (SELECT rsvd_money
                                                          FROM fc_agreed_deposit
                                                         WHERE fc_agreed_deposit.start_date <= B.balance_date
                                                         AND (fc_agreed_deposit.terminate_time IS NULL
                                                              OR fc_agreed_deposit.terminate_time > B.balance_date )
                                                         AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                                           AND ROWNUM = 1)
                                 ELSE 0.00
                                 END)


                ELSE 0.00
                END
                )
                --����B

          FROM fc_acc A INNER JOIN fc_acc_balance B ON A.blnctr_acc = B.account
                LEFT OUTER JOIN fc_agreed_deposit C ON (A.blnctr_acc = C.blnctr_acc and C.terminate_optor IS NULL)
         WHERE A.interest_sign = '1'
           AND A.net_code = a_net_code
           AND ( A.acc_type_code not in('05', '06', '08','01') or (a.acc_type_code='01' and a.cur_code=(select cur_code from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1)))--'05'��ҵ����'06'���ж���'08'֪ͨ��� 2011 fc�ų���һ���
           AND B.balance_date > a_already_day
           AND B.balance_date <= a_over_day;


  --��������
  CURSOR cur_adjust_dtl IS -- ��Ҫ������������ϸ��
         SELECT fc_accbook_dtl.account, --�˺�
                fc_accbook.tally_date, --��������
                fc_accbook.interest_start_date, --��Ϣ����
                ((fc_accbook_dtl.debit_money - fc_accbook_dtl.credit_money) --(�跽 �C ����)
                 * fc_acc.balance_way  --����
                 * sign(fc_accbook.tally_date - fc_accbook.interest_start_date) --�����ĵ�������
                ) -- ÿ���ܵĵ�������
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code ;--�ս�����


  --���������������˺�
  CURSOR cur_adjust_acc IS -- ���������������˺�
         SELECT DISTINCT fc_accbook_dtl.account --�˺�
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code ;--�ս�����
begin

    begin
      select cur_code into v_natural_cur
      from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1;
      Exception
        WHEN NO_DATA_FOUND THEN --û�����ñ�λ��
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, 'ȡ��λ�ҳ���!');
            RETURN;
    end;

    --���ɻ���A��B
    OPEN cur_cumu_dtl;
    FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    WHILE cur_cumu_dtl%FOUND LOOP
       --�������ڱ�����ڵ��ڿ������ڲſ����������ɻ��������ϣ������ʼ������������Ϊ0
       -- ����� 2009-05-08
       IF v_Acc_Start_Date> v_Balance_Date  Then
           NULL;
       ELSE

       BEGIN
            --��ȡ�ܵ��Ѽ�Ϣ����A���ܵ��Ѽ�Ϣ����B
            SELECT NVL(SUM(A_cumu), 0.00),
                   NVL(SUM(B_cumu), 0.00)
              INTO v_SUM_already_A,
                   v_SUM_already_B
              FROM fc_accu_balance
             WHERE balance_date = v_balance_date
               AND account = v_acc
               AND interest_sign = '1'; --�Ѽ�Ϣ

             v_A_cumu := v_A_cumu - v_SUM_already_A; --GREATEST(v_A_cumu - v_SUM_already_A, 0.00);
             v_B_cumu := v_B_cumu - v_SUM_already_B; --GREATEST(v_B_cumu - v_SUM_already_B, 0.00);

             --���»�����
             BEGIN
                  --��ȡ�Ƿ���δ��Ϣ�Ļ���
                  SELECT interest_sign
                    INTO v_interest_sign
                    FROM fc_accu_balance
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND interest_sign = '0'; --δ��Ϣ

                 --��δ��Ϣ�Ļ�����,����»���
                  UPDATE fc_accu_balance
                     SET A_cumu = v_A_cumu,
                         B_cumu = v_B_cumu
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND interest_sign = '0';

               Exception
                    WHEN NO_DATA_FOUND THEN --û��δ��Ϣ�Ļ�����,����������
                         INSERT INTO fc_accu_balance(balance_date, account,
                                                     A_cumu,
                                                     B_cumu,
                                                     A_adjust_cumu,
                                                     B_adjust_cumu,
                                                     interest_sign)
                              VALUES( v_balance_date,
                                      v_acc,
                                      v_A_cumu,
                                      v_B_cumu,
                                      0.00,--��������A
                                      0.00, --��������B
                                      '0' --�Ƿ��Ϣ��־
                                      );
                   WHEN TOO_MANY_ROWS THEN --���ݴ���(�����ϲ����ܳ��ֶ���)
                        ROllback Work;
                        RAISE_APPLICATION_ERROR(-20001, '���ݴ��󣺻������ֶ���!');
                        RETURN;
              END;




          EXCEPTION
               WHEN OTHERS THEN
                    Rollback Work;
                    RAISE_APPLICATION_ERROR(-20001, '���ɻ���������!');
                    RETURN;
       END;
       END IF;
       FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    END LOOP;

    CLOSE cur_cumu_dtl;


    --���µ�������
    OPEN cur_adjust_dtl;

    FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;
    WHILE cur_adjust_dtl%FOUND LOOP
        BEGIN

           v_SUM_A_adjust_cumu := 0;
           v_SUM_B_adjust_cumu := 0;

           v_day_idx := v_interest_start_date;

           WHILE v_day_idx < v_tally_date LOOP
                 v_A_adjust_cumu := 0;
                 v_B_adjust_cumu := 0;
                 --2011 fc����,��ҵ���ڷִ�С�����ʴ���
                 --��һ��ڵ��ú��������ص�ֵ300W��Ԫ��������ҽ��,������ڸ�ֵ,
                 select acc_type_code, cur_code,(select cur_name from bt_currency where cur_code=fc_acc.cur_code)
                  into v_acc_type, v_cur,v_cur_name
                  from fc_acc
                 where blnctr_acc = V_ACC;

                 if v_acc_type='01' and v_cur<> v_natural_cur then -- �����ҵ����
                    begin

                            SELECT CONV_MONEY INTO v_equal_usd
                              FROM V_INTER_EXRATE_USD
                             WHERE CUR_FC = v_cur
                               AND OPT_DATE <= v_day_idx
                               AND OPT_DATE = (SELECT MAX(OPT_DATE)
                                                 FROM V_INTER_EXRATE_USD
                                                WHERE OPT_DATE <= v_day_idx
                                                  AND CUR_FC = v_cur
                                                  AND ROWNUM=1) ;
                        IF v_equal_usd IS NULL OR v_equal_usd = 0.00 THEN --û��ȡ������Ԫ��������
                           Rollback Work;
                           RAISE_APPLICATION_ERROR(-20001, 'ȡ����'||v_cur_name||'����Ԫ��������,��ά���ڲ�����!');
                           RETURN;
                        else
                            BEGIN
                                SELECT SUM(NVL(A_cumu, 0.00) + NVL(a_adjusted, 0.00)), --A ����
                                       SUM(NVL(B_cumu, 0.00) + NVL(b_adjusted, 0.00)) --B ����
                                  INTO v_A_cumu, v_B_cumu
                                  FROM fc_accu_balance
                                 WHERE account = v_acc
                                   AND balance_date = v_day_idx;
                              EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                     NULL;
                            END;

                            IF v_day_adjust_cumu > 0 THEN--����
                               IF (v_day_adjust_cumu + v_A_cumu > v_equal_usd) THEN --���ܵĻ��� +���� A>��������
                                  v_A_adjust_cumu := v_equal_usd - v_A_cumu;
                                  v_B_adjust_cumu := v_day_adjust_cumu - v_A_adjust_cumu;
                               ELSE --A ���� <0 ͬʱ �ܵĻ��� +���� A <=��������
                                  v_A_adjust_cumu := v_day_adjust_cumu;

                               END IF;

                            ELSE --����

                               IF ABS(v_B_cumu) >= ABS(v_day_adjust_cumu) THEN --ABS(B����)>=ABS�������ܵĵ���������
                                  v_B_adjust_cumu := v_day_adjust_cumu;
                               ELSE -- ABS(B����)<ABS�������ܵĵ���������
                                  v_B_adjust_cumu := - v_B_cumu;
                                  v_A_adjust_cumu := v_day_adjust_cumu + v_B_cumu;
                               END IF;

                            END IF;
                        end if;
                    end ;
                 else----2011 fc����,��ҵ���ڷִ�С�����ʴ���
                       begin
                         --�������ã������˻������Ƿ�Э�������Э����ͬʱ�����������
                         BEGIN
                               v_IS_AGREED := FUN_IS_AGREED(v_ACC, v_day_idx, v_rsvd_money);
                            EXCEPTION
                               WHEN OTHERS THEN
                                   ROllback Work;
                                   CLOSE cur_adjust_dtl;
                                   RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                         END;

                         IF v_IS_AGREED = 0 THEN --�����Э�����
                            v_A_adjust_cumu := v_day_adjust_cumu;
                         ELSE --����Э�����

                            BEGIN
                                SELECT SUM(NVL(A_cumu, 0.00) + NVL(a_adjusted, 0.00)), --A ����
                                       SUM(NVL(B_cumu, 0.00) + NVL(b_adjusted, 0.00)) --B ����
                                  INTO v_A_cumu, v_B_cumu
                                  FROM fc_accu_balance
                                 WHERE account = v_acc
                                   AND balance_date = v_day_idx;
                              EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                     NULL;
                            END;

                            IF v_day_adjust_cumu > 0 THEN--����
                               --MODIFIED  BY 2004.09.23 //v_A_cumu > 0 OR --A ���� > 0
                               IF (v_day_adjust_cumu + v_A_cumu > v_rsvd_money) THEN --���ܵĻ��� +���� A>��������
                                  v_A_adjust_cumu := v_rsvd_money - v_A_cumu;
                                  v_B_adjust_cumu := v_day_adjust_cumu - v_A_adjust_cumu;
                               ELSE --A ���� <0 ͬʱ �ܵĻ��� +���� A <=��������
                                  v_A_adjust_cumu := v_day_adjust_cumu;

                               END IF;

                            ELSE --����

                               IF ABS(v_B_cumu) >= ABS(v_day_adjust_cumu) THEN --ABS(B����)>=ABS�������ܵĵ���������
                                  v_B_adjust_cumu := v_day_adjust_cumu;
                               ELSE -- ABS(B����)<ABS�������ܵĵ���������
                                  v_B_adjust_cumu := - v_B_cumu;
                                  v_A_adjust_cumu := v_day_adjust_cumu + v_B_cumu;
                               END IF;

                            END IF;

                         END IF;
                        end;
                 end if ;----2011 fc����,��ҵ���ڷִ�С�����ʴ���

                 -- ADD by 2004.09.23
                 BEGIN
                       UPDATE fc_accu_balance
                          SET a_adjusted = NVL(a_adjusted, 0.00) + v_A_adjust_cumu,
                              b_adjusted = NVL(b_adjusted, 0.00) + v_B_adjust_cumu
                        WHERE account = v_acc
                          AND balance_date = v_day_idx
                          AND ROWNUM = 1; --ADD by 2005.10.24
                   EXCEPTION
                       WHEN OTHERS THEN
                            ROllback Work;
                            CLOSE cur_adjust_dtl;
                            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu + v_A_adjust_cumu;
                 v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu + v_B_adjust_cumu;

                 v_day_idx := v_day_idx + 1;

           END LOOP;

           --���»�������
           BEGIN
              /* --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
               SELECT NVL(SUM(A_adjust_cumu), 0.00),
                      NVL(SUM(B_adjust_cumu), 0.00)
                 INTO v_SUM_already_A,
                      v_SUM_already_B
                 FROM fc_accu_balance
                WHERE balance_date = v_balance_date
                  AND account = v_acc
                  AND interest_sign = '1'; --�Ѽ�Ϣ

               v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu - v_SUM_already_A; --GREATEST(v_SUM_A_adjust_cumu - v_SUM_already_A, 0.00);
               v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu - v_SUM_already_B; --GREATEST(v_SUM_B_adjust_cumu - v_SUM_already_B, 0.00);
               */
               UPDATE fc_accu_balance
                  SET A_adjust_cumu = A_adjust_cumu + v_SUM_A_adjust_cumu,
                      B_adjust_cumu = B_adjust_cumu + v_SUM_B_adjust_cumu
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;

    END LOOP;

    CLOSE cur_adjust_dtl;


    --�����˻���������  ����ȥ�Ѽ�Ϣ����������
    OPEN cur_adjust_acc;

    FETCH cur_adjust_acc INTO v_acc;
    WHILE cur_adjust_acc%FOUND LOOP
        BEGIN
             --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
             SELECT NVL(SUM(A_adjust_cumu), 0.00),
                    NVL(SUM(B_adjust_cumu), 0.00)
               INTO v_SUM_already_A,
                    v_SUM_already_B
               FROM fc_accu_balance
              WHERE balance_date = a_over_day
                AND account = v_acc
                AND interest_sign = '1'; --�Ѽ�Ϣ

             BEGIN
               UPDATE fc_accu_balance
                  SET A_adjust_cumu = A_adjust_cumu - v_SUM_already_A,
                      B_adjust_cumu = B_adjust_cumu - v_SUM_already_B
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_acc INTO v_acc;

    END LOOP;

    CLOSE cur_adjust_acc;

    --ɾ�����ɵ���Ч����(�����)
    BEGIN
       DELETE FROM fc_accu_balance a
         WHERE a_cumu = 0.00
           AND b_cumu = 0.00
           AND a_adjust_cumu = 0.00
           AND b_adjust_cumu = 0.00
           AND interest_sign = '0'
           AND balance_date > a_already_day
           AND balance_date <= a_over_day
           AND (SELECT count(*)
                  FROM fc_accu_balance
                 WHERE fc_accu_balance.account = a.account
                   AND fc_accu_balance.balance_date = a.balance_date) > 1;

     EXCEPTION
       WHEN OTHERS THEN
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
    END;

    RETURN;

END PROC_GENERATE_ACCU_FEX;
/
CREATE OR REPLACE PROCEDURE PROC_GENERATE_ACCU_FEX_PREDRAW (
    a_net_code in char,
    a_over_day in date,
    a_already_day in date
 )
 as
  v_balance_date Date;--��������
  v_Acc_Start_Date Date;--������
  v_acc varchar2(50); --�˺�
  v_rsvd_money NUMBER(14, 2); --��������
  v_day_adjust_cumu NUMBER(14, 2); --�����������
  v_A_cumu NUMBER(14, 2); --����A����
  v_B_cumu NUMBER(14, 2); --����B����
  v_interest_sign char(1); --��Ϣ��־�����ڻ�ȡ���Ƿ���δ��Ϣ����
  v_SUM_already_A NUMBER(14, 2);--�ܵ��Ѽƻ���A(��������A)
  v_SUM_already_B NUMBER(14, 2);--�ܵ��Ѽƻ���B(��������B)
  v_A_adjust_cumu NUMBER(14, 2); --����A��������
  v_B_adjust_cumu NUMBER(14, 2); --����B��������
  v_SUM_A_adjust_cumu NUMBER(14, 2); -- �ܵ�A��������
  v_SUM_B_adjust_cumu NUMBER(14, 2); -- �ܵ�B��������
  v_tally_date date; --��������
  v_interest_start_date date; --��Ϣ����
  v_IS_AGREED NUMBER; --��(1)��(0)Э�����
  v_day_idx date; --��������
  --2011 fc���ӱ���
  v_cur char(2);--�ұ� ���ʱ�õ�
  v_acc_type char(2); -- �˺����� ��һ����账��
  v_equal_usd NUMBER(14, 2); --��ֵ300W��Ԫ����ҽ��
  v_cur_name varchar2(20);
  v_natural_cur  char(2);--��λ��


  --��������
  CURSOR cur_cumu_dtl IS
      SELECT a.acc_start_date,
           B.balance_date,
           B.account,
           --Modified by 2004.09.23
           (CASE
             WHEN (B.BALANCE > (SELECT conv_money
                                  FROM v_inter_exrate_usd a1
                                 WHERE a1.cur_fc = a.cur_code
                                   AND a1.opt_date <= B.balance_date
                                   AND a1.opt_date = (SELECT MAX(opt_date)
                                                        FROM v_inter_exrate_usd a2
                                                       WHERE a2.opt_date <= B.balance_date
                                                         AND a2.cur_fc = a1.cur_fc
                                                         AND ROWNUM = 1)))
              THEN (SELECT conv_money
                     FROM v_inter_exrate_usd a1
                    WHERE a1.cur_fc = a.cur_code
                      AND a1.opt_date <= B.balance_date
                      AND a1.opt_date = (SELECT MAX(opt_date)
                                           FROM v_inter_exrate_usd a2
                                          WHERE a2.opt_date <= B.balance_date
                                            AND a2.cur_fc = a1.cur_fc
                                            AND ROWNUM = 1))
               ELSE B.BALANCE
           END), --����A
           (CASE  WHEN (B.BALANCE > (SELECT conv_money
                                      FROM v_inter_exrate_usd a1
                                     WHERE a1.cur_fc = a.cur_code
                                       AND a1.opt_date <= B.balance_date
                                       AND a1.opt_date = (SELECT MAX(opt_date)
                                                            FROM v_inter_exrate_usd a2
                                                           WHERE a2.opt_date <= B.balance_date
                                                             AND a2.cur_fc = a1.cur_fc
                                                             AND ROWNUM = 1)))
                  THEN B.Balance - (SELECT conv_money
                                     FROM v_inter_exrate_usd a1
                                    WHERE a1.cur_fc = a.cur_code
                                      AND a1.opt_date <= B.balance_date
                                      AND a1.opt_date = (SELECT MAX(opt_date)
                                                           FROM v_inter_exrate_usd a2
                                                          WHERE a2.opt_date <= B.balance_date
                                                            AND a2.cur_fc = a1.cur_fc
                                                            AND ROWNUM = 1))
             ELSE  0.00
           END) --����B
      FROM fc_acc A
     INNER JOIN fc_acc_balance_PREDRAW B ON A.blnctr_acc = B.account
     WHERE A.interest_sign = '1'
       AND A.net_code = a_net_code
       AND (A.acc_type_code = '01' and a.cur_code <> (select cur_code from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1)) --'01'�����ҵ����
       AND B.balance_date > a_already_day
       AND B.balance_date <= a_over_day
       union
        SELECT a.acc_start_date,B.balance_date, B.account,
               --Modified by 2004.09.23
               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1)
                                 ELSE B.balance
                                 END)


                ELSE B.balance
                END
                ), --����A

               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE
                            WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                               OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN B.Balance - (SELECT rsvd_money
                                                          FROM fc_agreed_deposit
                                                         WHERE fc_agreed_deposit.start_date <= B.balance_date
                                                         AND (fc_agreed_deposit.terminate_time IS NULL
                                                              OR fc_agreed_deposit.terminate_time > B.balance_date )
                                                         AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                                           AND ROWNUM = 1)
                                 ELSE 0.00
                                 END)


                ELSE 0.00
                END
                )
                --����B

          FROM fc_acc A INNER JOIN fc_acc_balance_PREDRAW B ON A.blnctr_acc = B.account
                LEFT OUTER JOIN fc_agreed_deposit C ON (A.blnctr_acc = C.blnctr_acc and C.terminate_optor IS NULL)
         WHERE A.interest_sign = '1'
           AND A.net_code = a_net_code
           AND ( A.acc_type_code not in('05', '06', '08','01') or (a.acc_type_code='01' and a.cur_code=(select cur_code from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1)))--'05'��ҵ����'06'���ж���'08'֪ͨ��� 2011 fc�ų���һ���
           AND B.balance_date > a_already_day
           AND B.balance_date <= a_over_day
           AND A.PREDRAW_SIGN IN ('1','3','4'); -- ��ĩ��ϢԤ�� ÿ�½�Ϣ ��ĩ����ϢԤ��


  --��������
  CURSOR cur_adjust_dtl IS -- ��Ҫ������������ϸ��
         SELECT fc_accbook_dtl.account, --�˺�
                fc_accbook.tally_date, --��������
                fc_accbook.interest_start_date, --��Ϣ����
                ((fc_accbook_dtl.debit_money - fc_accbook_dtl.credit_money) --(�跽 �C ����)
                 * fc_acc.balance_way  --����
                 * sign(fc_accbook.tally_date - fc_accbook.interest_start_date) --�����ĵ�������
                ) -- ÿ���ܵĵ�������
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code --�ս�����
            AND fc_acc.PREDRAW_SIGN IN ('1','4'); -- ��ĩ��ϢԤ��  ��ĩ����ϢԤ��


  --���������������˺�
  CURSOR cur_adjust_acc IS -- ���������������˺�
         SELECT DISTINCT fc_accbook_dtl.account --�˺�
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code  --�ս�����
            AND fc_acc.PREDRAW_SIGN IN ('1','4'); -- ��ĩ��ϢԤ��  ��ĩ����ϢԤ��
begin

    begin
      select cur_code into v_natural_cur
      from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1;
      Exception
        WHEN NO_DATA_FOUND THEN --û�����ñ�λ��
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, 'ȡ��λ�ҳ���!');
            RETURN;
    end;

    --���ɻ���A��B
    OPEN cur_cumu_dtl;
    FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    WHILE cur_cumu_dtl%FOUND LOOP
       --�������ڱ�����ڵ��ڿ������ڲſ����������ɻ��������ϣ������ʼ������������Ϊ0
       -- ����� 2009-05-08
       IF v_Acc_Start_Date> v_Balance_Date  Then
           NULL;
       ELSE

       BEGIN
            --��ȡ�ܵ��Ѽ�Ϣ����A���ܵ��Ѽ�Ϣ����B
            SELECT NVL(SUM(A_cumu), 0.00),
                   NVL(SUM(B_cumu), 0.00)
              INTO v_SUM_already_A,
                   v_SUM_already_B
              FROM FC_ACCU_BALANCE_PREDRAW
             WHERE balance_date = v_balance_date
               AND account = v_acc
               AND eom_interest_sign = '1'; --�Ѽ�Ϣ

             v_A_cumu := v_A_cumu - v_SUM_already_A; --GREATEST(v_A_cumu - v_SUM_already_A, 0.00);
             v_B_cumu := v_B_cumu - v_SUM_already_B; --GREATEST(v_B_cumu - v_SUM_already_B, 0.00);

             --���»�����
             BEGIN
                  --��ȡ�Ƿ���δ��Ϣ�Ļ���
                  SELECT eom_interest_sign
                    INTO v_interest_sign
                    FROM FC_ACCU_BALANCE_PREDRAW
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND eom_interest_sign = '0'; --δ��Ϣ

                 --��δ��Ϣ�Ļ�����,����»���
                  UPDATE FC_ACCU_BALANCE_PREDRAW
                     SET A_cumu = v_A_cumu,
                         B_cumu = v_B_cumu
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND eom_interest_sign = '0';

               Exception
                    WHEN NO_DATA_FOUND THEN --û��δ��Ϣ�Ļ�����,����������
                         INSERT INTO FC_ACCU_BALANCE_PREDRAW(balance_date, account,
                                                     A_cumu,
                                                     B_cumu,
                                                     A_adjust_cumu,
                                                     B_adjust_cumu,
                                                     interest_sign,eom_interest_sign)
                              VALUES( v_balance_date,
                                      v_acc,
                                      v_A_cumu,
                                      v_B_cumu,
                                      0.00,--��������A
                                      0.00, --��������B
                                      '0','0' --�Ƿ��Ϣ��־
                                      );
                   WHEN TOO_MANY_ROWS THEN --���ݴ���(�����ϲ����ܳ��ֶ���)
                        ROllback Work;
                        RAISE_APPLICATION_ERROR(-20001, '���ݴ��󣺻������ֶ���!');
                        RETURN;
              END;




          EXCEPTION
               WHEN OTHERS THEN
                    Rollback Work;
                    RAISE_APPLICATION_ERROR(-20001, '���ɻ���������!');
                    RETURN;
       END;
       END IF;
       FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    END LOOP;

    CLOSE cur_cumu_dtl;


    --���µ�������
    OPEN cur_adjust_dtl;

    FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;
    WHILE cur_adjust_dtl%FOUND LOOP
        BEGIN

           v_SUM_A_adjust_cumu := 0;
           v_SUM_B_adjust_cumu := 0;

           v_day_idx := v_interest_start_date;

           WHILE v_day_idx < v_tally_date LOOP
                 v_A_adjust_cumu := 0;
                 v_B_adjust_cumu := 0;
                 --2011 fc����,��ҵ���ڷִ�С�����ʴ���
                 --��һ��ڵ��ú��������ص�ֵ300W��Ԫ��������ҽ��,������ڸ�ֵ,
                 select acc_type_code, cur_code,(select cur_name from bt_currency where cur_code=fc_acc.cur_code)
                  into v_acc_type, v_cur,v_cur_name
                  from fc_acc
                 where blnctr_acc = V_ACC;

                 if v_acc_type='01' and v_cur<> v_natural_cur then -- �����ҵ����
                    begin

                            SELECT CONV_MONEY INTO v_equal_usd
                              FROM V_INTER_EXRATE_USD
                             WHERE CUR_FC = v_cur
                               AND OPT_DATE <= v_day_idx
                               AND OPT_DATE = (SELECT MAX(OPT_DATE)
                                                 FROM V_INTER_EXRATE_USD
                                                WHERE OPT_DATE <= v_day_idx
                                                  AND CUR_FC = v_cur
                                                  AND ROWNUM=1) ;
                        IF v_equal_usd IS NULL OR v_equal_usd = 0.00 THEN --û��ȡ������Ԫ��������
                           Rollback Work;
                           RAISE_APPLICATION_ERROR(-20001, 'ȡ����'||v_cur_name||'����Ԫ��������,��ά���ڲ�����!');
                           RETURN;
                        else
                            BEGIN
                                SELECT SUM(NVL(A_cumu, 0.00) + NVL(a_adjusted, 0.00)), --A ����
                                       SUM(NVL(B_cumu, 0.00) + NVL(b_adjusted, 0.00)) --B ����
                                  INTO v_A_cumu, v_B_cumu
                                  FROM FC_ACCU_BALANCE_PREDRAW
                                 WHERE account = v_acc
                                   AND balance_date = v_day_idx;
                              EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                     NULL;
                            END;

                            IF v_day_adjust_cumu > 0 THEN--����
                               IF (v_day_adjust_cumu + v_A_cumu > v_equal_usd) THEN --���ܵĻ��� +���� A>��������
                                  v_A_adjust_cumu := v_equal_usd - v_A_cumu;
                                  v_B_adjust_cumu := v_day_adjust_cumu - v_A_adjust_cumu;
                               ELSE --A ���� <0 ͬʱ �ܵĻ��� +���� A <=��������
                                  v_A_adjust_cumu := v_day_adjust_cumu;

                               END IF;

                            ELSE --����

                               IF ABS(v_B_cumu) >= ABS(v_day_adjust_cumu) THEN --ABS(B����)>=ABS�������ܵĵ���������
                                  v_B_adjust_cumu := v_day_adjust_cumu;
                               ELSE -- ABS(B����)<ABS�������ܵĵ���������
                                  v_B_adjust_cumu := - v_B_cumu;
                                  v_A_adjust_cumu := v_day_adjust_cumu + v_B_cumu;
                               END IF;

                            END IF;
                        end if;
                    end ;
                 else----2011 fc����,��ҵ���ڷִ�С�����ʴ���
                       begin
                         --�������ã������˻������Ƿ�Э�������Э����ͬʱ�����������
                         BEGIN
                               v_IS_AGREED := FUN_IS_AGREED(v_ACC, v_day_idx, v_rsvd_money);
                            EXCEPTION
                               WHEN OTHERS THEN
                                   ROllback Work;
                                   CLOSE cur_adjust_dtl;
                                   RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                         END;

                         IF v_IS_AGREED = 0 THEN --�����Э�����
                            v_A_adjust_cumu := v_day_adjust_cumu;
                         ELSE --����Э�����

                            BEGIN
                                SELECT SUM(NVL(A_cumu, 0.00) + NVL(a_adjusted, 0.00)), --A ����
                                       SUM(NVL(B_cumu, 0.00) + NVL(b_adjusted, 0.00)) --B ����
                                  INTO v_A_cumu, v_B_cumu
                                  FROM FC_ACCU_BALANCE_PREDRAW
                                 WHERE account = v_acc
                                   AND balance_date = v_day_idx;
                              EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                     NULL;
                            END;

                            IF v_day_adjust_cumu > 0 THEN--����
                               --MODIFIED  BY 2004.09.23 //v_A_cumu > 0 OR --A ���� > 0
                               IF (v_day_adjust_cumu + v_A_cumu > v_rsvd_money) THEN --���ܵĻ��� +���� A>��������
                                  v_A_adjust_cumu := v_rsvd_money - v_A_cumu;
                                  v_B_adjust_cumu := v_day_adjust_cumu - v_A_adjust_cumu;
                               ELSE --A ���� <0 ͬʱ �ܵĻ��� +���� A <=��������
                                  v_A_adjust_cumu := v_day_adjust_cumu;

                               END IF;

                            ELSE --����

                               IF ABS(v_B_cumu) >= ABS(v_day_adjust_cumu) THEN --ABS(B����)>=ABS�������ܵĵ���������
                                  v_B_adjust_cumu := v_day_adjust_cumu;
                               ELSE -- ABS(B����)<ABS�������ܵĵ���������
                                  v_B_adjust_cumu := - v_B_cumu;
                                  v_A_adjust_cumu := v_day_adjust_cumu + v_B_cumu;
                               END IF;

                            END IF;

                         END IF;
                        end;
                 end if ;----2011 fc����,��ҵ���ڷִ�С�����ʴ���

                 -- ADD by 2004.09.23
                 BEGIN
                       UPDATE FC_ACCU_BALANCE_PREDRAW
                          SET a_adjusted = NVL(a_adjusted, 0.00) + v_A_adjust_cumu,
                              b_adjusted = NVL(b_adjusted, 0.00) + v_B_adjust_cumu
                        WHERE account = v_acc
                          AND balance_date = v_day_idx
                          AND ROWNUM = 1; --ADD by 2005.10.24
                   EXCEPTION
                       WHEN OTHERS THEN
                            ROllback Work;
                            CLOSE cur_adjust_dtl;
                            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu + v_A_adjust_cumu;
                 v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu + v_B_adjust_cumu;

                 v_day_idx := v_day_idx + 1;

           END LOOP;

           --���»�������
           BEGIN
              /* --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
               SELECT NVL(SUM(A_adjust_cumu), 0.00),
                      NVL(SUM(B_adjust_cumu), 0.00)
                 INTO v_SUM_already_A,
                      v_SUM_already_B
                 FROM FC_ACCU_BALANCE_PREDRAW
                WHERE balance_date = v_balance_date
                  AND account = v_acc
                  AND interest_sign = '1'; --�Ѽ�Ϣ

               v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu - v_SUM_already_A; --GREATEST(v_SUM_A_adjust_cumu - v_SUM_already_A, 0.00);
               v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu - v_SUM_already_B; --GREATEST(v_SUM_B_adjust_cumu - v_SUM_already_B, 0.00);
               */
               UPDATE FC_ACCU_BALANCE_PREDRAW
                  SET A_adjust_cumu = A_adjust_cumu + v_SUM_A_adjust_cumu,
                      B_adjust_cumu = B_adjust_cumu + v_SUM_B_adjust_cumu
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND eom_interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;

    END LOOP;

    CLOSE cur_adjust_dtl;


    --�����˻���������  ����ȥ�Ѽ�Ϣ����������
    OPEN cur_adjust_acc;

    FETCH cur_adjust_acc INTO v_acc;
    WHILE cur_adjust_acc%FOUND LOOP
        BEGIN
             --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
             SELECT NVL(SUM(A_adjust_cumu), 0.00),
                    NVL(SUM(B_adjust_cumu), 0.00)
               INTO v_SUM_already_A,
                    v_SUM_already_B
               FROM FC_ACCU_BALANCE_PREDRAW
              WHERE balance_date = a_over_day
                AND account = v_acc
                AND eom_interest_sign = '1'; --�Ѽ�Ϣ

             BEGIN
               UPDATE FC_ACCU_BALANCE_PREDRAW
                  SET A_adjust_cumu = A_adjust_cumu - v_SUM_already_A,
                      B_adjust_cumu = B_adjust_cumu - v_SUM_already_B
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND eom_interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_acc INTO v_acc;

    END LOOP;

    CLOSE cur_adjust_acc;

    --ɾ�����ɵ���Ч����(�����)
    BEGIN
       DELETE FROM FC_ACCU_BALANCE_PREDRAW a
         WHERE a_cumu = 0.00
           AND b_cumu = 0.00
           AND a_adjust_cumu = 0.00
           AND b_adjust_cumu = 0.00
           AND eom_interest_sign = '0'
           AND balance_date > a_already_day
           AND balance_date <= a_over_day
           AND (SELECT count(*)
                  FROM FC_ACCU_BALANCE_PREDRAW
                 WHERE FC_ACCU_BALANCE_PREDRAW.account = a.account
                   AND FC_ACCU_BALANCE_PREDRAW.balance_date = a.balance_date) > 1;

     EXCEPTION
       WHEN OTHERS THEN
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
    END;

    RETURN;

END PROC_GENERATE_ACCU_FEX_PREDRAW;

/
CREATE OR REPLACE PROCEDURE proc_generate_accu_predraw (
    a_net_code in char,
    a_over_day in date,
    a_already_day in date
 )
 as
  v_balance_date Date;--��������
  v_Acc_Start_Date Date;--������
  v_acc varchar2(50); --�˺�
  v_rsvd_money NUMBER(14, 2); --��������
  v_day_adjust_cumu NUMBER(14, 2); --�����������
  v_A_cumu NUMBER(14, 2); --����A����
  v_B_cumu NUMBER(14, 2); --����B����
  v_interest_sign char(1); --��Ϣ��־�����ڻ�ȡ���Ƿ���δ��Ϣ����
  v_SUM_already_A NUMBER(14, 2);--�ܵ��Ѽƻ���A(��������A)
  v_SUM_already_B NUMBER(14, 2);--�ܵ��Ѽƻ���B(��������B)
  v_A_adjust_cumu NUMBER(14, 2); --����A��������
  v_B_adjust_cumu NUMBER(14, 2); --����B��������
  v_SUM_A_adjust_cumu NUMBER(14, 2); -- �ܵ�A��������
  v_SUM_B_adjust_cumu NUMBER(14, 2); -- �ܵ�B��������
  v_tally_date date; --��������
  v_interest_start_date date; --��Ϣ����
  v_IS_AGREED NUMBER; --��(1)��(0)Э�����
  v_day_idx date; --��������

  --��������
  CURSOR cur_cumu_dtl IS
        SELECT a.acc_start_date,B.balance_date, B.account,
               --Modified by 2004.09.23
               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                                   OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1)
                                 ELSE B.balance
                                 END)


                ELSE B.balance
                END
                ), --����A

               (CASE
                   WHEN Exists(SELECT rsvd_money
                                FROM fc_agreed_deposit
                               WHERE fc_agreed_deposit.start_date <= B.balance_date
                                 AND (fc_agreed_deposit.terminate_time IS NULL
                                      OR fc_agreed_deposit.terminate_time > B.balance_date )
                                 AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                 AND ROWNUM = 1)
                     THEN
                        (CASE
                            WHEN (B.balance > (SELECT rsvd_money
                                             FROM fc_agreed_deposit
                                            WHERE fc_agreed_deposit.start_date <= B.balance_date
                                              AND (fc_agreed_deposit.terminate_time IS NULL
                                               OR fc_agreed_deposit.terminate_time > B.balance_date )
                                              AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                              AND ROWNUM = 1))
                                      THEN B.Balance - (SELECT rsvd_money
                                                          FROM fc_agreed_deposit
                                                         WHERE fc_agreed_deposit.start_date <= B.balance_date
                                                         AND (fc_agreed_deposit.terminate_time IS NULL
                                                              OR fc_agreed_deposit.terminate_time > B.balance_date )
                                                         AND fc_agreed_deposit.blnctr_acc = A.blnctr_acc
                                                           AND ROWNUM = 1)
                                 ELSE 0.00
                                 END)


                ELSE 0.00
                END
                )
                --����B

          FROM fc_acc A INNER JOIN fc_acc_balance_PREDRAW B ON A.blnctr_acc = B.account
                LEFT OUTER JOIN fc_agreed_deposit C ON (A.blnctr_acc = C.blnctr_acc and C.terminate_optor IS NULL)
         WHERE A.interest_sign = '1'
           AND A.net_code = a_net_code
           AND  A.acc_type_code not in('05', '06', '08')--'05'��ҵ����'06'���ж���'08'֪ͨ���
           AND B.balance_date > a_already_day
           AND B.balance_date <= a_over_day
           AND A.PREDRAW_SIGN IN ('1','3','4'); -- ��ĩ��ϢԤ�� ÿ�½�Ϣ ��ĩ����ϢԤ��


  --��������
  CURSOR cur_adjust_dtl IS -- ��Ҫ������������ϸ��
         SELECT fc_accbook_dtl.account, --�˺�
                fc_accbook.tally_date, --��������
                fc_accbook.interest_start_date, --��Ϣ����
                ((fc_accbook_dtl.debit_money - fc_accbook_dtl.credit_money) --(�跽 �C ����)
                 * fc_acc.balance_way  --����
                 * sign(fc_accbook.tally_date - fc_accbook.interest_start_date) --�����ĵ�������
                ) -- ÿ���ܵĵ�������
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code  --�ս�����
            AND fc_acc.PREDRAW_SIGN IN ('1','3','4'); -- ��ĩ��ϢԤ�� ÿ�½�Ϣ ��ĩ����ϢԤ��


  --���������������˺�
  CURSOR cur_adjust_acc IS -- ���������������˺�
         SELECT DISTINCT fc_accbook_dtl.account --�˺�
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code  --�ս�����
            AND fc_acc.PREDRAW_SIGN IN ('1','3','4'); -- ��ĩ��ϢԤ�� ÿ�½�Ϣ ��ĩ����ϢԤ��
begin
    --���ɻ���A��B
    OPEN cur_cumu_dtl;
    FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    WHILE cur_cumu_dtl%FOUND LOOP
       --�������ڱ�����ڵ��ڿ������ڲſ����������ɻ��������ϣ������ʼ������������Ϊ0
       -- ����� 2009-05-08
       IF v_Acc_Start_Date> v_Balance_Date  Then
           NULL;
       ELSE

       BEGIN
            --��ȡ�ܵ��Ѽ�Ϣ����A���ܵ��Ѽ�Ϣ����B
            SELECT NVL(SUM(A_cumu), 0.00),
                   NVL(SUM(B_cumu), 0.00)
              INTO v_SUM_already_A,
                   v_SUM_already_B
              FROM FC_ACCU_BALANCE_PREDRAW
             WHERE balance_date = v_balance_date
               AND account = v_acc
               AND eom_interest_sign = '1'; --�Ѽ�Ϣ

             v_A_cumu := v_A_cumu - v_SUM_already_A; --GREATEST(v_A_cumu - v_SUM_already_A, 0.00);
             v_B_cumu := v_B_cumu - v_SUM_already_B; --GREATEST(v_B_cumu - v_SUM_already_B, 0.00);

             --���»�����
             BEGIN
                  --��ȡ�Ƿ���δ��Ϣ�Ļ���
                  SELECT eom_interest_sign
                    INTO v_interest_sign
                    FROM FC_ACCU_BALANCE_PREDRAW
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND eom_interest_sign = '0'; --δ��Ϣ

                 --��δ��Ϣ�Ļ�����,����»���
                  UPDATE FC_ACCU_BALANCE_PREDRAW
                     SET A_cumu = v_A_cumu,
                         B_cumu = v_B_cumu
                   WHERE balance_date = v_balance_date
                     AND account = v_acc
                     AND eom_interest_sign = '0';

               Exception
                    WHEN NO_DATA_FOUND THEN --û��δ��Ϣ�Ļ�����,����������
                         INSERT INTO FC_ACCU_BALANCE_PREDRAW(balance_date, account,
                                                     A_cumu,
                                                     B_cumu,
                                                     A_adjust_cumu,
                                                     B_adjust_cumu,
                                                     interest_sign,eom_interest_sign)
                              VALUES( v_balance_date,
                                      v_acc,
                                      v_A_cumu,
                                      v_B_cumu,
                                      0.00,--��������A
                                      0.00, --��������B
                                      '0','0' --�Ƿ��Ϣ��־
                                      );
                   WHEN TOO_MANY_ROWS THEN --���ݴ���(�����ϲ����ܳ��ֶ���)
                        ROllback Work;
                        RAISE_APPLICATION_ERROR(-20001, '���ݴ��󣺻������ֶ���!');
                        RETURN;
              END;




          EXCEPTION
               WHEN OTHERS THEN
                    Rollback Work;
                    RAISE_APPLICATION_ERROR(-20001, '���ɻ���������!');
                    RETURN;
       END;
       END IF;
       FETCH cur_cumu_dtl INTO v_Acc_Start_Date,v_balance_date, v_acc, v_A_cumu, v_B_cumu;
    END LOOP;

    CLOSE cur_cumu_dtl;


    --���µ�������
    OPEN cur_adjust_dtl;

    FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;
    WHILE cur_adjust_dtl%FOUND LOOP
        BEGIN

           v_SUM_A_adjust_cumu := 0;
           v_SUM_B_adjust_cumu := 0;

           v_day_idx := v_interest_start_date;

           WHILE v_day_idx < v_tally_date LOOP
                 v_A_adjust_cumu := 0;
                 v_B_adjust_cumu := 0;
                 --�������ã������˻������Ƿ�Э�������Э����ͬʱ�����������
                 BEGIN
                       v_IS_AGREED := FUN_IS_AGREED(v_ACC, v_day_idx, v_rsvd_money);
                    EXCEPTION
                       WHEN OTHERS THEN
                           ROllback Work;
                           CLOSE cur_adjust_dtl;
                           RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 IF v_IS_AGREED = 0 THEN --�����Э�����
                    v_A_adjust_cumu := v_day_adjust_cumu;
                 ELSE --����Э�����

                    BEGIN
                        SELECT SUM(NVL(A_cumu, 0.00) + NVL(a_adjusted, 0.00)), --A ����
                               SUM(NVL(B_cumu, 0.00) + NVL(b_adjusted, 0.00)) --B ����
                          INTO v_A_cumu, v_B_cumu
                          FROM FC_ACCU_BALANCE_PREDRAW
                         WHERE account = v_acc
                           AND balance_date = v_day_idx;
                      EXCEPTION
                        WHEN NO_DATA_FOUND THEN
                             NULL;
                    END;

                    IF v_day_adjust_cumu > 0 THEN--����
                       --MODIFIED  BY 2004.09.23 //v_A_cumu > 0 OR --A ���� > 0
                       IF (v_day_adjust_cumu + v_A_cumu > v_rsvd_money) THEN --���ܵĻ��� +���� A>��������
                          v_A_adjust_cumu := v_rsvd_money - v_A_cumu;
                          v_B_adjust_cumu := v_day_adjust_cumu - v_A_adjust_cumu;
                       ELSE --A ���� <0 ͬʱ �ܵĻ��� +���� A <=��������
                          v_A_adjust_cumu := v_day_adjust_cumu;

                       END IF;

                    ELSE --����

                       IF ABS(v_B_cumu) >= ABS(v_day_adjust_cumu) THEN --ABS(B����)>=ABS�������ܵĵ���������
                          v_B_adjust_cumu := v_day_adjust_cumu;
                       ELSE -- ABS(B����)<ABS�������ܵĵ���������
                          v_B_adjust_cumu := - v_B_cumu;
                          v_A_adjust_cumu := v_day_adjust_cumu + v_B_cumu;
                       END IF;

                    END IF;

                 END IF;

                 -- ADD by 2004.09.23
                 BEGIN
                       UPDATE FC_ACCU_BALANCE_PREDRAW
                          SET a_adjusted = NVL(a_adjusted, 0.00) + v_A_adjust_cumu,
                              b_adjusted = NVL(b_adjusted, 0.00) + v_B_adjust_cumu
                        WHERE account = v_acc
                          AND balance_date = v_day_idx
                          AND ROWNUM = 1; --ADD by 2005.10.24
                   EXCEPTION
                       WHEN OTHERS THEN
                            ROllback Work;
                            CLOSE cur_adjust_dtl;
                            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 v_SUM_A_adjust_cumu := v_SUM_A_adjust_cumu + v_A_adjust_cumu;
                 v_SUM_B_adjust_cumu := v_SUM_B_adjust_cumu + v_B_adjust_cumu;

                 v_day_idx := v_day_idx + 1;

           END LOOP;

           --���»�������
           BEGIN
               UPDATE FC_ACCU_BALANCE_PREDRAW
                  SET A_adjust_cumu = A_adjust_cumu + v_SUM_A_adjust_cumu,
                      B_adjust_cumu = B_adjust_cumu + v_SUM_B_adjust_cumu
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND eom_interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;

    END LOOP;

    CLOSE cur_adjust_dtl;


    --�����˻���������  ����ȥ�Ѽ�Ϣ����������
    OPEN cur_adjust_acc;

    FETCH cur_adjust_acc INTO v_acc;
    WHILE cur_adjust_acc%FOUND LOOP
        BEGIN
             --��ȡ�ܵ��Ѽ�Ϣ��������A���ܵ��Ѽ�Ϣ��������B
             SELECT NVL(SUM(A_adjust_cumu), 0.00),
                    NVL(SUM(B_adjust_cumu), 0.00)
               INTO v_SUM_already_A,
                    v_SUM_already_B
               FROM FC_ACCU_BALANCE_PREDRAW
              WHERE balance_date = a_over_day
                AND account = v_acc
                AND eom_interest_sign = '1'; --�Ѽ�Ϣ

             BEGIN
               UPDATE FC_ACCU_BALANCE_PREDRAW
                  SET A_adjust_cumu = A_adjust_cumu - v_SUM_already_A,
                      B_adjust_cumu = B_adjust_cumu - v_SUM_already_B
                WHERE account = v_acc
                  AND balance_date = a_over_day
                  AND eom_interest_sign = '0'; --δ��Ϣ

             EXCEPTION
               WHEN OTHERS THEN
                    ROllback Work;
                    CLOSE cur_adjust_dtl;
                    RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
           END;

        END;

        FETCH cur_adjust_acc INTO v_acc;

    END LOOP;

    CLOSE cur_adjust_acc;

    --ɾ�����ɵ���Ч����(�����)
    BEGIN
       DELETE FROM FC_ACCU_BALANCE_PREDRAW a
         WHERE a_cumu = 0.00
           AND b_cumu = 0.00
           AND a_adjust_cumu = 0.00
           AND b_adjust_cumu = 0.00
           AND eom_interest_sign = '0'
           AND balance_date > a_already_day
           AND balance_date <= a_over_day
           AND (SELECT count(*)
                  FROM FC_ACCU_BALANCE_PREDRAW
                 WHERE FC_ACCU_BALANCE_PREDRAW.account = a.account
                   AND FC_ACCU_BALANCE_PREDRAW.balance_date = a.balance_date) > 1;

     EXCEPTION
       WHEN OTHERS THEN
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
    END;

    RETURN;

END proc_generate_accu_predraw;



/
CREATE OR REPLACE PROCEDURE PROC_ACC_BALANCE_ATTRIBUTE (
   a_net_code in char,
   a_operator varchar2,
   a_TALLY_DATE in date)
 AS
    v_voucher_type varchar2(4);
    v_ACC varchar2(50);
    v_ACC_NAME VARCHAR2(80);
    v_ATTRIBUTE_ACC varchar2(16);
    v_ATTRIBUTE_Money Number(14, 2);
    v_CURRENCY CHAR(2);
    v_ORDER_NO VARCHAR2(18);
    v_VOUCHER_NO VARCHAR2(15);
    v_online_balance NUMBER(14, 2);
    v_check_balance NUMBER(14, 2);
    v_BALANCE_WAY NUMBER;

        Cursor cur_attri IS --������ϵ
          SELECT FC_ACC_ATTRI.BLNCTR_ACC, FC_ACC_ATTRI.ATTRIBUTE_ACC,
               FC_ACCBOOK_DTL.BALANCE - FC_ACC_ATTRI.RSVD_MONEY
          FROM FC_ACCBOOK,FC_ACCBOOK_DTL, FC_ACC_ATTRI
          WHERE FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
           AND FC_ACCBOOK_DTL.ACCOUNT = FC_ACC_ATTRI.ATTRIBUTE_ACC
           AND FC_ACCBOOK_DTL.BALANCE > FC_ACC_ATTRI.RSVD_MONEY
           AND FC_ACC_ATTRI.ATTRIBUTE_TYPE = 'T'
           AND FC_ACCBOOK.VOUCHER_STATE = 'N'
           AND FC_ACCBOOK.TALLY_DATE = a_TALLY_DATE
           AND FC_ACC_ATTRI.ATTRIBUTE_ACC LIKE a_net_code || '%';

 BEGIN
     --��ȡ��ϵͳ��Ŀ��ת-05��Ӧ���û�����Ļ�ƿ�Ŀ

     BEGIN
          SELECT voucher_type
            INTO v_voucher_type
            FROM fc_voucher_type
           WHERE fc_voucher_type.sys_voucher_code = '05' --ϵͳ��Ŀ��ת'05'
            AND ROWNUM = 1;
        Exception
          WHEN NO_DATA_FOUND THEN --δ�ҵ���Ӧ�Ŀ�Ŀ����ִ�й鼯
               RETURN;
          WHEN OTHERS THEN
               RAISE_APPLICATION_ERROR(-20001, SQLCode || SQLERRM);

     END;

     OPEN cur_attri;

     FETCH cur_attri INTO v_ACC, v_ATTRIBUTE_ACC, v_ATTRIBUTE_Money;

     WHILE cur_attri%FOUND LOOP
           BEGIN

              SELECT acc_name, cur_code, balance_way
                INTO v_ACC_NAME, v_CURRENCY, v_BALANCE_WAY
                FROM FC_ACC
               WHERE BLNCTR_ACC = v_ACC;

              -- ��ȡ��ˮ��
              PROC_GET_ACCBOOK_ORDER(a_net_code, v_ORDER_NO);
              -- ��ȡƾ֤��
              PROC_GET_VOUCHER_NO(a_net_code, v_CURRENCY, a_tally_date, v_VOUCHER_NO);

              BEGIN
                    --����ƾ֤����
                    INSERT INTO FC_ACCBOOK (ORDER_NO,
                                            VOUCHER_NO,
                                            enrol_time, --¼��ʱ��
                                            tally_date, --��������
                                            interest_start_date, --��Ϣ����
                                            voucher_type, --���㷽ʽ
                                            emergency_sign, --�Ӽ���־
                                            operator_code, --����Ա����
                                            checker_code, --����Ա����
                                            check_time, --��������
                                            approve_sign, --������־
                                            redblue_sign, --������־
                                            voucher_state, --ƾ֤״̬
                                            charged_sign, --�Ѽ������ѱ�־
                                            print_sign, --��ӡ��־
                                            generate_mode --������ʽ
                                           )
                           VALUES(v_ORDER_NO,
                                  v_VOUCHER_NO,
                                  SYSDATE,
                                  a_TALLY_DATE,
                                  a_TALLY_DATE, --��Ϣ����
                                  v_voucher_type,
                                  'G', --�Ӽ���־����ͨ
                                  a_operator,
                                  a_operator, --����Ա
                                  SYSDATE,
                                  'N', --��������
                                  'B', --������־
                                  'N', --ƾ֤״̬
                                  '0', --�Ѽ������ѱ�־
                                  '0', --��ӡ��־
                                  'A'  --������ʽ:�鼯
                                  );

                    --����ƾ֤��ϸ
                     SELECT online_balance, check_balance
                       INTO v_online_balance, v_check_balance
                       FROM FC_ONLINE_LEDGER
                      WHERE account = v_ACC;

                    v_online_balance := v_online_balance + (- v_ATTRIBUTE_Money) * v_BALANCE_WAY;
                    v_check_balance := v_check_balance + (- v_ATTRIBUTE_Money) * v_BALANCE_WAY;

                    INSERT INTO fc_accbook_dtl(order_no,
                                               line_no,
                                               summary_content, --ժҪ
                                               account,
                                               acc_name,
                                               debit_money,
                                               credit_money,
                                               balance
                                               )
                           VALUES(v_ORDER_NO,
                                  2,
                                  '��ʱ���鼯--ת��',
                                  v_ACC,
                                  v_ACC_NAME,
                                  0,
                                  v_ATTRIBUTE_Money, --�鼯���
                                  v_online_balance
                                  );

                    UPDATE FC_ONLINE_LEDGER
                       SET tally_cnt = tally_cnt + 1,
                           check_cnt = check_cnt + 1,
                           online_balance = v_online_balance,
                           check_balance = v_check_balance
                     WHERE account = v_ACC;

                    SELECT acc_name, balance_way
                      INTO v_ACC_NAME, v_BALANCE_WAY
                      FROM FC_ACC
                     WHERE BLNCTR_ACC = v_ATTRIBUTE_ACC;

                     SELECT online_balance, check_balance
                       INTO v_online_balance, v_check_balance
                       FROM FC_ONLINE_LEDGER
                      WHERE account = v_ATTRIBUTE_ACC;

                    v_online_balance := v_online_balance + v_ATTRIBUTE_Money * v_BALANCE_WAY;
                    v_check_balance := v_check_balance + v_ATTRIBUTE_Money * v_BALANCE_WAY;

                    INSERT INTO fc_accbook_dtl(order_no,
                                               line_no,
                                               summary_content, --ժҪ
                                               account,
                                               acc_name,
                                               debit_money,
                                               credit_money,
                                               balance
                                               )
                           VALUES(v_ORDER_NO,
                                  1,
                                  '��ʱ���鼯--ת��',
                                  v_ATTRIBUTE_ACC,
                                  v_ACC_NAME,
                                  v_ATTRIBUTE_Money, --�鼯���
                                  0,
                                  v_online_balance
                                  );

                    UPDATE FC_ONLINE_LEDGER
                       SET tally_cnt = tally_cnt + 1,
                           check_cnt = check_cnt + 1,
                           online_balance = v_online_balance,
                           check_balance = v_check_balance
                     WHERE account = v_ATTRIBUTE_ACC;
                EXCEPTION
                   WHEN OTHERS THEN
                        ROLLBACK WORK;
                        RAISE_APPLICATION_ERROR(-20001, '�鼯�˻�'||v_ATTRIBUTE_ACC||'��'||v_ACC||'����!');
              END;

              FETCH cur_attri INTO v_ACC, v_ATTRIBUTE_ACC, v_ATTRIBUTE_Money;
           END;

     END LOOP;

     CLOSE cur_attri;

     RETURN;

 END PROC_ACC_BALANCE_ATTRIBUTE;

/
CREATE OR REPLACE PROCEDURE PROC_DAY_OVER (A_NET_CODE        IN CHAR,
                                           A_OVER_DAY        IN DATE,
                                           A_ALREADY_DAY     IN DATE,
                                           A_OPERATOR_CODE   IN VARCHAR2)
AS
   V_ACC                        VARCHAR2 (50);
   V_ORDER_NO                   VARCHAR2 (18);
   V_LINE_NO                    NUMBER;
   V_BALANCE_WAY                NUMBER;
   --V_SUBJECT_CODE VARCHAR2(6);
   --V_SUBJECT_NAME VARCHAR2(40);
   V_SUM_CREDIT                 NUMBER;
   V_SUM_DEBIT                  NUMBER;
   V_DEBIT_MONEY                NUMBER (14, 2);
   V_CREDIT_MONEY               NUMBER (14, 2);
   V_BALANCE                    NUMBER (14, 2);
   V_ERRTXT                     VARCHAR2 (255);
   V_DAY_IDX                    DATE;
   V_SUBJECT_BALANCE_EVERYDAY   CHAR (1);
   V_IS_FEX   CHAR (1);
   V_IS_FundPool   CHAR (1);
   V_IS_INIT   CHAR (1);

   CURSOR CUR_ACC_BALANCE
   IS
      SELECT   FC_ACC_BALANCE.ACCOUNT,
               NVL (FC_ACC_BALANCE.YESTER_BALANCE, 0.00),
               FC_ACC.BALANCE_WAY
        FROM   FC_ACC, FC_ACC_BALANCE
       WHERE       FC_ACC.BLNCTR_ACC = FC_ACC_BALANCE.ACCOUNT
               AND FC_ACC.NET_CODE = A_NET_CODE
               AND BALANCE_DATE = A_OVER_DAY;

   CURSOR CUR_VOUCHER
   IS
        SELECT   FC_ACCBOOK_DTL.ORDER_NO,
                 FC_ACCBOOK_DTL.LINE_NO,
                 FC_ACCBOOK_DTL.DEBIT_MONEY,
                 FC_ACCBOOK_DTL.CREDIT_MONEY
          FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
         WHERE       FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                 AND FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%')
                 AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
                 AND FC_ACCBOOK_DTL.ACCOUNT = V_ACC
                 AND FC_ACCBOOK.VOUCHER_STATE <> 'B'
      ORDER BY   FC_ACCBOOK.VOUCHER_NO, FC_ACCBOOK_DTL.LINE_NO;
BEGIN
   /* ���������սᴦ�� */
   Proc_Out_Day_Over(A_NET_CODE,A_OVER_DAY,A_ALREADY_DAY);

   /*���ұ���ˮ���Ƿ�ƽ��*/
   BEGIN
        SELECT   FC_ACCBOOK_DTL.ORDER_NO
          INTO   V_ORDER_NO
          FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_ACC
         WHERE       FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                 AND FC_ACC.BLNCTR_ACC = FC_ACCBOOK_DTL.ACCOUNT
                 AND                                                        --
                    FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%')
                 AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
      GROUP BY   FC_ACCBOOK_DTL.ORDER_NO
        HAVING   SUM (DEBIT_MONEY) <> SUM (CREDIT_MONEY);
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ORDER_NO IS NOT NULL
   THEN
      ROLLBACK WORK;
      V_ERRTXT := '��ˮ��Ϊ:' || V_ORDER_NO || ' ����ˮ�˲�ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   /*����Ŀ��������������Ƿ�ƽ��*/
   BEGIN
      SELECT   SUM(CASE FC_ACC.BALANCE_WAY
                      WHEN 1 THEN FC_ONLINE_LEDGER.CHECK_BALANCE
                   END),
               SUM(CASE FC_ACC.BALANCE_WAY
                      WHEN -1 THEN FC_ONLINE_LEDGER.CHECK_BALANCE
                   END)
        INTO   V_SUM_DEBIT, V_SUM_CREDIT
        FROM   FC_ACC, FC_ONLINE_LEDGER
       WHERE   FC_ACC.BLNCTR_ACC = FC_ONLINE_LEDGER.ACCOUNT
               AND FC_ACC.NET_CODE = A_NET_CODE;
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_SUM_DEBIT <> V_SUM_CREDIT
   THEN
      ROLLBACK WORK;

      --V_ERRTXT := '��ĿΪ:' || V_SUBJECT_NAME || ' �ĸ��������������ƽ��!';
      V_ERRTXT := '����Ŀ�ĸ��������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;


   --�ʻ����鼯
   PROC_ACC_BALANCE_ATTRIBUTE (A_NET_CODE, A_OPERATOR_CODE, A_OVER_DAY);

   /*����������������*/
   V_DAY_IDX := A_ALREADY_DAY + 1;          /*DATEADD( DD , 1, ALREADY_DAY )*/

   WHILE V_DAY_IDX <= A_OVER_DAY
   LOOP
      /*������������Ľ跽������������*/
      BEGIN
         INSERT INTO FC_ACC_BALANCE (BALANCE_DATE,
                                     ACCOUNT,
                                     ACC_NAME,
                                     TR_CNT,                        --��ת����
                                     RUSH_CNT,                      --��������
                                     CNT,                             --�ܱ���
                                     YESTER_BALANCE,                --�������
                                     BALANCE,                           --���
                                     TR_DEBIT_MONEY,          --��ת�跽������
                                     TR_CREDIT_MONEY,         --��ת����������
                                     RUSH_DEBIT_MONEY,        --�����跽������
                                     RUSH_CREDIT_MONEY,       --��������������
                                     DEBIT_MONEY,             --�ܵĽ跽������
                                     CREDIT_MONEY,            --�ܵĴ���������
                                     TALLY_DAY_SIGN               --�Ƿ������
                                                   )    --��������ı������
            SELECT   V_DAY_IDX,
                     A.BLNCTR_ACC,
                     A.ACC_NAME,
                     (SELECT   COUNT (FC_ACCBOOK_DTL.ACCOUNT)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_VOUCHER_TYPE
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_VOUCHER_TYPE.VOUCHER_TYPE =
                                     FC_ACCBOOK.VOUCHER_TYPE
                               AND FC_VOUCHER_TYPE.SYS_VOUCHER_CODE = '05' --���㷽ʽ���Ϊ��ת(05)
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��ת����
                     (SELECT   COUNT (FC_ACCBOOK_DTL.ACCOUNT)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.REDBLUE_SIGN = 'R'    --������־
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��������
                     (SELECT   COUNT (FC_ACCBOOK_DTL.ACCOUNT)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ),  --�ܱ���
                     NVL (
                        (SELECT   BALANCE
                           FROM   FC_ACC_BALANCE
                          WHERE   BALANCE_DATE = V_DAY_IDX - 1 /*DATEADD( DD , -1, DAY_IDX )*/
                                                              AND FC_ACC_BALANCE.ACCOUNT = A.BLNCTR_ACC),
                        0.00
                     ),                                             --�������
                     0.00,                                     --���(�ݴ�Ϊ0)
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.DEBIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_VOUCHER_TYPE
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_VOUCHER_TYPE.VOUCHER_TYPE =
                                     FC_ACCBOOK.VOUCHER_TYPE
                               AND FC_VOUCHER_TYPE.SYS_VOUCHER_CODE = '05' --���㷽ʽ���Ϊ��ת(05)
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��ת�跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.CREDIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_VOUCHER_TYPE
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_VOUCHER_TYPE.VOUCHER_TYPE =
                                     FC_ACCBOOK.VOUCHER_TYPE
                               AND FC_VOUCHER_TYPE.SYS_VOUCHER_CODE = '05' --���㷽ʽ���Ϊ��ת(05)
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��ת����������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.DEBIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.REDBLUE_SIGN = 'R'    --������־
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�����跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.CREDIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.REDBLUE_SIGN = 'R'    --������־
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�����跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.DEBIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�ܵĽ跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.CREDIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�ܵĴ���������
                     (CASE WHEN V_DAY_IDX = A_OVER_DAY THEN '1' ELSE '0' END) --�Ƿ������
              FROM   FC_ACC A
             WHERE       A.CHECKER_CODE IS NOT NULL
                     AND A.NET_CODE = A_NET_CODE
                     AND A.ACC_START_DATE <= V_DAY_IDX
                     AND NOT EXISTS
                           (SELECT   WRITEOFF_ACC
                              FROM   FC_ACC_WRITEOFF
                             WHERE   WRITEOFF_ACC = A.BLNCTR_ACC
                                     AND TO_CHAR (CHECK_TIME, 'YYYYMMDD') <=
                                           TO_CHAR (V_DAY_IDX, 'YYYYMMDD')); --�ʻ����켰��ǰδע��
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK WORK;
            RAISE_APPLICATION_ERROR (-20001, '��������������!');
            RETURN;
      END;

      --������������������������������
      BEGIN
         UPDATE   FC_ACC_BALANCE A
            SET   CNT =
                     CNT
                     + NVL (
                          (SELECT   CNT
                             FROM   FC_ACC_BALANCE
                            WHERE   BALANCE_DATE = V_DAY_IDX - 1 /*DATEADD( DD , -1, DAY_IDX )*/
                                                                AND FC_ACC_BALANCE.ACCOUNT = A.ACCOUNT),
                          0
                       ),
                  BALANCE =
                     NVL (
                        (SELECT   A.YESTER_BALANCE
                                  + ( (A.DEBIT_MONEY - A.CREDIT_MONEY)
                                     * B.BALANCE_WAY)
                           FROM   FC_ACC B
                          WHERE   B.BLNCTR_ACC = A.ACCOUNT),
                        0.00
                     )
          WHERE       A.ACCOUNT LIKE (A_NET_CODE || '%')
                  AND A.BALANCE_DATE = V_DAY_IDX
                  AND (SELECT   ACC_START_DATE
                         FROM   FC_ACC
                        WHERE   BLNCTR_ACC = A.ACCOUNT) <= V_DAY_IDX;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK WORK;
            RAISE_APPLICATION_ERROR (-20001, '��������������!');
            RETURN;
      END;

      V_DAY_IDX := V_DAY_IDX + 1;              /*DATEADD( DD , 1, DAY_IDX ) */
   END LOOP;

   --����Ŀ�����������Ƿ�ƽ��
   BEGIN
      SELECT   SUM( (CASE FC_ACC.BALANCE_WAY
                        WHEN 1 THEN FC_ACC_BALANCE.BALANCE
                     END)),
               SUM( (CASE FC_ACC.BALANCE_WAY
                        WHEN -1 THEN FC_ACC_BALANCE.BALANCE
                     END))
        INTO   V_SUM_DEBIT, V_SUM_CREDIT
        FROM   FC_ACC, FC_ACC_BALANCE
       WHERE       FC_ACC.BLNCTR_ACC = FC_ACC_BALANCE.ACCOUNT
               AND FC_ACC.NET_CODE = A_NET_CODE
               AND FC_ACC_BALANCE.BALANCE_DATE = A_OVER_DAY;
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_SUM_DEBIT <> V_SUM_CREDIT
   THEN
      ROLLBACK WORK;

      --V_ERRTXT := '��ĿΪ:' || V_SUBJECT_NAME || ' �������������ƽ��!';
      V_ERRTXT := '����Ŀ�������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   --�������˱��������������Ƿ����
   BEGIN
      SELECT   A.ACCOUNT
        INTO   V_ACC
        FROM      FC_ONLINE_LEDGER A
               INNER JOIN
                  FC_ACC_BALANCE B
               ON A.ACCOUNT = B.ACCOUNT
       WHERE   A.ACCOUNT LIKE (A_NET_CODE || '%')
               AND B.BALANCE_DATE = A_OVER_DAY
               AND (A.CHECK_CNT
                    - (SELECT   COUNT ( * )
                         FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                        WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                                AND FC_ACCBOOK_DTL.ACCOUNT = A.ACCOUNT
                                AND FC_ACCBOOK.TALLY_DATE > A_OVER_DAY
                                AND FC_ACCBOOK.CHECKER_CODE IS NOT NULL
                                AND FC_ACCBOOK.VOUCHER_STATE <> 'B') <> B.CNT);
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ACC IS NOT NULL
   THEN
      ROLLBACK WORK;
      V_ERRTXT := '�ʻ�Ϊ:' || V_ACC || ' ����������������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   --���������������������Ƿ����
   BEGIN
      SELECT   A.ACCOUNT
        INTO   V_ACC
        FROM      FC_ONLINE_LEDGER A
               INNER JOIN
                  FC_ACC_BALANCE B
               ON A.ACCOUNT = B.ACCOUNT
       WHERE   A.ACCOUNT LIKE (A_NET_CODE || '%')
               AND B.BALANCE_DATE = A_OVER_DAY
               AND (A.CHECK_BALANCE
                    - (SELECT   SUM( (FC_ACCBOOK_DTL.DEBIT_MONEY
                                      - FC_ACCBOOK_DTL.CREDIT_MONEY)
                                    * FC_ACC.BALANCE_WAY)
                         FROM   FC_ACC, FC_ACCBOOK, FC_ACCBOOK_DTL
                        WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                                AND FC_ACC.BLNCTR_ACC =
                                      FC_ACCBOOK_DTL.ACCOUNT
                                AND FC_ACCBOOK_DTL.ACCOUNT = A.ACCOUNT
                                AND FC_ACCBOOK.TALLY_DATE > A_OVER_DAY
                                AND FC_ACCBOOK.CHECKER_CODE IS NOT NULL
                                AND FC_ACCBOOK.VOUCHER_STATE <> 'B') <>
                       B.BALANCE);
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ACC IS NOT NULL
   THEN
      ROLLBACK WORK;

      V_ERRTXT := '�ʻ�Ϊ:' || V_ACC || ' �����������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   --���ɿ�Ŀ�սᵥ
   --���뵱���з����Ŀ�Ŀ�ķ��������
   BEGIN
      INSERT INTO FC_SUBJECT_DAY (OPT_DATE,
                                  NET_CODE,
                                  AREA_CODE,
                                  VOCATION_CODE,
                                  SUBJECT_CODE,
                                  CURRENCY_CODE,
                                  TR_DEBIT_MONEY,
                                  TR_DEBIT_CNT,
                                  TR_CREDIT_MONEY,
                                  TR_CREDIT_CNT,
                                  CASH_DEBIT_MONEY,
                                  CASH_DEBIT_CNT,
                                  CASH_CREDIT_MONEY,
                                  CASH_CREDIT_CNT,
                                  YEST_BALANCE,
                                  TODAY_BALANCE)
           SELECT   A_OVER_DAY,
                    A_NET_CODE,
                    FC_ACC.AREA_CODE,
                    FC_ACC.VOCATION_CODE,
                    FC_ACC.SUBJECT_CODE,
                    FC_ACC.CUR_CODE,
                    NVL (
                       SUM(CASE CASH_TRANSFER_SIGN
                              WHEN 'T' THEN FC_ACCBOOK_DTL.DEBIT_MONEY
                           END),
                       0.00
                    ),                                          --ת�ʽ跽���
                    NVL (
                       SUM(CASE
                              WHEN CASH_TRANSFER_SIGN = 'T'
                                   AND FC_ACCBOOK_DTL.DEBIT_MONEY <> 0.00
                              THEN
                                 1
                              ELSE
                                 0
                           END),
                       0
                    ),                                          --ת�ʽ跽����
                    NVL (
                       SUM(CASE CASH_TRANSFER_SIGN
                              WHEN 'T' THEN FC_ACCBOOK_DTL.CREDIT_MONEY
                           END),
                       0.00
                    ),                                          --ת�ʴ������
                    NVL (
                       SUM(CASE
                              WHEN CASH_TRANSFER_SIGN = 'T'
                                   AND FC_ACCBOOK_DTL.CREDIT_MONEY <> 0.00
                              THEN
                                 1
                              ELSE
                                 0
                           END),
                       0
                    ),                                          --ת�ʴ�������
                    NVL (
                       SUM(CASE CASH_TRANSFER_SIGN
                              WHEN 'C' THEN FC_ACCBOOK_DTL.DEBIT_MONEY
                           END),
                       0.00
                    ),                                          --�ֽ�跽���
                    NVL (
                       SUM(CASE
                              WHEN CASH_TRANSFER_SIGN = 'C'
                                   AND FC_ACCBOOK_DTL.DEBIT_MONEY <> 0.00
                              THEN
                                 1
                              ELSE
                                 0
                           END),
                       0
                    ),                                          --�ֽ�跽����
                    NVL (
                       SUM(CASE CASH_TRANSFER_SIGN
                              WHEN 'C' THEN FC_ACCBOOK_DTL.CREDIT_MONEY
                           END),
                       0.00
                    ),                                          --�ֽ�������
                    NVL (
                       SUM(CASE
                              WHEN CASH_TRANSFER_SIGN = 'C'
                                   AND FC_ACCBOOK_DTL.CREDIT_MONEY <> 0.00
                              THEN
                                 1
                              ELSE
                                 0
                           END),
                       0
                    ),                                          --�ֽ��������
                    0.00,
                    0.00
             FROM   FC_ACC,
                    FC_ACCBOOK,
                    FC_ACCBOOK_DTL,
                    FC_VOUCHER_TYPE
            WHERE       FC_ACC.BLNCTR_ACC = FC_ACCBOOK_DTL.ACCOUNT
                    AND FC_ACC.NET_CODE = A_NET_CODE
                    AND FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                    AND FC_ACCBOOK.VOUCHER_TYPE = FC_VOUCHER_TYPE.VOUCHER_TYPE
                    AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
                    AND FC_ACCBOOK.VOUCHER_STATE <> 'B'               --δ����
         GROUP BY   A_OVER_DAY,
                    A_NET_CODE,
                    FC_ACC.AREA_CODE,
                    FC_ACC.VOCATION_CODE,
                    FC_ACC.SUBJECT_CODE,
                    FC_ACC.CUR_CODE;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, '���ɿ�Ŀ�սᵥ����!');
         RETURN;
   END;


   --���ɿ�Ŀ�սᵥ
   --���뵱��û�з����Ŀ�Ŀ�� ������(Ϊ0)������(Ϊ0)
   V_DAY_IDX := A_ALREADY_DAY + 1;        /*DATEADD( DD , 1, ALREADY_DAY )  */

   SELECT   PARAM_VALUE
     INTO   V_SUBJECT_BALANCE_EVERYDAY
     FROM   FC_PARAM
    WHERE   PARAM_CODE = 'subject_balance_everyday';

   IF V_SUBJECT_BALANCE_EVERYDAY = '0'
   THEN                                   -- '0'�����ս᲻�����ÿ��Ŀ�Ŀ���
      V_DAY_IDX := A_OVER_DAY;
   END IF;

   WHILE V_DAY_IDX <= A_OVER_DAY
   LOOP
      BEGIN
         INSERT INTO FC_SUBJECT_DAY (OPT_DATE,
                                     NET_CODE,
                                     AREA_CODE,
                                     VOCATION_CODE,
                                     SUBJECT_CODE,
                                     CURRENCY_CODE,
                                     TR_DEBIT_MONEY,
                                     TR_DEBIT_CNT,
                                     TR_CREDIT_MONEY,
                                     TR_CREDIT_CNT,
                                     CASH_DEBIT_MONEY,
                                     CASH_DEBIT_CNT,
                                     CASH_CREDIT_MONEY,
                                     CASH_CREDIT_CNT,
                                     YEST_BALANCE,
                                     TODAY_BALANCE)
              SELECT   V_DAY_IDX,
                       A_NET_CODE,
                       A.AREA_CODE,
                       A.VOCATION_CODE,
                       A.SUBJECT_CODE,
                       A.CUR_CODE,
                       0.00,                                    --ת�ʽ跽���
                       0,                                       --ת�ʽ跽����
                       0.00,                                    --ת�ʴ������
                       0,                                       --ת�ʴ�������
                       0.00,                                    --�ֽ�跽���
                       0,                                       --�ֽ�跽����
                       0.00,                                    --�ֽ�������
                       0,                                       --�ֽ��������
                       0.00,                                        --�������
                       0.00                                         --�������
                FROM   FC_SUBJECT, FC_ACC A
               WHERE   A.SUBJECT_CODE = FC_SUBJECT.SUBJECT_CODE
                       AND A.NET_CODE = A_NET_CODE
                       AND NOT EXISTS
                             (SELECT   *
                                FROM   FC_SUBJECT_DAY
                               WHERE       OPT_DATE = V_DAY_IDX
                                       AND NET_CODE = A_NET_CODE
                                       AND AREA_CODE = A.AREA_CODE
                                       AND VOCATION_CODE = A.VOCATION_CODE
                                       AND SUBJECT_CODE = A.SUBJECT_CODE
                                       AND CURRENCY_CODE = A.CUR_CODE)
            GROUP BY   A.AREA_CODE,
                       A.VOCATION_CODE,
                       A.SUBJECT_CODE,
                       A.CUR_CODE;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK WORK;
            RAISE_APPLICATION_ERROR (-20001, '���ɿ�Ŀ�սᵥ����!');
            RETURN;
      END;
      --�����������������
      BEGIN
         UPDATE   FC_SUBJECT_DAY A
            SET   YEST_BALANCE =
                     NVL (
                        (SELECT   TODAY_BALANCE
                           FROM   FC_SUBJECT_DAY
                          WHERE   ID =
                                     (SELECT   MAX (ID)
                                        FROM   FC_SUBJECT_DAY
                                       WHERE   FC_SUBJECT_DAY.NET_CODE =
                                                  A.NET_CODE
                                               AND FC_SUBJECT_DAY.AREA_CODE =
                                                     A.AREA_CODE
                                               AND FC_SUBJECT_DAY.VOCATION_CODE =
                                                     A.VOCATION_CODE
                                               AND FC_SUBJECT_DAY.SUBJECT_CODE =
                                                     A.SUBJECT_CODE
                                               AND FC_SUBJECT_DAY.CURRENCY_CODE =
                                                     A.CURRENCY_CODE
                                               AND FC_SUBJECT_DAY.OPT_DATE <
                                                     V_DAY_IDX)),
                        0.00
                     ),
                  TODAY_BALANCE =
                     NVL (
                        (SELECT   SUM(FC_ACC_BALANCE.BALANCE
                                      * FC_ACC.BALANCE_WAY)
                           FROM   FC_ACC, FC_ACC_BALANCE
                          WHERE   FC_ACC.BLNCTR_ACC = FC_ACC_BALANCE.ACCOUNT
                                  AND FC_ACC.NET_CODE = A.NET_CODE
                                  AND FC_ACC.AREA_CODE = A.AREA_CODE
                                  AND FC_ACC.VOCATION_CODE = A.VOCATION_CODE
                                  AND FC_ACC.SUBJECT_CODE = A.SUBJECT_CODE
                                  AND FC_ACC.CUR_CODE = A.CURRENCY_CODE
                                  AND FC_ACC_BALANCE.BALANCE_DATE = V_DAY_IDX),
                        0.00
                     )
          WHERE   NET_CODE = A_NET_CODE AND OPT_DATE = V_DAY_IDX;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK WORK;
            RAISE_APPLICATION_ERROR (-20001, '���¿�Ŀ�սᵥ����!');
            RETURN;
      END;


      V_DAY_IDX := V_DAY_IDX + 1;              /*DATEADD( DD , 1, DAY_IDX ) */
   END LOOP;

   --�������������ϸ��������Ժ�������Ļ���
   BEGIN
     SELECT PARAM_VALUE INTO V_IS_FEX FROM FC_PARAM WHERE PARAM_CODE='is_fex';
      Exception
          WHEN NO_DATA_FOUND THEN
               Rollback Work;
               RAISE_APPLICATION_ERROR(-20001, '����:��ҹ����Ƿ�����δ��ʼ��!');
               RETURN;
     END;
   IF V_IS_FEX IS NULL OR V_IS_FEX<>'1' THEN --�������Ƿ����ò��� ,������
      PROC_GENERATE_ACCU (A_NET_CODE, A_OVER_DAY, A_ALREADY_DAY);
    ELSE
      PROC_GENERATE_ACCU_FEX (A_NET_CODE, A_OVER_DAY, A_ALREADY_DAY);
    END IF;

   --��ת����ˮ��֮ǰ������ˮ�����
   OPEN CUR_ACC_BALANCE;

   FETCH CUR_ACC_BALANCE INTO   V_ACC, V_BALANCE, V_BALANCE_WAY;

   WHILE CUR_ACC_BALANCE%FOUND
   LOOP
      BEGIN
         OPEN CUR_VOUCHER;

         FETCH CUR_VOUCHER
            INTO   V_ORDER_NO, V_LINE_NO, V_DEBIT_MONEY, V_CREDIT_MONEY;

         WHILE CUR_VOUCHER%FOUND
         LOOP
            BEGIN
               V_BALANCE :=
                  V_BALANCE
                  + (V_DEBIT_MONEY - V_CREDIT_MONEY) * V_BALANCE_WAY;

               UPDATE   FC_ACCBOOK_DTL
                  SET   BALANCE = V_BALANCE
                WHERE   ORDER_NO = V_ORDER_NO AND LINE_NO = V_LINE_NO;
            EXCEPTION
               WHEN OTHERS
               THEN
                  ROLLBACK WORK;
                  RAISE_APPLICATION_ERROR (-20001, '����ƾ֤������!');
                  RETURN;
            END;

            FETCH CUR_VOUCHER
               INTO   V_ORDER_NO, V_LINE_NO, V_DEBIT_MONEY, V_CREDIT_MONEY;
         END LOOP;                           -- END FOR ���µ�ǰ�ʻ���ˮ�����

         CLOSE CUR_VOUCHER;
      END;

      FETCH CUR_ACC_BALANCE INTO   V_ACC, V_BALANCE, V_BALANCE_WAY;
   END LOOP;                                        --END FOR ��ȡ�ʻ��������

   CLOSE CUR_ACC_BALANCE;

   --�������ж�������
   BEGIN
      INSERT INTO FC_COMPARE_ACC (VOUCHER_ORDER_NO,
                                  VOUCHER_NO,
                                  VOUCHER_TYPE,
                                  TALLY_DATE,
                                  INTEREST_START_DATE,
                                  OPERATOR_CODE,
                                  BILL_NO,
                                  LINE_NO,
                                  SUMMARY_CONTENT,
                                  ACCOUNT,
                                  DEBIT_MONEY,
                                  CREDIT_MONEY,
                                  BALANCE,
                                  REDBLUE_SIGN)
         SELECT   FC_ACCBOOK.ORDER_NO,
                  FC_ACCBOOK.VOUCHER_NO,
                  FC_ACCBOOK.VOUCHER_TYPE,
                  FC_ACCBOOK.TALLY_DATE,
                  FC_ACCBOOK.INTEREST_START_DATE,
                  FC_ACCBOOK.OPERATOR_CODE,
                  FC_ACCBOOK.ORIG_VOUCHER_NO,
                  FC_ACCBOOK_DTL.LINE_NO,
                  FC_ACCBOOK_DTL.SUMMARY_CONTENT,
                  FC_ACCBOOK_DTL.ACCOUNT,
                  FC_ACCBOOK_DTL.DEBIT_MONEY,
                  FC_ACCBOOK_DTL.CREDIT_MONEY,
                  FC_ACCBOOK_DTL.BALANCE,
                  FC_ACCBOOK.REDBLUE_SIGN
           FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_ACC
          WHERE       FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                  AND FC_ACC.BLNCTR_ACC = FC_ACCBOOK_DTL.ACCOUNT
                  AND FC_ACC.NET_CODE = A_NET_CODE
                  AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
                  AND FC_ACC.IF_COMPARE = '1'
                  AND FC_ACCBOOK.VOUCHER_STATE <> 'B';                --δ����
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, '�������ж������ݳ���!');
         RETURN;
   END;


   --������ˮ��ת�ѽ���ˮ�ʱ�
   --��ˮ����ϸ
   BEGIN
      INSERT INTO FC_ACCBOOK_BLNED_DTL
         SELECT   FC_ACCBOOK_DTL.*
           FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
          WHERE       FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                  AND FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%')
                  AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, 'ת����ˮ����ϸ���ݳ���!');
         RETURN;
   END;

   BEGIN
      DELETE   FC_ACCBOOK_DTL
       WHERE   FC_ACCBOOK_DTL.ORDER_NO IN
                     (SELECT   FC_ACCBOOK.ORDER_NO
                        FROM   FC_ACCBOOK
                       WHERE   FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%')
                               AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY);
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, 'ת����ˮ����ϸ���ݳ���!');
         RETURN;
   END;

   --��ˮ������
   BEGIN
      INSERT INTO FC_ACCBOOK_BLNED
         SELECT   FC_ACCBOOK.*
           FROM   FC_ACCBOOK
          WHERE   FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
                  AND FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%');
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, 'ת����ˮ���������ݳ���!');
         RETURN;
   END;

   BEGIN
      DELETE   FC_ACCBOOK
       WHERE   FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
               AND FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%');
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, 'ת����ˮ���������ݳ���!');
         RETURN;
   END;

   --��¼�����ս���Ϣ
   BEGIN
      INSERT INTO FC_CARRY (CARRY_TYPE,
                            NET_CODE,
                            CARRY_TIME,
                            OPERATOR_CODE,
                            VOUCHER_START_DATE,
                            VOUCHER_END_DATE)
        VALUES   ('D',
                  A_NET_CODE,
                  SYSDATE,
                  A_OPERATOR_CODE,
                  A_ALREADY_DAY + 1,
                  A_OVER_DAY);
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, '��¼�ս���Ϣ����!');
         RETURN;
   END;
 proc_gen_corp_interest_dtl (A_NET_CODE, A_OVER_DAY, A_OVER_DAY);
 --�ʽ���Ƿ�����δ��ʼ��,�����ʽ�زŵ���
   BEGIN
     SELECT PARAM_VALUE1 INTO V_IS_FundPool FROM bt_param WHERE code='isFundPool' and sys_code='fcs';
      Exception
          WHEN NO_DATA_FOUND THEN
               Rollback Work;
               RAISE_APPLICATION_ERROR(-20001, '����:�ʽ���Ƿ�����!');
               RETURN;
     END;
   IF V_IS_FundPool ='1' THEN --������
      select col_add1 into V_IS_INIT from fc_param where param_code='day_over'and col_add2=A_NET_CODE;
      IF V_IS_INIT='1' THEN--�����ѳ�ʼ��
         proc_gen_foundPool_balance (A_NET_CODE, A_ALREADY_DAY, A_OVER_DAY);
      END IF;

   END IF;
   --�����ս��־
   BEGIN
      UPDATE   FC_PARAM
         SET   PARAM_VALUE = TO_CHAR (A_OVER_DAY, 'yyyy-mm-dd') /*CONVERT(CHAR(10), OVER_DAY, 120), */
       WHERE   PARAM_CODE = 'day_over' AND COL_ADD2 = A_NET_CODE;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE_APPLICATION_ERROR (-20001, '�����ս��־����!');
         RETURN;
   END;

   RETURN;
END PROC_DAY_OVER;

/
CREATE OR REPLACE PROCEDURE PROC_DAY_OVER_PREDRAW (A_NET_CODE        IN CHAR,
                                           A_OVER_DAY        IN DATE,
                                           A_ALREADY_DAY     IN DATE,
                                           A_OPERATOR_CODE   IN VARCHAR2)
AS
   V_ACC                        VARCHAR2 (50);
   V_ORDER_NO                   VARCHAR2 (18);
   V_LINE_NO                    NUMBER;
   V_BALANCE_WAY                NUMBER;
   --V_SUBJECT_CODE VARCHAR2(6);
   --V_SUBJECT_NAME VARCHAR2(40);
   V_SUM_CREDIT                 NUMBER;
   V_SUM_DEBIT                  NUMBER;
   V_DEBIT_MONEY                NUMBER (14, 2);
   V_CREDIT_MONEY               NUMBER (14, 2);
   V_BALANCE                    NUMBER (14, 2);
   V_ERRTXT                     VARCHAR2 (255);
   V_DAY_IDX                    DATE;
   V_SUBJECT_BALANCE_EVERYDAY   CHAR (1);
   V_IS_FEX   CHAR (1);

BEGIN

   /*�Ƿ���δ���˵���*/

   BEGIN
        SELECT   ORDER_NO
          INTO   V_ORDER_NO
          FROM   FC_ACCBOOK
         WHERE ( voucher_no IS NULL or voucher_no =' ' OR VOUCHER_STATE='W' )
           AND TALLY_DATE =  A_OVER_DAY AND ORDER_NO LIKE (A_NET_CODE || '%');
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ORDER_NO IS NOT NULL
   THEN
      ROLLBACK WORK;
      V_ERRTXT := '��ˮ��Ϊ:' || V_ORDER_NO || ' δ����!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   /*���ұ���ˮ���Ƿ�ƽ��*/
   BEGIN
        SELECT   FC_ACCBOOK_DTL.ORDER_NO
          INTO   V_ORDER_NO
          FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_ACC
         WHERE       FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                 AND FC_ACC.BLNCTR_ACC = FC_ACCBOOK_DTL.ACCOUNT
                 AND                                                        --
                    FC_ACCBOOK.ORDER_NO LIKE (A_NET_CODE || '%')
                 AND FC_ACCBOOK.TALLY_DATE = A_OVER_DAY
      GROUP BY   FC_ACCBOOK_DTL.ORDER_NO
        HAVING   SUM (DEBIT_MONEY) <> SUM (CREDIT_MONEY);
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ORDER_NO IS NOT NULL
   THEN
      ROLLBACK WORK;
      V_ERRTXT := '��ˮ��Ϊ:' || V_ORDER_NO || ' ����ˮ�˲�ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   /*����Ŀ��������������Ƿ�ƽ��*/
   BEGIN
      SELECT   SUM(CASE FC_ACC.BALANCE_WAY
                      WHEN 1 THEN FC_ONLINE_LEDGER.CHECK_BALANCE
                   END),
               SUM(CASE FC_ACC.BALANCE_WAY
                      WHEN -1 THEN FC_ONLINE_LEDGER.CHECK_BALANCE
                   END)
        INTO   V_SUM_DEBIT, V_SUM_CREDIT
        FROM   FC_ACC, FC_ONLINE_LEDGER
       WHERE   FC_ACC.BLNCTR_ACC = FC_ONLINE_LEDGER.ACCOUNT
               AND FC_ACC.NET_CODE = A_NET_CODE;
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_SUM_DEBIT <> V_SUM_CREDIT
   THEN
      ROLLBACK WORK;

      --V_ERRTXT := '��ĿΪ:' || V_SUBJECT_NAME || ' �ĸ��������������ƽ��!';
      V_ERRTXT := '����Ŀ�ĸ��������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;


   --�ʻ����鼯
   --PROC_ACC_BALANCE_ATTRIBUTE (A_NET_CODE, A_OPERATOR_CODE, A_OVER_DAY);

   /*����������������*/
   V_DAY_IDX := A_ALREADY_DAY + 1;          /*DATEADD( DD , 1, ALREADY_DAY )*/

   WHILE V_DAY_IDX <= A_OVER_DAY
   LOOP
      /*������������Ľ跽������������*/
      BEGIN

         --ɾ��Ԥ�������
          BEGIN
             DELETE FROM FC_ACC_BALANCE_PREDRAW a
               WHERE  balance_date = V_DAY_IDX
                 AND account like (A_NET_CODE || '%') ;
             DELETE FROM FC_ACCU_BALANCE_PREDRAW a
               WHERE  balance_date = V_DAY_IDX
                 AND account like (A_NET_CODE || '%') and eom_interest_sign='0' ;

           EXCEPTION
             WHEN OTHERS THEN
                  ROllback Work;
                  RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
          END;

         INSERT INTO FC_ACC_BALANCE_PREDRAW (BALANCE_DATE,
                                     ACCOUNT,
                                     ACC_NAME,
                                     TR_CNT,                        --��ת����
                                     RUSH_CNT,                      --��������
                                     CNT,                             --�ܱ���
                                     YESTER_BALANCE,                --�������
                                     BALANCE,                           --���
                                     TR_DEBIT_MONEY,          --��ת�跽������
                                     TR_CREDIT_MONEY,         --��ת����������
                                     RUSH_DEBIT_MONEY,        --�����跽������
                                     RUSH_CREDIT_MONEY,       --��������������
                                     DEBIT_MONEY,             --�ܵĽ跽������
                                     CREDIT_MONEY,            --�ܵĴ���������
                                     TALLY_DAY_SIGN               --�Ƿ������
                                                   )    --��������ı������
            SELECT   V_DAY_IDX,
                     A.BLNCTR_ACC,
                     A.ACC_NAME,
                     (SELECT   COUNT (FC_ACCBOOK_DTL.ACCOUNT)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_VOUCHER_TYPE
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_VOUCHER_TYPE.VOUCHER_TYPE =
                                     FC_ACCBOOK.VOUCHER_TYPE
                               AND FC_VOUCHER_TYPE.SYS_VOUCHER_CODE = '05' --���㷽ʽ���Ϊ��ת(05)
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��ת����
                     (SELECT   COUNT (FC_ACCBOOK_DTL.ACCOUNT)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.REDBLUE_SIGN = 'R'    --������־
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��������
                     (SELECT   COUNT (FC_ACCBOOK_DTL.ACCOUNT)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ),  --�ܱ���
                     NVL (
                        (SELECT   BALANCE
                           FROM   FC_ACC_BALANCE
                          WHERE   BALANCE_DATE = V_DAY_IDX - 1 /*DATEADD( DD , -1, DAY_IDX )*/
                            AND FC_ACC_BALANCE.ACCOUNT = A.BLNCTR_ACC),
                        0.00
                     ),                                             --�������
                     0.00,                                     --���(�ݴ�Ϊ0)
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.DEBIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_VOUCHER_TYPE
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_VOUCHER_TYPE.VOUCHER_TYPE =
                                     FC_ACCBOOK.VOUCHER_TYPE
                               AND FC_VOUCHER_TYPE.SYS_VOUCHER_CODE = '05' --���㷽ʽ���Ϊ��ת(05)
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��ת�跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.CREDIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL, FC_VOUCHER_TYPE
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_VOUCHER_TYPE.VOUCHER_TYPE =
                                     FC_ACCBOOK.VOUCHER_TYPE
                               AND FC_VOUCHER_TYPE.SYS_VOUCHER_CODE = '05' --���㷽ʽ���Ϊ��ת(05)
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --��ת����������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.DEBIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.REDBLUE_SIGN = 'R'    --������־
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�����跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.CREDIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.REDBLUE_SIGN = 'R'    --������־
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�����跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.DEBIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�ܵĽ跽������
                     (SELECT   NVL (SUM (FC_ACCBOOK_DTL.CREDIT_MONEY), 0.00)
                        FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                       WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                               AND FC_ACCBOOK_DTL.ACCOUNT = A.BLNCTR_ACC
                               AND FC_ACCBOOK.TALLY_DATE = V_DAY_IDX
                               AND FC_ACCBOOK.VOUCHER_STATE <> 'B'  --��Ϊ����
                                                                  ), --�ܵĴ���������
                     (CASE WHEN V_DAY_IDX = A_OVER_DAY THEN '1' ELSE '0' END) --�Ƿ������
              FROM   FC_ACC A
             WHERE       A.CHECKER_CODE IS NOT NULL
                     AND A.NET_CODE = A_NET_CODE
                     AND A.PREDRAW_SIGN IN ('1','3','4') -- ��ĩ��ϢԤ��  ÿ�½�Ϣ ��ĩ����ϢԤ��
                     AND A.ACC_START_DATE <= V_DAY_IDX
                     AND NOT EXISTS
                           (SELECT   WRITEOFF_ACC
                              FROM   FC_ACC_WRITEOFF
                             WHERE   WRITEOFF_ACC = A.BLNCTR_ACC
                                     AND TO_CHAR (CHECK_TIME, 'YYYYMMDD') <=
                                           TO_CHAR (V_DAY_IDX, 'YYYYMMDD')); --�ʻ����켰��ǰδע��
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK WORK;
            RAISE_APPLICATION_ERROR (-20001, '��������������!');
            RETURN;
      END;

      --������������������������������
      BEGIN
         UPDATE   FC_ACC_BALANCE_PREDRAW A
            SET   CNT =
                     CNT
                     + NVL (
                          (SELECT   CNT
                             FROM   FC_ACC_BALANCE
                            WHERE   BALANCE_DATE = V_DAY_IDX - 1 /*DATEADD( DD , -1, DAY_IDX )*/
                            AND FC_ACC_BALANCE.ACCOUNT = A.ACCOUNT),
                          0
                       ),
                  BALANCE =
                     NVL (
                        (SELECT   C.BALANCE
                                  + ( (A.DEBIT_MONEY - A.CREDIT_MONEY)
                                     * B.BALANCE_WAY)
                           FROM   FC_ACC B,FC_ACC_BALANCE C
                          WHERE   B.BLNCTR_ACC = A.ACCOUNT AND B.BLNCTR_ACC=C.ACCOUNT
                          and  C.BALANCE_DATE=V_DAY_IDX - 1),
                        0.00
                     )
          WHERE       A.ACCOUNT LIKE (A_NET_CODE || '%')
                  AND A.BALANCE_DATE = V_DAY_IDX
                  AND (SELECT   ACC_START_DATE
                         FROM   FC_ACC
                        WHERE   BLNCTR_ACC = A.ACCOUNT) <= V_DAY_IDX;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK WORK;
            RAISE_APPLICATION_ERROR (-20001, '��������������!');
            RETURN;
      END;

      V_DAY_IDX := V_DAY_IDX + 1;              /*DATEADD( DD , 1, DAY_IDX ) */
   END LOOP;

   /*--����Ŀ�����������Ƿ�ƽ��
   BEGIN
      SELECT   SUM( (CASE FC_ACC.BALANCE_WAY
                        WHEN 1 THEN FC_ACC_BALANCE_PREDRAW.BALANCE
                     END)),
               SUM( (CASE FC_ACC.BALANCE_WAY
                        WHEN -1 THEN FC_ACC_BALANCE_PREDRAW.BALANCE
                     END))
        INTO   V_SUM_DEBIT, V_SUM_CREDIT
        FROM   FC_ACC, FC_ACC_BALANCE_PREDRAW
       WHERE       FC_ACC.BLNCTR_ACC = FC_ACC_BALANCE_PREDRAW.ACCOUNT
               AND FC_ACC.NET_CODE = A_NET_CODE
               AND FC_ACC_BALANCE_PREDRAW.BALANCE_DATE = A_OVER_DAY;
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_SUM_DEBIT <> V_SUM_CREDIT
   THEN
      ROLLBACK WORK;

      --V_ERRTXT := '��ĿΪ:' || V_SUBJECT_NAME || ' �������������ƽ��!';
      V_ERRTXT := '����Ŀ�������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   --�������˱��������������Ƿ����
   BEGIN
      SELECT   A.ACCOUNT
        INTO   V_ACC
        FROM      FC_ONLINE_LEDGER A
               INNER JOIN
                  FC_ACC_BALANCE_PREDRAW B
               ON A.ACCOUNT = B.ACCOUNT
       WHERE   A.ACCOUNT LIKE (A_NET_CODE || '%')
               AND B.BALANCE_DATE = A_OVER_DAY
               AND (A.CHECK_CNT
                    - (SELECT   COUNT ( * )
                         FROM   FC_ACCBOOK, FC_ACCBOOK_DTL
                        WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                                AND FC_ACCBOOK_DTL.ACCOUNT = A.ACCOUNT
                                AND FC_ACCBOOK.TALLY_DATE > A_OVER_DAY
                                AND FC_ACCBOOK.CHECKER_CODE IS NOT NULL
                                AND FC_ACCBOOK.VOUCHER_STATE <> 'B') <> B.CNT);
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ACC IS NOT NULL
   THEN
      ROLLBACK WORK;
      V_ERRTXT := '�ʻ�Ϊ:' || V_ACC || ' ����������������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;

   --���������������������Ƿ����
   BEGIN
      SELECT   A.ACCOUNT
        INTO   V_ACC
        FROM      FC_ONLINE_LEDGER A
               INNER JOIN
                  FC_ACC_BALANCE_PREDRAW B
               ON A.ACCOUNT = B.ACCOUNT
       WHERE   A.ACCOUNT LIKE (A_NET_CODE || '%')
               AND B.BALANCE_DATE = A_OVER_DAY
               AND (A.CHECK_BALANCE
                    - (SELECT   SUM( (FC_ACCBOOK_DTL.DEBIT_MONEY
                                      - FC_ACCBOOK_DTL.CREDIT_MONEY)
                                    * FC_ACC.BALANCE_WAY)
                         FROM   FC_ACC, FC_ACCBOOK, FC_ACCBOOK_DTL
                        WHERE   FC_ACCBOOK.ORDER_NO = FC_ACCBOOK_DTL.ORDER_NO
                                AND FC_ACC.BLNCTR_ACC =
                                      FC_ACCBOOK_DTL.ACCOUNT
                                AND FC_ACCBOOK_DTL.ACCOUNT = A.ACCOUNT
                                AND FC_ACCBOOK.TALLY_DATE > A_OVER_DAY
                                AND FC_ACCBOOK.CHECKER_CODE IS NOT NULL
                                AND FC_ACCBOOK.VOUCHER_STATE <> 'B') <>
                       B.BALANCE);
   EXCEPTION
      WHEN TOO_MANY_ROWS
      THEN
         NULL;
      WHEN NO_DATA_FOUND
      THEN
         NULL;
   END;

   IF V_ACC IS NOT NULL
   THEN
      ROLLBACK WORK;

      V_ERRTXT := '�ʻ�Ϊ:' || V_ACC || ' �����������������ƽ��!';
      RAISE_APPLICATION_ERROR (-20001, V_ERRTXT);
      RETURN;
   END IF;*/


   --�������������ϸ��������Ժ�������Ļ���
   BEGIN
     SELECT PARAM_VALUE INTO V_IS_FEX FROM FC_PARAM WHERE PARAM_CODE='is_fex';
      Exception
          WHEN NO_DATA_FOUND THEN
               Rollback Work;
               RAISE_APPLICATION_ERROR(-20001, '����:��ҹ����Ƿ�����δ��ʼ��!');
               RETURN;
     END;
   IF V_IS_FEX IS NULL OR V_IS_FEX<>'1' THEN --�������Ƿ����ò��� ,������
      proc_generate_accu_predraw (A_NET_CODE, A_OVER_DAY, A_ALREADY_DAY);
    ELSE
      PROC_GENERATE_ACCU_FEX_PREDRAW (A_NET_CODE, A_OVER_DAY, A_ALREADY_DAY);
    END IF;


   RETURN;
END PROC_DAY_OVER_PREDRAW;

/
CREATE OR REPLACE PROCEDURE PROC_REGENERATE_COMPARE_ACC(
 a_net_code      IN char,
 a_begin_day     IN date,
 a_end_day       IN date )
as
  v_acc          varchar2(50);
  v_order_no     varchar2(18);
  v_line_no      Number;
  v_balance_way  Number;
  v_debit_money  Number(14, 2);
  v_credit_money Number(14, 2);
  v_balance      Number(14, 2);

  --��ȡ�˻���@begin_day���ڳ����
  CURSOR cur_acc_balance IS
   SELECT fc_acc_balance.account,
          NVL(fc_acc_balance.yester_balance, 0.00),
          fc_acc.balance_way
     FROM fc_acc, fc_acc_balance
    WHERE fc_acc.blnctr_acc = fc_acc_balance.account
      AND fc_acc.net_code = a_net_code
      AND balance_date = a_begin_day;

  CURSOR cur_voucher IS
  SELECT fc_accbook_blned_dtl.order_no, fc_accbook_blned_dtl.line_no,
         fc_accbook_blned_dtl.debit_money, fc_accbook_blned_dtl.credit_money
    FROM fc_accbook_blned, fc_accbook_blned_dtl
   WHERE fc_accbook_blned.order_no = fc_accbook_blned_dtl.order_no AND
         fc_accbook_blned.tally_date >= a_begin_day AND
         fc_accbook_blned.tally_date <= a_end_day AND
         fc_accbook_blned_dtl.account = v_acc AND
         fc_accbook_blned.voucher_state <> 'B'
ORDER BY fc_accbook_blned.voucher_no,
         fc_accbook_blned_dtl.line_no;

begin

  OPEN cur_acc_balance;
  FETCH cur_acc_balance INTO v_acc, v_balance, v_balance_way;
  WHILE cur_acc_balance%FOUND LOOP
     BEGIN

         OPEN cur_voucher;
         FETCH cur_voucher INTO v_order_no, v_line_no, v_debit_money, v_credit_money;
         WHILE cur_voucher%FOUND LOOP
            BEGIN
                v_balance := v_balance + (v_debit_money - v_credit_money) * v_balance_way;

                UPDATE fc_accbook_blned_dtl
                   SET balance = v_balance
                 WHERE order_no = v_order_no
                   AND line_no = v_line_no;

              Exception
                WHEN OTHERS THEN
                    Rollback Work;
                    RAISE_APPLICATION_ERROR(-20001, '������ϸ�˳���!');
                    RETURN;
            END;

            FETCH cur_voucher INTO v_order_no, v_line_no, v_debit_money, v_credit_money;

         END  LOOP; -- end for ���µ�ǰ�˻���ϸ�����

         CLOSE cur_voucher;

     END;

     FETCH cur_acc_balance INTO v_acc, v_balance, v_balance_way;

  END LOOP; --END FOR ��ȡ�˻��ڳ����

  CLOSE cur_acc_balance;

  --�������ɶ��˵�
  --�������������ɣ���Ҫ��ɾ�����ٲ���
  --ɾ�����˵�����
  BEGIN
      DELETE fc_compare_acc
       WHERE voucher_order_no like (a_net_code || '%')
         AND tally_date >= a_begin_day
         AND tally_date <= a_end_day;
    Exception
        WHEN OTHERS THEN
            Rollback Work;
            RAISE_APPLICATION_ERROR(-20001, 'ɾ�����˵����ݳ���!');
            RETURN;
  END;

  BEGIN
    INSERT INTO fc_compare_acc
      (voucher_order_no,
       voucher_no,
       tally_date,
       interest_start_date,
       operator_code,
       bill_no,
       line_no,
       summary_content,
       account,
       debit_money,
       credit_money,
       balance,
       redblue_sign)
      SELECT fc_accbook_blned.order_no,
             fc_accbook_blned.voucher_no,
             fc_accbook_blned.tally_date,
             fc_accbook_blned.interest_start_date,
             fc_accbook_blned.operator_code,
             fc_accbook_blned.orig_voucher_no,
             fc_accbook_blned_dtl.line_no,
             fc_accbook_blned_dtl.summary_content,
             fc_accbook_blned_dtl.account,
             fc_accbook_blned_dtl.debit_money,
             fc_accbook_blned_dtl.credit_money,
             fc_accbook_blned_dtl.balance,
             fc_accbook_blned.redblue_sign
        FROM fc_accbook_blned, fc_accbook_blned_dtl, fc_acc
       WHERE fc_accbook_blned.order_no = fc_accbook_blned_dtl.order_no AND
             fc_acc.blnctr_acc = fc_accbook_blned_dtl.account AND
             fc_acc.net_code = a_net_code AND
             fc_accbook_blned.tally_date >= a_begin_day AND
             fc_accbook_blned.tally_date <= a_end_day AND
             fc_acc.if_compare = '1' AND
             fc_accbook_blned.voucher_state <> 'B'; --δ����
   Exception
     WHEN OTHERS THEN
       Rollback Work;
       RAISE_APPLICATION_ERROR(-20001, '���ɶ��˵����ݳ���!');
       RETURN;
  END;

END PROC_REGENERATE_COMPARE_ACC;

/
CREATE OR REPLACE PROCEDURE PROC_RESTORE_ADJUSTED_ACCU(
    a_net_code char,  --�ָ��ս�����
    a_over_day date  --�ָ��ս�����
 )
AS
    --v_balance_date Date; --��������
    v_acc Varchar2(50); --�˺�
    v_rsvd_money Number(14, 2); --��������
    v_day_adjust_cumu Number(14, 2); --�����������
    v_A_adjusted Number(14, 2); --����A�ѵ�����
    v_B_adjusted Number(14, 2); --����B�ѵ�����
    --v_interest_sign Char(1); --��Ϣ��־�����ڻ�ȡ���Ƿ���δ��Ϣ����
    v_A_adjust_cumu Number(14, 2); --����A��������
    v_B_adjust_cumu Number(14, 2); --����B��������
    v_tally_date Date; --��������
    v_interest_start_date Date; --��Ϣ����
    v_IS_AGREED Integer; --��(1)��(0)Э�����
    v_day_idx Date; --��������

    --��������
    CURSOR cur_adjust_dtl IS -- ��Ҫ������������ϸ��
         SELECT fc_accbook_dtl.account, --�˺�
                fc_accbook.tally_date,--��������
                fc_accbook.interest_start_date, --��Ϣ����
                ((fc_accbook_dtl.debit_money - fc_accbook_dtl.credit_money) --(�跽 �C ����)
                 * fc_acc.balance_way  --����
                 * SIGN(fc_accbook.tally_date - fc_accbook.interest_start_date) --�����ĵ�������
                ) -- ÿ���ܵĵ�������
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ָ��ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code; --�ָ��ս�����
BEGIN

    OPEN cur_adjust_dtl;

    FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;
    WHILE cur_adjust_dtl%FOUND LOOP

           v_day_idx := v_interest_start_date;

           WHILE v_day_idx < v_tally_date LOOP

                 v_A_adjust_cumu := 0;
                 v_B_adjust_cumu := 0;
                 --�������ã������˻������Ƿ�Э�������Э����ͬʱ�����������
                 BEGIN
                       v_IS_AGREED := FUN_IS_AGREED(v_ACC, v_day_idx, v_rsvd_money);
                    EXCEPTION
                       WHEN OTHERS THEN
                           ROllback Work;
                           CLOSE cur_adjust_dtl;
                           RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                 END;

                 IF v_IS_AGREED = 0 THEN  --�����Э�����

                    v_A_adjust_cumu := v_day_adjust_cumu;

                 ELSE --����Э�����

                    SELECT NVL(sum(a_adjusted), 0.00), --A  �ѵ�����
                           NVL(sum(b_adjusted), 0.00) --B  �ѵ�����
                      INTO v_A_adjusted, v_B_adjusted
                      FROM fc_accu_balance
                     WHERE account = v_acc
                       AND balance_date = v_day_idx;

                    IF v_day_adjust_cumu > 0 THEN --����

                       IF v_B_adjusted > v_day_adjust_cumu THEN
                          v_B_adjust_cumu := v_day_adjust_cumu;
                       ELSE
                          v_B_adjust_cumu := v_B_adjusted;
                          v_A_adjust_cumu := v_day_adjust_cumu - v_B_adjust_cumu;
                       END IF;

                    ELSE --����

                       IF v_B_adjusted < v_day_adjust_cumu THEN
                          v_B_adjust_cumu := v_day_adjust_cumu;
                       ELSE
                          v_B_adjust_cumu := v_B_adjusted;
                          v_A_adjust_cumu := v_day_adjust_cumu - v_B_adjust_cumu;
                       END IF;

                    END IF; --end for ����

                 END IF; --end for ����Э�����
                 BEGIN
                     UPDATE fc_accu_balance
                        SET a_adjusted = a_adjusted - v_A_adjust_cumu,
                            b_adjusted = b_adjusted - v_B_adjust_cumu
                      WHERE account = v_acc
                        AND balance_date = v_day_idx
                        AND ROWNUM = 1;

                   EXCEPTION
                        WHEN OTHERS THEN
                             ROllback Work;
                             CLOSE cur_adjust_dtl;
                             RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM); --'�����ѵ�������������!'
                 END;


                 v_day_idx := v_day_idx + 1;

           END LOOP; -- end for  WHILE @day_idx < @tally_date


           FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;

    END LOOP; -- end for FETCH cur_adjust_dtl

    CLOSE cur_adjust_dtl;

  EXCEPTION
     WHEN OTHERS THEN
       ROllback Work;
       CLOSE cur_adjust_dtl;
       RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);


END PROC_RESTORE_ADJUSTED_ACCU;

/
CREATE OR REPLACE PROCEDURE PROC_RESTORE_ADJUSTED_ACCU_FEX(
    a_net_code char,  --�ָ��ս�����
    a_over_day date  --�ָ��ս�����
 )
AS
    --v_balance_date Date; --��������
    v_acc Varchar2(50); --�˺�
    v_rsvd_money Number(14, 2); --��������
    v_day_adjust_cumu Number(14, 2); --�����������
    v_A_adjusted Number(14, 2); --����A�ѵ�����
    v_B_adjusted Number(14, 2); --����B�ѵ�����
    --v_interest_sign Char(1); --��Ϣ��־�����ڻ�ȡ���Ƿ���δ��Ϣ����
    v_A_adjust_cumu Number(14, 2); --����A��������
    v_B_adjust_cumu Number(14, 2); --����B��������
    v_tally_date Date; --��������
    v_interest_start_date Date; --��Ϣ����
    v_IS_AGREED Integer; --��(1)��(0)Э�����
    v_day_idx Date; --��������

    --2011 fc���ӱ���
    v_cur char(2);--�ұ� ���ʱ�õ�
    v_acc_type char(2); -- �˺����� ��һ����账��
    --v_equal_usd NUMBER(14, 2); --��ֵ300W��Ԫ����ҽ��
    v_cur_name varchar2(20);
    v_natural_cur char(2);--��λ��

    --��������
    CURSOR cur_adjust_dtl IS -- ��Ҫ������������ϸ��
         SELECT fc_accbook_dtl.account, --�˺�
                fc_accbook.tally_date,--��������
                fc_accbook.interest_start_date, --��Ϣ����
                ((fc_accbook_dtl.debit_money - fc_accbook_dtl.credit_money) --(�跽 �C ����)
                 * fc_acc.balance_way  --����
                 * SIGN(fc_accbook.tally_date - fc_accbook.interest_start_date) --�����ĵ�������
                ) -- ÿ���ܵĵ�������
           FROM fc_accbook, fc_accbook_dtl, fc_acc
          WHERE fc_accbook.order_no = fc_accbook_dtl.order_no
            AND fc_accbook_dtl.account = fc_acc.blnctr_acc
            AND fc_accbook.tally_date <> fc_accbook.interest_start_date --�������ڲ�������Ϣ����
            AND fc_accbook.tally_date = a_over_day --�������� ���� �ָ��ս�����
            AND fc_acc.interest_sign = '1' --��Ϣ��־
            AND fc_accbook.voucher_state <> 'B' --δ����
            AND fc_acc.acc_state <> 'D' --�˻�δע��
            AND fc_acc.net_code = a_net_code; --�ָ��ս�����
BEGIN
    begin
      select cur_code into v_natural_cur
      from bt_currency where valid_sign='1' and natural_sign='1' and rownum=1;
      Exception
        WHEN NO_DATA_FOUND THEN --û�����ñ�λ��
            ROllback Work;
            RAISE_APPLICATION_ERROR(-20001, 'ȡ��λ�ҳ���!');
            RETURN;
    end;

    OPEN cur_adjust_dtl;

    FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;
    WHILE cur_adjust_dtl%FOUND LOOP

           v_day_idx := v_interest_start_date;

           WHILE v_day_idx < v_tally_date LOOP

                 v_A_adjust_cumu := 0;
                 v_B_adjust_cumu := 0;
                 --2011 fc����,��ҵ���ڷִ�С�����ʴ���
                 --��һ��ڵ��ú��������ص�ֵ300W��Ԫ��������ҽ��,������ڸ�ֵ,
                 select acc_type_code, cur_code,(select cur_name from bt_currency where cur_code=fc_acc.cur_code)
                  into v_acc_type, v_cur,v_cur_name
                  from fc_acc
                 where blnctr_acc = V_ACC;
                 if v_acc_type='01' and v_cur<> v_natural_cur then -- �����ҵ����
                    BEGIN
                        SELECT NVL(a_adjusted, 0.00), --A  �ѵ�����
                               NVL(b_adjusted, 0.00) --B  �ѵ�����
                          INTO v_A_adjusted, v_B_adjusted
                          FROM fc_accu_balance
                         WHERE account = v_acc
                           AND balance_date = v_day_idx;

                        IF v_day_adjust_cumu > 0 THEN --����

                           IF v_B_adjusted > v_day_adjust_cumu THEN
                              v_B_adjust_cumu := v_day_adjust_cumu;
                           ELSE
                              v_B_adjust_cumu := v_B_adjusted;
                              v_A_adjust_cumu := v_day_adjust_cumu - v_B_adjust_cumu;
                           END IF;

                        ELSE --����

                           IF v_B_adjusted < v_day_adjust_cumu THEN
                              v_B_adjust_cumu := v_day_adjust_cumu;
                           ELSE
                              v_B_adjust_cumu := v_B_adjusted;
                              v_A_adjust_cumu := v_day_adjust_cumu - v_B_adjust_cumu;
                           END IF;

                        END IF; --end for ����
                    END;
                 else--2011 fc����,��ҵ���ڷִ�С�����ʴ���
                    begin
                       --�������ã������˻������Ƿ�Э�������Э����ͬʱ�����������
                       BEGIN
                             v_IS_AGREED := FUN_IS_AGREED(v_ACC, v_day_idx, v_rsvd_money);
                          EXCEPTION
                             WHEN OTHERS THEN
                                 ROllback Work;
                                 CLOSE cur_adjust_dtl;
                                 RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);
                       END;

                       IF v_IS_AGREED = 0 THEN  --�����Э�����

                          v_A_adjust_cumu := v_day_adjust_cumu;

                       ELSE --����Э�����

                          SELECT NVL(sum(a_adjusted), 0.00), --A  �ѵ�����
                                 NVL(sum(b_adjusted), 0.00) --B  �ѵ�����
                            INTO v_A_adjusted, v_B_adjusted
                            FROM fc_accu_balance
                           WHERE account = v_acc
                             AND balance_date = v_day_idx;

                          IF v_day_adjust_cumu > 0 THEN --����

                             IF v_B_adjusted > v_day_adjust_cumu THEN
                                v_B_adjust_cumu := v_day_adjust_cumu;
                             ELSE
                                v_B_adjust_cumu := v_B_adjusted;
                                v_A_adjust_cumu := v_day_adjust_cumu - v_B_adjust_cumu;
                             END IF;

                          ELSE --����

                             IF v_B_adjusted < v_day_adjust_cumu THEN
                                v_B_adjust_cumu := v_day_adjust_cumu;
                             ELSE
                                v_B_adjust_cumu := v_B_adjusted;
                                v_A_adjust_cumu := v_day_adjust_cumu - v_B_adjust_cumu;
                             END IF;

                          END IF; --end for ����

                       END IF; --end for ����Э�����
                     end;
                 end if;--2011 fc����,��ҵ���ڷִ�С�����ʴ���

                 BEGIN
                     UPDATE fc_accu_balance
                        SET a_adjusted = a_adjusted - v_A_adjust_cumu,
                            b_adjusted = b_adjusted - v_B_adjust_cumu
                      WHERE account = v_acc
                        AND balance_date = v_day_idx
                        AND ROWNUM = 1;

                   EXCEPTION
                        WHEN OTHERS THEN
                             ROllback Work;
                             CLOSE cur_adjust_dtl;
                             RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM); --'�����ѵ�������������!'
                 END;


                 v_day_idx := v_day_idx + 1;

           END LOOP; -- end for  WHILE @day_idx < @tally_date


           FETCH cur_adjust_dtl INTO v_acc, v_tally_date, v_interest_start_date, v_day_adjust_cumu;

    END LOOP; -- end for FETCH cur_adjust_dtl

    CLOSE cur_adjust_dtl;

  EXCEPTION
     WHEN OTHERS THEN
       ROllback Work;
       CLOSE cur_adjust_dtl;
       RAISE_APPLICATION_ERROR(-20001, SQLCODE||SQLERRM);


END PROC_RESTORE_ADJUSTED_ACCU_FEX;

/
