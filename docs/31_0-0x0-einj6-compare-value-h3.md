# 31 :0 0x0 EINJ6_COMPARE_VALUE_H3:

- Packet Compare Value: 4th DWORD. Specifies the value to compare against
- Tx the TLP header DWORD#3 bits specified in the Packet Compare Point
registers (EINJ6_COMPARE_POINT*). Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
where <j> = 4, 8. Description:Program this register for the 1st DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW0[7:0],
- TLP_DW0[15:8], TLP_DW0[23:16], TLP_DW0[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X4_EP_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
- Offset: 0x228
- PCIE_X8_EP_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H0_REG_0
- Offset: 0x23c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

