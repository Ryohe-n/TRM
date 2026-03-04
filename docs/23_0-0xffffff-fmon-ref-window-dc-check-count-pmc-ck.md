# 23 :0 0xffffff FMON_REF_WINDOW_DC_CHECK_COUNT_PMC_CK:

- The count determined the reference clock cycle edge on which DC
check is performed. If the count if > ref_window_count, then the DC check is never enabled.
- PMC_IMPL_FMON_FAULT_ACTION_PMC_CK_0
- Offset: 0x838
- Read/Write: R/W
- Parity Protection: Y

- PMC IMPL Registers
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PMC_CK_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
- DISABLE
FMON_ACTION_DC_RESET_REQ_PMC_CK: if set, DC fault will trigger reset request on fmon_dc_reset_req 0 = DISABLE 1 = ENABLE
- DISABLE
FMON_ACTION_FAULT_REPORT_PMC_CK: if set, triggering of any fault (which are enabled) will result in pusling of fault_out_pulse pin 0 = DISABLE 1 = ENABLE
- DISABLE
FMON_ACTION_RESET_REQ_PMC_CK: if set, triggering of any fault (which are enabled) will result in reset request 0 = DISABLE 1 = ENABLE
- PMC_IMPL_FMON_CONFIG_PMC_CK_0
- Offset: 0x83c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_PMC_CK_SCR_0
- Reset: 0x0000007f (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111,1111)
- Bit
- Reset
- Description
- ENABLE
FMON_REPORT_DC_FAULT_VIOL_PMC_CK:
- If set, DC fault violation will be reported on fault_out_pulse

