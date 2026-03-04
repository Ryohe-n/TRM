# 31 :0 0x0 EINJ6_CHANGE_POINT_H1:

- Packet Change Point: 2nd DWORD. Specifies which Tx TLP header
- DWORD#1 bits to replace with the corresponding bits in the Packet Change
Value registers (EINJ6_CHANGE_VALUE*). Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0
where <j> = 4, 8. Description:Program this register for the 3rd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW2[7:0],
- TLP_DW2[15:8], TLP_DW2[23:16], TLP_DW2[31:24] The Packet Change Point registers
(EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the EINJ6_TLP_REG register. Only applies when EINJ6_INVERTED_CONTROL in EINJ6_TLP_REG =0.
- PCIE_X4_EP_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0
- Offset: 0x230
- PCIE_X8_EP_PF0_RAS_DES_CAP_EINJ6_CHANGE_POINT_H2_REG_0

- PCIe x4/x8 Endpoint
- Offset: 0x244
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

