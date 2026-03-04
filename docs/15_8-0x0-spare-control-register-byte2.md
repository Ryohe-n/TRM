# 15 :8 0x0 SPARE_CONTROL_REGISTER_BYTE2:

- Need to Program bits 8, 9, and 10 along with Rx_Clk_TAP_DELAY in
- COMMAND2 Register to adjust clock delay on internal registers. Useful
only in Master Mode. 7:0 0x0
- SPARE_CONTROL_REGISTER_BYTE1
- SPI_MISC_0
- Offset: 0x194
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x80000000 (0b10xx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- PROD: 0x00000000 (0b0xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- PROD
- Description
0x1 0x0 CLKEN_OVERRIDE:
- Override for spi_clk. Can be used to bypass the SLCG incase of
issues. By default SLCG is not enabled. Software should turn on it by writing this bit to 0. 0: spi_clk is gated 1: spi_clk is not gated

- SPI Registers
- Bit
- Reset
- PROD
- Description
0x0 _NONE_ EXT_CLK_EN:
- This bit is used to gate the external master clk. In multi slave
environment where master clock is connected to all slave, this clock is running even though master is communicating to other slave.
- Software should enable this once controller is out of reset and all
the configuration is done which means slave is ready to receive data. During this time, if any valid data comes in, that will be lost. 0: ext_clk is gated. 1: ext_clk is not gated.
- SPI_FATAL_INTR_EN_0
- Offset: 0x198
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b00x0,000x,xxxx,xxxx,xxxx,xx0x,xxxx,xxxx)
- Bit
- Reset
- Description
0x0 CS_FATAL_INTR_EN: Fatal Interrupt enable bit for CS de-assert in Slave Mode. 1 = fatal_intr line will be asserted if CS_INACTIVE bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE 0x0 FRAME_END_FATAL_INTR_EN: Fatal Interrupt enable bit for FRAME_END. 1 = fatal_intr line will be asserted if FRAME_END bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE 0x0 TX_FIFO_OVF_FATAL_INTR_EN: Fatal Interrupt enable bit for TX_FIFO_OVF. 1 = fatal_intr line will be asserted if TX_FIFO_OVF bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE 0x0 TX_FIFO_UNF_FATAL_INTR_EN: Fatal Interrupt enable bit for TX_FIFO_UNF. 1 = fatal_intr line will be asserted if TX_FIFO_UNF bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE

- SPI Registers
- Bit
- Reset
- Description
0x0 RX_FIFO_OVF_FATAL_INTR_EN: Fatal Interrupt enable bit for RX_FIFO_OVF. 1 = fatal_intr line will be asserted if RX_FIFO_OVF bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE 0x0 RX_FIFO_UNF_FATAL_INTR_EN: Fatal Interrupt enable bit for RX_FIFO_UNF. 1 = fatal_intr line will be asserted if RX_FIFO_UNF bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE 0x0 CS_BOUNDARY_TIMEOUT_FATAL_INTR_EN: Fatal Interrupt enable bit for CS_BOUNDARY_TIMEOUT. 1 = fatal_intr line will be asserted if CS_BOUNDARY_TIMEOUT_INTR bit is set 1 in FIFO_STATUS Register. 0 = fatal_intr line will not be asserted. 0 = DISABLE 1 = ENABLE
- SPI_CS_BOUNDARY_TIMEOUT_0
- SPI slave Rx continuous pause mode timeout Register
- Offset: 0x19c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

