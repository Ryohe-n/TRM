# 4 :0 0x0 CYCLES_BETWEEN_PACKETS_0:

- Number of cycles in between packets for CS-0
- RSVD field
- QSPI_TRANSFER_STATUS_0
- Offset: 0x10
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bx0xx,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 RDY:
- Ready bit. This bit is set to 1 at the end of every transfer and an
interrupt is also generated if the corresponding interrupt enable is set in PIO/DMA Mode.
- Software writes a 1 to clear it. The interrupt is also cleared when
this bit is cleared. 0 = NOT_READY 1 = READY 27:0
- RO
0x0 BLK_CNT:
- Counts the number of packets in a transfer (Tx or Rx) PIO/DMA
Mode.
- QSPI_FIFO_STATUS_0
- Offset: 0x14
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00400005 (0bxx00,0000,0100,0000,00xx,xxx0,0000,0101)
- Bit
R/W
- Reset
- Description

