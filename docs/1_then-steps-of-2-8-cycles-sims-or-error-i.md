# 1 then steps of 2^8 cycles (sims or error inject) 19:4

- RW
Y 0x0 FEMAXTIME:
- Insert a frame end after a frame start when
- FE_MAX_TIME*2^20 clock cycles have
elapsed, off if 0 3:0
- RW
Y 0x0 WT:
- The weight of stream into arbiter
- VI_CSIMUX_CONFIG_STREAM_VC_HI_0
This is an array of six identical register entries; the register fields below apply to each entry. Full register list is: VI_CSIMUX_CONFIG_STREAM_VC_HI_<i>, among which <i> belongs to <0..5>.
- Offset: 0x110f,..,0x1114
- Byte Offset: 0x443c,..,0x4450
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00fff000 (0bxxxx,xxxx,1111,1111,1111,0000,0000,0000)
- Bit
- Reset
- Description

