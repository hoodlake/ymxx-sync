--�޸����� 20130130
--�޸��� ���
--�޸����� ���Ӷ����˵��ӿ�����
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='�ӿ�����' and t1.father_code=t2.sys_code and t2.res_name='��������';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '�ӿ�����', 'exchange', res_code, '', '0', '1', '0', '0', 4, '�ӿ�����', '', '', '', '', '', null, null, null, null, null, 2  
   from bt_sys_res  where res_name = '��������' and sys_code = 'exchange';
 end if;
 commit;
end;
/


--�޸����� 20130130
--�޸��� ���
--�޸����� ���������˵������տ�ӿ�����
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='�����տ�ӿ�����' and t1.father_code=t2.sys_code and t2.res_name='�ӿ�����';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '�����տ�ӿ�����', 'exchange', res_code, '/dataExchange/btInterConfigAction.do?method=initData'||chr(38)||'interCode=0', '0', '1', '0', '0', 4, '�����տ�ӿ�����', '', '', '', '', '', null, null, null, null, null, 3  
   from bt_sys_res  where res_name = '�ӿ�����' and sys_code = 'exchange';
 end if;
 commit;
end;
/

--�޸����� 20130130
--�޸��� ���
--�޸����� ���������˵����и���ӿ�����
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='���и���ӿ�����' and t1.father_code=t2.sys_code and t2.res_name='�ӿ�����';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), '���и���ӿ�����', 'exchange', res_code, '/dataExchange/btInterConfigAction.do?method=initData'||chr(38)||'interCode=1', '0', '1', '0', '0', 4, '���и���ӿ�����', '', '', '', '', '', null, null, null, null, null, 3  
   from bt_sys_res  where res_name = '�ӿ�����' and sys_code = 'exchange';
 end if;
 commit;
end;
/

--�޸����� 20130130
--�޸��� ���
--�޸����� ���������˵�ƾ֤�ӿ�����
declare 
 vn_count number;
begin
 select count(*) into vn_count from bt_sys_res t1,bt_sys_res t2 where t1.sys_code='exchange' and t1.res_name='ƾ֤�ӿ�����' and t1.father_code=t2.sys_code and t2.res_name='�ӿ�����';
 if vn_count<1 then
    insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL) 
   select (select max(RES_CODE) + 1 from bt_sys_res), 'ƾ֤�ӿ�����', 'exchange', res_code, '/dataExchange/btInterConfigAction.do?method=initData'||chr(38)||'interCode=2', '0', '1', '0', '0', 4, 'ƾ֤�ӿ�����', '', '', '', '', '', null, null, null, null, null, 3  
   from bt_sys_res  where res_name = '�ӿ�����' and sys_code = 'exchange';
 end if;
 commit;
end;
/


--�޸����� 20130130
--�޸��� ���
--�޸����� �������нӿ����ñ�
DECLARE
 VC_STR VARCHAR(2000);
 VC_COUNT NUMBER;
BEGIN
 SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG';
 IF VC_COUNT < 1 THEN
  VC_STR := 'CREATE TABLE ERP_INTER_CONFIG
            (
                    INTER_CODE VARCHAR(1) PRIMARY KEY,--�ո���־��0���գ� 1������2��ƾ֤��
                    OFFLINE_SIGN VARCHAR(1),--���߱�־��0����1�ǣ�
                    ONLINE_SIGN VARCHAR(1),--���߱�־��0����1�ǣ�
                    AUTOSEND_SIGN VARCHAR(1),--�Զ����ͱ�־��0����1�ǣ�
                    SPLIT_SIGN VARCHAR(1),--��ֱ�־��0����1�ǣ�
                    MERGER_SIGN VARCHAR(1),--�ϲ���־��0����1�ǣ�
                    BUDGETMATCH_SIGN VARCHAR(1),--Ԥ��ƥ���־��0����1�ǣ�
                    MAKEUP_SIGN VARCHAR(1),--��¼��־��0����1�ǣ�
                    NET_SIGN VARCHAR(1),--��������ƾ֤��0����1�ǣ�
                    CORP_SIGN VARCHAR(1),--���ɵ�λƾ֤��0����1�ǣ�
                    COMPARE_SIGN VARCHAR(1),--���Ҹ���ָ��(0����1��)
                    PAY_IN_COMPARE_SIGN VARCHAR(1),--����¼��ƥ��ģ��(0����1��)
                    DATA_SOURCE VARCHAR(20) --���͵�������Դ��bytter:B,erp:E,other:O��
            )';
  EXECUTE IMMEDIATE VC_STR;
 END IF;
