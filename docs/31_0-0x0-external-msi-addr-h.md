# 31 :0 0x0 EXTERNAL_MSI_ADDR_H:

- External MSI Address upper 32 bits, Non zero value would enabled the
MSI address translation.
- Used for MSI Decode: Received Write Address [63:2] is compare with
{EXTERNAL_MSI_ADDR_H, EXTERNAL_MSI_ADDR_L}.
- PCIE_RP_SEC_EXTERNAL_MSI_ADDR_L_0
- Offset: 0x10104
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,00xx)
- Bit
- Reset
- Description

