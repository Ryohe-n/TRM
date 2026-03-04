# 31 :16 0x0 PCI_MSI_CAP_OFF_0EH:

- For a function that supports a 32-bit message address, this field contains the
upper Mask Bits when the Per Vector Masking Capable bit (PCI_MSI_CAP_ID_NEXT_CTRL_REG.PCI_PVM_SUPPORT) is set. For a function that supports a 64-bit message address, this field contains Message Data (System-specified message data). Note: The access attributes of this field are as follows: - Wire: (!MSI_64_EN && MSI_PVM_EN_VALUE) ? RW: MSI_64_EN &&
- DEFAULT_EXT_MSI_DATA_CAPABLE ? RW : RO - Dbi: (!MSI_64_EN &&
- MSI_PVM_EN_VALUE) ? RW: MSI_64_EN && DEFAULT_EXT_MSI_DATA_CAPABLE ?
- RW : RO

