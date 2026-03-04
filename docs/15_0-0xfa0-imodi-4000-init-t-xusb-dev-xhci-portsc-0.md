# 15 :0 0xfa0 IMODI: 4000 = INIT T_XUSB_DEV_XHCI_PORTSC_0

- Port Status and Control Register
- Offset: 0x3c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xX00XX080 (0bx0xx,xxxx,000x,0x00,xx00,0000,1000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0 WPR: 0 = NORST 1 = RST 29:28
- RO
X RSVD4: 0 = _00
- RW
0x0 CEC: 0 = NOT_PENDING 1 = PENDING
- RW
0x0 PLC: 0 = NOT_PENDING 1 = PENDING
- RW
0x0 PRC: 0 = NOT_PENDING 1 = PENDING
- RW
0x0 WRC: 0 = NOT_PENDING 1 = PENDING
- RO
X RSVD3: 0 = _00
- RW
0x0 CSC: 0 = NOT_PENDING 1 = PENDING
- RW
0x0 LWS: 0 = INIT 1 = SET
- RO
X RSVD2: 0 = _00

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- Bit
R/W
- Reset
- Description

