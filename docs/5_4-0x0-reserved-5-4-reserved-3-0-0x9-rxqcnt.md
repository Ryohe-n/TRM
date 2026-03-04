# 5 :4 0x0 Reserved_5_4: Reserved. 3:0 0x9 RXQCNT:

- Number of MTL Receive Queues. This field indicates the number of MTL
Receive queues: - 4'b0000: 1 MTL Rx Queue - 4'b0001: 2 MTL Rx Queues - ...
- 4'b1011: 12 MTL Rx Queues
- MGBE_DWCXG_CORE_MAC_HW_FEATURE3_0
This register indicates the presence of the fourth set of optional features or functions of
- DWC_xgmac. The software driver can use this register to dynamically enable or disable the
programs related to the optional blocks.
- Offset: 0x128
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x9dbdb5bd (0b1001,1101,1011,1101,1011,0101,1011,1101)

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description

