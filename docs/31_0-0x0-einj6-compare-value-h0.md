# 31 :0 0x0 EINJ6_COMPARE_VALUE_H0:

- Packet Compare Value: 1st DWORD. Specifies the value to compare against
- Tx the TLP header DWORD#0 bits specified in the Packet Compare Point
registers (EINJ6_COMPARE_POINT*). Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
where <j> = 4, 8. Description:Program this register for the 2nd DWORD of TLP header/prefix. It is necessary to carefully consider the endianness when you program this register. Bits [31:0] = TLP_DW1[7:0],
- TLP_DW1[15:8], TLP_DW1[23:16], TLP_DW1[31:24] The Packet Compare Point registers
(EINJ6_COMPARE_POINT*) specify which Tx TLP header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the EINJ6_TLP_REG register.
- PCIE_X4_EP_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
- Offset: 0x21c
- PCIE_X8_EP_PF0_RAS_DES_CAP_EINJ6_COMPARE_VALUE_H1_REG_0
- Offset: 0x230
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

