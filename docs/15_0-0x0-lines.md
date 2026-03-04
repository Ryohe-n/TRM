# 15 :0 0x0 LINES:

- Number of lines to skip at top of the frame
- VI_CH35_CROP_Y_0
Last line position before following lines are dropped, line are numbered from 1.
- Ensure that 1. SKIP_Y_LINES < CROP_Y_HEIGHT
2. SKIP_Y_LINES < FRAME_Y_HEIGHT
- It is not necessary that CROP_Y_HEIGHT <= FRAME_Y_HEIGHT, if CROP_Y_HEIGHT >=
FRAME_Y_HEIGHT then no bottom crop. 0 means 2^16 = 65536, or no cropping on bottom edge.
- Offset: 0x6316
- Byte Offset: 0x18c58
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)

- Video Input Channels 21-35 Registers
- Bit
- Reset
- Description

