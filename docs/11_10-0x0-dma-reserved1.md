# 11 :10 0x0 DMA_RESERVED1:

- Reserved. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: R/W 0x0 LLE:
- Linked List Enable (LLE). Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R/W 0x0 CCS:
- Consumer Cycle State (CCS). Used in linked list mode only. It is used to
synchronize the producer (software) and the consumer (DMA). For more details, see "PCS-CCS-CB-TCB Producer-Consumer Synchronization". You must initialize this bit. The DMA updates this bit during linked list operation. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W 0x0 DMA_RESERVED0:
- Reserved. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: R/W 6:5 0x0 CS:
- Channel Status (CS). The channel status bits identify the current operational
state of the DMA channel. The operation state encoding for each DMA channel is a s follows: 0x0 RIE:
- Remote Interrupt Enable (RIE). You must set this bit to enable the generation
of the Done or Abort Remote interrupts. For more details, see "Interrupts and
- Error Handling". In LL mode, the DMA overwrites this with the RIE of the LL
element. The RIE bit in a LL element only enables the Done interrupt. In non-
- LL mode, the RIE bit enables the Done and Abort interrupts. This field is not
defined in a link LL element. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W 0x0 LIE:
- Local Interrupt Enable (LIE). You must set this bit to enable the generation of
the Done or Abort Local interrupts. For more details, see "Interrupts and Error Handling". In LL mode, the DMA overwrites this with the LIE of the LL element.
- The LIE bit in a LL element only enables the Done interrupt. In non-LL mode,
the LIE bit enables the Done and Abort interrupts. This field is not defined in a link LL element. Note: The access attributes of this field are as follows: - Wire:
- No access. - Dbi: R/W
0x0 LLP:
- Load Link Pointer (LLP). Used in linked list mode only. Indicates that this linked
list element is a link element, and its LL element pointer dwords are pointing to the next (non-contiguous) element. The DMA loads this field with the LLP of the linked list element. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W 0x0 TCB:
- Toggle Cycle Bit (TCB). Indicates to the DMA to toggle its interpretation of the
- CB. Used in linked list mode only. It is used to synchronize the producer
(software) and the consumer (DMA). For more details, see "PCS-CCS-CB-TCB
- Producer-Consumer Synchronization". The DMA loads this field with the TCB
of the linked list element. This field is not defined in a data LL element. Note:
- The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W

- PCIe iATU
- Bit
- Reset
- Description
0x0 CB:
- Cycle Bit (CB). Used in linked list mode only. It is used to synchronize the
producer (software) and the consumer (DMA). For more details, see "PCS-
- CCS-CB-TCB Producer-Consumer Synchronization". The DMA loads this field
with the CB of the linked list element. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_TRANSFER_SIZE_OFF_RDCH_1_0
Description: This register holds the DMA read transfer size.
- Offset: 0x20508
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

