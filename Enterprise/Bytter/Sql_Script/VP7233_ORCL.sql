-- 修改日期：2012-12-02
-- 修改人：梁铭利
--修改内容：云南白药 历史余额自动生成功

--修改人：刘勇
--添加线帐户历史余额计算方式0,通过接口从银行获取，1系统根据明细自动计算 
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
       'computeHisBal','adm','在线账户历史余额计算方式','0',null,null,0,'在线账户历史余额计算方式,默认0','0,通过接口从银行获取;1,系统根据明细自动计算',null,null,null,null,1,null,null,null,null);
end if;
end;
/



--账号表,历史余额表,历史明细表加字段

--初始余额  初始余额日期 计算余额的时间 明细是否已参与余额的计算 
DECLARE
  VN_COUNT     NUMBER;
  VC_STR        VARCHAR2(1000);
BEGIN
  --查看该表中该字段是否存在
  SELECT COUNT(*) 
    INTO VN_COUNT
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = upper('bt_bank_acc') AND COLUMN_NAME = upper('init_balance');
  --如果小于1则说明不存在，则新增此字段
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


--新建存储过程,用于历史余额的计算
CREATE OR REPLACE Procedure Proc_Bis_Acc_His_Bal(In_Bif_Code in varchar) --银行代号
 As
  /*
    本过程的功能:系统根据明细自动计算银行账号的历史余额,根据需求确认,计算的前提是:银行账号维护中维护了日期的才计算
    开发人员:梁铭利
    开发时间:2012-11-29
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
  --找出所有需要计算余额的账号
  CURSOR COMPUTE_BANKACC
  IS
    SELECT a.bank_acc, a.init_balance_date, nvl(a.init_balance,0.00)
      FROM bt_bank_acc a,bis_acc_list b
     WHERE a.bank_acc=b.bank_acc and init_balance_date is not null
       AND b.bif_code like In_Bif_Code
       AND a.BIS_TYPE = '1';

  --取当天没有计算过的明细,但是明细是上次计算之后扫回来的,当天有余额时用,即用于更新或插
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
--第一次第一层循环,按账号 ------------------------开始------------------------
OPEN COMPUTE_BANKACC;
FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
WHILE COMPUTE_BANKACC%FOUND
LOOP
  BEGIN
      V_systime := sysdate;
      --计算账号需计算余额的开始日期,结束日期为系统日期前一天
      select max(compute_time) into V_compute_time from bis_acc_his_bal where bank_acc=V_BANK_ACC; --取最近一次余额的计算时间
      IF V_compute_time IS NULL THEN
          V_compute_time :=V_systime;
      END IF;
      --取最近一次计算余额的日期
      V_init_date :=null;
      select max(bal_date) into V_init_date from bis_acc_his_bal where bank_acc=V_BANK_ACC and compute_time is not null;
      IF V_init_date IS NULL OR V_init_date <= V_init_balance_date THEN --最近一次计算的余额不存在或小于账号的初始日期
           V_Bal_Date_Begin := trunc(V_init_balance_date);
           V_BANK_BAL := V_init_balance;
       ELSE
           V_Bal_Date_Begin := trunc(V_init_date);
           select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and bal_date=V_init_date and rownum=1;
       END IF;
       V_Bal_Date_End := trunc(V_systime - 1);
       --第二层循环,根据明细计算余额---------------------开始------------------------
        If V_Bal_Date_Begin <= V_Bal_Date_End Then
          --按日期循环
          v_Bal_Date := V_Bal_Date_Begin;
          While (v_Bal_Date <= V_Bal_Date_End) Loop
            Begin
                --将前一天的余额插入到当天
                IF v_Bal_Date > V_Bal_Date_Begin THEN --循环到第二笔及之后的余额时,余额则取前一笔计算出的余额
                   select Bank_Bal into V_BANK_BAL from bis_acc_his_bal where bank_acc=V_BANK_ACC and bal_date=v_Bal_Date - 1 and rownum=1;
                END IF;
                Insert Into Bis_Acc_His_Bal (Bank_Acc, Bif_Code, Bal_Date, Get_Date,  Bank_Bal, Get_By, Avail_Bal, Reverse1,compute_time)
                select Bank_Acc, Bif_Code, v_Bal_Date , v_Bal_Date, V_BANK_BAL, '2', V_BANK_BAL, '昨日余额手动生成',V_systime
                 from v_acc_list
                where bif_code like In_Bif_Code
                  and bank_acc = V_BANK_ACC
                  and bank_acc not in
                      (select a.bank_acc
                         from bis_acc_his_bal a,  Bt_Bank_Acc b
                        where a.bank_acc=b.bank_acc and To_char(a.Bal_Date,'yyyy-mm-dd') = To_char(v_Bal_Date,'yyyy-mm-dd'));
                --根据当天明细,更新的余额
                --取明细表的总收入-总支出
                Select nvl(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - nvl(Sum( case cd_sign when '1' then Amt else 0 end),0.00)
                  Into v_Sum
                  From Bis_Acc_His_Dtl
                 Where Bank_Acc = V_BANK_ACC
                   And To_Char(Trans_Time, 'yyyy-mm-dd') = To_Char(v_Bal_Date , 'yyyy-mm-dd')
                   AND ( is_compute is null or is_compute<>'1')
		   AND rec_time <= V_compute_time;

                --更新余额
                select compute_time into V_compute_time_tmp from Bis_Acc_His_Bal
                where BANK_ACC = V_BANK_ACC AND To_char(Bal_Date, 'yyyy-mm-dd') = To_char(v_Bal_Date, 'yyyy-mm-dd') and rownum=1;
                IF V_compute_time_tmp IS NULL THEN --计算日期为空,表示余额是接口生成的,需将接口的余额写到reverse6字段,备查
                    --如果更新的余额为银行接口扫回的余额,则余额值=昨天余额 + 当天明细,
                    --由于计算后同一天的余额compute_time会写入相应时间,所以下次再更新这天的余额时,不会再调用此方法
                    --而且调用此方法时,明细的is_compute肯定为空,所以上面的取明细计算金额的方法是通用的
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

                --将明细更新为已计算的状态
                update Bis_Acc_His_Dtl
                   set is_compute = '1'
                 where bank_acc = V_BANK_ACC
                   and To_char(trans_time, 'yyyy-mm-dd') = To_char(v_Bal_Date, 'yyyy-mm-dd')
                   and rec_time <= V_compute_time ;
             END;

             v_Bal_Date := v_Bal_Date + 1;
          End Loop;
        End If;
       --第二层循环,根据明细计算余额---------------------结束------------------------
  END;
  FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
END LOOP;                           -- END FOR 更新当前帐户流水账余额
CLOSE COMPUTE_BANKACC;
--第一次第一层循环,按账号 ------------------------结束------------------------


--第二次第一层循环,按账号 ------------------------开始------------------------
OPEN COMPUTE_BANKACC;
FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
WHILE COMPUTE_BANKACC%FOUND
LOOP
  BEGIN
      V_systime := sysdate;
      --扫描上次余额更新之后的明细
      --重新取最后一次余额的计算时间
      select max(compute_time) into V_compute_time from bis_acc_his_bal where bank_acc=V_BANK_ACC; --取最近一次余额的计算时间
      IF V_compute_time IS NULL THEN
          V_compute_time :=V_systime;
      END IF;
      --如果扫回的是起始日期前的数据,则不处理
      OPEN Bis_Acc_His_Dtl_online;
      FETCH Bis_Acc_His_Dtl_online INTO V_trans_time;
      WHILE Bis_Acc_His_Dtl_online%FOUND
      LOOP
        BEGIN
            IF V_trans_time > V_init_balance_date THEN
                --取明细表的总收入-总支出
                Select nvl(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - nvl(Sum( case cd_sign when '1' then Amt else 0 end),0.00)
                  Into v_Sum
                  From Bis_Acc_His_Dtl
                 Where Bank_Acc = V_BANK_ACC
                   And To_Char(Trans_Time, 'yyyy-mm-dd') = To_Char(V_trans_time , 'yyyy-mm-dd')
                   AND ( is_compute is null or is_compute<>'1')
		   AND rec_time > V_compute_time ;

                --更新余额
                select compute_time into V_compute_time_tmp from Bis_Acc_His_Bal
                where BANK_ACC = V_BANK_ACC AND To_char(Bal_Date, 'yyyy-mm-dd') = To_char(V_trans_time, 'yyyy-mm-dd') and rownum=1;
                IF V_compute_time_tmp IS NULL THEN --计算日期为空,表示余额是接口生成的,需将接口的余额写到reverse6字段,备查
                    --如果更新的余额为银行接口扫回的余额,则余额值=昨天余额 + 当天明细,
                    --由于计算后同一天的余额compute_time会写入相应时间,所以下次再更新这天的余额时,不会再调用此方法
                    --而且调用此方法时,明细的is_compute肯定为空,所以上面的取明细计算金额的方法是通用的
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

                --将明细更新为已计算的状态
                update Bis_Acc_His_Dtl
                   set is_compute = '1'
                 where bank_acc = V_BANK_ACC
                   and To_char(trans_time, 'yyyy-mm-dd') = To_char(V_trans_time, 'yyyy-mm-dd')
                   and rec_time > V_compute_time ;
            END IF;
        END;
        --第二层循环,根据明细计算余额---------------------结束------------------------
        FETCH Bis_Acc_His_Dtl_online INTO V_trans_time;
      END LOOP;
      CLOSE Bis_Acc_His_Dtl_online;
  END;
  FETCH COMPUTE_BANKACC INTO V_BANK_ACC,V_init_balance_date,V_init_balance;
END LOOP;                           -- END FOR 更新当前帐户流水账余额
CLOSE COMPUTE_BANKACC;
--第二次第一层循环,按账号 ------------------------结束------------------------

End;
/



