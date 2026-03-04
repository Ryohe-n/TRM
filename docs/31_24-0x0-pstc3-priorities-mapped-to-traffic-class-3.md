# 31 :24 0x0 PSTC3: Priorities Mapped to Traffic Class 3. This field is similar to the PSTC0. 23:16 0x0 PSTC2: Priorities Mapped to Traffic Class 2. This field is similar to the PSTC0. 15:8 0x0 PSTC1: Priorities Mapped to Traffic Class 1. This field is similar to the PSTC0. 7:0 0x0 PSTC0:

- Priorities Mapped to Traffic Class 0. This field holds the priorities assigned to
traffic class 0, programmed by the application. This field determines if the transmit queues associated with the traffic class 0 should be blocked from transmitting for the specified pause time when a PFC packet is received with priorities matching the priorities programmed in this field. Each bit corresponds to a priority. For example, PSTC0[7] corresponds to priority 7 and so on. If the content of this field is not mutually exclusive to the corresponding fields of other traffic classes, that is, if the same priority is mapped to multiple traffic classes, DWC_xgmac blocks all queues with matching priority for a specified time.
- MGBE_DWCXG_MTL_MTL_TC_PRTY_MAP1_0
This register contains the priority values assigned to traffic classes 4 to 7.
- Offset: 0x1044
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

