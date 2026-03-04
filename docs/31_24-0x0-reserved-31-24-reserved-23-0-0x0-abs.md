# 31 :24 0x0 Reserved_31_24: Reserved. 23:0 0x0 ABS:

- Average Bits per Slot. This field contains the average transmitted bits per
slot computed over every slot of 10 million bit times (1ms in 10G mode, 10ms in 1G mode). The maximum value is 0x989680.
- MGBE_DWCXG_MTL_TCQ7_MTL_TC7_QUANTUM_WEIGHT_0
The TC1 Quantum or Weights register provides the average traffic transmitted in Traffic Class 1. For TCn, where n = 1 to 7, this register is not available when the number of traffic classes selected is less than n + 1 This register is not available in corresponding Queues 8-15 registers.

10G Ethernet Controller Core Registers cont'd 2
- Offset: 0x1498
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

