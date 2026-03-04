# 27 -- 7: Selects the Port Address range of 28 to 31


10G Ethernet Controller Core Registers
- MGBE_DWCXG_CORE_MDIO_PORTNX4P0_DEVICE_IN_USE_0
This register gives the status of each device on Port Nx4 Plus0 (Here N is as per the PRS field of MDIO Port Nx4 Indirect Control register). Set these bits to indicate that a device is present and that the SMA must access it during continuous scan/write operations. If any bit is cleared, the corresponding device is not scanned when the Continuous Scan command is issued nor is it written when the Continuous Write command is issued. This register setting does not affect single read or write commands.
- Offset: 0x230
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
0x1 Nx4P0VSD2:
- VSD2 Device is in Use When Vendor-Specific Device 2 is present,
this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register
- RW
0x1 Nx4P0VSD1:
- VSD1 Device is in Use When Vendor-Specific Device 1 is present,
this bit is set to 1. Here N is as per the PRS field of MDIO Port
- Nx4 Indirect Control register

