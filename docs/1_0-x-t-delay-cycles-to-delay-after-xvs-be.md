# 1 :0 X T_DELAY: Cycles to delay after XVS before assert XHS. 0 means no delay. Measured in SYNCGEN_CLK. Default to 1.

- VI_SYNCGEN2_INT_STATUS_0
- Offset: 0x3405
- Byte Offset: 0xd014
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 SCAN_STOPPED:
- Write-1 to clear
0x0 XHS_TIMER:
- Write-1 to clear
0x0 STALE_FRAME:
- Write-1 to clear
0x0 LOAD_DONE:
- Write-1 to clear
0x0 XVS:
- Write-1 to clear
- VI_SYNCGEN2_INT_MASK_0

- Video Input Registers
- Offset: 0x3406
- Byte Offset: 0xd018
- Read/Write: R/W
- Parity Protection: N
- Shadow: Y
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0,0000)
- Bit
- Reset
- Description
0x0 SCAN_STOPPED: 0=disable interrupt 1=pass interrupt 0 = DISABLE 1 = ENABLE 0x0 XHS_TIMER: 0=disable interrupt 1=pass interrupt 0 = DISABLE 1 = ENABLE 0x0 STALE_FRAME: 0=disable interrupt 1=pass interrupt 0 = DISABLE 1 = ENABLE 0x0 LOAD_DONE: 0=disable interrupt 1=pass interrupt 0 = DISABLE 1 = ENABLE 0x0 XVS: 0=disable interrupt 1=pass interrupt 0 = DISABLE 1 = ENABLE
- VI_SYNCGEN2_XHS_TIMER_0
- Offset: 0x3407
- Byte Offset: 0xd01c
- Read/Write: R/W
- Parity Protection: N
- Shadow: Y
- SCR Protection: 0
- Reset: 0x0000XXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)

- Video Input Registers
- Bit
- Reset
- Description

