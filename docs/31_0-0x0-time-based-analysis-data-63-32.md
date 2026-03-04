# 31 :0 0x0 TIME_BASED_ANALYSIS_DATA_63_32:

- Upper 32 bits of Time Based Analysis Data. Note: This register field is
sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0

- PCIe x4/x8 Endpoint
where <j> = 4, 8. Description:Each type of error insertion is enabled by the corresponding bit in this register. The specific injection controls for each type of error are defined in the following registers: - 0: CRC Error: EINJ0_CRC_REG - 1: Sequence Number Error: EINJ1_SEQNUM_REG - 2: DLLP Error:
- EINJ2_DLLP_REG - 3: Symbol DataK Mask Error or Sync Header Error: EINJ3_SYMBOL_REG - 4: FC
Credit Update Error: EINJ4_FC_REG - 5: TLP Duplicate/Nullify Error: EINJ5_SP_TLP_REG - 6: Specific
- TLP Error: EINJ6_COMPARE_*_REG/EINJ6_CHANGE_*_REG/EINJ6_TLP_REG After the errors have
been inserted by controller, it will clear each bit here. For more details, see the RAS DES section in the Core Operations chapter of the Databook.
- PCIE_X4_EP_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0
- Offset: 0x1ec
- PCIE_X8_EP_PF0_RAS_DES_CAP_EINJ_ENABLE_REG_0
- Offset: 0x200
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

