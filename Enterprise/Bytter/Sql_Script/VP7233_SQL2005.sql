-- 修改日期：2012-12-02
-- 修改人：梁铭利
--修改内容：云南白药 历史余额自动生成功能

--账号表,历史余额表,历史明细表加字段
IF NOT EXISTS(SELECT *  FROM SYSCOLUMNS  WHERE ID=OBJECT_ID('bt_bank_acc') AND NAME='init_balance')  
	begin
		alter table bt_bank_acc add init_balance  numeric(14,2);  
		alter table bt_bank_acc add init_balance_date datetime; 
		alter table bis_acc_his_bal add  compute_time datetime;
		alter table bis_acc_his_dtl add is_compute char(1);
	end
GO

--添加线帐户历史余额计算方式0,通过接口从银行获取，1系统根据明细自动计算 
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
go




--新建存储过程,用于历史余额的计算
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'P'
             AND NAME='Proc_Bis_Acc_His_Bal')
DROP PROCEDURE Proc_Bis_Acc_His_Bal
GO


CREATE Procedure [dbo].[Proc_Bis_Acc_His_Bal](@In_Bif_Code  varchar(4)) --银行代号
 As
  /*
    本过程的功能:系统根据明细自动计算银行账号的历史余额,根据需求确认,计算的前提是:银行账号维护中维护了日期的才计算
    开发人员:梁铭利
    开发时间:2012-11-29
  */

   DECLARE @count INT;
   DECLARE @Bal_Date datetime;
   DECLARE @Sum  numeric(15,2);
   DECLARE @BANK_BAL  numeric(15,2);
   DECLARE @BANK_ACC varchar(50)
   DECLARE @init_balance_date datetime;
   DECLARE @init_date datetime;
   DECLARE @init_balance numeric(14,2);
   DECLARE @Bal_Date_Begin datetime;
   DECLARE @Bal_Date_End   datetime;
   DECLARE @compute_time   datetime;
   DECLARE @compute_time_tmp   datetime;
   DECLARE @systime   datetime;
   DECLARE @trans_time   datetime;
   DECLARE @v_trans_time   varchar(20);

  
Begin
--第一次第一层循环,按账号 ------------------------开始------------------------

  --找出所有需要计算余额的账号
  DECLARE COMPUTE_BANKACC  CURSOR FOR
    SELECT a.bank_acc, a.init_balance_date, isnull(a.init_balance,0.00)
      FROM bt_bank_acc a,bis_acc_list b
     WHERE a.bank_acc=b.bank_acc 
       and init_balance_date is not null
       and init_balance_date <>'1900-01-01 00:00:00'
       and a.bis_type='1'
       AND b.bif_code like @In_Bif_Code 
