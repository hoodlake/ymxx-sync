-- �޸����ڣ�20120928
-- �޸��ˣ�������
--�޸����ݣ�AKSƱ�ݽ��


declare 
 @max_id_cs20120928 int, @max_id_cs20120928_id int,@max_id_cs20120928_1 int;
 begin
    select @max_id_cs20120928=count(*) from bt_function where FUNCTION_IDEN='w_bill_provide_loan';
    if @max_id_cs20120928=0 
      begin
        select @max_id_cs20120928_id=FUNCTION_ID from bt_function where function_name='�Ŵ�����';
        --Ʊ�ݴ���
        select @max_id_cs20120928_1=max(function_id)+1  from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'Ʊ�ݴ���', '', '', '', 'Mod', @max_id_cs20120928_id, 25, '', '1', 'interacc', '����', '1');
        --���˸��˸���
        select @max_id_cs20120928_id= max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_bill_provide_loan', '����', '', '', '', 'Mnu', @max_id_cs20120928_1, 1, '', '1', 'interacc', '����', '1');
        
        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_bill_provide_loan_modify', '����', '', '', '', 'Mnu', @max_id_cs20120928_1, 2, '', '1', 'interacc', '����', '1');

        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_bill_provide_loan_check', '����', '', '', '', 'Mnu', @max_id_cs20120928_1, 3, '', '1', 'interacc', '����', '1');
       
        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, '', '-', '', '', '', 'Mnu', @max_id_cs20120928_1, 4, '', '1', 'interacc', '-', '1');
        
        select @max_id_cs20120928_id=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_id, 'w_indv_loan_interacc_bill', '�����Ϣ', '', '', '', 'Mnu', @max_id_cs20120928_1, 5, '', '1', 'interacc', '�����Ϣ', '1');
        --����
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bill_provide_loan';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '����', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '����', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '���', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'ˢ��', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', 'ˢ����ʾ', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '��ӡԤ��', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '��ӡ', '1');
        --����
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bill_provide_loan_modify';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '����', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '�������', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '���', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'ˢ��', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', 'ˢ����ʾ', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '��ӡԤ��', '1');
        
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '��ӡ', '1');


        --����
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_bill_provide_loan_check';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '����', 'bmp\check.bmp', 'ue_check', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '����', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '���', 'bmp\stop.bmp', 'ue_delete', 'C', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '���', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'ˢ��', 'bmp\refresh.bmp', 'ue_refresh', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', 'ˢ����ʾ', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', '��ӡԤ��', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'P', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '��ӡ', '1');
    
    
        --�����Ϣ
        select @max_id_cs20120928=FUNCTION_ID from bt_function where FUNCTION_IDEN='w_indv_loan_interacc_bill';
        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��Ϣ', 'bmp\compute.bmp', 'ue_add', 'C', 'Btn', @max_id_cs20120928, 1, '', '1', 'interacc', '������Ϣ', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��Ϣ', 'bmp\save.bmp', 'ue_save', 'S', 'Btn', @max_id_cs20120928, 2, '', '1', 'interacc', '��Ϣ����', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��һ��', 'bmp\first.bmp', 'ue_first', 'F', 'Btn', @max_id_cs20120928, 3, '', '1', 'interacc', '��һ��ƾ֤', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��һ��', 'bmp\prior.bmp', 'ue_prior', 'P', 'Btn', @max_id_cs20120928, 4, '', '1', 'interacc', 'ǰһ��ƾ֤', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (max_id_cs20120928_1, '', '��һ��', 'bmp\next.bmp', 'ue_next', 'N', 'Btn', @max_id_cs20120928, 5, '', '1', 'interacc', '��һ��ƾ֤', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '�����', 'bmp\last.bmp', 'ue_last', 'L', 'Btn', @max_id_cs20120928, 6, '', '1', 'interacc', '���һ��ƾ֤', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', '��ӡ', 'bmp\print.bmp', 'ue_print', 'p', 'Btn', @max_id_cs20120928, 7, '', '1', 'interacc', '��ӡ', '1');

        select @max_id_cs20120928_1=max(function_id)+1 from BT_FUNCTION;
        insert into bt_function (FUNCTION_ID, FUNCTION_IDEN, FUNCTION_NAME, DISPLAY_PIC, USER_EVENT, HOTKEY, FUN_TYPE, UPPER_FUNCTION_ID, SEQ_NO, ARRANGEOPEN, TURNON_SIGN, SYS_CODE, RMK, VALID_SIGN)
        values (@max_id_cs20120928_1, '', 'Ԥ��', 'bmp\preview.bmp', 'ue_printpreview', 'V', 'Btn', @max_id_cs20120928, 8, '', '1', 'interacc', '��ӡԤ��', '1');
      
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