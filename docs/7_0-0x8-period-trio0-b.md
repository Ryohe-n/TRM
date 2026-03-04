# 7 :0 0x8 PERIOD_TRIO0_B:

- For CPHY, how many cycles allowed for non pre-amble symbol
before sync word.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_EDGE_DELAY_CALIB_START_0
- Offset: 0x10783
- Byte Offset: 0x41e0c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 EDGE_DELAY_CAL_TRIGGER_TRIO1_B:
- Trigger the CPHY clock recover calibration for lane B1 by write 1'b1, when
the calibration complete, HW will clear this bit to 1'b0. Write 1'b0 to this be take no effect. 0x0 EDGE_DELAY_CAL_TRIGGER_TRIO0_B:
- Trigger the CPHY clock recover calibration for lane B0 by write 1'b1, when
the calibration complete, HW will clear this bit to 1'b0. Write 1'b0 to this be take no effect.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_EDGE_DELAY_CALIB_CTRL_0
- Offset: 0x10784
- Byte Offset: 0x41e10
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x12011201 (0b0001,0010,0000,0001,0001,0010,0000,0001)
- PROD: 0x08000800 (0bxxx0,10xx,xxxx,xxxx,xxx0,10xx,xxxx,xxxx)
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ TRIM_CAL_E_NONSTOP_TRIO1_B: Reserved. Trimmer calibration background monitoring control. 1: enable. The accumulator keeps updating.

- NVCSI PHY Registers
- Bit
- Reset
- PROD
- Description

