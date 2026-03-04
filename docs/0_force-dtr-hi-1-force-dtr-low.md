# 0 = FORCE_DTR_HI 1 = FORCE_DTR_LOW


- UART Registers
- UART_LSR_0
- UART Line Status Register
- Offset: 0x14
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000260 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx10,0110,0000)
- Bit
- Reset
- Description
X RX_FIFO_EMPTY: 1 = RX FIFO is empty 0 = RX FIFO has at least one entry 0 = NOT_EMPTY 1 = EMPTY X
- TX_FIFO_FULL: Transmitter FIFO full status

