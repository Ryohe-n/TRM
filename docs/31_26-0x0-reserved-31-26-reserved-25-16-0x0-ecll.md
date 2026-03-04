# 31 :26 0x0 Reserved_31_26: Reserved. 25:16 0x0 ECLL:

- Count of parity errors in the previous safety loop This field indicates the
Count of parity errors in previous loop of all safety register parity check.
- Any application read related errors are also included in the count. Value
saturates at all "1"s and is cleared on read. 15:10 0x0 Reserved_15_10: Reserved. 9:0 0x0 ECCL:
- Count of parity errors in current safety loop This field indicates the Count
of parity errors in the current loop of all safety register parity check.
- Application read related errors are also included in the count. Value
saturates at all "1"s and is cleared on read.
- MGBE_DWCXG_CORE_MDIO_SINGLE_COMMAND_ADDRESS_0

10G Ethernet Controller Core Registers This register contains the addresses of the ports, devices, and registers accessed by the SMA during single read or write transfers.
- Offset: 0x200
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

