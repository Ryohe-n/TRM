# 0 = STOP 1 = RUN T_XUSB_DEV_XHCI_ST_0

- Status Register Run Change - set when run bit transitions from 1 to 0
Interrupt Pending is set by hardware when an event is added to the event ring. Device System Error bit set when error is received on FPCI wrapper.
- Offset: 0x34
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,xxx0)
- Bit
R/W
- Reset
- Description

