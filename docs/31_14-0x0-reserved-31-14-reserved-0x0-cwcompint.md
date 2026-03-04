# 31 :14 0x0 Reserved_31_14: Reserved. 0x0 CWCOMPINT:

- Continuous Write Completion Interrupt. Set when a continuous write
completes. Note: This bit is valid only when PRS field of MDIO Port Nx4
- Indirect Control register is 0. Access restriction applies. Clears on read (or
write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 SNGLCOMPINT:
- Single Command Completion Interrupt. Set when a single command
completes. Note: This bit is available only when PRS field of MDIO Port Nx4
- Indirect Control register is 0. Access restriction applies. Clears on read (or
write of 1 when RCWE bit in MAC_CSR_SW_Ctrl register is set). Self-set to 1 on internal event. 0x0 PORTNx4P3ALINT:
- Device Present Status Change Interrupt (Port Nx4 Plus3). When set,
indicates that an interrupt occurred due to a change in one or more of the
- Port Nx4 Plus3 device's Alive status. Here N is as per the PRS field of MDIO
- Port Nx4 Indirect Control register Access restriction applies. Clears on
reading byte-1 (or when byte-1 is written when RCWE bit in
- MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P2ALINT:
- Device Present Status Change Interrupt (Port Nx4 Plus2). When set,
indicates that an interrupt occurred due to a change in one or more of the
- Port Nx4 Plus2 device's Alive status. Here N is as per the PRS field of MDIO
- Port Nx4 Indirect Control register Access restriction applies. Clears on
reading byte-1 (or when byte-1 is written when RCWE bit in
- MAC_CSR_SW_Ctrl register is set)

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 PORTNx4P1ALINT:
- Device Present Status Change Interrupt (Port Nx4 Plus1). When set,
indicates that an interrupt occurred due to a change in one or more of the
- Port Nx4 Plus1 device's Alive status. Here N is as per the PRS field of MDIO
- Port Nx4 Indirect Control register Access restriction applies. Clears on
reading byte-1 (or when byte-1 is written when RCWE bit in
- MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P0ALINT:
- Device Present Status Change Interrupt (Port Nx4 Plus0). When set,
indicates that an interrupt occurred due to a change in one or more of the
- Port Nx4 Plus0 device's Alive status. Here N is as per the PRS field of MDIO
- Port Nx4 Indirect Control register Access restriction applies. Clears on
reading byte-1 (or when byte-1 is written when RCWE bit in
- MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P3LSINT:
- Link Status Change Interrupt (Port Nx4 Plus3). When set, indicates that the
link status changed on at least one of the Port Nx4 Plus3 devices. Here N is as per the PRS field of MDIO Port Nx4 Indirect Control register Access restriction applies. Clears on reading byte-0 (or when byte-0 is written when
- RCWE bit in MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P2LSINT:
- Link Status Change Interrupt (Port Nx4 Plus2). When set, indicates that the
link status changed on at least one of the Port Nx4 Plus2 devices. Here N is as per the PRS field of MDIO Port Nx4 Indirect Control register Access restriction applies. Clears on reading byte-0 (or when byte-0 is written when
- RCWE bit in MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P1LSINT:
- Link Status Change Interrupt (Port Nx4 Plus1). When set, indicates that the
link status changed on at least one of the Port Nx4 Plus1 devices. Here N is as per the PRS field of MDIO Port Nx4 Indirect Control register Access restriction applies. Clears on reading byte-0 (or when byte-0 is written when
- RCWE bit in MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P0LSINT:
- Link Status Change Interrupt (Port Nx4 Plus0). When set, indicates that the
link status changed on at least one of the Port Nx4 Plus0 devices. Here N is as per the PRS field of MDIO Port Nx4 Indirect Control register Access restriction applies. Clears on reading byte-0 (or when byte-0 is written when
- RCWE bit in MAC_CSR_SW_Ctrl register is set)
0x0 PORTNx4P3CONINT:
- Connect/Disconnect Event Interrupt (Port Nx4 Plus3). When set, indicates
that Port Nx4 Plus3 caused an interrupt due to a connection or disconnection. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register Access restriction applies. Clears on reading byte-0 (or when
byte-0 is written when RCWE bit in MAC_CSR_SW_Ctrl register is set) 0x0 PORTNx4P2CONINT:
- Connect/Disconnect Event Interrupt (Port Nx4 Plus2). When set, indicates
that Port Nx4 Plus2 caused an interrupt due to a connection or disconnection. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register Access restriction applies. Clears on reading byte-0 (or when
byte-0 is written when RCWE bit in MAC_CSR_SW_Ctrl register is set)

10G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 PORTNx4P1CONINT:
- Connect/Disconnect Event Interrupt (Port Nx4 Plus1). When set, indicates
that Port Nx4 Plus1 caused an interrupt due to a connection or disconnection. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register Access restriction applies. Clears on reading byte-0 (or when
byte-0 is written when RCWE bit in MAC_CSR_SW_Ctrl register is set) 0x0 PORTNx4P0CONINT:
- Connect/Disconnect Event Interrupt (Port Nx4 Plus0). When set, indicates
that Port Nx4 Plus0 caused an interrupt due to a connection or disconnection. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register Access restriction applies. Clears on reading byte-0 (or when
byte-0 is written when RCWE bit in MAC_CSR_SW_Ctrl register is set)
- MGBE_DWCXG_CORE_MDIO_INTERRUPT_ENABLE_0
This register controls the enabling of interrupt sources in the MDIO Interrupt Status register.
- Offset: 0x218
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

