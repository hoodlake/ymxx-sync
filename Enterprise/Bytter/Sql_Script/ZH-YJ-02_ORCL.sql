--�޸����ڣ�2012.12.10
--�޸��ˣ��ܱ�
--�޸����ݣ��Զ�ɨ��Ԥ��
--�޸�ԭ���Զ�ɨ��Ԥ��

--����
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BAL' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BAL ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BAL' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BAL ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BAL' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BAL ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BAL' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BAL ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/






--��������½�

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'STRATEGY_DETAIL_STR';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD STRATEGY_DETAIL_STR VARCHAR2(40)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/



DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_BALANCEDOWN ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/





--����ֽ𳬱�Ԥ����Ϣ
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_CASH' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_CASH ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_CASH' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_CASH ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_CASH' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_CASH ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_CASH' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_CASH ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_CASH' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_CASH ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--����˻�֧��
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DEZJZC' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DEZJZC ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DEZJZC' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DEZJZC ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DEZJZC' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DEZJZC ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DEZJZC' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DEZJZC ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DEZJZC' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DEZJZC ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DEZJZC' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DEZJZC ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--ժҪԤ��
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'STRATEGY_DETAIL_STR';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD STRATEGY_DETAIL_STR VARCHAR2(40)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_DTLRMK' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_DTLRMK ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/



--����ֽ�֧��Ԥ����Ϣ
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_LARGEPAY' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_LARGEPAY ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_LARGEPAY' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_LARGEPAY ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_LARGEPAY' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_LARGEPAY ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_LARGEPAY' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_LARGEPAY ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_LARGEPAY' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_LARGEPAY ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_LARGEPAY' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_LARGEPAY ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/



--ϵͳ�⸶��Ԥ����Ϣ
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'STRATEGY_DETAIL_STR';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD STRATEGY_DETAIL_STR VARCHAR2(40)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_OUTPAY' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_OUTPAY ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/




--��ͬ��˾����
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_PAYEE' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_PAYEE ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_PAYEE' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_PAYEE ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_PAYEE' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_PAYEE ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_PAYEE' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_PAYEE ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_PAYEE' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_PAYEE ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--ʮ��Ԫ������
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_SWYZSB' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_SWYZSB ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_SWYZSB' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_SWYZSB ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_SWYZSB' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_SWYZSB ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_SWYZSB' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_SWYZSB ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_SWYZSB' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_SWYZSB ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_SWYZSB' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_SWYZSB ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--֧��������
DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'STRATEGY_DETAIL_STR';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD STRATEGY_DETAIL_STR VARCHAR2(40)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'BUSINESS_DATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD BUSINESS_DATE DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'WARNING_REASON';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD WARNING_REASON VARCHAR2(400)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'BANK_ACC';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD BANK_ACC VARCHAR2(50)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'STRAGE_DETAIL_ID';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD STRAGE_DETAIL_ID NUMBER(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'SCAN_DATE_START';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD SCAN_DATE_START DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_ZCHLR' AND COLUMN_NAME = 'BANK_TYPE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_ZCHLR ADD BANK_TYPE VARCHAR2(10)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/









--�洢��ϸ��¼
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_RESULT_DETAIL';
   IF VN_COUNT < 1 THEN  

  VC_STR := VC_STR || 'create table BT_WARNING_RESULT_DETAIL  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_DETAIL_ID    NUMBER(10), ';
  VC_STR := VC_STR || '   RESULT_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(12), ';
  VC_STR := VC_STR || '   BANK_ACC             VARCHAR2(50), ';
  VC_STR := VC_STR || '   ACC_NAME             VARCHAR2(140), ';
  VC_STR := VC_STR || '   BANK_NAME            VARCHAR2(140), ';
  VC_STR := VC_STR || '   AMT                  NUMBER(15,2), ';
  VC_STR := VC_STR || '   BANK_BAL             NUMBER(15,2), ';
  VC_STR := VC_STR || '   CD_SIGN              CHAR(1), ';
  VC_STR := VC_STR || '   TRANS_TIME           DATE, ';
  VC_STR := VC_STR || '   CUR                  VARCHAR2(2), ';
  VC_STR := VC_STR || '   OPP_ACC_NO           VARCHAR2(50), ';
  VC_STR := VC_STR || '   OPP_ACC_NAME         VARCHAR2(120), ';
  VC_STR := VC_STR || '   OPP_BANK_NAME        VARCHAR2(120), ';
  VC_STR := VC_STR || '   ABS                  VARCHAR2(140) ';
  VC_STR := VC_STR || ') ';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

