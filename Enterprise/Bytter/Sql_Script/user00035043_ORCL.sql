--�޸��ˣ�������
--�޸�ʱ�䣺2012-11-21
--��������Ʒ��־����Ӳ�Ʒ�ֶ�


declare
  v_cnt number;
begin
  select count(*) into v_cnt FROM USER_TAB_COLUMNS WHERE TABLE_NAME ='BIS_FIN_OPER_LOG' and COLUMN_NAME='BL_PRONO';
  if v_cnt = 0 then
     execute immediate 'alter table bis_fin_oper_log  add BL_PRONO  VARCHAR2(30)';
  end if;
end;

/