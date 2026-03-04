# 31 :16 0x9c ACKQ_TMR: 156 = DEFAULT 14:10 0x2 PIPE_ISO_THRES: 2 = INIT 0x1 EXTRA_NUMP: 1 = INIT


- XHCI Controller Configuration Registers
- Bit
- Reset
- Description
0x0 NUMP_MAX_ISOCH: 0 = DISABLED 1 = ENABLED 0x0 NUMP_MAX: 0 = DISABLED 1 = ENABLED 0x0 ISOBURST2: 0 = DISABLED 1 = ENABLED 0x0 ISOBURST1: 0 = DISABLED 1 = ENABLED 0x1 ACKQUEUE: 0 = DISABLED 1 = ENABLED 0x1 RETRY: 0 = DISABLED 1 = ENABLED T_XUSB_CFG_SSPX_CORE_ASYNC_0
- Offset: 0x76c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 POST_ALL: 0 = INIT T_XUSB_CFG_SSPX_CORE_OUTXFER_0
- Offset: 0x770
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000001 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1)
- Bit
- Reset
- Description
0x1 CLAMP_NUMP_16: 1 = INIT

- XHCI Controller Configuration Registers
T_XUSB_CFG_SSPX_CORE_BUBBLE_0
- Offset: 0x774
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b00xx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 EN: 0 = INIT 0x0 TRAIN: 0 = NOT_PEND 1 = SET 15:0 0x0 CNT: 0 = INIT T_XUSB_CFG_SSPX_CORE_CTRL_LTSSM_0
- Offset: 0x778
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00XX0000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
R/W
- Reset
- Description

