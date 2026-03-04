# 0 = NO_UNDERRUN 1 = UNDERRUN X

- Reserved
X
- Reserved
- UART_ASR_0
- UART Auto Sense Baud Register
The UART has autobaud sensing logic that can measure the width of the start bit of incoming data to determine baud rate. For this to work, the incoming character must have its LSB set. A <cr> works well (0x0d). The logic uses the UART device clock to count how wide the start pulse is, and the BUSY bit is set when the sensing is complete. The value in {RX_RATE_SENSE_H, RX_RATE_SENSE_L} should be divided by 16 with Round-to-Nearest, and the resulting value loaded into the DLM, DLL register pair to set the Baud Clock to 16x the Baud Rate.
- Offset: 0x3c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b00xx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Rese
t
- Description
0x0 VALID: This bit is set when the controller finishes counting the clocks between two successive clock edges after there is a write to ASR with don't care data. 0 = UN_SET 1 = SET

- Server Base System Architecture (SBSA) UART
- Bit
- Rese
t
- Description
0x0 BUSY: This bit is set when there is a write to ASR and is reset when the controller finishes counting the clock edges between two successive clock edges. 0 = NO_BUSY 1 = BUSY 15: 0x0 RX_RATE_SENSE_H: Shows bits [15:8] of the count of clock edges between two successive clock edges. 7:0 0x0 RX_RATE_SENSE_L: Shows bits [7:0] of the count of clock edges between two successive clock edges.

