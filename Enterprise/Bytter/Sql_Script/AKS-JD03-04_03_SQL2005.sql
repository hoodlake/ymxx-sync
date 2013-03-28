-- 修改日期：20120928
-- 修改人：梁铭利
--修改内容：AKS票据借贷


declare 
 @max_id_cs20120928 int, @max_id_cs20120928_id int,@max_id_cs20120928_1 int;
 begin
    select @max_id_cs20120928=count(*) from bt_function where FUNCTION_IDEN='w_bill_provide_loan';
    if @max_id_cs20120928=0 
      begin
        select @max_id_cs20120928_id=FUNCTION_ID from bt_function where function_name='信贷融资';
        --票据贷款
        select @max_id_cs20120928_1=max(function_id)+1  from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '票据贷款', '', '', '', 'Mod', @max_id_cs20120928_id, 25, '', '1', 'interacc', '划拨', '1');
        --记账改账复核
        select @max_id_cs20120928_id= max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_bill_provide_loan', '记账', '', '', '', 'Mnu', @max_id_cs20120928_1, 1, '', '1', 'interacc', '记账', '1');
        
        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_bill_provide_loan_modify', '改账', '', '', '', 'Mnu', @max_id_cs20120928_1, 2, '', '1', 'interacc', '改账', '1');

        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_bill_provide_loan_check', '复核', '', '', '', 'Mnu', @max_id_cs20120928_1, 3, '', '1', 'interacc', '复核', '1');
       
        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, '', '-', '', '', '', 'Mnu', @max_id_cs20120928_1, 4, '', '1', 'interacc', '-', '1');
        
        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_indv_loan_interacc_bill', '还款计息', '', '', '', 'Mnu', @max_id_cs20120928_1, 5, '', '1', 'interacc', '还款计息', '1');
        --记账
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bill_provide_loan';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '记账', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '记账', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '打回', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '刷新', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', '刷新显示', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '打印预览', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '打印', '1');
        --改账
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bill_provide_loan_modify';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '改账', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '保存改账', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '打回', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '刷新', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', '刷新显示', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '打印预览', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '打印', '1');


        --复核
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bill_provide_loan_check';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '复核', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '复核', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打回', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '打回', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '刷新', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', '刷新显示', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '打印预览', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '打印', '1');
    
    
        --还款计息
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_indv_loan_interacc_bill';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '计息', 'bmp\compute.bmp', 'ue_add', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '计算利息', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '入息', 'bmp\save.bmp', 'ue_save', 'S', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '入息计账', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '第一张', 'bmp\first.bmp', 'ue_first', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', '第一张凭证', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '上一张', 'bmp\prior.bmp', 'ue_prior', 'P', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '前一张凭证', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (max_id_cs20120928_1, '', '下一张', 'bmp\next.bmp', 'ue_next', 'N', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '下一张凭证', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '最后张', 'bmp\last.bmp', 'ue_last', 'L', 'Btn', @max_id_cs20120928, 6, '', '1', 'interacc', '最后一张凭证', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '打印', 'bmp\print.bmp', 'ue_print', 'p', 'Btn', @max_id_cs20120928, 7, '', '1', 'interacc', '打印', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '预览', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 8, '', '1', 'interacc', '打印预览', '1');
      
      end;
end;
go

alter table LOAN_SEND_OUT_INFO
add VOUCHER_NO   CHAR(15) ;
alter table LOAN_SEND_OUT_INFO
add ORDER_NO   CHAR(18) ;
alter table LOAN_SEND_OUT_INFO
add TALLIER_CODE    VARCHAR2(8);
go

alter table LOAN_SEND_OUT_INFO 
alter column LOAN_ACC varchar(50);

alter table LOAN_SEND_OUT_INFO 
alter column REPAY_ACC varchar(50);
go