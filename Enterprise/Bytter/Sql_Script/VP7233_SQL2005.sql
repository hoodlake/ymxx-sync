-- �޸����ڣ�2012-12-02
-- �޸��ˣ�������
--�޸����ݣ����ϰ�ҩ ��ʷ����Զ����ɹ���

--�˺ű�,��ʷ����,��ʷ��ϸ����ֶ�
IF NOT EXISTS(SELECT *  FROM SYSCOLUMNS  WHERE ID=OBJECT_ID('bt_bank_acc') AND NAME='init_balance')  
	begin
		alter table bt_bank_acc add init_balance  numeric(14,2);  
		alter table bt_bank_acc add init_balance_date datetime; 
		alter table bis_acc_his_bal add  compute_time datetime;
		alter table bis_acc_his_dtl add is_compute char(1);
	end
GO

--������ʻ���ʷ�����㷽ʽ0,ͨ���ӿڴ����л�ȡ��1ϵͳ������ϸ�Զ����� 
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
go




--�½��洢����,������ʷ���ļ���
IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'P'
             AND NAME='Proc_Bis_Acc_His_Bal')
DROP PROCEDURE Proc_Bis_Acc_His_Bal
GO


CREATE Procedure [dbo].[Proc_Bis_Acc_His_Bal](@In_Bif_Code  varchar(4)) --���д���
 As
  /*
    �����̵Ĺ���:ϵͳ������ϸ�Զ����������˺ŵ���ʷ���,��������ȷ��,�����ǰ����:�����˺�ά����ά�������ڵĲż���
    ������Ա:������
    ����ʱ��:2012-11-29
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
--��һ�ε�һ��ѭ��,���˺� ------------------------��ʼ------------------------

  --�ҳ�������Ҫ���������˺�
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
      --�����˺���������Ŀ�ʼ����,��������Ϊϵͳ����ǰһ��
      select @compute_time=max(compute_time) from bis_acc_his_bal where bank_acc=@BANK_ACC; --ȡ���һ�����ļ���ʱ��
      IF @compute_time IS NULL  or @compute_time='1900-01-01 00:00:00'
        select @compute_time =@systime;
      --ȡ���һ�μ�����������
      select @init_date =null;
      select @init_date=max(bal_date) from bis_acc_his_bal where bank_acc=@BANK_ACC and (compute_time is not null and compute_time <>'1900-01-01 00:00:00');
      IF @init_date IS NULL OR @init_date <= @init_balance_date  --���һ�μ���������ڻ�С���˺ŵĳ�ʼ����
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
       --�ڶ���ѭ��,������ϸ�������---------------------��ʼ------------------------
        If @Bal_Date_Begin <= @Bal_Date_End 
			begin
				  --������ѭ��
				  select @Bal_Date = @Bal_Date_Begin;
				  While (@Bal_Date <= @Bal_Date_End) 
					Begin
						--��ǰһ��������뵽����
						IF @Bal_Date > @Bal_Date_Begin  --ѭ�����ڶ��ʼ�֮������ʱ,�����ȡǰһ�ʼ��������� 
						   select top 1 @BANK_BAL=Bank_Bal  from bis_acc_his_bal where bank_acc=@BANK_ACC and convert(char(10),bal_date,120) = DATEADD( DD , - 1, convert(char(10),@Bal_Date,120) );
		                
						Insert Into Bis_Acc_His_Bal (Bank_Acc, Bif_Code, Bal_Date, Get_Date,  Bank_Bal, Get_By, Avail_Bal, Reverse1,compute_time)
						select Bank_Acc, Bif_Code, @Bal_Date , @Bal_Date, @BANK_BAL, '2', @BANK_BAL, '��������ֶ�����',@systime
						 from v_acc_list
						where bif_code like @In_Bif_Code
						  and bank_acc = @BANK_ACC
						  and bank_acc not in
							  (select a.bank_acc
								 from bis_acc_his_bal a,  Bt_Bank_Acc b
								where a.bank_acc=b.bank_acc and convert(char(10),a.Bal_Date,120) = convert(char(10),@Bal_Date,120));
						--���ݵ�����ϸ,���µ����
						--ȡ��ϸ���������-��֧��
						Select @Sum=(ISNULL(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - ISNULL(Sum( case cd_sign when '1' then Amt else 0 end),0.00))
						  From Bis_Acc_His_Dtl
						 Where Bank_Acc = @BANK_ACC
						   and convert(char(10),Trans_Time,120) = convert(char(10),@Bal_Date,120)
						   AND ( is_compute is null or is_compute<>'1')
						   and rec_time <= @compute_time ;

						--�������
						select top 1 @compute_time_tmp=compute_time from Bis_Acc_His_Bal
						where BANK_ACC = @BANK_ACC AND convert(char(10),Bal_Date, 120) = convert(char(10),@Bal_Date, 120);
						IF (@compute_time_tmp IS NULL or @compute_time_tmp='1900-01-01 00:00:00') --��������Ϊ��,��ʾ����ǽӿ����ɵ�,�轫�ӿڵ����д��reverse6�ֶ�,����
							--������µ����Ϊ���нӿ�ɨ�ص����,�����ֵ=������� + ������ϸ,
							--���ڼ����ͬһ������compute_time��д����Ӧʱ��,�����´��ٸ�����������ʱ,�����ٵ��ô˷���
							--���ҵ��ô˷���ʱ,��ϸ��is_compute�϶�Ϊ��,���������ȡ��ϸ������ķ�����ͨ�õ�  
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

						--����ϸ����Ϊ�Ѽ����״̬
						update Bis_Acc_His_Dtl
						   set is_compute = '1'
						 where bank_acc = @BANK_ACC
						   and convert(char(10),trans_time,120) = convert(char(10),@Bal_Date,120) 
						   and rec_time <= @compute_time ;
						SELECT  @Bal_Date = DATEADD( DD , 1, @Bal_Date ) ;
					END;
			end
		--�ڶ���ѭ��,������ϸ�������---------------------����------------------------
	  FETCH NEXT FROM COMPUTE_BANKACC INTO @BANK_ACC,@init_balance_date,@init_balance;
	END;
CLOSE COMPUTE_BANKACC;
DEALLOCATE COMPUTE_BANKACC;

--��һ�ε�һ��ѭ��,���˺� ------------------------����------------------------


--�ڶ��ε�һ��ѭ��,���˺� ------------------------��ʼ------------------------

  --�ҳ�������Ҫ���������˺�
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
      --ɨ���ϴ�������֮�����ϸ
      --����ȡ���һ�����ļ���ʱ��
      select @compute_time=max(compute_time) From bis_acc_his_bal where bank_acc=@BANK_ACC; --ȡ���һ�����ļ���ʱ��
      IF @compute_time IS NULL  or @compute_time='1900-01-01 00:00:00'
          SELECT @compute_time =@systime;
          
      --���ɨ�ص�����ʼ����ǰ������,�򲻴���
      --ȡ����û�м��������ϸ,������ϸ���ϴμ���֮��ɨ������,���������ʱ��,�����ڸ��»��
	  DECLARE Bis_Acc_His_Dtl_online CURSOR FOR
		  SELECT  convert(char(10),trans_time,120)
			FROM   Bis_Acc_His_Dtl a,bt_bank_acc b
		   WHERE   a.bank_acc=b.bank_acc and b.bis_type='1'
			and a.bank_acc=@BANK_ACC
			and a.bif_code like @In_Bif_Code
			and ( a.is_compute is null or a.is_compute<>'1')
			and a.rec_time > @compute_time
	   group by convert(char(10),trans_time,120) ;
   
        --�ڶ���ѭ��,������ϸ�������---------------------��ʼ------------------------
      OPEN Bis_Acc_His_Dtl_online;
      FETCH NEXT FROM Bis_Acc_His_Dtl_online INTO @v_trans_time;
	  WHILE @@FETCH_STATUS = 0
		  BEGIN
			select @trans_time=convert(datetime,@v_trans_time,120);
            IF @trans_time > @init_balance_date 
				begin
					--ȡ��ϸ���������-��֧��
					Select @Sum=ISNULL(Sum( case cd_sign when '0' then Amt else 0 end),0.00)  - ISNULL(Sum( case cd_sign when '1' then Amt else 0 end),0.00)
					  From Bis_Acc_His_Dtl
					 Where Bank_Acc = @BANK_ACC
					   and convert(char(10),trans_time,120) = @v_trans_time
					   AND ( is_compute is null or is_compute<>'1')
                                           and rec_time > @compute_time ;

					--�������
					select TOP 1 @compute_time_tmp=compute_time  from Bis_Acc_His_Bal
					where BANK_ACC = @BANK_ACC AND convert(char(10),Bal_Date,120) =@v_trans_time ;
					IF @compute_time_tmp IS NULL or @compute_time_tmp='1900-01-01 00:00:00' --��������Ϊ��,��ʾ����ǽӿ����ɵ�,�轫�ӿڵ����д��reverse6�ֶ�,����
						--������µ����Ϊ���нӿ�ɨ�ص����,�����ֵ=������� + ������ϸ,
						--���ڼ����ͬһ������compute_time��д����Ӧʱ��,�����´��ٸ�����������ʱ,�����ٵ��ô˷���
						--���ҵ��ô˷���ʱ,��ϸ��is_compute�϶�Ϊ��,���������ȡ��ϸ������ķ�����ͨ�õ�  
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

					--����ϸ����Ϊ�Ѽ����״̬
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
        --�ڶ���ѭ��,������ϸ�������---------------------����------------------------
  FETCH NEXT FROM COMPUTE_BANKACC_DTL INTO @BANK_ACC,@init_balance_date,@init_balance;
END;
CLOSE COMPUTE_BANKACC_DTL;
DEALLOCATE COMPUTE_BANKACC_DTL;
--�ڶ��ε�һ��ѭ��,���˺� ------------------------����------------------------

End;
go