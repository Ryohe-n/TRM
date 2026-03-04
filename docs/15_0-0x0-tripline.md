# 15 :0 0x0 TRIPLINE:

- Pixel line count at which a notification is sent out, 0x0 implies 2^16
- VI_CH15_SKIP_X_0
- Image cropping registers (cropping does not apply to embedded data)
Number of 8 pixel packets to SKIP or drop at start of line, 0 means no packets dropped at start of line.
- Ensure that 1. (NV_VI_PPC=8)*SKIP_X_PACKETS < CROP_X_WIDTH
2. (NV_VI_PPC=8)*SKIP_X_PACKETS < FRAME_X_WIDTH
- It is not necessary that CROP_X_WIDTH <= FRAME_X_WIDTH, if CROP_X_WIDTH >=
FRAME_X_WIDTH then no right crop. For 4 PPC mode this still represents 8 pixels (i.e. 2 physical packets on the internal VI pixel bus).
- Offset: 0x4f13
- Byte Offset: 0x13c4c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxx0,0000,0000,0000)
- Bit
- Reset
- Description

