# 2 :0 0x2 PCI_MSIX_PBA_BIR:

- MSI-X PBA BIR. This field indicates which one of a Function's Base Address
- Registers , located beginning at 10h in Configuration Space, or entry in the
- Enhanced Allocation capability with a matching BEI, is used to map the
- Function's MSI-X PBA into Memory Space. The PBA BIR value definitions are
identical to those for the Table BIR . Note: The access attributes of this field are as follows: - Wire: No access - Dbi: No access - Dbi2: if (DBI_RO_WR_EN == 1 && MSIX_CAP_ENABLE=1 ) then R/W else R Note: This register field is sticky.
#### 10.5.5.4 PCIe x4/x8 Endpoint
For a description of these standard PCIe register fields, see the PCI Express Specification. NOTE: There are 6 instances for each of the "X4" registers as listed, one for each of the X4 PCIe module instances, namely C0, C4, C6, C8, C9, and C10. And there are 2 instances for each of the "X8" registers as listed, one for each of the X8 PCIe module instances, namely C5 and C7.
- For the base addresses of these different register instances, please refer to the System
Address Map. NOTE:
- The binary “x” is turned to “0” for the Reset and PROD hex value. Hence, in some cases, a
mismatch occurs between the displayed hexadecimal and binary value. A bit Reset value as “x” or “Undefined” actually means that the bit could be either “0” or “1” after Reset, whereas a bit PROD value as “x” or “Don’t-care” means that either “0” or “1” can be written to the bit by software Initialization.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_DEVICE_ID_VENDOR_ID_REG_0
where <j> = 4, 8. Description: This register holds the device ID and vendor ID.
- PCIE_X4_EP_PF0_TYPE0_HDR_DEVICE_ID_VENDOR_ID_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_DEVICE_ID_VENDOR_ID_REG_0

- PCIe x4/x8 Endpoint
- Offset: 0x0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x229c10de (0b0010,0010,1001,1100,0001,0000,1101,1110)
- Bit
- Reset
- Description

