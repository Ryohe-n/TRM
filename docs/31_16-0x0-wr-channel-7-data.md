# 31 :16 0x0 WR_CHANNEL_7_DATA:

- The DMA uses this field to generate the data field for the Done or Abort
- IMWr TLPs it generates for write channel 7. Note: The access attributes of
this field are as follows: - Wire: No access. - Dbi: R/W 15:0 0x0 WR_CHANNEL_6_DATA:
- The DMA uses this field to generate the data field for the Done or Abort
- IMWr TLPs it generates for write channel 6. Note: The access attributes of
this field are as follows: - Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_WRITE_LINKED_LIST_ERR_EN_OFF_0
Description: The LIE and RIE bits in the LL element enable the channel "done" interrupts (local and remote). The LLLAIE and LLRAIE bits enable the channel "abort" interrupts (local and remote).
- Offset: 0x20090
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe iATU
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,xxxx,0000,0000,0000,xxxx,0000)
- Bit
R/W
- Reset
- Description

