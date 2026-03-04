# 27 :24 0x8 DEVICE_BUSY_WAIT_CYCLES:

- This register field is used to load wait_cycles counter before device busy
sampling in HS400 mode. Please note that this counter is used only in HS400 mode. 0x0 ALLOW_CARD_CLK_STALLS_IN_WR:
- When set, allows card clock stopping during transfer of data within a
block in DDR52/HS400 writes. 0x1 EMMC_IOBRICK_CLK_DATA: Used to drive AP_CLK and AN_CLK input of iobrick. 0x1 - clk_out will be same as iobrick_clk_in 0x0 - clk_out will be inverted iobrick_clk_in 0x1 QUALIFY_WITH_RD_DATA_VLD:
- We have async FIFOs in both cmd_in and dat_in paths in padmacro which
are used in tunable modes.
- When this bit set, rdata from FIFO is treated as valid data only when
rd_req is high. This is needed to handle bubbles on 'rd_req' when MTBF is high. 0x0 SD_BUS_POWER_ON_OFF_INT_STATUS:
- SD_BUS_POWER was changed. System software can use this interrupt to
implement power switch. 0x0 VOLT_SWITCH_INT_STATUS:
- VOLT_18_EN was changed. System software can use this interrupt to
implement a UHS-I voltage switch procedure for a standard SD Host driver 0 = NO_INT 1 = GEN_INT 0x0 TUNING_SYS_INT_STATUS:
- CMD19 was issued while EXECUTE_TUNING was set. System software can
use this interrupt to implement a UHS-I tuning procedure for a standard SD Host driver. 0 = NO_INT 1 = GEN_INT

- SDMMCA Registers
- Bit
- Reset
- Description

