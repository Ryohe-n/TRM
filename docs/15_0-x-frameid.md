# 15 :0 X FRAMEID:

- Frame ID
- VI_CH35_FRAME_COUNT_0

- Video Input Channels 21-35 Registers
The FS and FE count should match (FS=FE) unless channel in the middle of processing a frame. If in frame then FS=FE+1. FE can be perceived as a checksum check for FS. Write any value to register to clear all counts.
- Offset: 0x631c
- Byte Offset: 0x18c70
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

