-- �޸����ڣ�2012-12-02
-- �޸��ˣ�������
--�޸����ݣ����ϰ�ҩ ��ʷ����Զ����ɹ�

--�޸��ˣ�����
--������ʻ���ʷ�����㷽ʽ0,ͨ���ӿڴ����л�ȡ��1ϵͳ������ϸ�Զ����� 
DECLARE
  VN_COUNT    NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_param
    WHERE code ='computeHisBal';
    IF VN_COUNT = 0 THEN
insert into bt_param
       (CODE,
       SYS_CODE,
       NAME,
       PARAM_VALUE1,
       PARAM_VALUE2,
       PARAM_VALUE3,
       PARAM_TYPE,
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
       REVERSE10) values (
       'computeHisBal','adm','�����˻���ʷ�����㷽ʽ','0',null,null,0,'�����˻���ʷ�����㷽ʽ,Ĭ��0','0,ͨ���ӿڴ����л�ȡ;1,ϵͳ������ϸ�Զ�����',null,null,null,null,1,null,null,null,null);
end if;
end;
/



--�˺ű�,��ʷ����,��ʷ��ϸ����ֶ�

--��ʼ���  ��ʼ������� ��������ʱ�� ��ϸ�Ƿ��Ѳ������ļ��� 
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = upper('bt_bank_acc') AND COLUMN_NAME = upper('init_balance');
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' alter table bt_bank_acc add init_balance  NUMBER(14,2)';
    EXECUTE IMMEDIATE VC_STR;
    VC_STR := ' alter table bt_bank_acc add init_balance_date date';
    EXECUTE IMMEDIATE VC_STR;
    VC_STR := ' alter table bis_acc_his_bal add compute_time date';
    EXECUTE IMMEDIATE VC_STR;
    VC_STR := ' alter table bis_acc_his_dtl add is_compute char(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--�½��洢����,������ʷ���ļ���
CREATE OR REPLACE Procedure Proc_Bis_Acc_His_Bal(In_Bif_Code in varchar) --���д���
 As
  /*
    �����̵Ĺ���:ϵͳ������ϸ�Զ����������˺ŵ���ʷ���,��������ȷ��,�����ǰ����:�����˺�ά����ά�������ڵĲż���
    ������Ա:������
    ����ʱ��:2012-11-29
  */

   v_count number;
   v_Bal_Date date;
   v_Sum  Bis_Acc_His_Bal.Bank_Bal%Type := 0;
   V_BANK_BAL  Bis_Acc_His_Bal.Bank_Bal%Type := 0;
   V_BANK_ACC Bis_Acc_His_Bal.Bank_ACC%Type;
   V_init_balance_date bt_bank_acc.init_balance_date%Type;
   V_init_date bt_bank_acc.init_balance_date%Type;
   V_init_balance bt_bank_acc.init_balance%Type;
   V_Bal_Date_Begin Bis_Acc_His_Bal.Bal_Date%Type;
   V_Bal_Date_End   Bis_Acc_His_Bal.Bal_Date%Type;
   V_compute_time   Bis_Acc_His_Bal.compute_time%Type;
   V_compute_time_tmp   Bis_Acc_His_Bal.compute_time%Type;
   V_systime   Bis_Acc_His_Bal.compute_time%Type;
   V_trans_time   Bis_Acc_His_Dtl.trans_time%Type;
  --�ҳ�������Ҫ���������˺�
  CURSOR COMPUTE_BANKACC
  IS
    SELECT a.bank_acc, a.init_balance_date, nvl(a.init_balance,0.00)
      FROM bt_bank_acc a,bis_acc_list b
     WHERE a.bank_acc=b.bank_acc and init_balance_date is not null
       AND b.bif_code like In_Bif_Code
       AND a.BIS_TYPE = '1';

  --ȡ����û�м��������ϸ,������ϸ���ϴμ���֮��ɨ������,���������ʱ��,�����ڸ��»��
  CURSOR Bis_Acc_His_Dtl_online
   IS
      SELECT  trunc(trans_time)
        FROM   Bis_Acc_His_Dtl a,bt_bank_acc b
       WHERE   a.bank_acc=b.bank_acc and b.bis_type='1'
        and a.bank_acc=V_BANK_ACC
        and a.bif_code like In_Bif_Code
        and ( a.is_compute is null or a.is_compute<>'1')
        and a.rec_time > V_compute_time
   group by trunc(trans_time) ;
