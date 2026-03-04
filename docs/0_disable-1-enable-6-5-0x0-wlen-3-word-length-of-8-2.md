# 0 = DISABLE 1 = ENABLE 6:5 0x0 WLEN: 3 = Word length of 8, 2 = Word length of 7, 1 = Word length of 6, 0 = Word length of 5. 0 = WORD_LENGTH_5 1 = WORD_LENGTH_6 2 = WORD_LENGTH_7 3 = WORD_LENGTH_8 0x0 FEN: This bit is to select FIFO/non-FIFO mode. FIFO mode is disabled by default. 0 = DISABLE 1 = ENABLE 0x0 STP2: 1 = Two stop bits, 0 = One stop bit. 0 = ONE 1 = TWO 0x0 EPS: 0 = Odd parity select, 1 = Even parity select. 0 = ODD 1 = EVEN 0x0 PEN: 0 = Parity Disabled, 1 = Parity Enabled. 0 = NO_PARITY 1 = PARITY 0x0 BRK:

- If this bit is set to 1, a low-level is continually output on the UARTTXD output,
after completing transmission of the current character. For the proper execution of the break command, the software must set this bit for at least two complete frames. For normal use, this bit must be cleared to 0. 0 = NO_BREAK 1 = BREAK
- SBSA_UARTCR_0
- Control Register
The RTS and CTS pins are used for hardware handshaking with an external serial device. RTS (Request-To-Send) informs the device that the UART is ready to accept data.
- CTS (Clear-To-Send) comes from the RTS of the external device and informs us that it is OK
to send data. Bits [6:3] of UARTCR are reserved writing '1' into TXE field enables the Tx data writing into Tx FIFO even if UARTEN is not set; Tx data transmission starts from Tx FIFO, when UARTEN is set. In Receive path, both RXE and UARTEN should be set in order to start receiving the data and store in RXFIFO.

- SBSA UART Registers
- Note: bits UARTCR[13:12] - Out2, Out1; UARTCR[10] - DTR; UARTCR[2:1] - SIREN, SIRLP are
reserved and are not supported in RTL.
- Offset: 0x30
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000300 (0bxxxx,xxxx,xxxx,xxxx,0000,0011,0xxx,x000)
- Bit
- Reset
- Description
0x0 CTS_EN: 1 = Enable CTS Hardware Flow Control 0 = DISABLE 1 = ENABLE 0x0 RTS_EN: 1 = Enable RTS Hardware Flow Control 0 = DISABLE 1 = ENABLE 0x0 Out2:
- This bit is the complement of the UARTOut2 (nUARTOut2) modem status
output. For DTE this can be used as Ring Indicator (RI). 0 = DISABLE 1 = ENABLE 0x0 Out1:
- This bit is the complement of the UARTOut1 (nUARTOut1) modem status
output. For DTE this can be used as Data Carrier Detect (DCD). 0 = DISABLE 1 = ENABLE 0x0 RTS: RTS = 1, Request to send the data. 0 = RTS_LOW 1 = RTS_HIGH 0x0 DTR: DTR = 1, Data is ready to transmit. 0 = DTR_LOW 0 = DTR_HIGH 0x1 RXE: 1 = Receive Enable. 0 = RX_DISABLE 1 = RX_ENABLE 0x1 TXE: 1 = Transmit Enable. 0 = TX_DISABLE 1 = TX_ENABLE 0x0 LBE: Disable Loopback by default. 0 = LPBCK_DISABLE 1 = LPBCK_ENABLE

- SBSA UART Registers
- Bit
- Reset
- Description
0x0 SIRLP: SIR low-power IrDA mode is set. 0 = NOT_SIRLOWP 1 = SIRLOWP 0x0 SIREN: 1 = IrDA SIR ENDEC is enabled; 0 = Regular TXD/RXD data transmission. 0 = SIR_DISABLE 1 = SIR_ENABLE 0x0 UARTEN: 0 = UART is disabled. If the UART is disabled in the middle of transmission or reception, it completes the current character before stopping. 1 = the UART is enabled. Data transmission and reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit. 0 = UART_DISABLE 1 = UART_ENABLE
- SBSA_UARTIFLS_0
- Interrupt FIFO Level Select Register
Transmit interrupt FIFO level select. Tx interrupt is raised when FIFO data count comes down to programmable threshold/trigger level; for example of 000, Tx interrupt is asserted when Tx FIFO data count comes down to four locations (1/8 full). Note: The transmit interrupt is based on a transition through a level, rather than on the level itself. b000 = Transmit FIFO becomes <= 1/8 full b001 = Transmit FIFO becomes <= 1/4 full b010 = Transmit FIFO becomes <= 1/2 full b011 = Transmit FIFO becomes <= 3/4 full b100 = Transmit FIFO becomes <= 7/8 full b101-b111 = reserved Receive interrupt FIFO level select. The trigger points for the receive interrupt are as follows: b000 = Receive FIFO becomes >= 1/8 full b001 = Receive FIFO becomes >= 1/4 full b010 = Receive FIFO becomes >= 1/2 full b011 = Receive FIFO becomes >= 3/4 full b100 = Receive FIFO becomes >= 7/8 full b101-b111 = reserved
- Offset: 0x34
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- SBSA UART Registers
- SCR Protection: 0
- Reset: 0x00000012 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx01,0010)
- Bit
- Reset
- Description

