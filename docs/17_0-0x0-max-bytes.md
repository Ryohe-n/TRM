# 17 :0 0x0 MAX_BYTES:

- Maximum number of embedded data bytes on a line
- VI_CH35_EMBED_Y_0
- Applies when DTYPE==CSI_DT_GED_ED
Embedded lines configuration -- the EXPECTED field will not block embedded data. it is used for reporting an error when embedded data is present but not expected. if there is no embedded data on particular frame and the expect field is true then no error is reported.
- Offset: 0x6310
- Byte Offset: 0x18c40
- Read/Write: R/W
- Parity Protection: Y
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xx00,xxxx,xxxx,0000,0000,0000,0000)

- Video Input Channels 21-35 Registers
- Bit
- Reset
- Description
0x0 ENABLE:
- Whether embedded data should be processed (i.e., if set, embedded data
is transmitted downstream). Note that EXPECT and ENABLE are handled independently. 0x0 EXPECT: Embedded data expected within channel. 15:0 0x0 LINES:
- If EXPECTED=1: Number of embedded lines in frame, where 0x0 implies

