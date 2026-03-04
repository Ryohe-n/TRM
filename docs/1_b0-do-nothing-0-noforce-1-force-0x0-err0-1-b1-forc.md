# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR0: 1'b1 -> Force Assertion of Latent Error Reporting for Register Parity Error from NV_MGBE_err_collator 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- MGBE_WRAP_ERRCOLLATOR_ERRSLICE0_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register.

10G Ethernet Controller Wrapper Registers Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0xf048
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000,0000)
- Bit
- Reset
- Description
0x0 ERR6: 1'b1 -> Error_6_pulse[1:0] for Other Uncorrected Error from DWC_xpcs_uncorrected_err was equal to 2'b00 or 2'b11. 1'b0 -> Error_6_pulse[1:0] for Other Uncorrected Error from DWC_xpcs_uncorrected_err was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR5: 1'b1 -> Error_5_pulse[1:0] for Other Corrected Error from DWC_xpcs_corrected err was equal to 2'b00 or 2'b11. 1'b0 -> Error_5_pulse[1:0] for Other Corrected Error from DWC_xpcs_corrected err was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR4: 1'b1 -> Error_4_pulse[1:0] for Other Uncorrected Error from DWC_xgmac_uncorrected_err was equal to 2'b00 or 2'b11. 1'b0 -> Error_4_pulse[1:0] for Other Uncorrected Error from
- DWC_xgmac_uncorrected_err was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR3: 1'b1 -> Error_3_pulse[1:0] for Other Corrected Error from DWC_xgmac_corrected err was equal to 2'b00 or 2'b11. 1'b0 -> Error_3_pulse[1:0] for Other Corrected Error from DWC_xgmac_corrected err was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR2: 1'b1 -> Error_2_pulse[1:0] for Register Parity Error from
- NV_MGBE_PCS_WRAPPER_VIRTUAL_APB_arreggen was equal to 2'b00 or

