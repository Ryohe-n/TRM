# 31 :16 0x0 THRESHOLD:

- Only apply the fast convergence algorithm if the current magnitude of
the difference exceeds the threshold. 15:8 0x0 K_INT:
- Integer part of the factor used to calculate the delta to apply to NUM
when the fast convergence algorithm is enabled. 5:4 0x0 M:
- Number of right shift used in conjunction with K_INT
0x0 FAST_ENABLE:
- Enable the fast convergence algorithm, subject to ENABLE being 1
- TSC_LOCKING_ADJUST_NUM_CONTROL_0
- Offset: 0x214
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: TSC_SCR_TSCSCR_0
- Reset: 0x00000000 (0b0xxx,xxxx,xx00,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 TRANSFER_TO_HW:
- When TRANSFER_TO_HW is 1b, the initial values are loaded in the
underlying hardware logic.
- If a software controlled loop is implemented, TRANSFER_TO_HW can be
kept at 1 and the other field modified based on the software based locking algorithm.

- Time Stamp Counter Registers
- Bit
- Reset
- Description

