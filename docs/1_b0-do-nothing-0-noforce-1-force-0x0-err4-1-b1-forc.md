# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR4: 1'b1 -> Force Assertion of Latent Error Reporting for Other Corrected Error from FAULT_UDF_TAG_FALCON2VI_OTHER_HW_CORRECTABLE_ERR 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR3: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error from on- chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.dmem 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR2: 1'b1 -> Force Assertion of Latent Error Reporting for ECC DED Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.imem 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR1: 1'b1 -> Force Assertion of Latent Error Reporting for ECC SEC Error from on-chip SRAM/FIFO from NV_vi.u_NV_VIFALCON_falcon.imem 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR0: 1'b1 -> Force Assertion of Latent Error Reporting for Register Parity Error from NV_VI_err_collator 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- VI_EC_ERRSLICE0_LATENTERR_STATUS_0

- Video Input Registers
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0xc12
- Byte Offset: 0x3048
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR31: 1'b1 -> Error_31_pulse[1:0] for Parity Error on internal data path from
- FAULT_UDF_TAG_VI_CHANSEL_DATA_PARITY_ERR was equal to 2'b00 or

