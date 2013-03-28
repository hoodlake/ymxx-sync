--修改日期：20120921
--修改人：叶爱军
--需求编号：XD-JD03-027 系统功能-贷款台账
--修改内容：系统参数 增加 内部贷款是否计费 信贷管理是否记账
--参数设置：
INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6) VALUES ('is_charging', 'cms', '内部贷款是否计费', 0, 0, 'VALUE = 0，否，VALUE = 1，是', '0,否;1,是', 1);
INSERT INTO BT_PARAM (CODE, SYS_CODE, NAME, PARAM_VALUE1, PARAM_TYPE, RMK, REVERSE1, REVERSE6) VALUES ('is_accounting', 'cms', '信贷管理是否记账', 1, 0, 'VALUE = 0，否，VALUE = 1，是', '0,否;1,是', 1);
COMMIT;