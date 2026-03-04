# 0 = DISABLE 1 = ENABLE 0x1 ERR0: 1'b1 -> Enable Mission Error Reporting for Register Parity Error from NV_VI_err_collator 1'b0 -> Disable Mission Error Reporting for Register Parity Error from NV_VI_err_collator 0 = DISABLE 1 = ENABLE

- VI_EC_ERRSLICE0_MISSIONERR_FORCE_0
- Offset: 0xc0d
- Byte Offset: 0x3034
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR31: 1'b1 -> Force Assertion of Mission Error Reporting for Parity Error on internal data path from FAULT_UDF_TAG_VI_CHANSEL_DATA_PARITY_ERR 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- Video Input Registers
- Bit
- Reset
- Description
0x0 ERR30: 1'b1 -> Force Assertion of Mission Error Reporting for ECC DED Error on internal data path from
- FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_DED

