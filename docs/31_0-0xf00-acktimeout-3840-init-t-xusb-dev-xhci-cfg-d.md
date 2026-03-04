# 31 :0 0xf00 ACKTIMEOUT: 3840 = INIT T_XUSB_DEV_XHCI_CFG_DEV_FE_0

- Offset: 0x85c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- SCR Protection: 0
- Reset: 0x1a000030 (0bxx01,1010,xxxx,xxxx,xxxx,xxxx,xx11,0000)
- Bit
- Reset
- Description
0x0 INFINITE_SS_RETRY: 0 = DIS 1 = EN 0x1 EN_PRIME_EVENT: 1 = INIT 0x1 FEATURE_LPM: 0 = DIS 1 = EN 0x0 EN_STALL_EVENT: 0 = INIT 0x1 PORTDISCON_RST_HW: 1 = INIT 0x0 CTX_RESTORE: 0 = INIT 0x1 PORTRST_HW: 1 = INIT 0x1 SEQNUM_INIT: 1 = INIT 3:0 0x0 PORTREGSEL: 0 = INIT 1 = SS_AUTO 2 = HSFS 4 = SSPI_0 5 = SSPI_1 6 = SSPI_2 7 = SSPI_3 T_XUSB_DEV_XHCI_CFG_IDLE_0
- Offset: 0x860
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000XX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X DEV_SS_PI: X DEV_FS_NVWRAP: X DEV_HS_NVWRAP: X DEV_HSFS_PI:

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- Bit
- Reset
- Description
X DEV_BI: T_XUSB_DEV_XHCI_CFG_SSXFER_0
- Offset: 0x864
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x03938700 (0b0000,0011,1001,0011,1000,0111,0000,0000)
- Bit
- Reset
- Description

