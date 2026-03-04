# 12 :0 0x0 PACKETS:

- Number of packets to skip on output at start of line, counted in
groups of 8 pixels
- VI_CH35_CROP_X_0
Last pixel position on line before following pixels of line are dropped, pixels positions are numbered from 1.
- Ensure that 1. (NV_VI_PPC=8)*SKIP_X_PACKETS < CROP_X_WIDTH
2. (NV_VI_PPC=8)*SKIP_X_PACKETS < FRAME_X_WIDTH
- It is not necessary that CROP_X_WIDTH <= FRAME_X_WIDTH, if CROP_X_WIDTH >=
- FRAME_X_WIDTH then no right crop. Ensure CROP_X_WIDTH % 8 == 0 when DPCM is in use. If 0
means 2^16 = 65536, or no cropping on right edge.
- Offset: 0x6314
- Byte Offset: 0x18c50
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description

