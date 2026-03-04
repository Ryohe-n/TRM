# 15 :0 0x0 PCI_MSI_CAP_OFF_0CH:

- For a function that supports a 32-bit message address, this field contains the
lower Mask Bits when the Per Vector Masking Capable bit (PCI_MSI_CAP_ID_NEXT_CTRL_REG.PCI_PVM_SUPPORT) is set. For a function that supports a 64-bit message address, this field contains Message Data (System-specified message data). If the Message Enable bit (bit 16 of the
- PCI_MSI_CAP_ID_NEXT_CTRL_REG) is set, the function sends a DWORD Memory
- Write transaction using Message Data for the lower 16 bits. All 4 Byte Enables are
set. The Multiple Message Enable field (bits 22:20 of the
- PCI_MSI_CAP_ID_NEXT_CTRL_REG) defines the number of low order message
data bits the function is permitted to modify to generate its system software allocated vectors. For example, a Multiple Message Enable encoding of 010b indicates the function has been allocated four vectors and is permitted to modify message data bits 1 and 0 (a function modifies the lower message data bits to generate the allocated number of vectors). If the Multiple Message Enable field is 000b, the Function is not permitted to modify the message data. Note: The access attributes of this field are as follows: - Wire: PCI_MSI_64_BIT_ADDR_CAP || MSI_PVM_EN ? R/W : R - Dbi: PCI_MSI_64_BIT_ADDR_CAP || MSI_PVM_EN ? R/W : R
- PCIE_X<j>_EP_PF0_MSI_CAP_MSI_CAP_OFF_10H_REG_0
where <j> = 4, 8. Description:For a function that supports a 32-bit message address, this register contains the
- Pending Bits when the Per-Vector Masking Capable bit (bit 24 of
PCI_MSI_CAP_ID_NEXT_CTRL_REG) is set. For a function that supports a 64-bit message address, this register contains the Mask Bits when the Per-Vector Masking Capable bit (bit 24 of PCI_MSI_CAP_ID_NEXT_CTRL_REG) is set.
- PCIE_X4_EP_PF0_MSI_CAP_MSI_CAP_OFF_10H_REG_0
- PCIE_X8_EP_PF0_MSI_CAP_MSI_CAP_OFF_10H_REG_0
- Offset: 0x60
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

