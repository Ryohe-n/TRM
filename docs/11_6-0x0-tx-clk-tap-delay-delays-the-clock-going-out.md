# 11 :6 0x0 Tx_Clk_TAP_DELAY: Delays the clock going out to the external device with these tap values. Useful only in Master Mode. 5:0 0x0 Rx_Clk_TAP_DELAY:

- For master mode, it uses the tap values to delay the internal Rx clock,
which is a loopback from Tx Outbound clock (before Tx Trimmer)
- For slave mode, it uses the tap values to delay the clock coming in from
the external device (master)
- SPI_TIMING_REG1_0
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N

- SPI Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

