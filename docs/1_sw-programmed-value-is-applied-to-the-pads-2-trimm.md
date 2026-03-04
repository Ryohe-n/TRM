# 1 - SW programmed value is applied to the pads. 2 - Trimmer value from HW calibration state machine is applied to the pads 5:0 0x0 DPHY_INADJ_IO0_B:

- Programmable value for bit 0 input delay trimmer,
- NVCSI_PHY_3_NVCSI_CIL_B_CLK_DESKEW_CTRL_0
- Offset: 0x1076c
- Byte Offset: 0x41db0
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x0000bf00 (0bxxxx,xxxx,xxxx,xxxx,1x11,1111,xx00,0000)
- Bit
- Reset
- Description
- ENABLE
CLK_INADJ_SWEEP_CTRL_B: Enable the clock trimmer sweep for D-PHY de-skew. 0 = DISABLE 1 = ENABLE 13:8 0x3f CLK_INADJ_LIMIT_HIGH_B: The upper limit of the sweep range for trimmer sweep. 5:0 0x0 CLK_INADJ_LIMIT_LOW_B: The lower limit of the sweep range for trimmer sweep.
- NVCSI_PHY_3_NVCSI_CIL_B_DATA_DESKEW_CTRL_0
- Offset: 0x1076d
- Byte Offset: 0x41db4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N

- NVCSI PHY Registers
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x9f80bf00 (0b1xx1,1111,1x00,0000,1x11,1111,xx00,0000)
- Bit
- Reset
- Description
0x1 DATA_INADJ_SWEEP_CTRL1_B: Enable the data lane B1 trimmer sweep for D-PHY de-skew. 28:23 0x3f DATA_INADJ_LIMIT_HIGH1_B: The upper limit of the sweep range for trimmer sweep. 21:16 0x0 DATA_INADJ_LIMIT_LOW1_B: The lower limit of the sweep range for trimmer sweep. 0x1 DATA_INADJ_SWEEP_CTRL0_B: Enable the data lane B0 trimmer sweep for D-PHY de-skew. 13:8 0x3f DATA_INADJ_LIMIT_HIGH0_B: The upper limit of the sweep range for trimmer sweep. 5:0 0x0 DATA_INADJ_LIMIT_LOW0_B: The lower limit of the sweep range for trimmer sweep.
- NVCSI_PHY_3_NVCSI_CIL_B_DPHY_DESKEW_STATUS_0
- Offset: 0x1076e
- Byte Offset: 0x41db8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x0000X0XX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X DPHY_CALIB_ERR_IO1_B: calib error status X DPHY_CALIB_DONE_IO1_B: calib done status X DPHY_CALIB_ERR_IO0_B: calib error status X DPHY_CALIB_DONE_IO0_B: calib done status X DPHY_CALIB_ERR_CTRL_B: calib error status X DPHY_CALIB_DONE_CTRL_B: calib done status

- NVCSI PHY Registers
- NVCSI_PHY_3_NVCSI_CIL_B_DPHY_DESKEW_DATA_CALIB_STATUS_LOW_0_0
- Offset: 0x1076f
- Byte Offset: 0x41dbc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

