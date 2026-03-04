# 31 :8 0x0 Reserved_31_8: Reserved. 7:4 0x0 TPS7:

- DMA Channel 7 Transmit Process State This field indicates the Tx DMA
- FSM state for Channel 7. The MSB of this field always returns 0. This field
does not generate an interrupt. 3:0 0x0 RPS7:
- DMA Channel 7 Receive Process State This field indicates the Rx DMA FSM
state for Channel 7. The MSB of this field always returns 0. This field does not generate an interrupt.
- EQOS_EQOS_DMA_AXI4_TX_AR_ACE_CONTROL_0
This register is used to control the AXI4 Cache Coherency Signals for read transactions by all the Transmit DMA channels. The following signals of the AXI4 interface are driven with different values as programmed for corresponding type (descriptor, buffer1, buffer2) of access. - arcache_m_o[3:0]
- ardomain_m_o[1:0]).
- Offset: 0x1020
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

