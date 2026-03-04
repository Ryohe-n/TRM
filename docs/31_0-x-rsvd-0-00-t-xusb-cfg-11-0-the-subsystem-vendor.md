# 31 :0 X RSVD: 0 = _00 T_XUSB_CFG_11_0 The SUBSYSTEM_VENDOR_ID bits and SUBSYSTEM_ID bits are used to uniquely identify the add-in board or subsystem where the device resides. When the device is on the motherboard, there is no serial ROM and the registers both initialize to NONE. The motherboard BIOS must set the values of the Subsystem ID and Subsystem Vendor ID by writing the proper values to the SUBSYSTEM_VENDOR_ID and SUBSYSTEM_ID bits in the PCI_T_16 register (NOT PCI_T_11).

- Offset: 0x2c
- Read/Write: RO
- Parity Protection: N
- Shadow: N

- XHCI Controller Configuration Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

