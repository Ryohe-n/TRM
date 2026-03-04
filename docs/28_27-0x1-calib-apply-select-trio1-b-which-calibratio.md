# 28 :27 0x1 CALIB_APPLY_SELECT_TRIO1_B: Which calibration result is applied to pad for dual calibration. 2'b11: Reserved 2'b10: Apply the middle value of two calibration to pad if the difference within threshold. 2'b01: Apply the 2nd calibration result to pad if it's difference with previous latch result within threshold. 2'b00: Apply the 1st calibration result to pad if it's difference with previous latch result within threshold. 0x1 DUAL_CALIB_TRIO1_B: Two times calibratiton. 1: Two time calibration with one trigger. 0: Single time calibration with one trigger 25:18 0x3 TEMP_EDGE_DELAY_VALUE_TRIO1_B: The edge delay value while doing the calibration. 0x1 TEMP_EDGE_DELAY_SEL_TRIO1_B: When the selection of edge delay value when do edge delay calibration. 1: Use the temp value from register setting. 0: Use the currently using setting. For the first calibration after reset, it's still using the temp value from register setting. 0x0 BYPASS_CALIB_PACKET_TRIO1_B: 1: Drop the packet data when do the calibration. 0: Not drop the packet data when do the calibration. 0x0 PERIODIC_CALIB_TRIO0_B: Enable the periodic calibration. 0x0 CALIB_APPLY_IN_POST_TRIO0_B: 1: Apply the calibration result when detect post symbol. 0: Apply the calibration result immediately when the calibration done. 12:11 0x1 CALIB_APPLY_SELECT_TRIO0_B: Which calibration result is applied to pad for dual calibration. 2'b11: Reserved 2'b10: Apply the middle value of two calibration to pad if the difference within threshold. 2'b01: Apply the 2nd calibration result to pad if it's difference with previous latch result within threshold. 2'b00: Apply the 1st calibration result to pad if it's difference with previous latch result within threshold. 0x1 DUAL_CALIB_TRIO0_B: Two times calibratiton. 1: Two time calibration with one trigger. 0: Single time calibration with one trigger 9:2 0x3 TEMP_EDGE_DELAY_VALUE_TRIO0_B: The edge delay value apply to pad while doing the calibration. 0x1 TEMP_EDGE_DELAY_SEL_TRIO0_B: When the selection of edge delay value when do edge delay calibration. 1: Use the temp value from register setting. 0: Use the currently using setting. For the first calibration after reset, it's still using the temp value from register setting. 0x0 BYPASS_CALIB_PACKET_TRIO0_B: 1: Drop the packet data when do the calibration. 0: Not drop the packet data when do the calibration.


- NVCSI PHY Registers
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_EDGE_DELAY_CALIB_CTRL2_0
- Offset: 0x10786
- Byte Offset: 0x41e18
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x01000100 (0bxxxx,xxx1,0000,0000,xxxx,xxx1,0000,0000)
- Bit
- Reset
- Description
- ENABLE
TRIM_CAL_PD_HOLD_TRIO1_B:
- Hold in PD

