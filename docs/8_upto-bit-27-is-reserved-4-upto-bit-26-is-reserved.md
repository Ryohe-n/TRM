# 8 : Upto Bit 27 is Reserved - 4: Upto Bit 26 is Reserved - 2: Upto Bit 25 is Reserved When set to 0, backward compatibility is maintained. 23:16

- RO
0x0 Reserved_23_12: Reserved. 15:0
- RW
0x0 TDRL:
- Transmit Descriptor Ring Length. This field sets the maximum
number of Tx descriptors in the circular descriptor ring. The maximum number of descriptors is limited to 16384 descriptors. - 0 implies ring length of 1 descriptor. - 0xFFFF implies a ring length of 65536 descriptors.
- MGBE_DWCXG_DMA_CH9_DMA_CH9_RX_CONTROL2_0
The Channel9 Rx Control2 register contains programmable control to Outstanding Write requests and the length of the Receive descriptor circular ring.
- Offset: 0x35b4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

