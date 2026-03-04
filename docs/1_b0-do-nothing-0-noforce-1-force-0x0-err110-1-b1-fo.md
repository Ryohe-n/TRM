# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR110: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_WVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR109: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_WREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR108: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_W 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE


- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR107: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_RVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR106: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_RREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR105: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_R 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR104: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_BVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR103: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_BREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR102: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_B 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR101: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_AWVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR100: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_AWUSER 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR99: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_AWREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR98: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_AWCTL 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR97: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_AWADDR 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR96: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_ARVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE
- RCE_FABRIC_ERR_COLLATOR_ERRSLICE3_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0x200d8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR127: 1'b1 -> Error_127_pulse[1:0] for ECC DED Error on internal data path from NV_xce_mndma_m_i_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_127_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_mndma_m_i_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but
no latent error.

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR126: 1'b1 -> Error_126_pulse[1:0] for ECC DED Error on internal data path from NV_xce_mndma_m_i_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_126_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_mndma_m_i_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR125: 1'b1 -> Error_125_pulse[1:0] for Comparator Error from NV_xce_mndma_m_i_wrapper was equal to 2'b00 or 2'b11. 1'b0 -> Error_125_pulse[1:0] for Comparator Error from
- NV_xce_mndma_m_i_wrapper was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR124: 1'b1 -> Error_124_pulse[1:0] for Other Uncorrected Error from NV_xce_mndma_p_i_wrapper.MASTER_TIMEOUT was equal to 2'b00 or 2'b11. 1'b0 -> Error_124_pulse[1:0] for Other Uncorrected Error from
- NV_xce_mndma_p_i_wrapper.MASTER_TIMEOUT was equal to 2'b01 or 2'b10,
but no latent error. 0x0 ERR123: 1'b1 -> Error_123_pulse[1:0] for Other Uncorrected Error from NV_xce_mndma_p_i_wrapper.TCC was equal to 2'b00 or 2'b11. 1'b0 -> Error_123_pulse[1:0] for Other Uncorrected Error from
- NV_xce_mndma_p_i_wrapper.TCC was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR122: 1'b1 -> Error_122_pulse[1:0] for Parity Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_122_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR121: 1'b1 -> Error_121_pulse[1:0] for Parity Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_121_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR120: 1'b1 -> Error_120_pulse[1:0] for Parity Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_B was equal to 2'b00 or 2'b11. 1'b0 -> Error_120_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_B was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR119: 1'b1 -> Error_119_pulse[1:0] for Parity Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_AW was equal to 2'b00 or 2'b11. 1'b0 -> Error_119_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_AW was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR118: 1'b1 -> Error_118_pulse[1:0] for Parity Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_AR was equal to 2'b00 or 2'b11. 1'b0 -> Error_118_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_AR was equal to 2'b01 or 2'b10, but
no latent error.

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR117: 1'b1 -> Error_117_pulse[1:0] for ECC SEC Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_117_pulse[1:0] for ECC SEC Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR116: 1'b1 -> Error_116_pulse[1:0] for ECC SEC Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_116_pulse[1:0] for ECC SEC Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR115: 1'b1 -> Error_115_pulse[1:0] for ECC DED Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_115_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR114: 1'b1 -> Error_114_pulse[1:0] for ECC DED Error on internal data path from NV_xce_mndma_p_i_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_114_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_mndma_p_i_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but
no latent error. 0x0 ERR113: 1'b1 -> Error_113_pulse[1:0] for Comparator Error from NV_xce_mndma_p_i_wrapper was equal to 2'b00 or 2'b11. 1'b0 -> Error_113_pulse[1:0] for Comparator Error from NV_xce_mndma_p_i_wrapper was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR112: 1'b1 -> Error_112_pulse[1:0] for Other Uncorrected Error from NV_xce_mncpu_m_i_wrapper.MASTER_TIMEOUT was equal to 2'b00 or 2'b11. 1'b0 -> Error_112_pulse[1:0] for Other Uncorrected Error from
- NV_xce_mncpu_m_i_wrapper.MASTER_TIMEOUT was equal to 2'b01 or 2'b10,
but no latent error. 0x0 ERR111: 1'b1 -> Error_111_pulse[1:0] for Other Uncorrected Error from NV_xce_mncpu_m_i_wrapper.TCC was equal to 2'b00 or 2'b11. 1'b0 -> Error_111_pulse[1:0] for Other Uncorrected Error from
- NV_xce_mncpu_m_i_wrapper.TCC was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR110: 1'b1 -> Error_110_pulse[1:0] for Parity Error on internal data path from
- NV_xce_mncpu_m_i_wrapper.CHANNEL_r5_WVALID was equal to 2'b00 or

