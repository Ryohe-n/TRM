# 1 , the EQOS-AXI master can select a burst length of 16 on the AXI interface. When the FB bit is set to 0, setting this bit has no effect.

- RW
0x0 BLEN8:
- AXI Burst Length 8 When this bit is set to 1 or the FB bit is set to 1,
the EQOS-AXI master can select a burst length of 8 on the AXI interface. When the FB bit is set to 0, setting this bit has no effect.
- RW
0x0 BLEN4:
- AXI Burst Length 4 When this bit is set to 1 or the FB bit is set to 1,
the EQOS-AXI master can select a burst length of 4 on the AXI interface. When the FB bit is set to 0, setting this bit has no effect.
- RW
0x0 FB:
- Fixed Burst Length - 1: the EQOS-AXI master initiates burst
transfers of specified lengths: -- Burst transfers of fixed burst lengths as indicated by the BLEN256, BLEN128, BLEN64, BLEN32, BLEN16, BLEN8, or BLEN4 field -- Burst transfers of length 1 - 0:
- EQOS-AXI master initiates burst transfers that are equal to or less
than the maximum allowed burst length programmed in Bits[7:4].
- EQOS_EQOS_DMA_DMA_INTERRUPT_STATUS_0
The application reads this Interrupt Status register during interrupt service routine or polling to determine the interrupt status of DMA channels, MTL queues, and the MAC.
- Offset: 0x1008
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

