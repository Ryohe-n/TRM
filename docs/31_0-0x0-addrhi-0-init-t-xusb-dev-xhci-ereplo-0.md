# 31 :0 0x0 ADDRHI: 0 = INIT T_XUSB_DEV_XHCI_EREPLO_0


- USB 3.0 Device Controller Memory-Mapped I/O Registers
Reflects the current value of Event Ring Enqueue Pointer, it is updated by hardware after posting an event software can write to the register when Control Enable bit is cleared, software also specifies the segment index of the segment to be used and hardware samples the value written by software on a positive edge of control enable.
- Offset: 0x28
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000000X (0b0000,0000,0000,0000,0000,0000,0000,xx00)
- Bit
R/W
- Reset
- Description

