# 30 :27 0x0 CFG_MSTR_AWCACHE_VALUE:

- Master Write CACHE Signal Value. Value of the individual bits in
mstr_awcache when CFG_MSTR_AWCACHE_MODE is '1'. Note: Not applicable to message requests; for message requests the value of mstr_awcache is always '0000'. Note: This register field is sticky. 22:19 0x0 CFG_MSTR_ARCACHE_VALUE:
- Master Read CACHE Signal Value. Value of the individual bits in
mstr_arcache when CFG_MSTR_ARCACHE_MODE is '1'. Note: This register field is sticky. 14:11 0x0 CFG_MSTR_AWCACHE_MODE:
- Master Write CACHE Signal Behavior. Defines how the individual bits in
mstr_awcache are controlled. Note: for message requests the value of mstr_awcache is always "0000" regardless of the value of this bit. Note: This register field is sticky. 6:3 0x0 CFG_MSTR_ARCACHE_MODE:
- Master Read CACHE Signal Behavior. Defines how the individual bits in
mstr_arcache are controlled. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0
where <j> = 4, 8. Description:Lower 20 bits of the programmable AXI address to which Messages coming from wire are mapped. Bits [11:0] of the register are tied to zero for the address to be 4k-aligned. In previous releases, the third and fourth DWORDs of a message (Msg/MsgD) TLP header were delivered though the AXI master address bus (mstr_awaddr). These DWORDS are now supplied through the mstr_awmisc_info_hdr_34dw[63:0] output; and the value on mstr_awaddr is driven to the value you have programmed into the AXI_MSTR_MSG_ADDR_LOW_OFF and AXI_MSTR_MSG_ADDR_HIGH_OFF registers.
- PCIE_X4_EP_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_AXI_MSTR_MSG_ADDR_LOW_OFF_0
- Offset: 0x8f0
- Read/Write: See table below
- Parity Protection: N

- PCIe x4/x8 Endpoint
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

