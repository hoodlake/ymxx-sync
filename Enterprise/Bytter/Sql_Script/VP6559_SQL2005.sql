-- 修改日期：20121207
-- 修改人：梁铭利
--修改内容：科目账户余额表,加应付利息-活期/定期的单位明细显示


IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'P'
             AND NAME='PROC_GET_INTEREST_INOUT_201')
DROP PROCEDURE PROC_GET_INTEREST_INOUT_201
GO

CREATE  PROCEDURE  PROC_GET_INTEREST_INOUT_201

       @a_net CHAR(4),
       @a_cur CHAR(2),
       @a_corp CHAR(4),
       @a_begindate DATETIME,
       @a_enddate DATETIME,
       @a_subject VARCHAR(6),
       @a_debit   DECIMAL(14, 2) = 0.00  OUTPUT,
       @a_credit  DECIMAL(14, 2) = 0.00  OUTPUT,
       @a_bal   DECIMAL(14, 2) = 0.00  OUTPUT

AS
  
   declare @v_acc_type varchar(20);--对应计息的系统科目
   declare @a_debit_1 DECIMAL(14,2);
   --declare @a_debit_2  DECIMAL(14, 2);
   declare @a_credit_1 DECIMAL(14,2);
   --declare @a_credit_2 DECIMAL(14,2);
  
BEGIN
   
   IF @a_subject='2011'  --应付利息--企业活期
     select @v_acc_type = '01';
   ELSE IF  @a_subject='2012'  --应付利息--企业定期
     select @v_acc_type = '05';
   select @a_bal=sum(bal),@a_debit_1=sum(debit_money),@a_credit_1=sum(credit_money)
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
                   and a.tally_date >= @a_begindate
                   and a.tally_date <= @a_enddate
                   and a.voucher_state <> 'B'
                   and c.cur_code = @a_cur
                   and c.net_code = @a_net
                   and f.sys_subject_code = @a_subject))
           and e.acc_type_code = @v_acc_type
           and e.corp_code = @a_corp
         group by e.corp_code
        union
        --批量计息冲预提算法
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
                           and a.tally_date >= @a_begindate
                           and a.tally_date <= @a_enddate
                           and a.voucher_state <> 'B'
                           and c.cur_code = @a_cur
                           and c.net_code = @a_net
                           and h.sys_subject_code = @a_subject)
                   ) f
         where d.strike_date = f.interest_time
           and e.blnctr_acc = d.account
           and e.acc_type_code = @v_acc_type
           and e.corp_code = @a_corp) dd; 

        if @a_debit_1 is null 
           select @a_debit_1 =0.00; 

        if @a_credit_1 is null 
           select @a_credit_1 =0.00;
           
         select @a_debit = @a_debit_1 ;
         select @a_credit = @a_credit_1;
end
go

IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'P'
             AND NAME='PROC_GET_INTEREST_INOUT')
DROP PROCEDURE PROC_GET_INTEREST_INOUT
GO
CREATE PROCEDURE PROC_GET_INTEREST_INOUT

       @a_net CHAR(4),
       @a_cur CHAR(2),
       @a_corp CHAR(4),
       @a_begindate DATETIME,
       @a_enddate DATETIME,
       @a_subject VARCHAR(6),
       @a_init   DECIMAL(14, 2) = 0.00  OUTPUT,
       @a_debit   DECIMAL(14, 2) = 0.00  OUTPUT,
       @a_credit  DECIMAL(14, 2) = 0.00  OUTPUT,
       @a_balance   DECIMAL(14, 2) = 0.00  OUTPUT

AS
     DECLARE @v_begindate DATETIME;
     DECLARE @v_enddate DATETIME;
     DECLARE @v_tmp DECIMAL(14, 2);
     DECLARE @v_subject VARCHAR(6);

Begin

	if @a_enddate is null 
		SELECT @v_enddate = GETDATE() 
	If  @a_subject = '5011'  --放款利息收入 --1
	BEGIN
		SELECT @v_subject ='501001';
		--取期初余额
		select @a_init=0.00;
		--取借方贷方发生额
		if @a_net<> @a_corp
		begin
			SELECT  @v_begindate =@a_begindate;
			SELECT @v_enddate = @a_enddate;
			EXEC PROC_GET_INTEREST_INOUT_5011 @a_net, @a_cur, @a_corp,@v_begindate,@v_enddate,@v_subject,@a_debit,@a_credit,@v_tmp 
		end
		select @a_balance=0.00;
	END--1

	If @a_subject = '5211' or @a_subject = '5212' or  @a_subject = '5013'   --利息支出  --2
	BEGIN
		select @a_init=0.00;  --取期初余额
		select @a_balance=0.00;	 --取期末余额
		--取借方贷方发生额
		if @a_net<> @a_corp
		begin
			SELECT @v_begindate =@a_begindate;
			SELECT @v_enddate = @a_enddate;
			IF @a_subject='5211'  
				SELECT @v_subject ='521001';
			ELSE IF  @a_subject='5212'   
				BEGIN
				SELECT  @v_subject ='521002';
				EXEC PROC_GET_INTEREST_INOUT_5212  @a_net, @a_cur, @a_corp,@v_begindate,@v_enddate,@v_subject,@a_debit,@a_credit,@v_tmp 
				END
			ELSE IF  @a_subject='5213'   
				SELECT  @v_subject ='521003'; 
		end
	END--2
	If @a_subject = '2011' or @a_subject = '2012' or  @a_subject = '2013'  or  @a_subject = '2014'  --应付利息  --3
	BEGIN
		select @a_init=0.00;  --取期初余额
		select @a_balance=0.00;	 --取期末余额
		--取借方贷方发生额
		if @a_net<> @a_corp
		begin
			SELECT @v_begindate =@a_begindate;
			SELECT @v_enddate = @a_enddate;
			IF @a_subject='2011' or  @a_subject='2012'   -- 应付利息-企业活期存款  企业定期存款  
				EXEC PROC_GET_INTEREST_INOUT_201 @a_net, @a_cur, @a_corp,@v_begindate,@v_enddate,@a_subject,@a_debit,@a_credit,@v_tmp 
		end
	END--3
RETURN 
END
GO