OPEN COMPUTE_BANKACC
FETCH NEXT FROM COMPUTE_BANKACC INTO @BANK_ACC,@init_balance_date,@init_balance
WHILE @@FETCH_STATUS = 0
BEGIN
      select @systime = getdate();
      --计算账号需计算余额的开始日期,结束日期为系统日期前一天
      select @compute_time=max(compute_time) from bis_acc_his_bal where bank_acc=@BANK_ACC; --取最近一次余额的计算时间
      IF @compute_time IS NULL  or @compute_time='1900-01-01 00:00:00'
        select @compute_time =@systime;
      --取最近一次计算余额的日期
      select @init_date =null;
      select @init_date=max(bal_date) from bis_acc_his_bal where bank_acc=@BANK_ACC and (compute_time is not null and compute_time <>'1900-01-01 00:00:00');
      IF @init_date IS NULL OR @init_date <= @init_balance_date  --最近一次计算的余额不存在或小于账号的初始日期
			begin
			   select @Bal_Date_Begin = @init_balance_date;
			   select @BANK_BAL = @init_balance;
			end
       ELSE
			begin
			   select @Bal_Date_Begin = @init_date;
			   select top 1 @BANK_BAL=Bank_Bal from bis_acc_his_bal where bank_acc=@BANK_ACC and bal_date=@init_date;
			end
       select @Bal_Date_End = DATEADD( DD , - 1, @systime ) ;
       --第二层循环,根据明细计算余额---------------------开始------------------------
        If @Bal_Date_Begin <= @Bal_Date_End 
			begin
				  --按日期循环
				  select @Bal_Date = @Bal_Date_Begin;
				  While (@Bal_Date <= @Bal_Date_End) 
					Begin
						--将前一天的余额插入到当天
						IF @Bal_Date > @Bal_Date_Begin  --循环到第二笔及之后的余额时,余额则取前一笔计算出的余额 
						   select top 1 @BANK_BAL=Bank_Bal  from bis_acc_his_bal where bank_acc=@BANK_ACC and convert(char(10),bal_date,120) = DATEADD( DD , - 1, convert(char(10),@Bal_Date,120) );
		                
						Insert Into Bis_Acc_His_Bal (Bank_Acc, Bif_Code, Bal_Date, Get_Date,  Bank_Bal, Get_By, Avail_Bal, Reverse1,compute_time)
						select Bank_Acc, Bif_Code, @Bal_Date , @Bal_Date, @BANK_BAL, '2', @BANK_BAL, '昨日余额手动生成',@systime
						 from v_acc_list
						where bif_code like @In_Bif_Code
						  and bank_acc = @BANK_ACC
						  and bank_acc not in
							  (select a.bank_acc
								 from bis_acc_his_bal a,  Bt_Bank_Acc b
								where a.bank_acc=b.bank_acc and convert(char(10),a.Bal_Date,120) = convert(char(10),@Bal_Date,120));
						--根据当天明细,更新的余额
						--取明细表的总收入-总支出
						Select @Sum=(ISNULL(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - ISNULL(Sum( case cd_sign when '1' then Amt else 0 end),0.00))
						  From Bis_Acc_His_Dtl
						 Where Bank_Acc = @BANK_ACC
						   and convert(char(10),Trans_Time,120) = convert(char(10),@Bal_Date,120)
						   AND ( is_compute is null or is_compute<>'1')
						   and rec_time <= @compute_time ;

						--更新余额
						select top 1 @compute_time_tmp=compute_time from Bis_Acc_His_Bal
						where BANK_ACC = @BANK_ACC AND convert(char(10),Bal_Date, 120) = convert(char(10),@Bal_Date, 120);
						IF (@compute_time_tmp IS NULL or @compute_time_tmp='1900-01-01 00:00:00') --计算日期为空,表示余额是接口生成的,需将接口的余额写到reverse6字段,备查
							--如果更新的余额为银行接口扫回的余额,则余额值=昨天余额 + 当天明细,
							--由于计算后同一天的余额compute_time会写入相应时间,所以下次再更新这天的余额时,不会再调用此方法
							--而且调用此方法时,明细的is_compute肯定为空,所以上面的取明细计算金额的方法是通用的  
							BEGIN
								select top 1 @count=count(1)  FROM Bis_Acc_His_Bal WHERE convert(char(10),Bal_Date,120) = DATEADD( DD , - 1, convert(char(10),@Bal_Date,120) )  AND BANK_ACC=@BANK_ACC;
								IF @count>0 
									select top 1 @BANK_BAL=Bank_Bal from bis_acc_his_bal where bank_acc=@BANK_ACC and convert(char(10),Bal_Date,120) = DATEADD( DD , - 1, convert(char(10),@Bal_Date,120) ) ;
								ELSE
								   select @BANK_BAL =0;
								   
								UPDATE Bis_Acc_His_Bal
								   SET Bank_Bal  = @BANK_BAL + @Sum, Avail_Bal = @BANK_BAL + @Sum,compute_time=@compute_time,reverse6=Bank_Bal
								 WHERE BANK_ACC = @BANK_ACC
								   AND convert(char(10),Bal_Date,120) = convert(char(10),@Bal_Date,120) ;
							END
						ELSE
							BEGIN
								UPDATE Bis_Acc_His_Bal
								   SET Bank_Bal  = Bank_Bal + @Sum, Avail_Bal = Avail_Bal + @Sum,compute_time=@compute_time
								 WHERE BANK_ACC = @BANK_ACC
								   AND convert(char(10),Bal_Date,120) = convert(char(10),@Bal_Date,120) ;
							END  

						--将明细更新为已计算的状态
						update Bis_Acc_His_Dtl
						   set is_compute = '1'
						 where bank_acc = @BANK_ACC
						   and convert(char(10),trans_time,120) = convert(char(10),@Bal_Date,120) 
						   and rec_time <= @compute_time ;
						SELECT  @Bal_Date = DATEADD( DD , 1, @Bal_Date ) ;
					END;
			end
		--第二层循环,根据明细计算余额---------------------结束------------------------
	  FETCH NEXT FROM COMPUTE_BANKACC INTO @BANK_ACC,@init_balance_date,@init_balance;
	END;
CLOSE COMPUTE_BANKACC;
DEALLOCATE COMPUTE_BANKACC;

--第一次第一层循环,按账号 ------------------------结束------------------------


--第二次第一层循环,按账号 ------------------------开始------------------------

  --找出所有需要计算余额的账号
DECLARE COMPUTE_BANKACC_DTL  CURSOR FOR
    SELECT a.bank_acc, a.init_balance_date, ISNULL(a.init_balance,0.00)
      FROM bt_bank_acc a,bis_acc_list b
     WHERE a.bank_acc=b.bank_acc and init_balance_date is not null
       and a.bis_type='1'
       and init_balance_date <>'1900-01-01'
       AND b.bif_code like @In_Bif_Code ;
       
OPEN COMPUTE_BANKACC_DTL;
FETCH NEXT FROM COMPUTE_BANKACC_DTL INTO @BANK_ACC,@init_balance_date,@init_balance;
WHILE @@FETCH_STATUS = 0
  BEGIN
      SELECT @systime = GETDATE();
      --扫描上次余额更新之后的明细
      --重新取最后一次余额的计算时间
      select @compute_time=max(compute_time) From bis_acc_his_bal where bank_acc=@BANK_ACC; --取最近一次余额的计算时间
      IF @compute_time IS NULL  or @compute_time='1900-01-01 00:00:00'
          SELECT @compute_time =@systime;
          
      --如果扫回的是起始日期前的数据,则不处理
      --取当天没有计算过的明细,但是明细是上次计算之后扫回来的,当天有余额时用,即用于更新或插
	  DECLARE Bis_Acc_His_Dtl_online CURSOR FOR
		  SELECT  convert(char(10),trans_time,120)
			FROM   Bis_Acc_His_Dtl a,bt_bank_acc b
		   WHERE   a.bank_acc=b.bank_acc and b.bis_type='1'
			and a.bank_acc=@BANK_ACC
			and a.bif_code like @In_Bif_Code
			and ( a.is_compute is null or a.is_compute<>'1')
			and a.rec_time > @compute_time
	   group by convert(char(10),trans_time,120) ;
   
        --第二层循环,根据明细计算余额---------------------开始------------------------
      OPEN Bis_Acc_His_Dtl_online;
      FETCH NEXT FROM Bis_Acc_His_Dtl_online INTO @v_trans_time;
	  WHILE @@FETCH_STATUS = 0
		  BEGIN
			select @trans_time=convert(datetime,@v_trans_time,120);
            IF @trans_time > @init_balance_date 
				begin
					--取明细表的总收入-总支出
					Select @Sum=ISNULL(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - ISNULL(Sum( case cd_sign when '1' then Amt else 0 end),0.00)
					  From Bis_Acc_His_Dtl
					 Where Bank_Acc = @BANK_ACC
					   and convert(char(10),trans_time,120) = @v_trans_time
					   AND ( is_compute is null or is_compute<>'1')
                                           and rec_time > @compute_time ;

					--更新余额
					select TOP 1 @compute_time_tmp=compute_time  from Bis_Acc_His_Bal
					where BANK_ACC = @BANK_ACC AND convert(char(10),Bal_Date,120) =@v_trans_time ;
					IF @compute_time_tmp IS NULL or @compute_time_tmp='1900-01-01 00:00:00' --计算日期为空,表示余额是接口生成的,需将接口的余额写到reverse6字段,备查
						--如果更新的余额为银行接口扫回的余额,则余额值=昨天余额 + 当天明细,
						--由于计算后同一天的余额compute_time会写入相应时间,所以下次再更新这天的余额时,不会再调用此方法
						--而且调用此方法时,明细的is_compute肯定为空,所以上面的取明细计算金额的方法是通用的  
						begin  
							select @count=count(1) FROM Bis_Acc_His_Bal WHERE convert(char(10),Bal_Date,120) =convert(char(10), DATEADD(DD,-1,@trans_time),120) AND BANK_ACC=@BANK_ACC ;
							IF @count>0 
								select TOP 1 @BANK_BAL=Bank_Bal from bis_acc_his_bal where bank_acc=@BANK_ACC and convert(char(10),Bal_Date,120) = convert(char(10), DATEADD(DD,-1,Bal_Date),120);
							ELSE
								select @BANK_BAL =0;
		                        
							select TOP 1 @BANK_BAL=Bank_Bal from bis_acc_his_bal where bank_acc=@BANK_ACC and convert(char(10),Bal_Date,120) =convert(char(10), DATEADD(DD,-1,@trans_time),120);
							UPDATE Bis_Acc_His_Bal
							   SET Bank_Bal  = @BANK_BAL + @Sum, Avail_Bal = @BANK_BAL + @Sum,compute_time=@compute_time,reverse6=Bank_Bal
							 WHERE BANK_ACC = @BANK_ACC
							   AND convert(char(10),Bal_Date,120) >= @v_trans_time;
						end
					ELSE
						UPDATE Bis_Acc_His_Bal
						   SET Bank_Bal  = Bank_Bal + @Sum, Avail_Bal = Avail_Bal + @Sum,compute_time=@compute_time
						 WHERE BANK_ACC = @BANK_ACC
						   AND convert(char(10),Bal_Date,120) >= @v_trans_time;

					--将明细更新为已计算的状态
					update Bis_Acc_His_Dtl
					   set is_compute = '1'
					 where bank_acc = @BANK_ACC
					   AND convert(char(10),trans_time,120) >= @v_trans_time
					   and rec_time > @compute_time ;
				END ;
      FETCH NEXT FROM Bis_Acc_His_Dtl_online INTO @trans_time;
	  END;
	  CLOSE Bis_Acc_His_Dtl_online;
	  DEALLOCATE Bis_Acc_His_Dtl_online;
        --第二层循环,根据明细计算余额---------------------结束------------------------
  FETCH NEXT FROM COMPUTE_BANKACC_DTL INTO @BANK_ACC,@init_balance_date,@init_balance;
END;
CLOSE COMPUTE_BANKACC_DTL;
DEALLOCATE COMPUTE_BANKACC_DTL;
--第二次第一层循环,按账号 ------------------------结束------------------------

End;
go