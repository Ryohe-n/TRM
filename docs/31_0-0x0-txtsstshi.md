# 31 :0 0x0 TXTSSTSHI:

- Transmit Timestamp Status High. This field contains the lower 32 bits of
the Seconds field of Transmit packet's captured timestamp.
- MGBE_DWCXG_CORE_MAC_TX_TIMESTAMP_STATUS_PKTID_0
- This register contains the PTP packet ID corresponding to the Tx Timestamp Status in
- MAC_TxTimestamp_Status_Nanoseconds and MAC_TxTimestamp_Status_Seconds registers. This
register is available when IEEE 1588 Tx Timestamp Status FIFO Depth is greater than 1. The correct reading sequence of these registers is as follows: - MAC_TxTimestamp_Status_PktID register -
- MAC_TxTimestamp_Status_Nanoseconds register - MAC_TxTimestamp_Status_Seconds register
This is because, all the 3 registers are updated to a new value when the application reads the last byte of the MAC_TxTimestamp_Status_Seconds register.
- Offset: 0xd38
- Read/Write: RO

10G Ethernet Controller Core Registers cont'd 1
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

