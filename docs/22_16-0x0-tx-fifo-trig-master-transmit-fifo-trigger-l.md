# 22 :16 0x0 TX_FIFO_TRIG: Master Transmit FIFO trigger level. 0000000 = 1 word, trigger is asserted when at least one word empty in the FIFO. 0000001 = 2 words, trigger is asserted when at least two words empty in the FIFO..... 1111111 = 128 words, trigger is asserted when 128 words empty in the FIFO. 10:4 0x0 RX_FIFO_TRIG: Master Receive FIFO trigger level. 0000000 = 1 word, trigger is asserted when at least one word full in the FIFO. 0000001 = 2 words, trigger is asserted when at least two words full in the FIFO...... 1111111 = 128 words, trigger is asserted when 128 words full in the FIFO. 0x0 TX_FIFO_FLUSH: 1 = flush the TX FIFO; bit is auto-cleared by Hardware after FIFO flush is done 0 = UNSET 1 = SET 0x0 RX_FIFO_FLUSH: 1 = flush the RX FIFO; bit is auto-cleared by Hardware after FIFO flush is done 0 = UNSET 1 = SET

- I2C_MST_FIFO_STATUS_0
- Offset: 0xb8
- Read/Write: RO
- Parity Protection: N

- I2C Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00800000 (0bxxxx,xxxx,1000,0000,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