END;
/
comment on column ERP_INTER_CONFIG.INTER_CODE
  is '�ո���־��0���գ� 1������2��ƾ֤��';
comment on column ERP_INTER_CONFIG.OFFLINE_SIGN
  is '���߱�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.ONLINE_SIGN
  is '���߱�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.AUTOSEND_SIGN
  is '�Զ����ͱ�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.SPLIT_SIGN
  is '��ֱ�־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.MERGER_SIGN
  is '�ϲ���־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.BUDGETMATCH_SIGN
  is 'Ԥ��ƥ���־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.MAKEUP_SIGN
  is '��¼��־��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.NET_SIGN
  is '��������ƾ֤��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.CORP_SIGN
  is '���ɵ�λƾ֤��0����1�ǣ�';
comment on column ERP_INTER_CONFIG.COMPARE_SIGN
  is '���Ҹ���ָ��(0����1��)';
comment on column ERP_INTER_CONFIG.PAY_IN_COMPARE_SIGN
  is '����¼��ƥ��ģ��(0����1��)';
comment on column ERP_INTER_CONFIG.DATA_SOURCE
  is '���͵�������Դ��bytter:B,erp:E,other:O��';

--�޸����� 20130131
--�޸��� ���
--�޸����� ��ʼ�����нӿ����ñ�����
insert into ERP_INTER_CONFIG (INTER_CODE, OFFLINE_SIGN, ONLINE_SIGN, AUTOSEND_SIGN, SPLIT_SIGN, MERGER_SIGN, BUDGETMATCH_SIGN, MAKEUP_SIGN, NET_SIGN, CORP_SIGN, COMPARE_SIGN, PAY_IN_COMPARE_SIGN, DATA_SOURCE)
values ('0', '0', '1', '0', '0', '0', '0', '1', '', '', '', '','');

insert into ERP_INTER_CONFIG (INTER_CODE, OFFLINE_SIGN, ONLINE_SIGN, AUTOSEND_SIGN, SPLIT_SIGN, MERGER_SIGN, BUDGETMATCH_SIGN, MAKEUP_SIGN, NET_SIGN, CORP_SIGN, COMPARE_SIGN, PAY_IN_COMPARE_SIGN, DATA_SOURCE)
values ('1', '0', '1', '0', '0', '0', '0', '1', '', '', '0', '0','');

insert into ERP_INTER_CONFIG (INTER_CODE, OFFLINE_SIGN, ONLINE_SIGN, AUTOSEND_SIGN, SPLIT_SIGN, MERGER_SIGN, BUDGETMATCH_SIGN, MAKEUP_SIGN, NET_SIGN, CORP_SIGN, COMPARE_SIGN, PAY_IN_COMPARE_SIGN, DATA_SOURCE)
values ('2', '', '', '0', '', '', '', '1', '1', '1', '', '','');
commit;

--�޸����� 20130131
--�޸��� ���
--�޸����� �������нӿ���ϸ���ñ�
declare
  VC_STR VARCHAR(2000);
  VC_COUNT NUMBER;
BEGIN
  SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG_SET';
  IF VC_COUNT < 1 THEN
      VC_STR := 'CREATE TABLE ERP_INTER_CONFIG_SET(
                     ID VARCHAR(32) PRIMARY KEY,--32λ����
                     OBJECT_CODE VARCHAR(10),--����/��λ ��NET/CORP��
                     RANGE_CODE VARCHAR(10),--�ڲ�/�ⲿ  (INTERNAL/EXTERNAL)
                     MATCHTEMP_TYPE VARCHAR(10),--ƥ��ģ������ (ģ������ά������)1
                     MATCH_FIELD VARCHAR(30),--ƥ���ֶ�1
                     MATCHTEMPTYPE_ANOTHER VARCHAR(10),--ƥ��ģ������ (ģ������ά������)2
                     MATCHFIELD_ANOTHER VARCHAR(30),--ƥ���ֶ�2
                     MATCH_OTHER VARCHAR(300),--��������
                     IS_LINE_SIGN VARCHAR(1),--�������߱�־(0:���ߣ�1����)
                     INTER_CODE VARCHAR(1),--�ո���־��0���գ� 1������2:ƾ֤��
                     VOUCHER_TYPE VARCHAR(2)--���㷽ʽ
                      )';
   EXECUTE IMMEDIATE VC_STR;
   END IF;
