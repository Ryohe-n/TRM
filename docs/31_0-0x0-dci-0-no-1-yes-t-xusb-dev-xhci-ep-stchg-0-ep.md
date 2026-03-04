# 31 :0 0x0 DCI: 0 = NO 1 = YES T_XUSB_DEV_XHCI_EP_STCHG_0 EP STCHG is set by hardware whenever halt/pause/run bit is cleared by software, to indicate completion of processing of the software request. Software should clear the EP_STCHG bit by writing 1 to it, there is 1 bit for each EP.

- Offset: 0x5c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 IN15: 0 = NO 1 = YES 0x0 OUT15: 0 = NO 1 = YES 0x0 IN14: 0 = NO 1 = YES 0x0 OUT14: 0 = NO 1 = YES 0x0 IN13: 0 = NO 1 = YES 0x0 OUT13: 0 = NO 1 = YES 0x0 IN12: 0 = NO 1 = YES 0x0 OUT12: 0 = NO 1 = YES 0x0 IN11: 0 = NO 1 = YES

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- Bit
- Reset
- Description
0x0 OUT11: 0 = NO 1 = YES 0x0 IN10: 0 = NO 1 = YES 0x0 OUT10: 0 = NO 1 = YES 0x0 IN9: 0 = NO 1 = YES 0x0 OUT9: 0 = NO 1 = YES 0x0 IN8: 0 = NO 1 = YES 0x0 OUT8: 0 = NO 1 = YES 0x0 IN7: 0 = NO 1 = YES 0x0 OUT7: 0 = NO 1 = YES 0x0 IN6: 0 = NO 1 = YES 0x0 OUT6: 0 = NO 1 = YES 0x0 IN5: 0 = NO 1 = YES 0x0 OUT5: 0 = NO 1 = YES 0x0 IN4: 0 = NO 1 = YES 0x0 OUT4: 0 = NO 1 = YES

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- Bit
- Reset
- Description
0x0 IN3: 0 = NO 1 = YES 0x0 OUT3: 0 = NO 1 = YES 0x0 IN2: 0 = NO 1 = YES 0x0 OUT2: 0 = NO 1 = YES 0x0 IN1: 0 = NO 1 = YES 0x0 OUT1: 0 = NO 1 = YES 0x0 IN0: 0 = NO 1 = YES 0x0 OUT0: 0 = NO 1 = YES T_XUSB_DEV_XHCI_FLOWCNTRL_0 Flow control threshold values for HSFS NAK. Software needs to enable this if more than four IN or four OUT EPs are configured. IDLE timeout for SS - number of micro frames an async EP is in idle state in a thread before it is evicted automatically.
- Offset: 0x60
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXX080000 (0bxxxx,xxxx,0000,1000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

