# 31 :16 0x0 ERR_FATAL_NON_FATAL_SOURCE_ID:

- Source of Fatal/Non-Fatal Error. Loaded with the Requester ID indicated in
the received ERR_FATAL or ERR_NONFATAL Message when the
- ERR_FATAL/NONFATAL Received bit is not already set. Note: This register
field is sticky. 15:0 0x0 ERR_COR_SOURCE_ID:
- Source of Correctable Error. Loaded with the Requester ID indicated in the
received ERR_COR Message when the ERR_COR Received bit is not already set. Note: This register field is sticky.
- PCIE_X<i>_RC_PF0_AER_CAP_TLP_PREFIX_LOG_1_OFF_0
where <i> = 1, 4, 8. Description: The First TLP Prefix Log Register contains the first End-End TLP Prefix from the TLP corresponding to the detected error. The TLP Prefix Log Register is only meaningful when the TLP
- Prefix Log Present bit is Set. The TLP Prefixes are captured such that, when read using DW
accesses, the fields of the TLP Prefix are laid out in the same way the fields of the TLP Prefix are described. Therefore, byte 0 of a TLP Prefix is located in byte 3 of the associated TLP Prefix Log Register; byte 1 of a TLP Prefix is located in byte 2; and so forth. The TLP Prefix Log Registers beyond the number supported by the Function are hardwired to zero by controller. If the End-End TLP Prefix Supported bit is Clear, the TLP Prefix Log Register is not required to be implemented.
- PCIE_X1_RC_PF0_AER_CAP_TLP_PREFIX_LOG_1_OFF_0
- PCIE_X4_RC_PF0_AER_CAP_TLP_PREFIX_LOG_1_OFF_0
- PCIE_X8_RC_PF0_AER_CAP_TLP_PREFIX_LOG_1_OFF_0

- PCIe x1/x4/x8 Root Complex
- Offset: 0x138
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

