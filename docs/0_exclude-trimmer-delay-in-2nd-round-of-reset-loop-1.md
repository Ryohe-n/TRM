# 0 : exclude trimmer delay in 2nd round of reset loop. 1: include trimmer delay in 2nd round of reset loop. For low data rate. 8:0 0x1 _NONE_ CALIB_LENGTH_TRIO0_B:

- The length of the peramble which use to do caliration. Count
by nvcsi core clock. It's used to make sure the calibration is doing inside the preamble phase. If this length set to a small value, the calibration may can't complete within one packet and need several packets to complete.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_EDGE_DELAY_CALIB_CTRL1_0
- Offset: 0x10785
- Byte Offset: 0x41e14
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x0c0e0c0e (0bx000,1100,0000,1110,x000,1100,0000,1110)
- Bit
- Reset
- Description
0x0 PERIODIC_CALIB_TRIO1_B: Enable the periodic calibration. 0x0 CALIB_APPLY_IN_POST_TRIO1_B: 1: Apply the calibration result when detect post symbol. 0: Apply the calibration result immediately when the calibration done.

- NVCSI PHY Registers
- Bit
- Reset
- Description

