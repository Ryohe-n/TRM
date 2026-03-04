# 31 :0 0x0 FDBGDATA:

- FIFO Debug Data. During debug or slave access write operation, this field
contains the data to be written to the Tx FIFO, Rx FIFO, or TSO FIFO. During debug or slave access read operation, this field contains the data read from the Tx FIFO, Rx FIFO, or TSO FIFO.
- MGBE_DWCXG_MTL_MTL_INTERRUPT_STATUS_0

10G Ethernet Controller Core Registers cont'd 1 The software driver (application) reads this register during interrupt service routine or polling to determine the interrupt status of MTL queues and the MAC.
- Offset: 0x1020
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