--�洢����¼
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_RESULT_BAL';
   IF VN_COUNT < 1 THEN  
   
  VC_STR := VC_STR || 'create table BT_WARNING_RESULT_BAL ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   ID                   NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_DETAIL_ID    NUMBER(10), ';
  VC_STR := VC_STR || '   RESULT_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   BANK_ACC             VARCHAR2(50), ';
  VC_STR := VC_STR || '   BANK_NAME            VARCHAR2(120), ';
  VC_STR := VC_STR || '   ACC_NAME             VARCHAR2(120), ';
  VC_STR := VC_STR || '   BANK_BAL             NUMBER(15,2), ';
  VC_STR := VC_STR || '   CUR                  VARCHAR2(2), ';
  VC_STR := VC_STR || '   BANK_BAL_DATE        DATE, ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(12) ';
  VC_STR := VC_STR || ') ';
 EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/
  

--�洢�����¼
--�洢����¼
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_RESULT_OVERFLOW';
   IF VN_COUNT < 1 THEN  
   
  VC_STR := VC_STR || 'create table BT_WARNING_RESULT_OVERFLOW  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_DETAIL_ID    NUMBER(10), ';
  VC_STR := VC_STR || '   RESULT_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   CUR                  VARCHAR2(2), ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(15), ';
  VC_STR := VC_STR || '   BANK_ACC             VARCHAR2(50), ';
  VC_STR := VC_STR || '   ACC_NAME             VARCHAR2(120), ';
  VC_STR := VC_STR || '   BANK_NAME            VARCHAR2(120), ';
  VC_STR := VC_STR || '   BEGIN_AMT            NUMBER(15,2), ';
  VC_STR := VC_STR || '   IN_FLOW_AMT          NUMBER(15,2), ';
  VC_STR := VC_STR || '   OUT_FLOW_AMT         NUMBER(15,2), ';
  VC_STR := VC_STR || '   NET_FLOW_AMT         NUMBER(15,2), ';
  VC_STR := VC_STR || '   FINAL_AMT            NUMBER(15,2), ';
  VC_STR := VC_STR || '   MONTH                NUMBER(2) ';
  VC_STR := VC_STR || ') ';
 EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/  

--�洢��������½���¼
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_RESULT_BAL_DOWN';
   IF VN_COUNT < 1 THEN  
   
  VC_STR := VC_STR || 'create table BT_WARNING_RESULT_BAL_DOWN  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_DETAIL_ID    NUMBER(10), ';
  VC_STR := VC_STR || '   RESULT_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   BANK_ACC             VARCHAR2(50), ';
  VC_STR := VC_STR || '   ACC_NAME             VARCHAR2(120), ';
  VC_STR := VC_STR || '   BANK_NAME            VARCHAR2(120), ';
  VC_STR := VC_STR || '   CUR                  VARCHAR2(2), ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(12) ';
  VC_STR := VC_STR || ') ';
 EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/  


--�洢��������½���ϸ
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_RESULT_DOWN_DETAIL';
   IF VN_COUNT < 1 THEN  
   
  VC_STR := VC_STR || 'create table BT_WARNING_RESULT_DOWN_DETAIL  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   BT_WARNING_RESULT_BAL_DOWN_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   MONTH_NO             NUMBER(2), ';
  VC_STR := VC_STR || '   BANKBAL_AVG          NUMBER(15,2), ';
  VC_STR := VC_STR || '   BANKBAL_END          NUMBER(15,2) ';
  VC_STR := VC_STR || ') ';
 EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/  

