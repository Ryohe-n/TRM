# 19 :16 0x0 _NONE_ DATA_TIMEOUT_VAL_MULTIPLIER:

- Used when SDMMC IO clock is used instead TMCLK for
running data timeout counter (USE_TMCLK_FOR_DATA_TIMEOUT is set in VENDOR_SYS_SW_CNTRL register).
- Effective data timeout val = (multiplier+1) *
data_timeout_val 0 - no multiplier 15:12 0x0 _NONE_ DAT_TUNING_ASYNC_FIFO_ADDNL_DELAY:
- This register field holds the additional delay in cycles
which should be added to wdata/crc token round trip delay Default value is - zero.
- NOTE: SW should not update this field unless a new PROD
setting is given. 11:8 0x0 _NONE_ ADDITIONAL_NCR_CYCLES:
- Additional Ncr wait time - useful for HW debug
Default is 0 - SW should not modify this. 7:0 0x0 _NONE_ OVERRIDE_FOR_1_8V_VDD2:
- Maximum override for 1.8V VDD2
- SDMMC_VENDOR_IO_TRIM_CNTRL_0
- Vendor IO trimmer control register
- Used to configure IO trimmer
- Truth table
- Input Pins Output Comments
E_DPD SEL_VREG SEL_VREF CLKOUT 1 x x 0 The cell is in deep power down mode 0 1 x based on ip_clk_select selected clock input Trimmer is powered by VAUXC 0 0 x based on ip_clk_select selected clock input Trimmer is powered by regulated voltage
- 'x' indicates don't care
- Offset: 0x1ac
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000205 (0b0000,xxxx,xxxx,xxxx,xxxx,x010,000x,x101)
- Bit
- Reset
- Description

