# 0 = WORD_LENGTH_5 1 = WORD_LENGTH_6 2 = WORD_LENGTH_7 3 = WORD_LENGTH_8

- UART_MCR_0
The Request-To-Send (RTS) and Clear-To-Send (CTS) pins are used for hardware handshaking with an external serial device. RTS informs the device that the UART is ready to accept data. CTS comes from the RTS of the external device and indicates that data can be sent. The RTS pin can be controlled manually with the RTS bit in the MCR or automatically by setting the RTS_EN bit. If RTS_EN is set, the RTS pin automatically removes the Request-To-Send when the FIFO reaches the trigger level. If the CTS_EN bit is set, the UART transmitter stops transmitting when the Clear-To-Send input is taken away.

- UART Registers
- Offset: 0x10
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,x000,0000,0000)
- Bit
- Reset
- Description
0x0 OLD_SIR_DECODE: Diagnostics bit to use the required SIR decode path. 0 = new SIR decode path 1 = old SIR decode path 0 = DISABLE 1 = ENABLE 9:8 0x0
- RI_POLARITY: Polarity selection bit for RI pin toggling to generate modem
status interrupt. 0x0 - interrupt is generated when RI pin toggles from low to high 0x1 - interrupt is generated when RI pin toggles from high to low 0x2 - interrupt is generated on RI delta change detection 0x3 - Reserved 0 = LOW_TO_HIGH 1 = HIGH_TO_LOW 2 = BOTH_EDGES 3 = RSVD 0x0
- DEL_QUAL_CTS_EN: Diagnostics bit to use the old qualified CTS in Tx
state machine 1 = use old qualified_cts 0 = use the new qualified_cts in Tx state machine 0 = DISABLE 1 = ENABLE 0x0
- RTS_EN: 1 = Enable RTS Hardware Flow Control