--Ԥ����Ϣ��
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_DETAIL';
   IF VN_COUNT < 1 THEN  
   
  VC_STR := VC_STR || 'create table BT_WARNING_DETAIL  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   STRAGEGY_DETAIL_ID    NUMBER(10), ';
  VC_STR := VC_STR || '   RESULT_ID            NUMBER(10), ';
  VC_STR := VC_STR || '   NATURE_CODE          VARCHAR2(20), ';
  VC_STR := VC_STR || '   CORP_CODE            VARCHAR2(15), ';
  VC_STR := VC_STR || '   BANK_TYPE            VARCHAR2(4), ';
  VC_STR := VC_STR || '   RUN_TIME             DATE, ';
  VC_STR := VC_STR || '   CREATE_TIME          DATE, ';
  VC_STR := VC_STR || '   STATE                CHAR(1), ';
  VC_STR := VC_STR || '   REMARK               VARCHAR2(200), ';
  VC_STR := VC_STR || '   BUSINESS_DATE        DATE, ';
  VC_STR := VC_STR || '   BANK_ACC             VARCHAR2(50), ';
  VC_STR := VC_STR || '   WARNING_REASON       VARCHAR2(400) ';
  VC_STR := VC_STR || ') ';
 EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/  




--��������½���ϸ��

DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_BALANCEDOWN_DTL';
   IF VN_COUNT < 1 THEN  
   
  VC_STR := VC_STR || 'create table BT_WARNING_BALANCEDOWN_DTL  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   BALANCE_DOWN_ID      NUMBER(10), ';
  VC_STR := VC_STR || '   MONTH_NO             NUMBER(2), ';
  VC_STR := VC_STR || '   BANKBAL_AVG          NUMBER(15,2), ';
  VC_STR := VC_STR || '   BANKBAL_END          NUMBER(15,2) ';
  VC_STR := VC_STR || ') ';
 EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/  

---������ϸ�����

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_STRATEGY_DETAIL' AND COLUMN_NAME = 'LAST_RUN_STATE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD LAST_RUN_STATE CHAR(1)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_STRATEGY_DETAIL' AND COLUMN_NAME = 'LAST_RUN_TIME';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD LAST_RUN_TIME DATE';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/

DECLARE
  VN_COUNT     NUMBER;
  VC_STR       VARCHAR2(1000);
BEGIN
  --�鿴�ñ��и��ֶ��Ƿ����
  SELECT COUNT(*) 
    INTO VN_COUNT 
    FROM USER_TAB_COLUMNS 
   WHERE TABLE_NAME = 'BT_WARNING_STRATEGY_DETAIL' AND COLUMN_NAME = 'NATURE_CODE';
  --���С��1��˵�������ڣ����������ֶ�
  IF VN_COUNT < 1 THEN
    VC_STR := ' ALTER TABLE BT_WARNING_STRATEGY_DETAIL ADD NATURE_CODE VARCHAR2(20)';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/



ALTER TABLE BT_WARNING_STRATEGY_DETAIL MODIFY BANK_TYPE not null;

comment on COLUMN BT_WARNING_STRATEGY_DETAIL.LAST_RUN_STATE is '��һ������״̬��0����ʼ��1�������У�2�����гɹ���3������ʧ�ܣ�';
comment on COLUMN  BT_WARNING_STRATEGY_DETAIL.LAST_RUN_TIME is '��һ������ʱ��';
comment on COLUMN  BT_WARNING_STRATEGY_DETAIL.NATURE_CODE is '�˻�����';


--��λ���������˻�������ͼ
CREATE OR REPLACE VIEW V_CORP_BANKTYPE_NATURE AS 
select c.corp_code , c.corp_name ,  b.bank_type, b.type_name as bank_name , a.acc_type as nature_code , a.property as nature_name 
from bt_corp c ,bt_bank_type b , bis_acc_type a 
where exists (
      select acc_all.BANK_ACC  from v_bank_acc_all acc_all 
      where acc_all.ACC_TYPE = a.acc_type and acc_all.CORP_CODE = c.corp_code and acc_all.bank_type = b.bank_type 
)
order by c.corp_code ,b.bank_type,a.property  ;


