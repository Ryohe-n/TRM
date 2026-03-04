# 15 :8 0xff ERR_THRESHOLD_TRIO1_A:

- The threshold of drop the calibration result between current result and
previous result.
- For dual calibration, check between the two calibration result in the
same trigger.
- For signal calibration, check between the current calibration result and
previous calibration result. 7:0 0xff ERR_THRESHOLD_TRIO0_A:
- The threshold of drop the calibration result between current result and
previous resulti.
- For dual calibration, check between the two calibration result in the
same trigger.
- For signal calibration, check between the current calibration result and
previous calibration result.

- NVCSI PHY Registers
- NVCSI_PHY_3_NVCSI_CIL_A_CPHY_EDGE_DELAY_CALIB_STATUS_0
- Offset: 0x1074a
- Byte Offset: 0x41d28
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000,xxxx)
- Bit
- Reset
- Description
0x0 EDGE_DELAY_MISMATCH_TRIO1_A:
- When the CALIB_APPLY_SELECT_TRIO is 0/1 or dual time calibration is not
enabled, the calibration result difference from the previous latched calibration result is larger than threshold, this time calibration result is not apply to pad.
- When the CALIB_APPLY_SELECT_TRIO is 2, the calibration result difference of
the two times calibration result is larger than threshold, this time calibration result is not apply to pad. 0x0 EDGE_DELAY_MISMATCH_TRIO0_A:
- When the CALIB_APPLY_SELECT_TRIO is 0/1 or dual time calibration is not
enabled, the calibration result difference from the previous latched calibration result is larger than threshold, this time calibration result is not apply to pad.
- When the CALIB_APPLY_SELECT_TRIO is 2, the calibration result difference of
the two times calibration result is larger than threshold, this time calibration result is not apply to pad. 0x0 CALIB_DONE_1_TRIO1_A:
- Maximum trimmer value reached without finding optimal trimmer setting for
the given data rate. 0x0 CALIB_DONE_1_TRIO0_A:
- Maximum trimmer value reached without finding optimal trimmer setting for
the given data rate. 0x0 CALIB_DONE_0_TRIO1_A:
- Maximum trimmer value reached without finding optimal trimmer setting for
the given data rate. 0x0 CALIB_DONE_0_TRIO0_A:
- Maximum trimmer value reached without finding optimal trimmer setting for
the given data rate.
- NVCSI_PHY_3_NVCSI_CIL_A_CPHY_EDGE_DELAY_CTRL_0
- Offset: 0x1074b
- Byte Offset: 0x41d2c
- Read/Write: R/W
- Parity Protection: See table below
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI PHY Registers
- SCR Protection: 0
- Reset: 0x40000000 (0b01xx,x000,0000,0000,xxxx,x000,0000,0000)
- Bit
- Parity Protection
- Reset
- Description

