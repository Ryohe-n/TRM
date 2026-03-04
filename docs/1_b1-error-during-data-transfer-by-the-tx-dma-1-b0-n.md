# 1 'b1: Error during data transfer by the Tx DMA - 1'b0: No Error during data transfer by the Tx DMA Bit 17 - 1'b1: Error during descriptor access - 1'b0: Error during data buffer access Bit 16 - 1'b1: Error during read transfer - 1'b0: Error during write transfer This field is valid only when the FBE bit is set. This field does not generate an interrupt.

- RW
0x0 NIS:
- Normal Interrupt Summary. Normal Interrupt Summary bit value is the
logical OR of the following bits when the corresponding interrupt bits are enabled in the DMA_CH9_Interrupt_Enable register: - Bit 0:
- Transmit Interrupt - Bit 2: Transmit Buffer Unavailable - Bit 6: Receive
- Interrupt Only unmasked bits (interrupts for which interrupt enable is
set in DMA_CH9_Interrupt_Enable register) affect the Normal
- Interrupt Summary bit. This is a sticky bit. You must clear this bit (by
writing 1 to this bit) each time a corresponding bit which causes NIS to be set is cleared.
- RW
0x0 AIS:
- Abnormal Interrupt Summary. Abnormal Interrupt Summary bit value
is the logical OR of the following when the corresponding interrupt bits are enabled in the DMA_CH9_Interrupt_Enable register: - Bit 1: Transmit Process Stopped - Bit 7: Receive Buffer Unavailable - Bit 8: Receive Process Stopped - Bit 9: Descriptor Definition Error - Bit 12:
- Fatal Bus Error - Bit 13: Context Descriptor Error Only unmasked bits
affect the Abnormal Interrupt Summary bit. This is a sticky bit. You must clear this bit (by writing 1 to this bit) each time a corresponding bit, which causes AIS to be set, is cleared.

10G Ethernet Controller Core Registers cont'd 3
- Bit
R/W
- Reset
- Description
- RW
0x0 CDE:
- Context Descriptor Error. This bit indicates that the DMA Tx engine
received a context descriptor in the middle of a packet (in an intermediate descriptor), and the DMA Tx engine ignored it.
- RW
0x0 FBE:
- Fatal Bus Error. This bit indicates that a bus error occurred (as
described in the EB field). When this bit is set, the corresponding DMA channel engine disables all bus accesses. 11:10
- RO
0x0 Reserved_11_10: Reserved.
- RW
0x0 DDE:
- Descriptor Definition Error. This bit indicates that a Descriptor
- Definition error occurred. When this bit is set, the corresponding DMA
channel engine suspends Descriptor Fetch.
- RW
0x0 RPS:
- Receive Process Stopped. This bit is asserted when the Rx process
enters the Stopped state.
- RW
0x0 RBU:
- Receive Buffer Unavailable. This bit indicates that the application
owns the next descriptor in the Receive list, and the DMA cannot acquire it. The Rx process is suspended. To resume the Rx process, the application must change the ownership of the descriptor and advance the DMA_CH9_RxDesc_Tail_LPointer register. If this is not done, the
- RxDMA remains in SUSPEND state and results in overflow of the
corresponding RxQueue.
- RW
0x0 RI:
- Receive Interrupt. This bit indicates that the packet reception is
complete. When packet reception is complete, Bit 31 of RDES1 is reset in the last descriptor, and the specific packet status information is updated in the descriptor. The reception remains in the Running state. 5:3
- RO
0x0 Reserved_5_3: Reserved.
- RW
0x0 TBU:
- Transmit Buffer Unavailable. This bit indicates that the application
owns the next descriptor in the Transmit list, and the DMA cannot acquire it. Transmission is suspended. The TPS0 field of the
- DMA_Debug_Status9 register explains the Transmit Process state
transitions. To resume the transmission, the application must do the following: - Change the ownership of the descriptor by setting Bit 31 of TDES0. - Issue a Transmit Poll Demand command by performing a write to the Transmit Descriptor Tail Pointer register.
- RW
0x0 TPS:
- Transmit Process Stopped. This bit is set when the transmission is
stopped.
- RW
0x0 TI:
- Transmit Interrupt. This bit indicates that the packet transmission is
complete. When transmission is complete, Bit 31 of TDES1 is reset in the first descriptor, and the specific packet status information is updated in the descriptor.

10G Ethernet Controller Core Registers cont'd 3
- MGBE_DWCXG_DMA_CH9_DMA_CH9_DEBUG_STATUS_0
- DMA Channe9 Debug Status register
- Offset: 0x35e4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 Reserved_31: Reserved. 30:28 0x0 RDWS:
- RxDMA Descriptor Write FSM state - 'x0: STOP/IDLE state - 'x1: Request to
Arbiter for Descriptor Write state - 'x2: Descriptor Write Transfer state - 'x3:
- Waiting for AXI Write Response state - 'x4: ERROR state - 'x5-'x7: Reserved