--�˻���ʷ�����ͼ�����������,�˻�����, �Ƿ�����ֶ�
create or replace view v_bis_acc_his_bal as
Select Bal.Bank_Acc, Bal.Bal_Date,Bal.Bank_Bal,Acc.Corp_Code,Bank.Bank_Type,
       Atype.Acc_Type,Atype.Property,Acc.Cur,acc.bank_name,acc.acc_name, '1' Iscomplete
  From --�����˺ŵ�
       --�����˺ŵ���ʷ���
        Bis_Acc_His_Bal Bal,
       Bt_Bank_Acc     Acc,
       Bis_Acc_List    Bis,
       Bt_Bank         Bank,
       Bis_Acc_Type    Atype
 Where Bal.Bank_Acc = Acc.Bank_Acc
   And Bis.Bank_Acc = Acc.Bank_Acc
   And Bank.Bank_Code = Bis.Bank_Code
   And Atype.Acc_Type = Bis.Acc_Type
   And Bal.Acc_No Is Null
   And Acc.Valid_Sign = '1'
Union
--�����˺�
Select Bal.Bank_Acc,Bal.Bal_Date,Bal.Bank_Bal,
       App.Corp_Code,Btype.Bank_Type,
       Atype.Acc_Type, Atype.Property,
       App.Cur,bank.bank_name,app.acc_name,BAL.ISCOMPLETE
  From Bis_Acc_His_Bal Bal,
       Bt_Bankacc_App  App,
       Bt_Bank_Type    Btype,
       Bis_Acc_Type    Atype,
       bt_bank         bank
 Where Bal.Bank_Acc = App.Bankacc
   And Btype.Bank_Type = App.Bank_Type
   And Atype.Acc_Type = App.Acc_Attribute
   and bank.bank_code = app.bank_code
   And App.Status = '95'
   And Bal.Status = 95
   And Bal.Acc_No Is Not Null; 
   
   
  --��ʷ��ϸ��ͼ������������ֶ�
  create or replace view v_all_bis_acc_his_dtl as
 Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       Acc.Corp_Code,
       Acc.Acc_Type,
       acc.bank_type ,
       bank_type.type_name ,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, v_Acc_List Acc , bt_bank_type bank_type 
 Where Dtl.Bank_Acc = Acc.Bank_Acc and acc.bank_type = bank_type.bank_type 
   And Id Is Null
--������ϸ
Union All
Select Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       App.Corp_Code,
       App.Acc_Attribute,
       app.bank_type ,
       bank_type.type_name,
       dtl.bal as bank_bal
  From Bis_Acc_His_Dtl Dtl, Bt_Bankacc_App App, bt_bank_type bank_type 
 Where Dtl.Bank_Acc = App.Bankacc and bank_type.bank_type = app.bank_type
   And App.Status = 95
   And Id Is Not Null;
   
 
   
   --����ϵͳ�⸶����ͼ
   create or replace view V_OUT_PAY_HIS_DTL  AS 
  select  Dtl.Serial_Id,
       Dtl.Bank_Acc,
       Dtl.Acc_Name,
       Dtl.Bank_Name,
       Dtl.Opp_Acc_No,
       Dtl.Opp_Acc_Name,
       Dtl.Opp_Acc_Bank,
       Dtl.Cd_Sign,
       Dtl.Amt,
       Dtl.Cur,
       Dtl.Abs,
       Dtl.Postscript,
       Dtl.Trans_Time,
       dtl.Corp_Code,
       dtl.Acc_Type,
       dtl.bank_type ,
       dtl.type_name ,
       dtl.bank_bal
   from V_all_Bis_Acc_His_Dtl dtl 
  where not exists
  (select e.voucher_no from bis_exc e 
   where dtl.Bank_Acc = e.payer_acc_no  
     and dtl.Opp_Acc_No = e.payee_acc_no  and dtl.Cd_Sign = '1'
     and dtl.Amt = e.amt and to_char(dtl.Trans_Time,'yyyy-MM-dd') = to_char(e.trans_time,'yyyy-MM-dd')
 ); 

