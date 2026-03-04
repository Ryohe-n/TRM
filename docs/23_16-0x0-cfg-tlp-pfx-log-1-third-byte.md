# 23 :16 0x0 CFG_TLP_PFX_LOG_1_THIRD_BYTE:

- Byte 2 of Error TLP Prefix Log 1. This field contains third byte of First
DW of TLP Prefix. Note: This register field is sticky. 15:8 0x0 CFG_TLP_PFX_LOG_1_SECOND_BYTE:
- Byte 1 of Error TLP Prefix Log 1. This field contains second byte of First
DW of TLP Prefix. Note: This register field is sticky. 7:0 0x0 CFG_TLP_PFX_LOG_1_FIRST_BYTE:
- Byte 0 of Error TLP Prefix Log 1. This field contains first byte of First
DW of TLP Prefix. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_AER_CAP_TLP_PREFIX_LOG_2_OFF_0
where <j> = 4, 8. Description:The Second TLP Prefix Log Register contains the second End-End TLP Prefix from the TLP corresponding to the detected error. The TLP Prefix Log Register is only meaningful when the TLP Prefix Log Present bit is Set. The TLP Prefixes are captured such that, when read using DW accesses, the fields of the TLP Prefix are laid out in the same way the fields of the TLP Prefix are described. Therefore, byte 0 of a TLP Prefix is located in byte 3 of the associated TLP Prefix Log Register; byte 1 of a TLP Prefix is located in byte 2; and so forth. The TLP Prefix Log Registers beyond the number supported by the Function are hardwired to zero by controller. If the End-End TLP Prefix Supported bit is Clear, the TLP Prefix Log Register is not required to be implemented.
- PCIE_X4_EP_PF0_AER_CAP_TLP_PREFIX_LOG_2_OFF_0
- PCIE_X8_EP_PF0_AER_CAP_TLP_PREFIX_LOG_2_OFF_0
- Offset: 0x13c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

