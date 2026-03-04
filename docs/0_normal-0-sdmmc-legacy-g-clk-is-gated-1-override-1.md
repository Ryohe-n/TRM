# 0 = NORMAL :0 -> sdmmc_legacy_g_clk is gated 1 = OVERRIDE :1 -> sdmmc_legacy_g_clk is not gated 0x1

- OVERRIDE
SDR50_TUNING_OVERRIDE: override the SDR50_TUNING capabilities bit.
- Software should only set this bit if it is required to use
Tuning for SDR50. (only supported for SDMMC1) 0 = NORMAL :0 -> No Tuning support advertised for SDR50 mode. 1 = OVERRIDE :1 -> Tuning support is enabled for SDR50 mode.

- SDMMCA Registers
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ UHS2_CAPABILITY_OVERRIDE: override the UHS-II capabilities bit. 0x1 0x0 PADPIPE_CLKEN_OVERRIDE: Override for padmacro and pipemacro clken. 0 = NORMAL :0 -> CLKEN is de-asserted when internal CLKEN is de-asserted. 1 = OVERRIDE :1 -> CLKEN is kept asserted even when internal CLKEN is de-asserted. 0x1 _NONE_ SPI_MODE_CLKEN_OVERRIDE: This mode is not supported in Tegra. 0x0
- FEEDBACK
INPUT_IO_CLK: Feedback clock is selected by default. Software should not change this.
- Disabling Feedback clock will select Internal Clock that
requires different TAP Value Programming. 0 = FEEDBACK 1 = INTERNAL 0x1 _NONE_ SDMMC_CLK:
- This is set when sdmmc_clk is supplied by the CAR
module. Prior to sdmmc_clk switch OFF, this bit should be written as '0'.
- By writing zero,the asynchronous card interrupt is
routed to the Interrupt controller. 0 = DISABLE 1 = ENABLE
- SDMMCA_VENDOR_SYS_SW_CNTRL_0
- Offset: 0x104
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x38600002 (0b0011,1000,011x,xxxx,x000,0000,x000,0010)
- Bit
- Reset
- Description
0x0 ENHANCED_STROBE_MODE:
- Enables enhanced strobe mode in HS400 mode for eMMC5.x devices

