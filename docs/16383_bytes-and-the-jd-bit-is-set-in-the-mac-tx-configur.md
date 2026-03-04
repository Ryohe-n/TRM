# 16383 bytes and the JD bit is set in the MAC_Tx_Configuration register. Access restriction applies. Clears on read (or write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event.

- MGBE_DWCXG_CORE_MAC_LPI_CONTROL_STATUS_0
The LPI Control and Status register controls the LPI functions and provides the LPI interrupt status. The status bits are cleared when this register is read. This register is present only when you select the Energy Efficient Ethernet feature while configuring the controller.
- Offset: 0xd0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description

