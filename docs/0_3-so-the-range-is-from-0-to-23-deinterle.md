# 0 -3. So the range is from 0 to 23. Deinterleave mode has its own specific register. There is also an in frame status of all registers. When using generated frame IDs: ------------------------------- If FRAMEID==0 and INFRAME==0 then no frame has been seen. If FRAMEID==1 and INFRAME==1 then processing first frame. If FRAMEID==1 and INFRAME==0 then first frame has been processed, waiting for second to start. This is an array of 96 identical register entries; the register fields below apply to each entry. Full register list is: VI_CSIMUX_STAT_FRAME_<i>, among which <i> belongs to <0..95>.

- Offset: 0x1129,..,0x1188
- Byte Offset: 0x44a4,..,0x4620
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000XXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

- Video Input Registers
X
- INFRAME: Determine whether a virtual channel is actively
processing a frame 15:0 X
- FRAMEID: Determine the current or last frame ID seen on
a viritual channel
- VI_CSIMUX_STAT_FRAME_DEINT_0
- Offset: 0x1189
- Byte Offset: 0x4624
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000XXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X
- INFRAME

