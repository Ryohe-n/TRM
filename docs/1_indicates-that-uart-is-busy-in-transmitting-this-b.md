# 1 : indicates that UART is busy in transmitting. This bit remains set until the complete byte, including all the stop bits, has been sent from the shift register. 0: indicates that UART is in IDLE and no data to transmit. Note: UARTFR[2:0] - DCD, DSR, CTS, and

- UARTFR[8] - RI fields are reserved as these features are not supported
- Offset: 0x18
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000090 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx0,1001,0000)
- Bit
- Reset
- Description
0x0 RI: State of Ring Indicator. 0 = DISABLE 1 = ENABLE

- SBSA UART Registers
- Bit
- Reset
- Description
0x1 TXFE: Transmit FIFO empty. 0 = NOT_EMPTY 1 = EMPTY 0x0 RXFF: Receive FIFO full. 0 = NOT_FULL 1 = FULL 0x0 TXFF: Transmit FIFO full. 0 = NOT_FULL 1 = FULL 0x1 RXFE: Receive FIFO empty. 0 = NOT_EMPTY 1 = EMPTY 0x0 BUSY: 0 = NOT_BUSY 1 = BUSY 0x0 DCD:
- Data carrier detect. This bit is the complement of the UART data carrier
detect nUARTDCD, modem status input. 0 = DISABLE 1 = ENABLE 0x0 DSR:
- Data set ready. This bit is the complement of the UART data set ready,
nUARTDSR, modem status input. That is, the bit is 1 when nUARTDSR is LOW. 0 = DISABLE 1 = ENABLE 0x0 CTS:
- Clear to send. This bit is the complement of the UART clear to send,
nUARTCTS, modem status input. That is, the bit is 1 when nUARTCTS is LOW. 0 = DISABLE 1 = ENABLE
- SBSA_UARTILPR_0
- IrDA Low-Power Counter Register (NOT USED)
- Offset: 0x20
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)

- SBSA UART Registers
- Bit
- Reset
- Description

