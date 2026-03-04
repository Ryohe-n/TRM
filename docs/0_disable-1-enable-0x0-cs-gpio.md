# 0 = DISABLE 1 = ENABLE 0x0 CS_GPIO:

- This bit is used to control the outgoing CS lines. It can be used to mask
the CS lines driven from controller. Controller will always drive CS_POL_INACTIVE* value to CS lines if this bit is set. 0 = Controller will drive CS lines based on CS_SW_HW (normal operation). 1 = Controller will drive CS_POL_INACTIVE* value. 0 = DISABLE 1 = ENABLE 0x0 PACKED: Packed mode enable bit. 1 = Packed mode is enabled. This is only valid if BIT_LENGTH in COMMAND register is set to 3, 7, 15, or 31. When enabled, all 32-bits of data in the
- FIFO contains valid data packets of either 4-bit, 8-bit, 16-bit, or 32-bit
length. 0 = Packed mode is disabled. 0 = DISABLE 1 = ENABLE 4:0 0x0 BIT_LENGTH: 31 = Thirty Two bit Transfers (Max)
- SPI_COMMAND2_0
- Offset: 0x4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,0000,0000,0000)
- Bit
- Reset
- Description

