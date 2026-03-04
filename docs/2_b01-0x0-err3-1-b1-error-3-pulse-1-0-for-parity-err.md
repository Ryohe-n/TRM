# 2 'b01. 0x0 ERR3: 1'b1 -> Error_3_pulse[1:0] for Parity Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.dmem was equal to 2'b10. 1'b0 -> Error_3_pulse[1:0] for Parity Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.dmem was equal to 2'b01. 0x0 ERR2: 1'b1 -> Error_2_pulse[1:0] for ECC DED Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.imem was equal to 2'b10. 1'b0 -> Error_2_pulse[1:0] for ECC DED Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.imem was equal to 2'b01. 0x0 ERR1: 1'b1 -> Error_1_pulse[1:0] for ECC SEC Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.imem was equal to 2'b10. 1'b0 -> Error_1_pulse[1:0] for ECC SEC Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.imem was equal to 2'b01. 0x0 ERR0: 1'b1 -> Error_0_pulse[1:0] for Register Parity Error from NV_VI_err_collator was equal to 2'b10. 1'b0 -> Error_0_pulse[1:0] for Register Parity Error from NV_VI_err_collator was equal to 2'b01.

- VI_EC_ERRSLICE0_MISSIONERR_INJECT_0
- Offset: 0xc0f
- Byte Offset: 0x303c
- Read/Write: R/W