Begin
--��һ�ε�һ��ѭ��,���˺� ------------------------��ʼ------------------------
OPEN COMPUTE_BANKACC;
FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
WHILE COMPUTE_BANKACC%FOUND
LOOP
  BEGIN
      V_systime := sysdate;
      --�����˺���������Ŀ�ʼ����,��������Ϊϵͳ����ǰһ��
      select max(compute_time) into V_compute_time from bis_acc_his_bal where bank_acc=V_BANK_ACC; --ȡ���һ�����ļ���ʱ��
      IF V_compute_time IS NULL THEN
          V_compute_time :=V_systime;
      END IF;
      --ȡ���һ�μ�����������
      V_init_date :=null;
      select max(bal_date) into V_init_date from bis_acc_his_bal where bank_acc=V_BANK_ACC and compute_time is not null;
      IF V_init_date IS NULL OR V_init_date <= V_init_balance_date THEN --���һ�μ���������ڻ�С���˺ŵĳ�ʼ����
           V_Bal_Date_Begin := trunc(V_init_balance_date);
           V_BANK_BAL := V_init_balance;
       ELSE
           V_Bal_Date_Begin := trunc(V_init_date);
           select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and bal_date=V_init_date and rownum=1;
       END IF;
       V_Bal_Date_End := trunc(V_systime - 1);
       --�ڶ���ѭ��,������ϸ�������---------------------��ʼ------------------------
        If V_Bal_Date_Begin <= V_Bal_Date_End Then
          --������ѭ��
          v_Bal_Date := V_Bal_Date_Begin;
          While (v_Bal_Date <= V_Bal_Date_End) Loop
            Begin
                --��ǰһ��������뵽����
                IF v_Bal_Date > V_Bal_Date_Begin THEN --ѭ�����ڶ��ʼ�֮������ʱ,�����ȡǰһ�ʼ���������
                   select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and bal_date=v_Bal_Date - 1 and rownum=1;
                END IF;
                Insert Into Bis_Acc_His_Bal (Bank_Acc, Bif_Code, Bal_Date, Get_Date,  Bank_Bal, Get_By, Avail_Bal, Reverse1,compute_time)
                select Bank_Acc, Bif_Code, v_Bal_Date , v_Bal_Date, V_BANK_BAL, '2', V_BANK_BAL, '��������ֶ�����',V_systime
                 from v_acc_list
                where bif_code like In_Bif_Code
                  and bank_acc = V_BANK_ACC
                  and bank_acc not in
                      (select a.bank_acc
                         from bis_acc_his_bal a,  Bt_Bank_Acc b
                        where a.bank_acc=b.bank_acc and To_char(a.Bal_Date,'yyyy-mm-dd') = To_char(v_Bal_Date,'yyyy-mm-dd'));
                --���ݵ�����ϸ,���µ����
                --ȡ��ϸ���������-��֧��
                Select nvl(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - nvl(Sum( case cd_sign when '1' then Amt else 0 end),0.00)
                  Into v_Sum
                  From Bis_Acc_His_Dtl
                 Where Bank_Acc = V_BANK_ACC
                   And To_Char(Trans_Time, 'yyyy-mm-dd') = To_Char(v_Bal_Date , 'yyyy-mm-dd')
                   AND ( is_compute is null or is_compute<>'1')
		   AND rec_time <= V_compute_time;

                --�������
                select compute_time into V_compute_time_tmp from Bis_Acc_His_Bal
                where BANK_ACC = V_BANK_ACC AND To_char(Bal_Date, 'yyyy-mm-dd') = To_char(v_Bal_Date, 'yyyy-mm-dd') and rownum=1;
                IF V_compute_time_tmp IS NULL THEN --��������Ϊ��,��ʾ����ǽӿ����ɵ�,�轫�ӿڵ����д��reverse6�ֶ�,����
                    --������µ����Ϊ���нӿ�ɨ�ص����,�����ֵ=������� + ������ϸ,
                    --���ڼ����ͬһ������compute_time��д����Ӧʱ��,�����´��ٸ�����������ʱ,�����ٵ��ô˷���
                    --���ҵ��ô˷���ʱ,��ϸ��is_compute�϶�Ϊ��,���������ȡ��ϸ������ķ�����ͨ�õ�
                    select count(1) into v_count FROM Bis_Acc_His_Bal WHERE To_char(Bal_Date,'yyyy-mm-dd') = To_char(v_Bal_Date  -1,'yyyy-mm-dd') AND BANK_ACC=V_BANK_ACC and rownum=1;
                    IF v_count>0 THEN
                        select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and To_char(Bal_Date,'yyyy-mm-dd') = To_char(v_Bal_Date  -1,'yyyy-mm-dd') and rownum=1;
                    ELSE
                        V_BANK_BAL :=0;
                    END IF;
                    UPDATE Bis_Acc_His_Bal
                       SET Bank_Bal  = V_BANK_BAL + v_Sum, Avail_Bal = V_BANK_BAL + v_Sum,compute_time=V_compute_time,reverse6=Bank_Bal
                     WHERE BANK_ACC = V_BANK_ACC
                       AND To_char(Bal_Date, 'yyyy-mm-dd') = To_char(v_Bal_Date, 'yyyy-mm-dd');
                ELSE
                    UPDATE Bis_Acc_His_Bal
                       SET Bank_Bal  = Bank_Bal + v_Sum, Avail_Bal = Avail_Bal + v_Sum,compute_time=V_compute_time
                     WHERE BANK_ACC = V_BANK_ACC
                       AND To_char(Bal_Date, 'yyyy-mm-dd') = To_char(v_Bal_Date, 'yyyy-mm-dd');
                END IF;

                --����ϸ����Ϊ�Ѽ����״̬
                update Bis_Acc_His_Dtl
                   set is_compute = '1'
                 where bank_acc = V_BANK_ACC
                   and To_char(trans_time, 'yyyy-mm-dd') = To_char(v_Bal_Date, 'yyyy-mm-dd')
                   and rec_time <= V_compute_time ;
             END;

             v_Bal_Date := v_Bal_Date + 1;
          End Loop;
        End If;
       --�ڶ���ѭ��,������ϸ�������---------------------����------------------------
  END;
  FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
END LOOP;                           -- END FOR ���µ�ǰ�ʻ���ˮ�����
CLOSE COMPUTE_BANKACC;
--��һ�ε�һ��ѭ��,���˺� ------------------------����------------------------


--�ڶ��ε�һ��ѭ��,���˺� ------------------------��ʼ------------------------
OPEN COMPUTE_BANKACC;
FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
WHILE COMPUTE_BANKACC%FOUND
LOOP
  BEGIN
      V_systime := sysdate;
      --ɨ���ϴ�������֮�����ϸ
      --����ȡ���һ�����ļ���ʱ��
      select max(compute_time) into V_compute_time from bis_acc_his_bal where bank_acc=V_BANK_ACC; --ȡ���һ�����ļ���ʱ��
      IF V_compute_time IS NULL THEN
          V_compute_time :=V_systime;
      END IF;
      --���ɨ�ص�����ʼ����ǰ������,�򲻴���
      OPEN Bis_Acc_His_Dtl_online;
      FETCH Bis_Acc_His_Dtl_online INTO V_trans_time;
      WHILE Bis_Acc_His_Dtl_online%FOUND
      LOOP
        BEGIN
            IF V_trans_time > V_init_balance_date THEN
                --ȡ��ϸ���������-��֧��
                Select nvl(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - nvl(Sum( case cd_sign when '1' then Amt else 0 end),0.00)
                  Into v_Sum
                  From Bis_Acc_His_Dtl
                 Where Bank_Acc = V_BANK_ACC
                   And To_Char(Trans_Time, 'yyyy-mm-dd') = To_Char(V_trans_time , 'yyyy-mm-dd')
                   AND ( is_compute is null or is_compute<>'1')
		   AND rec_time > V_compute_time ;

                --�������
                select compute_time into V_compute_time_tmp from Bis_Acc_His_Bal
                where BANK_ACC = V_BANK_ACC AND To_char(Bal_Date, 'yyyy-mm-dd') = To_char(V_trans_time, 'yyyy-mm-dd') and rownum=1;
                IF V_compute_time_tmp IS NULL THEN --��������Ϊ��,��ʾ����ǽӿ����ɵ�,�轫�ӿڵ����д��reverse6�ֶ�,����
                    --������µ����Ϊ���нӿ�ɨ�ص����,�����ֵ=������� + ������ϸ,
                    --���ڼ����ͬһ������compute_time��д����Ӧʱ��,�����´��ٸ�����������ʱ,�����ٵ��ô˷���
                    --���ҵ��ô˷���ʱ,��ϸ��is_compute�϶�Ϊ��,���������ȡ��ϸ������ķ�����ͨ�õ�
                    select count(1) into v_count FROM Bis_Acc_His_Bal WHERE To_char(Bal_Date,'yyyy-mm-dd') = To_char(V_trans_time  -1,'yyyy-mm-dd') AND BANK_ACC=V_BANK_ACC and rownum=1;
                    IF v_count>0 THEN
                        select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and To_char(Bal_Date,'yyyy-mm-dd') = To_char(v_Bal_Date  -1,'yyyy-mm-dd') and rownum=1;
                    ELSE
                        V_BANK_BAL :=0;
                    END IF;
                    select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and bal_date=V_trans_time - 1 and rownum=1;
                    UPDATE Bis_Acc_His_Bal
                       SET Bank_Bal  = V_BANK_BAL + v_Sum, Avail_Bal = V_BANK_BAL + v_Sum,compute_time=V_compute_time,reverse6=Bank_Bal
                     WHERE BANK_ACC = V_BANK_ACC
                       AND To_char(Bal_Date, 'yyyy-mm-dd') >= To_char(V_trans_time, 'yyyy-mm-dd');
                ELSE
                    UPDATE Bis_Acc_His_Bal
                       SET Bank_Bal  = Bank_Bal + v_Sum, Avail_Bal = Avail_Bal + v_Sum,compute_time=V_compute_time
                     WHERE BANK_ACC = V_BANK_ACC
                       AND To_char(Bal_Date, 'yyyy-mm-dd') >= To_char(V_trans_time, 'yyyy-mm-dd');
                END IF;

                --����ϸ����Ϊ�Ѽ����״̬
                update Bis_Acc_His_Dtl
                   set is_compute = '1'
                 where bank_acc = V_BANK_ACC
                   and To_char(trans_time, 'yyyy-mm-dd') = To_char(V_trans_time, 'yyyy-mm-dd')
                   and rec_time > V_compute_time ;
            END IF;
        END;
        --�ڶ���ѭ��,������ϸ�������---------------------����------------------------
        FETCH Bis_Acc_His_Dtl_online INTO V_trans_time;
      END LOOP;
      CLOSE Bis_Acc_His_Dtl_online;
  END;
  FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
END LOOP;                           -- END FOR ���µ�ǰ�ʻ���ˮ�����
CLOSE COMPUTE_BANKACC;
--�ڶ��ε�һ��ѭ��,���˺� ------------------------����------------------------

End;
/



