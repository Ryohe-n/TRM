# 31 :24 0x0 FIRST_DWORD_FOURTH_BYTE:

- Byte 3 of Header log register of First 32-bit Data Word. This field
represents fourth byte of First DW of Header. Note: This register field is sticky. 23:16 0x0 FIRST_DWORD_THIRD_BYTE:
- Byte 2 of Header log register of First 32-bit Data Word. This field
represents third byte of First DW of Header. Note: This register field is sticky. 15:8 0x0 FIRST_DWORD_SECOND_BYTE:
- Byte 1 of Header log register of First 32-bit Data Word. This field
represents second byte of First DW of Header. Note: This register field is sticky. 7:0 0x0 FIRST_DWORD_FIRST_BYTE:
- Byte 0 of Header log register of First 32-bit Data Word. This field
represents first byte of First DW of Header. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_AER_CAP_HDR_LOG_1_OFF_0
where <j> = 4, 8.
- Description:The Header Log Register 1 contains the header for the TLP corresponding to a
detected error; The header is captured such that, when read using DW accesses, the fields of the header are laid out in the same way the headers are presented in the specification. Therefore, byte 0 of the header is located in byte 3 of the Header Log Register 1, byte 1 of the header is in byte 2 of the Header Log Register 1 and so forth. For 12-byte headers, only bytes 0 through 11 of the Header Log Register are used and values in bytes 12 through 15 are undefined. In certain cases where a Malformed TLP is reported, the Header Log Register may contain TLP Prefix information.
- PCIE_X4_EP_PF0_AER_CAP_HDR_LOG_1_OFF_0
- PCIE_X8_EP_PF0_AER_CAP_HDR_LOG_1_OFF_0

- PCIe x4/x8 Endpoint
- Offset: 0x120
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

