# 16 :12 0x0 DMA_FUNC_NUM:

- Function Number (FN). The controller uses this field when generating the
requester ID for the MRd/MWr DMA TLP. When you have enabled SR-IOV, then this field is ignored if you have set the VFE field in the "DMA Write Channel
- Control 2 Register" (DMA_CH_CONTROL2_OFF_WRCH_0). Note: The access
attributes of this field are as follows: - Wire: No access. - Dbi: R/W 11:10 0x0 DMA_RESERVED1:
- Reserved. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: R/W 0x0 LLE:
- Linked List Enable (LLE). Note: The access attributes of this field are as
follows: - Wire: No access. - Dbi: R/W 0x0 CCS:
- Consumer Cycle State (CCS). Used in linked list mode only. It is used to
synchronize the producer (software) and the consumer (DMA). For more details, see "PCS-CCS-CB-TCB Producer-Consumer Synchronization". You must initialize this bit. The DMA updates this bit during linked list operation. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: R/W 0x0 DMA_RESERVED0:
- Reserved. Note: The access attributes of this field are as follows: - Wire: No
access. - Dbi: R/W

- PCIe iATU
- Bit
- Reset
- Description

