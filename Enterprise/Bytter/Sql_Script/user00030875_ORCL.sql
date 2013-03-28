--修改人:于海
--修改时间:2012-08-17
--修改内容:修改V_BIS_ACC_HIS_DTL视图
CREATE OR REPLACE VIEW V_BIS_ACC_HIS_DTL AS
SELECT d.serial_id,
       d.bank_acc,
       d.acc_name,
       d.bank_name,
       d.opp_acc_no,
       d.opp_acc_name,
       d.opp_acc_bank,
       d.cd_sign,
       d.rb_sign,
       d.amt,
       d.fee_1,
       d.fee_2,
       d.bal,
       d.bank_serial_id,
       d.bif_code,
       d.cur,
       d.abs,
       d.postscript,
       d.trans_time,
       d.voucher_no,
       d.voucher_type,
       d.acc_serial_no,
       d.query_time,
       d.rec_time,
       d.chk,
       d.uses,
       d.inpt,
       d.id,
       d.reverse1,
       d.reverse2,
       d.reverse3,
       d.reverse4,
       d.reverse5,
       d.reverse6,
       d.reverse7,
       d.reverse8,
       d.reverse9,
       d.reverse10,
       d.interface_id,
       d.usedremark,
       d.erp_send_status,
       d.erp_return_message,
       d.erp_send_time,
       d.status,
       d.is_import,
       cur.cur_name,
       tt.acc_type,
       tt.property,
       tt.bank_code,
       pp.corp_code,
       pp.corp_name
  FROM bis_acc_his_dtl d
  LEFT JOIN BT_CURRENCY cur
    ON d.cur = cur.cur_code
  left join (select l.bank_acc,
                    t.acc_type,
                    t.property,
                    b.bank_code,
                    b.bank_name
               from bis_acc_list l, bis_acc_type t, bt_bank b
              where l.acc_type = t.acc_type
                and l.bank_code = b.bank_code) tt
    on d.bank_acc = tt.bank_acc
  left join (select ac.bank_acc, cp.corp_code, cp.corp_name
               from bt_bank_acc ac
               left join bt_corp cp
                 on ac.corp_code = cp.corp_code) pp
    on d.bank_acc = pp.bank_acc;