END;
/
comment on column ERP_INTER_CONFIG_SET.ID
  is '����';
comment on column ERP_INTER_CONFIG_SET.OBJECT_CODE
  is '����/��λ ��NET/CORP��';
comment on column ERP_INTER_CONFIG_SET.RANGE_CODE
  is '�ڲ�/�ⲿ  (INTERNAL/EXTERNAL)';
comment on column ERP_INTER_CONFIG_SET.MATCHTEMP_TYPE
  is 'ƥ��ģ������ (ģ������ά������)1';
comment on column ERP_INTER_CONFIG_SET.MATCH_FIELD
  is 'ƥ���ֶ�1';
comment on column ERP_INTER_CONFIG_SET.MATCHTEMPTYPE_ANOTHER
  is 'ƥ��ģ������ (ģ������ά������)2';
comment on column ERP_INTER_CONFIG_SET.MATCHFIELD_ANOTHER
  is 'ƥ���ֶ�2';
comment on column ERP_INTER_CONFIG_SET.MATCH_OTHER
  is '��������';
comment on column ERP_INTER_CONFIG_SET.IS_LINE_SIGN
  is '�������߱�־(0:���ߣ�1����)';
comment on column ERP_INTER_CONFIG_SET.INTER_CODE
  is '�ո���־��0���գ� 1������2:ƾ֤��';
comment on column ERP_INTER_CONFIG_SET.VOUCHER_TYPE
  is '���㷽ʽ';
commit;


--�޸����� 20130131
--�޸��� ���
--�޸����� ���ӽӿڲ�¼���ñ�
DECLARE
  VC_STR VARCHAR(2000);
  VC_COUNT NUMBER;
BEGIN
  SELECT COUNT(*) INTO VC_COUNT FROM USER_TABLES WHERE TABLE_NAME='ERP_INTER_CONFIG_FILL';
  IF VC_COUNT < 1 THEN
  VC_STR := 'CREATE TABLE ERP_INTER_CONFIG_FILL(
            INTER_CODE  VARCHAR(1),--�ո���־��0���գ� 1����;2:ƾ֤��
            FIELD_CODE VARCHAR(30),--�ֶδ���
            FIELD_NAME VARCHAR(100),--�ֶ�����
            IS_SHOW VARCHAR(1),--�Ƿ���ʾ 0,�� 1,��
            IS_NOT_NULL VARCHAR(1),--�Ƿ��¼ 0,�� 1,��
            FIELD_NAME_SHOW VARCHAR(100),--��ʾ����
      sort_sign number not null,--�����ʶ
            PRIMARY KEY(INTER_CODE,FIELD_CODE)
         )';
  EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
comment on column ERP_INTER_CONFIG_FILL.INTER_CODE
  is '�ո���־��0���գ� 1����;2:ƾ֤��';
comment on column ERP_INTER_CONFIG_FILL.FIELD_CODE
  is '�ֶδ���';
comment on column ERP_INTER_CONFIG_FILL.FIELD_NAME
  is '�ֶ�����';
comment on column ERP_INTER_CONFIG_FILL.IS_SHOW
  is '�Ƿ���ʾ 0,�� 1,��';
comment on column ERP_INTER_CONFIG_FILL.IS_NOT_NULL
  is '�Ƿ��¼ 0,�� 1,��';
comment on column ERP_INTER_CONFIG_FILL.FIELD_NAME_SHOW
  is '��ʾ����';
  comment on column ERP_INTER_CONFIG_FILL.sort_sign
  is '�����ʶ';


