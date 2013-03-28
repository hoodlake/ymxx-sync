--修改日期：2012.11.27
--修改人：吴结兵
--修改内容：中国远洋
--修改原因：中国远洋脚本更新(融资利息查询)

--创建视图
CREATE OR REPLACE VIEW V_CMS_INTEREST_DTL_VIEW AS
SELECT net.net_name, --网点
       dtl.CONTRACT_CODE, --合同编号
       dtl.BILL_CODE, --业务编号
       type.type_name, --融资类型
       corp.corp_name, --单位名称 取bt_corp
       dtl.LOAN_MONEY, --本金
       dtl.BALANCE, --余额
       cur.cur_name, --币别 名称取bt_currency
       dtl.INTEREST_START_DATE, --起息日期
       dtl.BLN_INST_DATE, --结束日期
       dtl.DAYS, --天数
       dtl.CUMULATION, --积数
       dtl.INTEREST_RATE, --利率
       dtl.INTEREST, --利息金额
       dtl.NATURAL_INTEREST, -- 利息折算成本位币
       dtl.BORROW_NAME, --借款人
       dtl.statuszone as INTEREST_NAME, --计息类型 名称取fc_interest_type
       dtl.INTEREST_SIGN, --业务类型,1预提,2结息
       dtl.net_code,--查询条件
       dtl.corp_id,--查询条件
       dtl.bill_type,--查询条件
       to_char(dtl.balance_date,'yyyy-MM') as balance_date_str,--查询条件
       dtl.cur_code, --查询条件
       DTL.INTEREST_TIME,--查询条件
       DTL.INTEREST_TYPE--查询条件
  FROM CMS_INTEREST_DTL dtl
  inner join bt_net net on net.net_code=dtl.net_code
  inner join bt_corp corp on dtl.corp_id=corp.id
  inner join bt_currency cur on dtl.cur_code=cur.cur_code
  inner join cms_main_type type on type.type_code=dtl.bill_type
  inner join fc_interest_type interest on dtl.interest_type=interest.interest_code
 WHERE dtl.STATUS = '0'
/

--ZY-XD-06融资信息查询菜单
DECLARE
  VN_COUNT    NUMBER;
BEGIN
  SELECT COUNT(*) INTO VN_COUNT FROM BT_SYS_RES WHERE SYS_CODE = 'cms' and res_name='利息明细查询';
  IF VN_COUNT < 1 THEN
   insert into bt_sys_res(res_code,res_name,sys_code,father_code,res_url,res_type,status,res_order) 
values((select max(res_code)+1 from bt_sys_res),'利息明细查询','cms',(select res_code from 
bt_sys_res where res_name='查询' and sys_code='cms'),'/cms/cmsInterestDtlSearch.do?method=beforeOpr','1','0',15);
  END IF;
  COMMIT; 
END;
/