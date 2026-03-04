# 15 :0 0x0 WORD_CNT_HIGH_TRIO1_B:

- The trio B1 high 16 bits of the compared word number number when
detect the expected error number, report for BIST mode 0.
- NVCSI_PHY_3_NVCSI_CIL_B_CPHY_BIST_STATUS_6_0
- Offset: 0x1079e
- Byte Offset: 0x41e78
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,x000,0000,0000,xxxx,x000,0000,0000)
- Bit
- Reset
- Description
0x0 ERR_DETECT_FAIL_TRIO1_B:
- Multi symbol error in one word (7 symbol) for trio B1, BIST logic is not able
to detect the accurate wire state error. With this error, if not other errors detected, the word error is accurate. 0x0 SHIFT_DETECT_FAIL_TRIO1_B:
- Detect symbol error in two continuous word (14 symbols) for trio B1, BIST
logic is not able to determine if symbol clock is slip. (if the symbol error count is not saturating, the result is still available with this error) 0x0 SHIFT_OVERFLOW_TRIO1_B: Too many clocks slip and the BIST logic is not able to re-align for trio B1. Typically, when this error is detect, the symbol error counter will saturate. 23:20 0x0 DOUBLE_CLK_MISSED_CNT_TRIO1_B: Number of the times for double symbol clock lost for trio B1. 19:16 0x0 SINGLE_CLK_MISSED_CNT_TRIO1_B: Number of the times for single symbol clock lost for trio B1. 0x0 ERR_DETECT_FAIL_TRIO0_B:
- Multi symbol error in one word (7 symbol) for trio B0, BIST logic is not able
to detect the accurate wire state error. With this error, if not other errors detected, the word error is accurate. 0x0 SHIFT_DETECT_FAIL_TRIO0_B:
- Detect symbol error in two continuous word (14 symbols) for trio B0, BIST
logic is not able to determine if symbol clock is slip. (if the symbol error count is not saturating, the result is still available with this error) 0x0 SHIFT_OVERFLOW_TRIO0_B: Too many clocks slip and the BIST logic is not able to re-align for trio B0. Typically, when this error is detect, the symbol error counter will saturate.

- NVCSI PHY Registers
- Bit
- Reset
- Description

