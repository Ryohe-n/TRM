# 29 :7 0x0 Reserved_29_7: Reserved. 0x0 Nx4P1TCLS:

- Alive Status of TC Device When TC is present and functioning properly, this
bit is set to 1. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register
0x0 Nx4P1DTEXSLS:
- Alive Status of DTEXS Device When DTE XS is present and functioning
properly, this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register
0x0 Nx4P1PHYXSLS:
- Alive Status of PHYXS Device When PHY XS is present and functioning
properly, this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register
0x0 Nx4P1PCSLS:
- Alive Status of PCS Device When PCS is present and functioning properly,
this bit is set to 1. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register
0x0 Nx4P1WISLS:
- Alive Status of WIS Device When WIS is present and functioning properly,
this bit is set to 1. Here N is as per the PRS field of MDIO Port Nx4 Indirect
- Control register
0x0 Nx4P1PMDPMALS:
- Alive Status of PMA Device When PMD/PMA is present and functioning
properly, this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register
0x0 Reserved_0: Reserved.
- MGBE_DWCXG_CORE_MDIO_PORTNX4P2_DEVICE_IN_USE_0

10G Ethernet Controller Core Registers This register gives the status of each device on Port Nx4 Plus2 (Here N is as per the PRS field of MDIO Port Nx4 Indirect Control register). Set these bits to indicate that a device is present and that the SMA must access it during continuous scan/write operations. If any bit is cleared, the corresponding device is not scanned when the Continuous Scan command is issued nor is it written when the Continuous Write command is issued. This register setting does not affect single read or write commands. Note: All the register fields are renamed from P2 to Nx4P2 (Nx4 Plus 2).
- Offset: 0x250
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xc000007e (0b1100,0000,0000,0000,0000,0000,0111,1110)
- Bit
R/W
- Reset
- Description
- RW
0x1 Nx4P2VSD2:
- VSD2 Device is in Use When Vendor-Specific Device 2 is present,
this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register
- RW
0x1 Nx4P2VSD1:
- VSD1 Device is in Use When Vendor-Specific Device 1 is present,
this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register

