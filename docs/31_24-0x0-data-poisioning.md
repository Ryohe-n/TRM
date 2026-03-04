# 31 :24 0x0 DATA_POISIONING:

- Data Poisoning. The DMA read channel has detected data poisoning in the
completion from the remote device (in response to the MRd request). The DMA read channel will drop the completion and then be halted. The
- CX_FLT_MASK_UR_POIS filter rule does not affect this behavior. Each bit
corresponds to a DMA channel. Bit [0] corresponds to channel 0. - Enabling: For more details, see "Interrupts and Error Handling". - Masking: The DMA read interrupt Mask register has no effect on this register. - Clearing: You must write a 1'b1 to the corresponding channel bit in the Abort interrupt field of the DMA
- Read Interrupt Clear Register (DMA_READ_INT_CLEAR_OFF) to clear this error
bit. Note, this also clears the other error bits for the same channel in this register and in the DMA Read Error Status Low register. 23:16 0x0 CPL_TIMEOUT:
- Completion Time Out. The DMA read channel has timed-out while waiting for
the remote device to respond to the MRd request, or a malformed CplD has been received. For more details, see "Linked List Mode". Each bit corresponds to a DMA channel. Bit [0] corresponds to channel 0. - Enabling: For details, see "Interrupts and Error Handling" . - Masking: The DMA read interrupt Mask register has no effect on this register. - Clearing: You must write a 1'b1 to the corresponding channel bit in the Abort interrupt field of the DMA Read Interrupt Clear Register (DMA_READ_INT_CLEAR_OFF) to clear this error bit.
- Note, this also clears the other error bits for the same channel in this register
and in the DMA Read Error Status Low register. 15:8 0x0 CPL_ABORT:
- Completer Abort. The DMA read channel has received a PCIe completer abort
completion status from the remote device in response to the MRd request. For more details, see "Linked List Mode". Each bit corresponds to a DMA channel.
- Bit [0] corresponds to channel 0. - Enabling: For more details, see "Interrupts
and Error Handling". - Masking: The DMA read interrupt Mask register has no effect on this register. - Clearing: You must write a 1'b1 to the corresponding channel bit in the Abort interrupt field of the DMA Read Interrupt Clear Register (DMA_READ_INT_CLEAR_OFF) to clear this error bit. Note, this also clears the other error bits for the same channel in this register and in the DMA Read Error Status Low register. 7:0 0x0 UNSUPPORTED_REQ:
- Unsupported Request. The DMA read channel has received a PCIe unsupported
request completion status from the remote device in response to the MRd request. For more details, see "Linked List Mode". Each bit corresponds to a
- DMA channel. Bit [0] corresponds to channel 0. - Enabling: For more details, see
"Interrupts and Error Handling". - Masking: The DMA read interrupt Mask register has no effect on this register. - Clearing: You must write a 1'b1 to the corresponding channel bit in the Abort interrupt field of the DMA Read Interrupt Clear Register (DMA_READ_INT_CLEAR_OFF) to clear this error bit.
- Note, this also clears the other error bits for the same channel in this register
and in the DMA Read Error Status Low register.
- PCIE_DMA_CAP_PF0_DMA_CAP_DMA_READ_LINKED_LIST_ERR_EN_OFF_0
Description: The LIE and RIE bits in the LL element enable the channel "done" interrupts (local and remote). The LLLAIE and LLRAIE bits enable the channel "abort" interrupts (local and remote).
- Offset: 0x200c4
- Read/Write: See table below
- Parity Protection: N

- PCIe iATU
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,xxxx,xx00,0000,0000,xxxx,xx00)
- Bit
R/W
- Reset
- Description

