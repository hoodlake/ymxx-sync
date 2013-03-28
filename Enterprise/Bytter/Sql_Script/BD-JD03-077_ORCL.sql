
--�޸���:���¾�
--�޸�ʱ��:2012-10-24 17:04:26
--�޸�����:����ʽ�Ԥ����ѯ�˵� 
insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
values ((select max(s1.RES_CODE)+1 from bt_sys_res s1), '�ʽ�Ԥ����ѯ', 'fwg', (select s2.res_code from bt_sys_res s2 where s2.res_name='Ԥ��չʾ����' and s2.sys_code = 'fwg' ), '/fundwarning/queryFundwarningAction.do?method=queryWarningAll', '0', '1', '0', '0', 9, '', '', '', '', '', '', null, null, null, null, null, 2, '');
commit;


--�޸����ڣ�2012.10.25
--�޸��ˣ��ܱ�
--�޸����ݣ�����ժҪԤ�������ֶΣ�(zhaiyao_operator ��1Ϊ���ҡ���2Ϊ���򡯣�operator2��3Ϊ����������4Ϊ������������warning_rmk2Ϊ���ݡ�
--�޸�ԭ����ժҪԤ������Ҫ������Ƿ������һ����

alter table bt_warning_strategy_detail add zhaiyao_operator varchar2(1);
alter table bt_warning_strategy_detail add operator2 varchar2(1);
alter table bt_warning_strategy_detail add warning_rmk2 varchar2(200);

comment on column bt_warning_strategy_detail.zhaiyao_operator  is
'�һ�';

comment on column bt_warning_strategy_detail.operator2  is
'�Ƿ����';

comment on column bt_warning_strategy_detail.warning_rmk2  is
'��������';



--�޸����ڣ�2012.10.26
--�޸��ˣ���֮��
--�޸����ݣ�����Ԥ��չʾ��ʮһ�����һ���ֶΣ�(remark ��ע)
--�޸�ԭ��Ԥ����ѯʱ�������Ԥ��״̬���и��ģ���Ҫ���б�ע˵����

alter table bt_warning_cash add remark varchar2(200);
comment on column bt_warning_cash.remark is '��ע';

alter table bt_warning_bal add remark varchar2(200);
comment on column bt_warning_bal.remark is '��ע';

alter table bt_warning_payee add remark varchar2(200);
comment on column bt_warning_payee.remark is '��ע';

alter table bt_warning_largepay add remark varchar2(200);
comment on column bt_warning_largepay.remark is '��ע';

alter table bt_warning_overflow add remark varchar2(200);
comment on column bt_warning_overflow.remark is '��ע';

alter table bt_warning_balancedown add remark varchar2(200);
comment on column bt_warning_balancedown.remark is '��ע';

alter table bt_warning_dtlrmk add remark varchar2(200);
comment on column bt_warning_dtlrmk.remark is '��ע';

alter table bt_warning_outpay add remark varchar2(200);
comment on column bt_warning_outpay.remark is '��ע';

alter table bt_warning_dezjzc add remark varchar2(200);
comment on column bt_warning_dezjzc.remark is '��ע';

alter table bt_warning_swyzsb add remark varchar2(200);
comment on column bt_warning_swyzsb.remark is '��ע';

alter table bt_warning_zchlr add remark varchar2(200);
comment on column bt_warning_zchlr.remark is '��ע';



--�޸����ڣ�2012.10.30
--�޸��ˣ��ܱ�
--�޸����ݣ� �˻��������½�Ԥ����Ϣ,���� ��4��ĩ(last_four_month_end),��4��ƽ��(last_four_month_ave),��5��ĩ(last_five_month_end),��5��ƽ��(last_five_month_ave)
--�޸�ԭ�����˻��������½�Ԥ����Ϣ��ԭ����Ϊ����һ��������������Ԥ������ɨ������ĸ��¡������ڸ�Ϊһ��Ԥ��ɨ������������£�����Ԥ��ɨ������ĸ��£�����Ԥ��ɨ�����������

alter table bt_warning_balancedown add last_four_month_end number(15,2);
alter table bt_warning_balancedown add last_four_month_ave number(15,2);
alter table bt_warning_balancedown add last_five_month_end number(15,2);
alter table bt_warning_balancedown add last_five_month_ave number(15,2);

comment on column bt_warning_balancedown.last_four_month_end is '��4��ĩ';
comment on column bt_warning_balancedown.last_four_month_ave is '��4��ƽ��';
comment on column bt_warning_balancedown.last_five_month_end is '��5��ĩ';
comment on column bt_warning_balancedown.last_five_month_ave is '��5��ƽ��';


--�޸����ڣ�2012.11.01
--�޸��ˣ��ܱ�
--�޸����ݣ� ����Ԥ���޶�˵��
--�޸�ԭ����ǰ��Ϊstrategy_money�����ڸ�Ϊһ���ַ�������ʾ��ĳ����ֵ֮�䡣��1<��>2��.���Ұ�strategy_money��ֵ����strategy_detail_str
alter table bt_warning_bal add strategy_detail_str varchar2(40);
comment on column bt_warning_bal.strategy_detail_str  is 'Ԥ���޶�˵��';

alter table bt_warning_cash add strategy_detail_str varchar2(40);
comment on column bt_warning_cash.strategy_detail_str  is 'Ԥ���޶�˵��';

alter table bt_warning_payee add strategy_detail_str varchar2(40);
comment on column bt_warning_payee.strategy_detail_str  is 'Ԥ���޶�˵��';

alter table bt_warning_largepay add strategy_detail_str varchar2(40);
comment on column bt_warning_largepay.strategy_detail_str  is 'Ԥ���޶�˵��';

update bt_warning_bal set strategy_detail_str=strategy_money where strategy_detail_str is null;
update bt_warning_cash set strategy_detail_str=strategy_money where strategy_detail_str is null;
update bt_warning_payee set strategy_detail_str=strategy_money where strategy_detail_str is null;
update bt_warning_largepay set strategy_detail_str=strategy_money where strategy_detail_str is null;
