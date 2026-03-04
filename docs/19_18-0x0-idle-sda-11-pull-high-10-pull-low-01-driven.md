# 19 :18 0x0 IDLE_SDA: 11 = Pull High 10 = Pull Low 01 = Driven High 00 = Driven Low 0 = DRIVE_LOW 1 = DRIVE_HIGH 2 = PULL_LOW 3 = PULL_HIGH 0x0 BIDIR: 1 = RSVD 0 = Normal mode 0 = NORMAL 1 = RSVD 0x0 En_LE_Bit: 1 = Enable Little Endian Bit 0 = Disable Little Endian Bit 0 = LAST 1 = FIRST 0x0 En_LE_Byte: 1 = Enable Little Endian Byte 0 = Disable Little Endian Byte 0 = LAST 1 = FIRST 0x0 Rx_EN: 0 = DISABLE 1 = ENABLE 0x0 Tx_EN: 0 = DISABLE 1 = ENABLE 0x0 SDR_DDR_SEL: Selects between SDR (Single data rate) and DDR (Double data rate) mode. 0 = SDR 1 = DDR 0 = SDR 1 = DDR 8:7 0x0 INTERFACE_WIDTH: 00 = Single bit mode (x1 mode) 01 = Dual mode (x2 mode) 10 = Quad mode (x4 mode) 11 = RSVD 0 = SINGLE 1 = DUAL 2 = QUAD 0x0 PACKED: Packed mode enable bit. 1 = Packed mode is enabled. This is only valid if BIT_LENGTH in COMMAND register is set to 7, 15 or 31.

- When enabled, all 32-bits of data in the FIFO contains valid data packets of
either 8-bit, 16-bit or 32-bit length. 0 = Packed mode is disabled. 0 = DISABLE 1 = ENABLE 4:0 0x1f BIT_LENGTH: This field represents the number of bits in a packet to transmit/receive. The minimum bit_length supported is 1 byte (BIT_LEN=7). Only byte aligned bit_length are supported (BIT_LEN=7,15,31). N = N + 1 bits transfer.
- QSPI_COMMAND2_0

- QSPI Registers
- Offset: 0x4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,x000,00xx,0000,0000)
- Bit
- Reset
- Description

