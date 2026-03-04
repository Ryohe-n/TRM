# 31 :0 0x0 CARDBUS_CIS_POINTER:

- CardBus CIS Pointer. Its functionality does not apply to PCI Express. It must
be hardwired to 0000 0000h. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_SUBSYSTEM_ID_SUBSYSTEM_VENDOR_ID_REG_0
where <j> = 4, 8. Description:These registers are used to uniquely identify the add-in card or subsystem where the
- PCI Express component resides. They provide a mechanism for vendors to distinguish their
products from one another even though the assemblies may have the same PCI Express component on them (and, therefore, the same Vendor ID and Device ID).
- PCIE_X4_EP_PF0_TYPE0_HDR_SUBSYSTEM_ID_SUBSYSTEM_VENDOR_ID_REG_0

- PCIe x4/x8 Endpoint
- PCIE_X8_EP_PF0_TYPE0_HDR_SUBSYSTEM_ID_SUBSYSTEM_VENDOR_ID_REG_0
- Offset: 0x2c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

