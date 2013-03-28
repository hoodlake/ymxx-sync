--增加人：李程
--日期：2012-08-29
--[BZC002]人行标准化，添加“人行编码”字段（PB_SCALE_CODE）。位于：首页 >>基础平台>>基础数据维护 >>币别资料维护。
ALTER TABLE BT_CURRENCY ADD  PB_SCALE_CODE VARCHAR(20)
GO
