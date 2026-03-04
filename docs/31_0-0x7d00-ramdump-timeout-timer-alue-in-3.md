# 31 :0 0x7d00 RAMDUMP_TIMEOUT: timer alue(in 32K clocks_, which will result in a timeout while waiting for pmc2ccplex_cacheflush_done and pmc2mc_dram_sr_ack. both have the same value to save on AO logic should be programmed before enabling RAMDUMP_EN

- PMC_IMPL_RST_REQ_CONFIG_0
- For the RST_REQ_CONFIG and RST_REQ_CNTVAL registers - the configuration variables for each
reset level are reset using a reset one level lower. Example:
- L1a configurations knobs are reset using L0 cold register
- L1b configurations knobs are reset using L1a cold register
- L1c configurations knobs are reset using L1b cold register
- L2 configurations knobs are reset using L1c cold register
- WDT_OUT_RST_EN fields that enable WDT_RESET_OUT - should NOT be written by SW. It is
supposed to be set only in bootcode.
- Offset: 0x114
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0x00)
- Bit
- Reset
- Description
- DISABLE
L1CRST_WDT_OUT_RST_EN: Enables Sideband WDT_RESET_OUT for SW resetcases.
- Should only be used with PMIC that support RESET_IN

