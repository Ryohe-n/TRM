# 15 :0 0x0 MSG_DATA:

- System-specified message. When MSI is enabled, the message data is driven
onto the lower 16-bits of the MSI memory write. The MULT_MSG_ENABLE field in configuration register 80h specifies the number of low order message data bits that the XHCI is permitted to modify to generate its system software allocated vectors. 0 = DEFAULT T_XUSB_DEV_MSI_MASK_0
- Offset: 0xd0
- Read/Write: R/W
- Parity Protection: N

- XUSB DEV Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 BIT:
- For each mask bit that is set, the controller is prohibited from generating
the associated message. bit 0 corresponds to MSI vector 0 bit 1 corresponds to MSI vector 1 bit 2 corresponds to MSI vector 2 bit 3 corresponds to MSI vector 3 bit 4 corresponds to MSI vector 4 bit 5 corresponds to MSI vector 5 bit 6 corresponds to MSI vector 6 bit 7 corresponds to MSI vector 7
- Note: a value of 0 means to allow MSI generation for that vector; value of 1
means to prevent MSI generation for that vector. 0 = DEFAULT T_XUSB_DEV_MSI_PEND_0
- Offset: 0xd4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,0000,0000,0000,0000)
- Bit
- Reset
- Description