--�޸���������ͼ
create or replace view v_bis_acc_last_bal as
Select BANK_ACC,
       BAL_DATE,
       BANK_BAL,
       CORP_CODE,
       BANK_TYPE,
       ACC_TYPE,
       PROPERTY,
       CUR,
       ISCOMPLETE
  From v_Bis_Acc_His_Bal
 Where (Bank_Acc, Bal_Date) In (
                                --�����˺ŵ�������
                                Select Bank_Acc, Max(Bal_Date)
                                  From v_Bis_Acc_His_Bal
                                 Group By Bank_Acc);
                                 
--�洢�����˺�
DECLARE
  VC_STR           VARCHAR2(2000);
  VN_COUNT         NUMBER;
BEGIN
  SELECT COUNT(*)INTO VN_COUNT FROM USER_TABLES WHERE TABLE_NAME = 'BT_WARNING_STRATEGY_ACC';
   IF VN_COUNT < 1 THEN  

  VC_STR := VC_STR || 'create table BT_WARNING_STRATEGY_ACC  ';
  VC_STR := VC_STR || '( ';
  VC_STR := VC_STR || '   id                   NUMBER(10), ';
  VC_STR := VC_STR || '   DETAIL_ID           NUMBER(10), ';
  VC_STR := VC_STR || '   BANK_ACC             VARCHAR2(50), ';
  VC_STR := VC_STR || '   LAST_RUN_STATE              CHAR(1), ';
  VC_STR := VC_STR || '   LAST_RUN_TIME           DATE ';
  VC_STR := VC_STR || ') ';
    EXECUTE IMMEDIATE VC_STR;
  END IF;
END;
/


--�ֶ�ɨ��
DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '�ֶ�ɨ��' and sys_code = 'fwg' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values (( select max(res_code)+1 from bt_sys_res ) , '�ֶ�ɨ��', 'fwg', ( select min(res_code) from bt_sys_res r where r.res_name = 'Ԥ��չʾ����' and r.sys_code = 'fwg'  ), '/fundwarning/manualScan.jsp', '0', '1', '0', '0', 9, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/

--�ʽ�Ԥ����ϸ
--1����Ӳ˵�
DECLARE
  VN_COUNT NUMBER;
BEGIN
   SELECT COUNT(*)
    INTO VN_COUNT
    FROM bt_sys_res
   WHERE res_name = '�ʽ�Ԥ����ϸ' and sys_code = 'fwg' and res_level = 2;
   IF VN_COUNT = 0 THEN
      insert into bt_sys_res (RES_CODE, RES_NAME, SYS_CODE, FATHER_CODE, RES_URL, FUNC_FLAG, RES_TYPE, LINK_TARGET, STATUS, RES_ORDER, RMK, REVERSE1, REVERSE2, REVERSE3, REVERSE4, REVERSE5, REVERSE6, REVERSE7, REVERSE8, REVERSE9, REVERSE10, RES_LEVEL, RES_ROLE)
  values (( select max(res_code)+1 from bt_sys_res ) , '�ʽ�Ԥ����ϸ', 'fwg', ( select min(res_code) from bt_sys_res r where r.res_name = 'Ԥ��չʾ����' and r.sys_code = 'fwg'  ), '/fundwarning/queryFundwarningAction.do?method=queryFundWarningDetail', '0', '1', '0', '0', 9, ' ', '', '', '', '', '', null, null, null, null, null, 2, '');
   END IF;
END;
/


--��������ֹ�������ͼ
create or replace view v_bis_acc_last_bal_iscomplete as
Select BANK_ACC,
       BAL_DATE,
       BANK_BAL,
       CORP_CODE,
       BANK_TYPE,
       ACC_TYPE,
       PROPERTY,
       CUR,
       ISCOMPLETE
  From v_Bis_Acc_His_Bal
 Where (Bank_Acc, Bal_Date) In (
                                --�����˺ŵ�������
                                Select Bank_Acc, Max(Bal_Date)
                                  From v_Bis_Acc_His_Bal where iscomplete ='1'
                                 Group By Bank_Acc);


