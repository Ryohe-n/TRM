# 31 :2 0x0 EXTERNAL_MSI_ADDR_L:

- External MSI Address lower 30 bits, Non zero value would enabled the
MSI address translation.
- Used for MSI Decode: Received Write Address [63:2] is compare with
{EXTERNAL_MSI_ADDR_H, EXTERNAL_MSI_ADDR_L}.
- PCIE_RP_SEC_INTERNAL_MSI_ADDR_H_0
- PCIE Secure Register: MSI Address Translation Registers
- Offset: 0x10108
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe x1/x4/x8 Root Complex
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

