# 1 DDR50 is Supported 0 DDR50 is Not Supported

- SDR104 Support
SDR104 requires tuning. 1 SDR104 is Supported 0 SDR104 is Not Supported
- SDR50 Support
- If SDR104 is supported, this bit shall be set to 1. Bit 40 indicates whether
SDR50 requires tuning or not. 1 SDR50 is Supported 0 SDR50 is Not Supported
- Offset: 0x44
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x18002f73 (0bxxx1,1xxx,0000,0000,001x,1111,x111,0011)

- SDMMCA Registers
- Bit
- Reset
- Description
0x1 VDD2_1_8V_SUPPORT: 0 = NOT_SUPPORTED 1 = SUPPORTED 0x1 ADMA3_SUPPORT: 0 = NOT_SUPPORTED 1 = SUPPORTED 23:16 0x0
- CLOCK_MULTIPLIER

