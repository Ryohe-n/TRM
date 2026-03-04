# 0 = RX_INTR_INACTIVE 1 = RX_INTR_ACTIVE 0x0 DSRMMIS: nUARTDSR modem interrupt mask status 0 = DSR_INTR_INACTIVE 1 = DSR_INTR_ACTIVE 0x0 DCDMMIS: nUARTDCD modem interrupt mask status 0 = DCD_INTR_INACTIVE 1 = DCD_INTR_ACTIVE 0x0 CTSMMIS: nUARTCTS modem interrupt mask status 0 = CTS_INTR_INACTIVE 1 = CTS_INTR_ACTIVE 0x0 RIMMIS: nUARTRI modem interrupt mask status 0 = RI_INTR_INACTIVE 1 = RI_INTR_ACTIVE

- SBSA_UARTICR_0

- SBSA UART Registers
- Interrupt clear Register
Writing a 1 into particular field clears respective interrupt in both UARTMIS/UARTRIS and eventual to LIC.
- Writing a 0 has no effect/impact
- Offset: 0x44
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,x000,0000,0000)
- Bit
- Reset
- Description
0x0 OEIC:
- Overrun error interrupt clear

