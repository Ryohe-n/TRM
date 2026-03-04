# 3 , and n = 0, 6, 7. The selected clock is further divided by a factor m set by the following:

- Write (CLK_RST_CONTROLLER_CLK_SOURCE_SPI<i>_0.SPI<i>_CLK_DIVISOR =
(2m-2)), where i = 1, 2, 3. See the Clock Controller and Reset chapter for more information on controller enable and clock configuration.
- Controller Reset
The SPI controller can be reset in two different ways: Write (CLK_RST_CONTROLLER_RST_DEV_SPI<i>_0.SWR_SPI<i>_RST = 1), where i = 1, 2, 3.
- Write (CLK_RST_CONTROLLER_RST_DEV_SPI<i>_SET_0.SET_SWR_SPI<i>_RST = 1), where i =

