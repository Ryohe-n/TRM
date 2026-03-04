# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR75: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_WVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR74: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_WREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR73: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_W 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE


- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR72: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_RVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR71: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_RREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR70: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_R 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR69: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_BVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR68: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_BREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR67: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_B 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR66: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_AWVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR65: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_AWUSER 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR64: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_p_i_wrapper.CHANNEL_r5_AWREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE
- RCE_FABRIC_ERR_COLLATOR_ERRSLICE2_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0x200a8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR95: 1'b1 -> Error_95_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_ARUSER was equal to 2'b00 or

