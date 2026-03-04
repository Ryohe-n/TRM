# 0000000 = 1 word, trigger is asserted when at least one word full in the FIFO 0000001 = 2 words, trigger is asserted when at least two words full in the FIFO..... 1111111 = 128 words, trigger is asserted when 128 words full in the FIFO. 0x0 TX_FIFO_FLUSH: 1 = flush the SLAVE TX FIFO; bit will be auto-cleared by Hardware after FIFO flush is done 0 = UNSET 1 = SET 0x0 RX_FIFO_FLUSH: 1 = flush the SLAVE RX FIFO; bit will be auto-cleared by Hardware after FIFO flush is done 0 = UNSET 1 = SET

- I2C_SLV_FIFO_STATUS_0
- Offset: 0xc4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00800000 (0bxxxx,xxx0,1000,0000,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description
0x0 SLV_XFER_ERR_REASON:
- This bit describes the nature of the packet transfer error. It is
meaningful only if PKT_XFER_ERR is set. 0 = Master terminated transaction before it was completed, 1 = Master did not terminate transaction when all bytes are transferred 23:16 0x80 TX_FIFO_EMPTY_CNT:
- The number of slots that can be written to the Slave Tx FIFO

