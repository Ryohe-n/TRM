# 1 'b0 -> Do Nothing 0 = NORELOAD 1 = RELOAD 0x28 to 0x30 = Reserved for future use.

- RCE_FABRIC_ERR_COLLATOR_ERRSLICE3_MISSIONERR_ENABLE_0
- ERROR SLICE - 3
- Offset: 0x200c0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0xffffffff (0b1111,1111,1111,1111,1111,1111,1111,1111)

- RCE Fabric Registers
- Bit
- Reset
- Description
0x1 ERR127: 1'b1 -> Enable Mission Error Reporting for ECC DED Error on internal data path from NV_xce_mndma_m_i_wrapper.CHANNEL_W 1'b0 -> Disable Mission Error Reporting for ECC DED Error on internal data path from NV_xce_mndma_m_i_wrapper.CHANNEL_W 0 = DISABLE 1 = ENABLE 0x1 ERR126: 1'b1 -> Enable Mission Error Reporting for ECC DED Error on internal data path from NV_xce_mndma_m_i_wrapper.CHANNEL_R 1'b0 -> Disable Mission Error Reporting for ECC DED Error on internal data path from NV_xce_mndma_m_i_wrapper.CHANNEL_R 0 = DISABLE 1 = ENABLE 0x1 ERR125: 1'b1 -> Enable Mission Error Reporting for Comparator Error from
- NV_xce_mndma_m_i_wrapper

