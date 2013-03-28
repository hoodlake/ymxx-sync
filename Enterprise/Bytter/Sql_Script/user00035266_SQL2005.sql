

IF EXISTS(SELECT 1 
            FROM SYSOBJECTS 
           WHERE XTYPE = 'V'
             AND NAME='v_cms_precative_loan_send_info')
DROP VIEW v_cms_precative_loan_send_info
go
create  view v_cms_precative_loan_send_info as
select info.BILL_CODE            info_bill_code,        --ί�д���¼�뵥��
       info.PRECATIVE_ID         info_PRECATIVE_ID,     --ί���˵�λId
       info.CURRENCY             info_CURRENCY,         --�ұ����
       info.TERM                 info_TERM,             --��������
       info.MONEY                info_MONEY,            --������
       info.ENTER_DATE           info_ENTER_DATE,       --����¼������
       info.hypothec_code        info_hypothec_code,    --������ʽ����
       send.BILL_CODE            send_BILL_CODE,        --���ű�ţ�������
       send.CONTRACT_CODE        send_CONTRACT_CODE,    --���ű�ţ����룩
       send.MONEY                send_MONEY,            --���Ž��
       send.SEND_DATE            send_SEND_DATE,        --��������
       send.STATUS               send_STATUS,           --����״̬
       temp.USEDMONEY,                                  --�ѷ��Ž��
       cur.cur_name,                                    --�ұ�����
       corp.corp_name precative_corp_name,              --ί��������
       typ.type_name                                    --������ʽ����
  from cms_precative_loan_info info
  --���ͬʱֻ����һ�����ż�¼��ҵ����
  left join cms_precative_loan_send send on  info.bill_code =
                                            send.father_code
                                        and send.status >= -1
                                        and send.status < 102 --102�������
  left join (select father_code, sum(money) usedmoney
               from cms_precative_loan_send
              where status >= 102
              group by father_code) temp on temp.father_code =
                                            info.bill_code
 inner join bt_currency cur on cur.cur_code = info.currency
 inner join bt_corp corp on corp.id = info.precative_id
 inner join cms_provide_loan_type typ on typ.operation_type='C' and typ.type_code=info.hypothec_code
 where info.status >= 97 --��¼���
   and (temp.usedmoney < info.money or temp.usedmoney is null) --���Ž��δ��
;
go
