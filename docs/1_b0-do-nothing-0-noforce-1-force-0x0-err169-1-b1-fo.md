# 1 'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR169: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_WVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR168: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_WREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE


- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR167: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_W 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR166: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_RVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR165: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_RREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR164: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_R 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR163: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_BVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR162: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_BREADY 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR161: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_B 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR160: 1'b1 -> Force Assertion of Latent Error Reporting for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_AWVALID 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE

- RCE Fabric Registers
- RCE_FABRIC_ERR_COLLATOR_ERRSLICE5_LATENTERR_STATUS_0
SW must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0x20138
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR191: 1'b1 -> Error_191_pulse[1:0] for Parity Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_191_pulse[1:0] for Parity Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR190: 1'b1 -> Error_190_pulse[1:0] for Parity Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_190_pulse[1:0] for Parity Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR189: 1'b1 -> Error_189_pulse[1:0] for Parity Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_B was equal to 2'b00 or 2'b11. 1'b0 -> Error_189_pulse[1:0] for Parity Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_B was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR188: 1'b1 -> Error_188_pulse[1:0] for Parity Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_AW was equal to 2'b00 or 2'b11. 1'b0 -> Error_188_pulse[1:0] for Parity Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_AW was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR187: 1'b1 -> Error_187_pulse[1:0] for Parity Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_AR was equal to 2'b00 or 2'b11. 1'b0 -> Error_187_pulse[1:0] for Parity Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_AR was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR186: 1'b1 -> Error_186_pulse[1:0] for ECC SEC Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_186_pulse[1:0] for ECC SEC Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error.

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR185: 1'b1 -> Error_185_pulse[1:0] for ECC SEC Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_185_pulse[1:0] for ECC SEC Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR184: 1'b1 -> Error_184_pulse[1:0] for ECC DED Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_184_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR183: 1'b1 -> Error_183_pulse[1:0] for ECC DED Error on internal data path from NV_xce_snast0_t_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_183_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_snast0_t_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR182: 1'b1 -> Error_182_pulse[1:0] for Comparator Error from NV_xce_snast0_t_wrapper was equal to 2'b00 or 2'b11. 1'b0 -> Error_182_pulse[1:0] for Comparator Error from NV_xce_snast0_t_wrapper was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR181: 1'b1 -> Error_181_pulse[1:0] for Other Uncorrected Error from NV_xce_sncbb_t_wrapper.TCC was equal to 2'b00 or 2'b11. 1'b0 -> Error_181_pulse[1:0] for Other Uncorrected Error from
- NV_xce_sncbb_t_wrapper.TCC was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR180: 1'b1 -> Error_180_pulse[1:0] for Parity Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_180_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR179: 1'b1 -> Error_179_pulse[1:0] for Parity Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_179_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR178: 1'b1 -> Error_178_pulse[1:0] for Parity Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_B was equal to 2'b00 or 2'b11. 1'b0 -> Error_178_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_B was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR177: 1'b1 -> Error_177_pulse[1:0] for Parity Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_AW was equal to 2'b00 or 2'b11. 1'b0 -> Error_177_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_AW was equal to 2'b01 or 2'b10, but no
latent error.

- RCE Fabric Registers
- Bit
- Reset
- Description
0x0 ERR176: 1'b1 -> Error_176_pulse[1:0] for Parity Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_AR was equal to 2'b00 or 2'b11. 1'b0 -> Error_176_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_AR was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR175: 1'b1 -> Error_175_pulse[1:0] for ECC SEC Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_175_pulse[1:0] for ECC SEC Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR174: 1'b1 -> Error_174_pulse[1:0] for ECC SEC Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_174_pulse[1:0] for ECC SEC Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR173: 1'b1 -> Error_173_pulse[1:0] for ECC DED Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_W was equal to 2'b00 or 2'b11. 1'b0 -> Error_173_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_W was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR172: 1'b1 -> Error_172_pulse[1:0] for ECC DED Error on internal data path from NV_xce_sncbb_t_wrapper.CHANNEL_R was equal to 2'b00 or 2'b11. 1'b0 -> Error_172_pulse[1:0] for ECC DED Error on internal data path from
- NV_xce_sncbb_t_wrapper.CHANNEL_R was equal to 2'b01 or 2'b10, but no
latent error. 0x0 ERR171: 1'b1 -> Error_171_pulse[1:0] for Comparator Error from NV_xce_sncbb_t_wrapper was equal to 2'b00 or 2'b11. 1'b0 -> Error_171_pulse[1:0] for Comparator Error from NV_xce_sncbb_t_wrapper was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR170: 1'b1 -> Error_170_pulse[1:0] for Other Uncorrected Error from NV_xce_sncpu_t_wrapper.TCC was equal to 2'b00 or 2'b11. 1'b0 -> Error_170_pulse[1:0] for Other Uncorrected Error from
- NV_xce_sncpu_t_wrapper.TCC was equal to 2'b01 or 2'b10, but no latent
error. 0x0 ERR169: 1'b1 -> Error_169_pulse[1:0] for Parity Error on internal data path from NV_xce_sncpu_t_wrapper.CHANNEL_r5_WVALID was equal to 2'b00 or 2'b11. 1'b0 -> Error_169_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncpu_t_wrapper.CHANNEL_r5_WVALID was equal to 2'b01 or 2'b10,
but no latent error. 0x0 ERR168: 1'b1 -> Error_168_pulse[1:0] for Parity Error on internal data path from
- NV_xce_sncpu_t_wrapper.CHANNEL_r5_WREADY was equal to 2'b00 or

