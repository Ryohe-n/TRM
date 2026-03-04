# 31 :0 0xffffffff VENDOR_SPEC_DLLP:

- Vendor Specific DLLP Register. You can use this register to send a
specific PCI Express DLLP. Your application can write 8-bit DLLP Type and 24-bit Payload data into this register, and set the
- VENDOR_SPECIFIC_DLLP_REQ field of the PORT_LINK_CTRL_OFF, to
send the DLLP. - Bits[7:0]: DLLP Type - Bits[31:8]: Vendor Defined Payload (24 bits) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_PORT_FORCE_OFF_0
where <j> = 4, 8. Description:This register can be used for testing and debuggong the link.
- PCIE_X4_EP_PF0_PORT_LOGIC_PORT_FORCE_OFF_0

- PCIe x4/x8 Endpoint
- PCIE_X8_EP_PF0_PORT_LOGIC_PORT_FORCE_OFF_0
- Offset: 0x708
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00400000 (0b0000,0000,0100,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

