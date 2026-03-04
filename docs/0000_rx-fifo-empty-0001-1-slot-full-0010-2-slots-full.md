# 0000 = rx_fifo empty 0001 = 1 slot full 0010 = 2 slots full

- I2C_INTERRUPT_MASK_REGISTER_0
- Offset: 0x64
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxx0,0000,0000,xx00,xxxx,0000,0000,0000)
- Bit
- Reset
- Description
0x0 SLV_ACK_WITHHELD_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_RD2WR_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_WR2RD_INT_EN: 0 = DISABLE 1 = ENABLE

- I2C Registers
- Bit
- Reset
- Description
0x0 SLV_PKT_XFER_ERR_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_TX_BUFFER_REQ_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_RX_BUFFER_FILLED_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_PACKET_XFER_COMPLETE_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_TFIFO_OVF_REQ_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_RFIFO_UNF_REQ_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_TFIFO_DATA_REQ_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 SLV_RFIFO_DATA_REQ_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 BUS_CLEAR_DONE_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 TLOW_MEXT_TIMEOUT_EN: 0 = DISABLE 1 = ENABLE 0x0 TLOW_SEXT_TIMEOUT_EN: 0 = DISABLE 1 = ENABLE 0x0 TIMEOUT_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 PACKET_XFER_COMPLETE_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 ALL_PACKETS_XFER_COMPLETE_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 TFIFO_OVF_INT_EN: 0 = DISABLE 1 = ENABLE

- I2C Registers
- Bit
- Reset
- Description
0x0 RFIFO_UNF_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 NOACK_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 ARB_LOST_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 TFIFO_DATA_REQ_INT_EN: 0 = DISABLE 1 = ENABLE 0x0 RFIFO_DATA_REQ_INT_EN: 0 = DISABLE 1 = ENABLE
- I2C_INTERRUPT_STATUS_REGISTER_0
This register indicates the status bit for which the interrupt is set.
- Offset: 0x68
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxx0,0000,0000,xx00,xxxx,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 SLV_ACK_WITHHELD: ack is withheld, waiting for Software explicit info about ack. 0 = UNSET 1 = SET
- RW
0x0 SLV_RD2WR: Transaction switching from read to write. 0 = UNSET 1 = SET
- RW
0x0 SLV_WR2RD: Transaction switching from write to read. 0 = UNSET 1 = SET
- RW
0x0 SLV_PKT_XFER_ERR: 0 = Request was successful 1 = Error has occurred during packet transfer 0 = UNSET 1 = SET

- I2C Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 SLV_TX_BUFFER_REQ:
- Slave Tx buffer is full

