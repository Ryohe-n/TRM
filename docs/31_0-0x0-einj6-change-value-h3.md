# 31 :0 0x0 EINJ6_CHANGE_VALUE_H3:

- Packet Change Value: 4th DWORD. Specifies replacement values for the Tx
- TLP header DWORD#3 bits defined in the Packet Change Point registers
(EINJ6_CHANGE_POINT*). Only applies when the
- EINJ6_INVERTED_CONTROL field in EINJ6_TLP_REG is '0'. Note: This register
field is sticky.

- PCIe x4/x8 Endpoint
- PCIE_X<j>_EP_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
where <j> = 4, 8.
- Description:The Packet Compare Point registers (EINJ6_COMPARE_POINT*) specify which Tx TLP
header bits to compare with the corresponding bits in the Packet Compare Value registers (EINJ6_COMPARE_VALUE*). When all specified bits (in the Tx TLP header and EINJ6_COMPARE_VALUE*) match, the controller inserts errors into the TLP. The type and number of errors are specified by the this register. The Packet Change Point registers (EINJ6_CHANGE_POINT*) specify which Tx TLP header bits to replace with the corresponding bits in the Packet Change Value registers (EINJ6_CHANGE_VALUE*). The type and number of errors are specified by the this register. Only applies when EINJ6_INVERTED_CONTROL in this register =0. The TLP into that errors are injected will not arrive at the transaction layer of the remote device when all of the following conditions are true. - Using 128b/130b encoding - Injecting errors into TLP Length field / TLP digest bit.
- PCIE_X4_EP_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
- Offset: 0x248
- PCIE_X8_EP_PF0_RAS_DES_CAP_EINJ6_TLP_REG_0
- Offset: 0x25c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

