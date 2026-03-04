# 31 :19 0x0 Reserved_31_x: Reserved. 18:16 0x0 HBFQ:

- Queue Number of HLBF Captures the binary value of the of the first Queue
(number) experiencing HLBF error (see HLBF field of MTL_EST_status register). Value once written is not altered by any subsequent queue errors of similar nature. Once cleared, the queue number of the next occurring HLBF error is captured. Width is based on the number of Tx Queues configured; remaining bits are Read-Only. Cleared when MTL_EST_Frm_Size_Error register is all zeros. 0x0 Reserved_15: Reserved. 14:0 0x0 HBFS:
- Frame Size of HLBF Captures the Frame Size of the dropped frame of the
queue number indicated in the HBFQ field of this register. Contents of this register should be considered invalid, if this field is zero. Cleared when MTL_EST_Frm_Size_Error register is all zeros.
- MGBE_DWCXG_MTL_MTL_EST_INTR_ENABLE_0
- This register implements the Interrupt Enable bits for the various events that generate an
interrupt. Bit positions have a 1- to-1 correspondence with the status bit positions in MTL_EST_Status register.
- Offset: 0x1070
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers cont'd 1
- Bit
R/W
- Reset
- Description

