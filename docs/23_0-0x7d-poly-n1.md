# 23 :0 0x7d POLY_N1:

- The first splitting points for the three segments
- POLY_N1, POLY_N2 and DURATION programming should meet
- POLY_N1 <= POLY_N2 <=DURATION
For two segments case: POLY_N2 == DURATION.
- Programming coefficients for the first two segments: p1_0/1/2 and
p2_0/1/2 For one segment case: POLY_N1 == POLY_N2 == DURATION.
- Programming coefficients for the first segment: p1_0/1/2
- If SW program this register, must be followed by DURATION_SWITCH
trigger to let Hardware know new duration parameters ready. Hardware will take the new poly_n1 parameter after finishing current frame Note: POLY_N1 cannot be changed without DURATION changing.
- MVC_POLY_N2_0
- Offset: 0xfc
- Read/Write: RW
- Parity Protection: N
- Reset: 0x00000271 (0bxxxx,xxxx,0000,0000,0000,0010,0111,0001)

- Master Volume Control (MVC) Registers
- Bit
- Reset
- Description

