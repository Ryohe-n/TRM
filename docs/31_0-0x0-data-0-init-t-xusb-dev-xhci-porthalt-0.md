# 31 :0 0x0 DATA: 0 = INIT T_XUSB_DEV_XHCI_PORTHALT_0


- USB 3.0 Device Controller Memory-Mapped I/O Registers
- Offset: 0x6c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x01000001 (0bxxxx,x001,xxx0,0000,xxxx,xxxx,xxxx,xx01)
- Bit
R/W
- Reset
- Description
- RW
0x0 STCHG_SMI_EN: 0 = INIT
- RW
0x0 STCHG_PME_EN: 0 = INIT
- RW
0x1 STCHG_INTR_EN: 1 = INIT
- RW
0x0 STCHG_REQ: 0 = NOT_PENDING 1 = PENDING 19:16
- RO
0x0 STCHG_STATE: 0 = U0
- RW
0x0 HALT_REJECT: 0 = FALSE 1 = TRUE
- RW
0x1 HALT_LTSSM: 1 = INIT T_XUSB_DEV_XHCI_PORT_TM_0
- Offset: 0x70
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000)
- Bit
- Reset
- Description

