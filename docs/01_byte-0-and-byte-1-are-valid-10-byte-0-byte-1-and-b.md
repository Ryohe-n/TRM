# 01 : Byte 0 and Byte 1 are valid - 10: Byte 0, Byte 1, and Byte 2 are valid - 11: All four bytes are valid 2:1

- RO
0x0 PKTSTATE:
- Read Control Type. This field indicates the tag bits read along with
the data being read from the selected FIFO. When the TxFIFO is read in Debug mode, this field marks the type of data read as follows: - 00: Packet Data - 01: Control Word - 10: SOP Data - 11: EOP Data
- When the RxFIFO is read in Debug or Slave mode, this field marks
the type of data read as listed as follows: - 00: Packet Data - 01:
- Normal Status - 10: Last Status - 11: EOP
- RO
0x0 FIFOBUSY:
- FIFO Busy. When set, this bit indicates that a FIFO operation is in
progress in the MAC and content of the following fields is not valid: -
- All other fields of this register - All fields of the
- MTL_FIFO_Debug_Data register
- MGBE_DWCXG_MTL_MTL_FIFO_DEBUG_DATA_0
The FIFO Debug Data register contains the data to be written to or read from the FIFOs. Note: Consecutive write or read to this register should be performed after at least 16 clock cycles of the slowest clock among MAC Transmitter/Receiver clock and Application/CSR clock.
- Offset: 0x1010
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

