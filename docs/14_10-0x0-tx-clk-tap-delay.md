# 14 :10 0x0 Tx_Clk_TAP_DELAY:

- Delays the clock going out to the external device with these tap
values. Useful only in Master Mode. 7:0 0x0 Rx_Clk_TAP_DELAY:
- For master mode, it uses the tap values to delay the internal Rx clock,
which is a loopback from the SCK pad.
- QSPI_TIMING_REG1_0
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

