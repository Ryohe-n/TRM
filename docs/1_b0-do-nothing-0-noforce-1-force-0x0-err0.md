# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR0: 1'b1 -> Force Assertion of Latent Error Reporting for Register Parity Error from NV_FABRIC_XCE_FABRIC_ERR_COLLATOR_err_collator 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- RCE_FABRIC_ERR_COLLATOR_ERRSLICE0_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0x20048
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR31: 1'b1 -> Error_31_pulse[1:0] for Comparator Error from NV_xce_mncbb_i_wrapper was equal to 2'b00 or 2'b11. 1'b0 -> Error_31_pulse[1:0] for Comparator Error from NV_xce_mncbb_i_wrapper was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR30: 1'b1 -> Error_30_pulse[1:0] for Comparator Error from NV_xce_firewall_wrapper was equal to 2'b00 or 2'b11. 1'b0 -> Error_30_pulse[1:0] for Comparator Error from NV_xce_firewall_wrapper was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR29: 1'b1 -> Error_29_pulse[1:0] for Other Uncorrected Error from NV_xce_dmaapb_1_wrapper.TCC was equal to 2'b00 or 2'b11. 1'b0 -> Error_29_pulse[1:0] for Other Uncorrected Error from
- NV_xce_dmaapb_1_wrapper.TCC was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR28: 1'b1 -> Error_28_pulse[1:0] for Parity Error on internal data path from NV_xce_dmaapb_1_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_28_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR27: 1'b1 -> Error_27_pulse[1:0] for Parity Error on internal data path from NV_xce_dmaapb_1_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_27_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR26: 1'b1 -> Error_26_pulse[1:0] for Parity Error on internal data path from NV_xce_dmaapb_1_wrapper.CHANNEL_B was equal to 2'b00 or 2'b11. 1'b0 -> Error_26_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_B was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR25: 1'b1 -> Error_25_pulse[1:0] for Parity Error on internal data path from NV_xce_dmaapb_1_wrapper.CHANNEL_AW was equal to 2'b00 or 2'b11. 1'b0 -> Error_25_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_AW was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR24: 1'b1 -> Error_24_pulse[1:0] for Parity Error on internal data path from NV_xce_dmaapb_1_wrapper.CHANNEL_AR was equal to 2'b00 or 2'b11. 1'b0 -> Error_24_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_AR was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR23: 1'b1 -> Error_23_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_APB_RESPONSE was equal to 2'b00
or 2'b11. 1'b0 -> Error_23_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_APB_RESPONSE was equal to 2'b01
or 2'b10, but no latent error.

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR22: 1'b1 -> Error_22_pulse[1:0] for Parity Error on internal data path from
- NV_xce_dmaapb_1_wrapper.CHANNEL_APB_REQUEST was equal to 2'b00 or

