# 23 :20 0x0 DOUBLE_CLK_MISSED_CNT_TRIO1_A: Number of the times for double symbol clock lost for trio A1. 19:16 0x0 SINGLE_CLK_MISSED_CNT_TRIO1_A: Number of the times for single symbol clock lost for trio A1. 0x0 ERR_DETECT_FAIL_TRIO0_A:

- Multi symbol error in one word (7 symbol) for trio A0, BIST logic is not able
to detect the accurate wire state error. With this error, if not other errors detected, the word error is accurate. 0x0 SHIFT_DETECT_FAIL_TRIO0_A:
- Detect symbol error in two continuous word (14 symbols) for trio A0, BIST
logic is not able to determine if symbol clock is slip. (if the symbol error count is not saturating, the result is still available with this error) 0x0 SHIFT_OVERFLOW_TRIO0_A: Too many clocks slip and the BIST logic is not able to re-align for trio A0. Typically, when this error is detect, the symbol error counter will saturate. 7:4 0x0 DOUBLE_CLK_MISSED_CNT_TRIO0_A: Number of the times for double symbol clock lost for trio A0. 3:0 0x0 SINGLE_CLK_MISSED_CNT_TRIO0_A: Number of the times for single symbol clock lost for trio A0.
- NVCSI_PHY_2_NVCSI_CIL_B_SW_RESET_0
- Offset: 0xc75f
- Byte Offset: 0x31d7c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 SW_RESET1_B:
- SOFT RESET FOR LANE B1. Active High

