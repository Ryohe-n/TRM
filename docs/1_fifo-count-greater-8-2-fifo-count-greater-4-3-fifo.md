# 1 = FIFO_COUNT_GREATER_8 2 = FIFO_COUNT_GREATER_4 3 = FIFO_COUNT_GREATER_1

- RO
X IS_PRI2: Encoded Interrupt ID. Refer to the IIR[3:0] table above. 0 = DISABLE 1 = ENABLE
- WO
0x0 DMA: 0: DMA_MODE_0 1: DMA_MODE_1 0 = NO_CHANGE 1 = CHANGE
- RO
X IS_PRI1: Encoded Interrupt ID. Refer to the IIR[3:0] table above. 0 = DISABLE 1 = ENABLE
- WO
0x0 TX_CLR: 1 = Clears the contents of the transmit FIFO and resets its counter logic to 0 (the transmit shift register is not cleared or altered). This bit returns to 0 after clearing the FIFOs. 0 = NO_CLEAR 1 = CLEAR
- RO
X IS_PRI0: Encoded Interrupt ID. Refer to IIR[3:0] table above. 0 = DISABLE 1 = ENABLE
- WO
0x0 RX_CLR: 1 = Clears the contents of the receive FIFO and resets its counter logic to 0 (the receive shift register is not cleared or altered). This bit returns to 0 after clearing the FIFOs. 0 = NO_CLEAR 1 = CLEAR
- RO
X
- IS_STA: Interrupt Pending if ZERO

