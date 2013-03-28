-- �޸����ڣ�20121207
-- �޸��ˣ�������
--�޸����ݣ���Ŀ�˻�����,��Ӧ����Ϣ-����/���ڵĵ�λ��ϸ��ʾ


CREATE OR REPLACE PROCEDURE PROC_GET_INTEREST_INOUT_201 (
     a_net IN VARCHAR2,
    a_cur IN VARCHAR2,
    a_corp IN VARCHAR2,
    a_begindate IN date,
    a_enddate IN date,
    a_subject IN varchar2, --ϵͳ��Ŀ
    a_debit out number,
    a_credit out number,
    a_bal out number )
 AS
    v_acc_type varchar(20);--��Ӧ��Ϣ��ϵͳ��Ŀ
    v_debit_1 number(14,2);
    v_credit_1 number(14,2);
    v_debit_2 number(14,2);
    v_credit_2 number(14,2);/*
    v_carry_begin date;
    v_carry_end date;*/
 BEGIN
   
   IF a_subject='2011' THEN --Ӧ����Ϣ--��ҵ����
     v_acc_type := '01';
   ElsIf  a_subject='2012' THEN --Ӧ����Ϣ--��ҵ����
     v_acc_type := '05';
   END IF;
   select sum(bal),sum(debit_money),sum(credit_money)
  into a_bal, v_debit_1, v_credit_1
  from (select sum(d.interest) bal, 0.00 debit_money, sum(d.interest) credit_money
          from fc_predraw_dtl d, fc_acc e
         where d.account = e.blnctr_acc
           and d.interest_time in(select interest_time from fc_predraw_dtl where 
            order_no in
               (select b.order_no
                  from fc_accbook_blned     a,
                       fc_accbook_blned_dtl b,
                       fc_acc               c,
                       fc_subject           f
                 where a.order_no = b.order_no
                   and b.account = c.blnctr_acc
                   and c.subject_code = f.subject_code
                   and a.tally_date >= a_begindate
                   and a.tally_date <= a_enddate
                   and a.voucher_state <> 'B'
                   and c.cur_code = a_cur
                   and c.net_code = a_net
                   and f.sys_subject_code = a_subject))
           and e.acc_type_code = v_acc_type
           and e.corp_code = a_corp
         group by e.corp_code
        union
        --������Ϣ��Ԥ���㷨
        select sum(-strike_interest) bal, 0.00 debit_money,  sum(-strike_interest) credit_money --e.corp_code,
          from fc_predraw_dtl d,
               fc_acc e,
               (select distinct interest_time
                  from fc_interest_dtl
                 where order_no in
                       (select b.order_no
                          from fc_accbook_blned     a,
                               fc_accbook_blned_dtl b,
                               fc_acc               c,
                               fc_subject           h
                         where a.order_no = b.order_no
                           and b.account = c.blnctr_acc
                           and c.subject_code = h.subject_code
                           and a.tally_date >= a_begindate
                           and a.tally_date <= a_enddate
                           and a.voucher_state <> 'B'
                           and c.cur_code = a_cur
                           and c.net_code = a_net
                           and h.sys_subject_code = a_subject)
                   ) f
         where d.strike_date = f.interest_time
           and e.blnctr_acc = d.account
           and e.acc_type_code = v_acc_type
           and e.corp_code = a_corp);
             --and e.acc_type_code='01';

        if v_debit_1 is null then
           v_debit_1 :=0.00;
        end if;

        if v_credit_1 is null then
           v_credit_1 :=0.00;
        end if;
        if v_debit_2 is null then
           v_debit_2 :=0.00;
        end if;

        if v_credit_2 is null then
           v_credit_2 :=0.00;
        end if;
         a_debit := v_debit_1 + v_debit_2;
         a_credit := v_credit_1 + v_credit_2;
end PROC_GET_INTEREST_INOUT_201;
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
      a_init := 0.00;

      --ȡ�跽����������
      v_begindate :=a_begindate;
      v_enddate := a_enddate;
      if a_corp<>a_net then
         PROC_GET_INTEREST_INOUT_5011(a_net, a_cur, a_corp,v_begindate,v_enddate,v_subject,a_debit,a_credit,v_tmp);
       end if;
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
      --ȡ�ڳ����  ��ĩ��� Ĭ��Ϊ0
 ElsIf a_subject = '2011' or a_subject = '2012' or  a_subject = '2013'  or  a_subject = '2014' THEN --Ӧ����Ϣ
      a_init := 0.00; --ȡ�ڳ����
      a_balance :=0.00; --ȡ��ĩ���
      --ȡ�跽����������
      if a_corp<>a_net then
          v_begindate :=a_begindate;
          v_enddate := a_enddate;
          if a_subject='2011' or  a_subject='2012'  then -- Ӧ����Ϣ-��ҵ���ڴ��  ��ҵ���ڴ��
             PROC_GET_INTEREST_INOUT_201(a_net, a_cur, a_corp,v_begindate,v_enddate,a_subject,a_debit,a_credit,v_tmp);
          end if  ;
       END IF;
  END IF;
end PROC_GET_INTEREST_INOUT;
/
