# 3 :0 0x0 PERF_OUT_2:

- FW read/write register that feeds as input to Perfmux. bit_0 for
channel_32, bit3 for channel_35. which can be routed to HWPM for calculating throughput, fps, overheads.
- VI_CHANSEL_STATUS_NOMATCH_0
Register to indicate CHANSEL status for debug purpose. Disable PROD chk as SW driver will set the right values.
- Offset: 0x1060
- Byte Offset: 0x4180
- Read/Write: See table below

- Video Input Registers
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
R/W
- Reset
- Description

