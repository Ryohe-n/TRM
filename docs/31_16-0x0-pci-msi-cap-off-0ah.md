# 31 :16 0x0 PCI_MSI_CAP_OFF_0AH:

- For a function that supports a 32-bit message address, this field contains
- Extended Message Data (System-specified message data). For the MSI Capability
structures without per-vector masking, it must be implemented if the Extended
- Message Data Capable bit is set; otherwise, it is outside the MSI Capability
structure and undefined. For the MSI Capability structures with Per-vector
- Masking, it must be implemented if the Extended Message Data Capable bit is
set; otherwise, it is RsvdP. If the Extended Message Data Enable bit (bit 26 of the
- PCI_MSI_CAP_ID_NEXT_CTRL_REG) is set, the DWORD Memory Write transaction
uses Extended Message Data for the upper 16 bits; otherwise, it uses 0000h for the upper 16 bits. For a function that supports a 64-bit message address, it contains upper 16 bits of the Message Upper Address. Note: The access attributes of this field are as follows: - Wire: PCI_MSI_64_BIT_ADDR_CAP || `DEFAULT_EXT_MSI_DATA_CAPABLE ? R/W : R - Dbi: PCI_MSI_64_BIT_ADDR_CAP || `DEFAULT_EXT_MSI_DATA_CAPABLE ? R/W : R 15:0 0x0 PCI_MSI_CAP_OFF_08H:
- For a function that supports a 32-bit message address, this field contains
- Message Data (System-specified message data). If the Message Enable bit (bit

