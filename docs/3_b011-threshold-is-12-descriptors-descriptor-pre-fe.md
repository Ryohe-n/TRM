# 3 'b011: Threshold is 12 descriptors. Descriptor pre-fetch is triggered when 12 descriptors are left in the cache. - 3'b100: Threshold is 16 descriptors. Descriptor pre-fetch is triggered when 16 descriptors are left in the cache.

- 3'b101: Threshold is 24 descriptors. Descriptor pre-fetch is triggered
when 24 descriptors are left in the cache. - 3'b110-3'b111: Reserved.
- Note1: Bit 2 is reserved and RO when "Maximum Outstanding Write Burst
- Requests for each Rx DMA Channel" is less than or equal to 8, that is RDPS
value of 100 and 101 is not valid. Note2: When "Maximum Outstanding
- Write Burst Requests for each Rx DMA Channel" selected is 32 or 64, the
above encoding represent Descriptor pre-fetch is triggered when 2 times or 4 times the number of descriptors left in the cache. For example, when "Maximum Outstanding Write Burst Requests for each Rx DMA Channel" is 32 value of 3'b101 specifies that descriptor pre-fetch is triggered when 48 (=2*24) descriptors are left in the cache.

10G Ethernet Controller Core Registers cont'd 2
- MGBE_DWCXG_DMA_AXI_LPI_ENTRY_INTERVAL_0
This register is used to control the AXI LPI entry interval.
- Offset: 0x3050
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