- Video Input Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,00xx,0000)
- Bit
- Reset
- Description
0x0 ERR31: 1'b1 -> Assert the inject_error_31 output for Parity Error on internal data path to FAULT_UDF_TAG_VI_CHANSEL_DATA_PARITY_ERR to allow for error injection. 1'b0 -> De-Asseert inject_error_31 output. 0 = DISABLE 1 = ENABLE 0x0 ERR30: 1'b1 -> Assert the inject_error_30 output for ECC DED Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_DED to allow for error injection. 1'b0 -> De-Asseert inject_error_30 output. 0 = DISABLE 1 = ENABLE 0x0 ERR29: 1'b1 -> Assert the inject_error_29 output for ECC SEC Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_SEC to allow for error injection. 1'b0 -> De-Asseert inject_error_29 output. 0 = DISABLE 1 = ENABLE 0x0 ERR28: 1'b1 -> Assert the inject_error_28 output for ECC DED Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM4_ECC_DED to allow for error injection. 1'b0 -> De-Asseert inject_error_28 output. 0 = DISABLE 1 = ENABLE 0x0 ERR27: 1'b1 -> Assert the inject_error_27 output for ECC SEC Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM4_ECC_SEC to allow for error injection. 1'b0 -> De-Asseert inject_error_27 output. 0 = DISABLE 1 = ENABLE 0x0 ERR26: 1'b1 -> Assert the inject_error_26 output for ECC DED Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM3_ECC_DED to allow for error injection. 1'b0 -> De-Asseert inject_error_26 output. 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x0 ERR25: 1'b1 -> Assert the inject_error_25 output for ECC SEC Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM3_ECC_SEC to allow for error injection. 1'b0 -> De-Asseert inject_error_25 output. 0 = DISABLE 1 = ENABLE 0x0 ERR24: 1'b1 -> Assert the inject_error_24 output for ECC DED Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM2_ECC_DED to allow for error injection. 1'b0 -> De-Asseert inject_error_24 output. 0 = DISABLE 1 = ENABLE 0x0 ERR23: 1'b1 -> Assert the inject_error_23 output for ECC SEC Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM2_ECC_SEC to allow for error injection. 1'b0 -> De-Asseert inject_error_23 output. 0 = DISABLE 1 = ENABLE 0x0 ERR22: 1'b1 -> Assert the inject_error_22 output for ECC DED Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM1_ECC_DED to allow for error injection. 1'b0 -> De-Asseert inject_error_22 output. 0 = DISABLE 1 = ENABLE 0x0 ERR21: 1'b1 -> Assert the inject_error_21 output for ECC SEC Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM1_ECC_SEC to allow for error injection. 1'b0 -> De-Asseert inject_error_21 output. 0 = DISABLE 1 = ENABLE 0x0 ERR20: 1'b1 -> Assert the inject_error_20 output for ECC DED Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM0_ECC_DED to allow for error injection. 1'b0 -> De-Asseert inject_error_20 output. 0 = DISABLE 1 = ENABLE 0x0 ERR19: 1'b1 -> Assert the inject_error_19 output for ECC SEC Error on internal data path to FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM0_ECC_SEC to allow for error injection. 1'b0 -> De-Asseert inject_error_19 output. 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x0 ERR18: 1'b1 -> Assert the inject_error_18 output for Register Parity Error to NV_vi.u_csimux.u_reg to allow for error injection. 1'b0 -> De-Asseert inject_error_18 output. 0 = DISABLE 1 = ENABLE 0x0 ERR17: 1'b1 -> Assert the inject_error_17 output for Register Parity Error to NV_vi.u_chansel.u_shadow_reg to allow for error injection. 1'b0 -> De-Asseert inject_error_17 output. 0 = DISABLE 1 = ENABLE 0x0 ERR16: 1'b1 -> Assert the inject_error_16 output for Register Parity Error to NV_vi.u_chansel.u_direct_reg to allow for error injection. 1'b0 -> De-Asseert inject_error_16 output. 0 = DISABLE 1 = ENABLE 0x0 ERR15: 1'b1 -> Assert the inject_error_15 output for Register Parity Error to NV_vi.u_atomp.u_reg_stg0 to allow for error injection. 1'b0 -> De-Asseert inject_error_15 output. 0 = DISABLE 1 = ENABLE 0x0 ERR14: 1'b1 -> Assert the inject_error_14 output for Register Parity Error to NV_vi.u_pixfmt.u_cfgreg to allow for error injection. 1'b0 -> De-Asseert inject_error_14 output. 0 = DISABLE 1 = ENABLE 0x0 ERR13: 1'b1 -> Assert the inject_error_13 output for Register Parity Error to NV_vi.u_pixfmt.u_reg to allow for error injection. 1'b0 -> De-Asseert inject_error_13 output. 0 = DISABLE 1 = ENABLE 0x0 ERR12: 1'b1 -> Assert the inject_error_12 output for Register Parity Error to NV_vi.u_csbmaster.u_chanreg to allow for error injection. 1'b0 -> De-Asseert inject_error_12 output. 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x0 ERR11: 1'b1 -> Assert the inject_error_11 output for Other Uncorrected Error to
- FAULT_UDF_TAG_VI_FATAL_NOTIFY_TIMESTAMP_OVRFLOW_ERR to allow for
error injection. 1'b0 -> De-Asseert inject_error_11 output. 0 = DISABLE 1 = ENABLE 0x0 ERR10: 1'b1 -> Assert the inject_error_10 output for Other Uncorrected Error to
- FAULT_UDF_TAG_VI_FATAL_HOST_PKTINJECT_STALL_ERR to allow for error
injection. 1'b0 -> De-Asseert inject_error_10 output. 0 = DISABLE 1 = ENABLE 0x0 ERR9: 1'b1 -> Assert the inject_error_9 output for Other Uncorrected Error to
- FAULT_UDF_TAG_VI_FATAL_CSIMUX_FIFO_OVFL_ERR to allow for error
injection. 1'b0 -> De-Asseert inject_error_9 output. 0 = DISABLE 1 = ENABLE 0x0 ERR8: 1'b1 -> Assert the inject_error_8 output for Other Uncorrected Error to
- FAULT_UDF_TAG_VI_FATAL_ATOMP_PACKER_OVFL_ERR to allow for error
injection. 1'b0 -> De-Asseert inject_error_8 output. 0 = DISABLE 1 = ENABLE 0x0 ERR7: 1'b1 -> Assert the inject_error_7 output for Other Uncorrected Error to
- FAULT_UDF_TAG_VI_FATAL_NOTIFY_FIFO_OVFL_ERR to allow for error
injection. 1'b0 -> De-Asseert inject_error_7 output. 0 = DISABLE 1 = ENABLE 0x0 ERR6: 1'b1 -> Assert the inject_error_6 output for Register Parity Error to NV_VIFALCON_falcon.cfgregs.ptgt to allow for error injection. 1'b0 -> De-Asseert inject_error_6 output. 0 = DISABLE 1 = ENABLE 0x0 ERR3: 1'b1 -> Assert the inject_error_3 output for Parity Error from on-chip SRAM/ FIFO to NV_vi.u_NV_VIFALCON_falcon.dmem to allow for error injection. 1'b0 -> De-Asseert inject_error_3 output. 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x0 ERR2: 1'b1 -> Assert the inject_error_2 output for ECC DED Error from on-chip SRAM/FIFO to NV_vi.u_NV_VIFALCON_falcon.imem to allow for error injection. 1'b0 -> De-Asseert inject_error_2 output. 0 = DISABLE 1 = ENABLE 0x0 ERR1: 1'b1 -> Assert the inject_error_1 output for ECC SEC Error from on-chip SRAM/FIFO to NV_vi.u_NV_VIFALCON_falcon.imem to allow for error injection. 1'b0 -> De-Asseert inject_error_1 output. 0 = DISABLE 1 = ENABLE 0x0 ERR0: 1'b1 -> Assert the inject_error_0 output for Register Parity Error to NV_VI_err_collator to allow for error injection. 1'b0 -> De-Asseert inject_error_0 output. 0 = DISABLE 1 = ENABLE
- VI_EC_ERRSLICE0_LATENTERR_ENABLE_0
- Offset: 0xc10
- Byte Offset: 0x3040
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0xffffffff (0b1111,1111,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description
0x1 ERR31: 1'b1 -> Enable Latent Error Reporting for Parity Error on internal data path from FAULT_UDF_TAG_VI_CHANSEL_DATA_PARITY_ERR 1'b0 -> Disable Latent Error Reporting for Parity Error on internal data path from FAULT_UDF_TAG_VI_CHANSEL_DATA_PARITY_ERR 0 = DISABLE 1 = ENABLE 0x1 ERR30: 1'b1 -> Enable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_DED 1'b0 -> Disable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_DED 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x1 ERR29: 1'b1 -> Enable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_SEC 1'b0 -> Disable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM5_ECC_SEC 0 = DISABLE 1 = ENABLE 0x1 ERR28: 1'b1 -> Enable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM4_ECC_DED 1'b0 -> Disable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM4_ECC_DED 0 = DISABLE 1 = ENABLE 0x1 ERR27: 1'b1 -> Enable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM4_ECC_SEC 1'b0 -> Disable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM4_ECC_SEC 0 = DISABLE 1 = ENABLE 0x1 ERR26: 1'b1 -> Enable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM3_ECC_DED 1'b0 -> Disable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM3_ECC_DED 0 = DISABLE 1 = ENABLE 0x1 ERR25: 1'b1 -> Enable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM3_ECC_SEC 1'b0 -> Disable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM3_ECC_SEC 0 = DISABLE 1 = ENABLE 0x1 ERR24: 1'b1 -> Enable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM2_ECC_DED 1'b0 -> Disable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM2_ECC_DED 0 = DISABLE 1 = ENABLE 0x1 ERR23: 1'b1 -> Enable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM2_ECC_SEC 1'b0 -> Disable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM2_ECC_SEC 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x1 ERR22: 1'b1 -> Enable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM1_ECC_DED 1'b0 -> Disable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM1_ECC_DED 0 = DISABLE 1 = ENABLE 0x1 ERR21: 1'b1 -> Enable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM1_ECC_SEC 1'b0 -> Disable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM1_ECC_SEC 0 = DISABLE 1 = ENABLE 0x1 ERR20: 1'b1 -> Enable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM0_ECC_DED 1'b0 -> Disable Latent Error Reporting for ECC DED Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM0_ECC_DED 0 = DISABLE 1 = ENABLE 0x1 ERR19: 1'b1 -> Enable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM0_ECC_SEC 1'b0 -> Disable Latent Error Reporting for ECC SEC Error on internal data path from FAULT_UDF_TAG_VI_CSIMUX_CTRL_STREAM0_ECC_SEC 0 = DISABLE 1 = ENABLE 0x1 ERR18: 1'b1 -> Enable Latent Error Reporting for Register Parity Error from NV_vi.u_csimux.u_reg 1'b0 -> Disable Latent Error Reporting for Register Parity Error from NV_vi.u_csimux.u_reg 0 = DISABLE 1 = ENABLE 0x1 ERR17: 1'b1 -> Enable Latent Error Reporting for Register Parity Error from NV_vi.u_chansel.u_shadow_reg 1'b0 -> Disable Latent Error Reporting for Register Parity Error from NV_vi.u_chansel.u_shadow_reg 0 = DISABLE 1 = ENABLE 0x1 ERR16: 1'b1 -> Enable Latent Error Reporting for Register Parity Error from NV_vi.u_chansel.u_direct_reg 1'b0 -> Disable Latent Error Reporting for Register Parity Error from NV_vi.u_chansel.u_direct_reg 0 = DISABLE 1 = ENABLE

- Video Input Registers
- Bit
- Reset
- Description
0x1 ERR15: 1'b1 -> Enable Latent Error Reporting for Register Parity Error from
- NV_vi.u_atomp.u_reg_stg0