create table ERP_TEMPLATE_TYPE
(
  ID             NUMBER(10) not null primary key,
  TYPE_CODE      VARCHAR2(32),
  TYPE_NAME      VARCHAR2(4),
  GENERAL_RANGE  NUMBER(10),
  MATCHING_FIELD VARCHAR2(100),
  RMK            VARCHAR2(200),
  MODIFY_DATE    DATE default SYSDATE
)

-- Add comments to the table 
comment on table ERP_TEMPLATE_TYPE
  is 'ģ�����ͱ�';
-- Add comments to the columns 
comment on column ERP_TEMPLATE_TYPE.TYPE_CODE
  is 'ģ�����ͱ���';
comment on column ERP_TEMPLATE_TYPE.TYPE_NAME
  is 'ģ����������';
comment on column ERP_TEMPLATE_TYPE.GENERAL_RANGE
  is 'ͨ�÷�Χ
1:���й�˾ͨ��
2:ÿ����˾��ͬ
3:�����뵥λ��ͬ';
comment on column ERP_TEMPLATE_TYPE.MATCHING_FIELD
  is 'ƥ���ֶ�';
comment on column ERP_TEMPLATE_TYPE.RMK
  is '��ע';
comment on column ERP_TEMPLATE_TYPE.MODIFY_DATE
  is '��������';




--�޸����� 20130131
--�޸��� ���
--�޸����� ��ʼ���ӿڲ�¼���ñ�����
insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'USES', '��;', '0', '0', '��;',1);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'ABS', 'ժҪ', '0', '0', 'ժҪ',2);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE1', '�Զ���һ', '0', '0', '',3);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE2', '�Զ����', '0', '0', '',4);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE3', '�Զ�����', '0', '0', '',5);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE4', '�Զ�����', '0', '0', '',6);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('0', 'REVERSE5', '�Զ�����', '0', '0', '',7);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'VENDOR_NUM', '�ͻ�����', '0', '0', '�ͻ�����',1);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'ITEM_CODE', 'Ԥ���Ŀ', '0', '0', 'Ԥ���Ŀ',2);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'USES', '��;', '0', '0', '��;',3);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'ABS', 'ժҪ', '0', '0', 'ժҪ',4);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE1', '�Զ���һ', '0', '0', '',5);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE2', '�Զ����', '0', '0', '',6);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE3', '�Զ�����', '0', '0', '',7);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE4', '�Զ�����', '0', '0', '',8);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('1', 'REVERSE5', '�Զ�����', '0', '0', '',9);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'USES', '��;', '0', '0', '��;',1);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'ABS', 'ժҪ', '0', '0', 'ժҪ',2);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE1', '�Զ���һ', '0', '0', '',3);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE2', '�Զ����', '0', '0', '',4);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE3', '�Զ�����', '0', '0', '',5);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE4', '�Զ�����', '0', '0', '',6);

insert into ERP_INTER_CONFIG_fill (INTER_CODE, FIELD_CODE, FIELD_NAME, IS_SHOW, IS_NOT_NULL, FIELD_NAME_SHOW, SORT_SIGN)
values ('2', 'REVERSE5', '�Զ�����', '0', '0', '',7);

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d15055f013d150eb1ef0005', 'NET', 'INTERNAL', '', '', '', '', '', '0', '0', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d0f4393013d0f44fb9d0000', 'NET', 'INTERNAL', '', '', '', '', '', '1', '0', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d0f4393013d0f44fb9d0002', 'NET', 'INTERNAL', '', '', '', '', '', '0', '1', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d14833e013d14929f4b002e', 'NET', 'INTERNAL', '', '', '', '', '', '1', '1', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d0f4393013d0f44fb9d0003', 'NET', '', '', '', '', '', '', '', '2', '');

insert into erp_inter_config_set (ID, OBJECT_CODE, RANGE_CODE, MATCHTEMP_TYPE, MATCH_FIELD, MATCHTEMPTYPE_ANOTHER, MATCHFIELD_ANOTHER, MATCH_OTHER, IS_LINE_SIGN, INTER_CODE, VOUCHER_TYPE)
values ('402880363d14833e013d14929f4b002f', 'CORP', '', '', '', '', '', '', '', '2', '');



commit;


