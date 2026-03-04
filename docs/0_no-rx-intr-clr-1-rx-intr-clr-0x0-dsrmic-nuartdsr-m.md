# 0 = NO_RX_INTR_CLR 1 = RX_INTR_CLR 0x0 DSRMIC: nUARTDSR modem interrupt clear 0 = NO_DSR_INTR_CLR 1 = DSR_INTR_CLR 0x0 DCDMIC: nUARTDCD modem interrupt clear 0 = NO_DCD_INTR_CLR 1 = DCD_INTR_CLR


- Serial Peripheral Interface (SPI)
- Bit
- Reset
- Description
0x0 CTSMIC: nUARTCTS modem interrupt clear 0 = NO_CTS_INTR_CLR 1 = CTS_INTR_CLR 0x0 RIMIC: nUARTRI modem interrupt clear 0 = NO_RI_INTR_CLR 1 = RI_INTR_CLR
- SBSA_UARTDMACR_0
- DMA Control Register
- Offset: 0x48
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 DMAONERR:
- DMA on error. If this bit is set to 1, the DMA receive request outputs

