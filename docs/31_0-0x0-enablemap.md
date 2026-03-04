# 31 :0 0x0 EnableMap:

- Register for Shared interrupt 15, routing control
- TKE_TOP_SHARED_TKEIV_0
==================================================================
- Indicates which shared interrupts are currently asserted
BITMAPPING: 0:0 - Current Status of external interrupt 0 1:1 - Current Status of external interrupt 1 2:2 - Current Status of external interrupt 2 3:3 - Current Status of external interrupt 3 4:4 - Current Status of external interrupt 4 5:5 - Current Status of external interrupt 5 6:6 - Current Status of external interrupt 6 7:7 - Current Status of external interrupt 7 8:8 - Current Status of external interrupt 8 9:9 - Current Status of external interrupt 9 ==================================================================
- Offset: 0x200
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: TKE_TOP_SCR_TKESCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)

- Time Keeping Element: TOP Registers
- Bit
- Reset
- Description

