# 31 :26 0x0 INTERNAL_MSI_ADDR_L:

- Internal MSI Address upper[39:26] bits , Non zero value would
enabled the MSI address translation. MSI address [31:26] is translated with INTERNAL_MSI_ADDR_L.
- Internal_MSI_Address[39:26] = {INTERNAL_MSI_ADDR_H,
INTERNAL_MSI_ADDR_L}.
- MSi Translated address = {Internal_MSI_Address[39:26],
Received_Data[9:0], 16'b0000_0000_0000_0000}.
#### 10.5.5.3 PCIe x1/x4/x8 Root Complex
For a description of these standard PCIe register fields, see the PCI Express Specification. NOTE: There are 3 instances for each of the "X1" registers as listed, one for each of the X1 PCIe module instances, namely C1, C2, and C3. There are 6 instances for each of the "X4" registers as listed, one for each of the X4 PCIe module instances, namely C0, C4, C6, C8, C9, and C10. And there are 2 instances for each of the "X8" registers as listed, one for each of the X8 PCIe module instances, namely C5 and C7.

- PCIe x1/x4/x8 Root Complex
- For the base addresses of these different register instances, please refer to the System
Address Map. NOTE:
- The binary “x” is turned to “0” for the Reset and PROD hex value. Hence, in some cases, a
mismatch occurs between the displayed hexadecimal and binary value. A bit Reset value as “x” or “Undefined” actually means that the bit could be either “0” or “1” after Reset, whereas a bit PROD value as “x” or “Don’t-care” means that either “0” or “1” can be written to the bit by software Initialization.
- PCIE_X<i>_RC_PF0_TYPE1_HDR_TYPE1_DEV_ID_VEND_ID_REG_0
where <i> = 1, 4, 8. Description: This register holds the device ID and vendor ID.
- Offset: 0x0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- PCIE_X1_RC_PF0_TYPE1_HDR_TYPE1_DEV_ID_VEND_ID_REG_0
- Reset: 0x229e10de (0b0010,0010,1001,1110,0001,0000,1101,1110)
- Bit
- Reset
- Description

