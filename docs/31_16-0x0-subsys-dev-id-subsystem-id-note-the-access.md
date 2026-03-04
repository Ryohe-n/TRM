# 31 :16 0x0 SUBSYS_DEV_ID: Subsystem ID. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x0 SUBSYS_VENDOR_ID:

- Subsystem Vendor ID. Subsystem Vendor IDs can be obtained from the PCI
SIG and are used to identify the vendor of the add-in card or subsystem.
- Values for the Subsystem ID are vendor-specific. Note: The access attributes
of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_EXP_ROM_BASE_ADDR_REG_0
where <j> = 4, 8. Description:This register handles the base address and size information for this expansion ROM.
- PCIE_X4_EP_PF0_TYPE0_HDR_EXP_ROM_BASE_ADDR_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_EXP_ROM_BASE_ADDR_REG_0
- Offset: 0x30
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

