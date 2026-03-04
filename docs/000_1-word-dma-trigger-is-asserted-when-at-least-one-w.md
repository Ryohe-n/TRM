# 000 = 1 word DMA trigger is asserted when at least one word full in the FIFO 001 = 2 word DMA trigger is asserted when at least two word full in the FIFO 0x0 TX_FIFO_FLUSH: 1= flush the Tx FIFO, cleared after FIFO is flushed. 0 = UNSET 1 = SET 0x0 RX_FIFO_FLUSH: 1= flush the Rx FIFO, cleared after FIFO is flushed. 0 = UNSET 1 = SET

- I2C_FIFO_STATUS_0
- This register is RSVD and not used
- Offset: 0x60
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- I2C Registers
- SCR Protection: 0
- Reset: 0x00800080 (0bxxxx,xx0x,1000,0000,xxxx,xxxx,1000,0000)
- Bit
- Reset
- Description
0x0 SLV_XFER_ERR_REASON: This bit describes the nature of the packet transfer error. It is meaningful only if PKT_XFER_ERR is set: 0 = Master terminated transaction before it was completed 1 = Master did not terminate transaction when all bytes are transferred 23:20 0x8 SLV_TX_FIFO_EMPTY_CNT:
- The number of slots that can be written to the slave Tx FIFO

