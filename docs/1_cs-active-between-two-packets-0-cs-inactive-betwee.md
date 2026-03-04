# 1 = CS active between two packets 0 = CS inactive between two packets 4:0 0x0 CYCLES_BETWEEN_PACKETS_0:

- Number of cycles in between packets for CS-0
SPI_TRANSFER_STATUS_0 .
- Offset: 0x10
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00ff0000 (0bx0xx,xxxx,1111,1111,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 RDY:
- Ready bit. This bit is set to 1 at the end of every transfer and an
interrupt is also generated if the corresponding interrupt enable is set in PIO/DMA Mode.
- Software writes a 1 to clear it. The interrupt is also cleared
when this bit is cleared. 0 = NOT_READY 1 = READY 23:16
- RW
0xff SLV_IDLE_CNT:
- In Slave Continuous Mode if Sclk is not received for this number
of cycles then the continuous mode is terminated and the status bit FRAME_END is set. 15:0
- RO
0x0 BLK_CNT:
- Counts the number of Packets in a transaction (Tx or Rx) DMA/
PIO Mode.
- SPI_FIFO_STATUS_0
- Offset: 0x14
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00400005 (0b0000,0000,0100,0000,00xx,xx00,0000,0101)

- SPI Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 CS_INACTIVE: 1 = CS is de-asserted by external Master in-between a transaction. Interrupt is generated in this case.
- RW
0x0 FRAME_END: 1 = External clock is absent abruptly in-between a transaction. 29:23
- RO
0x0 RX_FIFO_FULL_COUNT:
- Indicates the number of full slots in the receive FIFO

