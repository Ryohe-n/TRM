# 7 :0 0x0 INTERNAL_MSI_ADDR_H:

- Internal MSI Address upper[39:26] bits , Non zero value would enabled the
MSI address translation. MSI address [39:32] is translated with INTERNAL_MSI_ADDR_H.
- Internal_MSI_Address[39:26] = {INTERNAL_MSI_ADDR_H,
INTERNAL_MSI_ADDR_L}.
- MSi Translated address = {Internal_MSI_Address[39:26],
Received_Data[9:0], 16'b0000_0000_0000_0000}.
- PCIE_RP_SEC_INTERNAL_MSI_ADDR_L_0
- Offset: 0x1010c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,00xx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

